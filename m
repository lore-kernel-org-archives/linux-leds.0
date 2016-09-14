From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/6] leds: gpio: fix an unhandled error case in
 create_gpio_led
Date: Wed, 14 Sep 2016 09:13:06 +0200
Message-ID: <d5aa04b0-2e5b-7fc8-9a23-0882670175d4@samsung.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
 <CGME20160913185832eucas1p2d66fec4689db17f211d2557fe426e3d2@eucas1p2.samsung.com>
 <15945af0-24df-ff7c-73b7-7872dc5ed8bd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11473 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755204AbcINHNM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Sep 2016 03:13:12 -0400
In-reply-to: <15945af0-24df-ff7c-73b7-7872dc5ed8bd@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Heiner,

You dropped also patch 1/8 from the first version of the patch
set but patch 2/6 from this series seems to be based on this
change, which causes conflict when trying to apply it.

Please also don't forget to add version number to the PATCH tag.

On 09/13/2016 08:53 PM, Heiner Kallweit wrote:
> gpiod_get_value_cansleep returns 0, 1, or an error code.
> So far errors are not handled and treated the same as 1.
> Change this to bail out if an error code is returned and
> remove the double negation.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/leds/leds-gpio.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 3599b2e..10c851e 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -118,10 +118,13 @@ static int create_gpio_led(const struct gpio_led *template,
>  		led_dat->platform_gpio_blink_set = blink_set;
>  		led_dat->cdev.blink_set = gpio_blink_set;
>  	}
> -	if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP)
> -		state = !!gpiod_get_value_cansleep(led_dat->gpiod);
> -	else
> +	if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP) {
> +		state = gpiod_get_value_cansleep(led_dat->gpiod);
> +		if (state < 0)
> +			return state;
> +	} else {
>  		state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
> +	}
>  	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
>  	if (!template->retain_state_suspended)
>  		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
>


-- 
Best regards,
Jacek Anaszewski
