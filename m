From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: bcm6328: Handle default-state of LEDs correctly
Date: Mon, 26 Oct 2015 09:45:38 +0100
Message-ID: <562DE832.6070903@samsung.com>
References: <562BB799.7000708@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26427 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753170AbbJZIpm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 26 Oct 2015 04:45:42 -0400
In-reply-to: <562BB799.7000708@simon.arlott.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>

Hi Simon,

Thanks for the patch. There are conflicts when applying
it to the LED tree:

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

Please use it as a code base for your LED development.

When patching existing drivers, please always copy its author(s).

Cc Alvaro and Jonas.

On 10/24/2015 06:53 PM, Simon Arlott wrote:
> The default-state handler assumes that the LED is active low and omits
> use of the shift macro causing "keep" to misdetect the state.
>
> Determine the brightness and then use the led set function to apply it.
>
> Update the documentation to indicate that this driver works for the
> BCM63168 (which has many active high LEDs) too.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>   .../devicetree/bindings/leds/leds-bcm6328.txt      |  2 +-
>   drivers/leds/leds-bcm6328.c                        | 23 ++++++++++++----------
>   2 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> index f9e36ad..d00260d 100644
> --- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
> @@ -1,6 +1,6 @@
>   LEDs connected to Broadcom BCM6328 controller
>
> -This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268.
> +This controller is present on BCM6318, BCM6328, BCM6362, BCM63168 and BCM63268.
>   In these SoCs it's possible to control LEDs both as GPIOs or by hardware.
>   However, on some devices there are Serial LEDs (LEDs connected to a 74x164
>   controller), which can either be controlled by software (exporting the 74x164

Is this change related to the modifications made to the driver?
If yes, please explain the relationship in the commit message, and if
not, it should be split into a separate patch.

> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index 1793727..771c171 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -259,7 +259,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   		       unsigned long *blink_leds, unsigned long *blink_delay)
>   {
>   	struct bcm6328_led *led;
> -	unsigned long flags;
>   	const char *state;
>   	int rc;
>
> @@ -282,13 +281,12 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   						    NULL);
>
>   	if (!of_property_read_string(nc, "default-state", &state)) {
> -		spin_lock_irqsave(lock, flags);
>   		if (!strcmp(state, "on")) {
>   			led->cdev.brightness = LED_FULL;
> -			bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
>   		} else if (!strcmp(state, "keep")) {
>   			void __iomem *mode;
>   			unsigned long val, shift;
> +			unsigned long flags;
>
>   			shift = bcm6328_pin2shift(led->pin);
>   			if (shift / 16)
> @@ -296,19 +294,24 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   			else
>   				mode = mem + BCM6328_REG_MODE_LO;
>
> -			val = bcm6328_led_read(mode) >> (shift % 16);
> +			spin_lock_irqsave(lock, flags);
> +			val = bcm6328_led_read(mode);
> +			spin_unlock_irqrestore(lock, flags);
> +
> +			val >>= BCM6328_LED_SHIFT(shift % 16);
>   			val &= BCM6328_LED_MODE_MASK;
> -			if (val == BCM6328_LED_MODE_ON)
> +
> +			dev_info(dev, "pin %lu = %08lx\n", led->pin, val);
> +			if ((led->active_low && val == BCM6328_LED_MODE_ON) ||
> +			    (!led->active_low && val == BCM6328_LED_MODE_OFF))
>   				led->cdev.brightness = LED_FULL;
> -			else {
> +			else
>   				led->cdev.brightness = LED_OFF;
> -				bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
> -			}
>   		} else {
>   			led->cdev.brightness = LED_OFF;
> -			bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
>   		}
> -		spin_unlock_irqrestore(lock, flags);
> +
> +		bcm6328_led_set(&led->cdev, led->cdev.brightness);
>   	}
>
>   	led->cdev.brightness_set = bcm6328_led_set;
>

-- 
Best Regards,
Jacek Anaszewski
