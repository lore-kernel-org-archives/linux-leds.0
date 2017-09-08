From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: pca955x: Don't invert requested value in
 pca955x_gpio_set_value()
Date: Fri, 8 Sep 2017 22:09:37 +0200
Message-ID: <9cbbe7d6-027e-6fef-ca3d-bbec25042c96@gmail.com>
References: <20170901053858.10070-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36835 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbdIHUKb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Sep 2017 16:10:31 -0400
In-Reply-To: <20170901053858.10070-1-andrew@aj.id.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux-kernel@vger.kernel.org, clg@kaod.org, bjwyman@gmail.com, openbmc@lists.ozlabs.org

Hi Andrew,

Thanks for the patch.

On 09/01/2017 07:38 AM, Andrew Jeffery wrote:
> The PCA9552 lines can be used either for driving LEDs or as GPIOs. The
> manual states that for LEDs, the operation is open-drain:
> 
>          The LSn LED select registers determine the source of the LED data.
> 
>            00 = output is set LOW (LED on)
>            01 = output is set high-impedance (LED off; default)
>            10 = output blinks at PWM0 rate
>            11 = output blinks at PWM1 rate
> 
> For GPIOs it suggests a pull-up so that the open-case drives the line
> high:
> 
>          For use as output, connect external pull-up resistor to the pin
>          and size it according to the DC recommended operating
>          characteristics.  LED output pin is HIGH when the output is
>          programmed as high-impedance, and LOW when the output is
>          programmed LOW through the ‘LED selector’ register.  The output
>          can be pulse-width controlled when PWM0 or PWM1 are used.
> 
> Now, I have a hardware design that uses the LED controller to control
> LEDs. However, for $reasons, we're using the leds-gpio driver to drive
> the them. The reasons are here are a tangent but lead to the discovery
> of the inversion, which manifested as the LEDs being set to full
> brightness at boot when we expected them to be off.
> 
> As we're driving the LEDs through leds-gpio, this means wending our way
> through the gpiochip abstractions. So with that in mind we need to
> describe an active-low GPIO configuration to drive the LEDs as though
> they were GPIOs.
> 
> The set() gpiochip callback in leds-pca955x does the following:
> 
>          ...
>          if (val)
>                 pca955x_led_set(&led->led_cdev, LED_FULL);
>          else
>                 pca955x_led_set(&led->led_cdev, LED_OFF);
>          ...
> 
> Where LED_FULL = 255. pca955x_led_set() in turn does:
> 
>          ...
>          switch (value) {
>          case LED_FULL:
>                 ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
>                 break;
>          ...
> 
> Where PCA955X_LS_LED_ON is defined as:
> 
>          #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
> 
> So here we have some type confusion: We've crossed domains from GPIO
> behaviour to LED behaviour without accounting for possible inversions
> in the process.
> 
> Stepping back to leds-gpio for a moment, during probe() we call
> create_gpio_led(), which eventually executes:
> 
>          if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP) {
>                 state = gpiod_get_value_cansleep(led_dat->gpiod);
>                 if (state < 0)
>                         return state;
>          } else {
>                 state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
>          }
>          ...
>          ret = gpiod_direction_output(led_dat->gpiod, state);
> 
> In the devicetree the GPIO is annotated as active-low, and
> gpiod_get_value_cansleep() handles this for us:
> 
>          int gpiod_get_value_cansleep(const struct gpio_desc *desc)
>          {
>                  int value;
> 
>                  might_sleep_if(extra_checks);
>                  VALIDATE_DESC(desc);
>                  value = _gpiod_get_raw_value(desc);
>                  if (value < 0)
>                          return value;
> 
>                  if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
>                          value = !value;
> 
>                  return value;
>          }
> 
> _gpiod_get_raw_value() in turn calls through the get() callback for the
> gpiochip implementation, so returning to our get() implementation in
> leds-pca955x we find we extract the raw value from hardware:
> 
>          static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
>          {
>                  struct pca955x *pca955x = gpiochip_get_data(gc);
>                  struct pca955x_led *led = &pca955x->leds[offset];
>                  u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
> 
>                  return !!(reg & (1 << (led->led_num % 8)));
>          }
> 
> This behaviour is not symmetric with that of set(), where the val is
> inverted by the driver.
> 
> Closing the loop on the GPIO_ACTIVE_LOW inversions,
> gpiod_direction_output(), like gpiod_get_value_cansleep(), handles it
> for us:
> 
>          int gpiod_direction_output(struct gpio_desc *desc, int value)
>          {
>                   VALIDATE_DESC(desc);
>                   if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
>                            value = !value;
>                   else
>                            value = !!value;
>                   return _gpiod_direction_output_raw(desc, value);
>          }
> 
> All-in-all, with a value of 'keep' for default-state property in a
> leds-gpio child node, the current state of the hardware will in-fact be
> inverted; precisely the opposite of what was intended.
> 
> Rework leds-pca955x so that we avoid the incorrect inversion and clarify
> the semantics with respect to GPIO.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> 
> I've rebased on top of "1591caf2d5ea leds: pca955x: check for I2C errors" and
> resolved the conflicts.
> 
>  drivers/leds/leds-pca955x.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 905729191d3e..6dcd2d7cc6a4 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -61,6 +61,9 @@
>  #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
>  #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
>  
> +#define PCA955X_GPIO_HIGH	LED_OFF
> +#define PCA955X_GPIO_LOW	LED_FULL
> +
>  enum pca955x_type {
>  	pca9550,
>  	pca9551,
> @@ -329,9 +332,9 @@ static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
>  	struct pca955x_led *led = &pca955x->leds[offset];
>  
>  	if (val)
> -		return pca955x_led_set(&led->led_cdev, LED_FULL);
> -	else
> -		return pca955x_led_set(&led->led_cdev, LED_OFF);
> +		return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_HIGH);
> +
> +	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
>  }
>  
>  static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
> 

Applied to the for-4.15 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
