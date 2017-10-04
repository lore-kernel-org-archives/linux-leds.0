From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH for 4.15] leds: pca955x: Fix configuration on GPIO request
 for input
Date: Wed, 4 Oct 2017 21:08:38 +0200
Message-ID: <80a419c1-9ccc-c477-fe48-641a527baaa5@gmail.com>
References: <20171004072701.25782-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171004072701.25782-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org
Cc: pavel@ucw.cz, linux-kernel@vger.kernel.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>
List-Id: linux-leds@vger.kernel.org

Hi Andrew,

Thanks for the fix.

On 10/04/2017 09:27 AM, Andrew Jeffery wrote:
> The prior patch which fixed the problem with output inversion failed to
> account for a necessary change to requesting a pin for input, which is
> affected by the open-drain nature of the hardware.
> 
> Previously pca955x_gpio_direction_input() called through
> pca955x_set_value() to configure the direction, however continuing down
> this route lead to a brain-hemorrhaging level of necessary inversions.
> Instead, remove one layer by calling directly into pca955x_led_set(),
> and define PCA955X_GPIO_INPUT to paper over the rest of the confusion.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Tested-by: Matt Spinler <mspinler@linux.vnet.ibm.com>
> ---
> Jacek:
> 
> The prior patch called out above is "eae1693fb026 leds: pca955x: Don't
> invert requested value in pca955x_gpio_set_value()" (at the time of sending). I
> think I've seen the leds tree be rebased in the past, so feel free to squash
> this change in if desired.

Squashed this patch into the original fix on the for-next branch.

Thanks,
Jacek Anaszewski

>  drivers/leds/leds-pca955x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 6dcd2d7cc6a4..78183f90820e 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -61,6 +61,7 @@
>  #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
>  #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
>  
> +#define PCA955X_GPIO_INPUT	LED_OFF
>  #define PCA955X_GPIO_HIGH	LED_OFF
>  #define PCA955X_GPIO_LOW	LED_FULL
>  
> @@ -358,8 +359,11 @@ static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
>  static int pca955x_gpio_direction_input(struct gpio_chip *gc,
>  					unsigned int offset)
>  {
> -	/* To use as input ensure pin is not driven */
> -	return pca955x_set_value(gc, offset, 0);
> +	struct pca955x *pca955x = gpiochip_get_data(gc);
> +	struct pca955x_led *led = &pca955x->leds[offset];
> +
> +	/* To use as input ensure pin is not driven. */
> +	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_INPUT);
>  }
>  
>  static int pca955x_gpio_direction_output(struct gpio_chip *gc,
> 
