From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-gpio: Fix return value check in
 create_gpio_led()
Date: Mon, 08 Feb 2016 09:09:45 +0100
Message-ID: <56B84D49.1030400@samsung.com>
References: <1454769453-9533-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34828 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755278AbcBHIJw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 8 Feb 2016 03:09:52 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2700MWVYODX840@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 08 Feb 2016 08:09:49 +0000 (GMT)
In-reply-to: <1454769453-9533-1-git-send-email-weiyj_lk@163.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: weiyj_lk@163.com
Cc: Richard Purdie <rpurdie@rpsys.net>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-leds@vger.kernel.org

Hi Wei,

On 02/06/2016 03:37 PM, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function gpio_to_desc() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>   drivers/leds/leds-gpio.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 7bc5328..5883ded 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -104,8 +104,8 @@ static int create_gpio_led(const struct gpio_led *template,
>   			return ret;
>
>   		led_dat->gpiod = gpio_to_desc(template->gpio);
> -		if (IS_ERR(led_dat->gpiod))
> -			return PTR_ERR(led_dat->gpiod);
> +		if (!led_dat->gpiod)
> +			return -EINVAL;
>   	}
>
>   	led_dat->cdev.name = template->name;
>
>
>

Thanks for the patch, applied.

-- 
Best Regards,
Jacek Anaszewski
