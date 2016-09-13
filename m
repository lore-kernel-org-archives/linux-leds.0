From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/8] leds: gpio: set max_brightness to 1
Date: Tue, 13 Sep 2016 15:35:02 +0200
Message-ID: <a5590de2-6b0b-f4cb-bd93-576795004bca@samsung.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
 <CGME20160913060410eucas1p2a02e6204477153843156938975d3b414@eucas1p2.samsung.com>
 <34a66492-d95f-0616-9eb1-84e283cf3f1d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48893 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751438AbcIMNfP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 09:35:15 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODG00LRY32NLI10@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 13 Sep 2016 14:35:11 +0100 (BST)
In-reply-to: <34a66492-d95f-0616-9eb1-84e283cf3f1d@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Heiner,

Thanks for the patches. I'll happily take them all except this
one, as it could break existing userspace clients.

Could you please remove this patch and rebase the rest of the
patch set on top of patch 1/8?

Besides, please also cc linux-kernel@vger.kernel.org list.

Thanks,
Jacek Anaszewski

On 09/13/2016 08:03 AM, Heiner Kallweit wrote:
> GPIO-controlled LED's just have the status on or off.
> Set max_brightness to 1 to reflect this.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/leds/leds-gpio.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 3599b2e..3f64544 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -34,22 +34,16 @@ static void gpio_led_set(struct led_classdev *led_cdev,
>  {
>  	struct gpio_led_data *led_dat =
>  		container_of(led_cdev, struct gpio_led_data, cdev);
> -	int level;
> -
> -	if (value == LED_OFF)
> -		level = 0;
> -	else
> -		level = 1;
>
>  	if (led_dat->blinking) {
> -		led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
> +		led_dat->platform_gpio_blink_set(led_dat->gpiod, value,
>  						 NULL, NULL);
>  		led_dat->blinking = 0;
>  	} else {
>  		if (led_dat->can_sleep)
> -			gpiod_set_value_cansleep(led_dat->gpiod, level);
> +			gpiod_set_value_cansleep(led_dat->gpiod, value);
>  		else
> -			gpiod_set_value(led_dat->gpiod, level);
> +			gpiod_set_value(led_dat->gpiod, value);
>  	}
>  }
>
> @@ -106,6 +100,7 @@ static int create_gpio_led(const struct gpio_led *template,
>  			return -EINVAL;
>  	}
>
> +	led_dat->cdev.max_brightness = 1;
>  	led_dat->cdev.name = template->name;
>  	led_dat->cdev.default_trigger = template->default_trigger;
>  	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
>
