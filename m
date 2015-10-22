From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-wrap.c: Use devm_led_classdev_register
Date: Thu, 22 Oct 2015 09:15:31 +0200
Message-ID: <56288D13.3070108@samsung.com>
References: <1445425115-5415-1-git-send-email-fmthoker@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14996 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754919AbbJVHPf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 22 Oct 2015 03:15:35 -0400
In-reply-to: <1445425115-5415-1-git-send-email-fmthoker@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fida Mohammad <fmthoker@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Muhammad Falak <falakreyaz@gmail.com>, Kristian Kielhofner <kris@krisk.org>

Hi Fida,

On 10/21/2015 12:58 PM, Fida Mohammad wrote:
> Use of resource managed function devm_led_classdev_register to
> make initialization path simpler. Also removed redundant remove
> function.
>
> Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
> ---
>   drivers/leds/leds-wrap.c | 26 ++++----------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
> index 1ba3def..c5ff4b4 100644
> --- a/drivers/leds/leds-wrap.c
> +++ b/drivers/leds/leds-wrap.c
> @@ -76,39 +76,21 @@ static int wrap_led_probe(struct platform_device *pdev)
>   {
>   	int ret;
>
> -	ret = led_classdev_register(&pdev->dev, &wrap_power_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &wrap_power_led);
>   	if (ret < 0)
>   		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &wrap_error_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &wrap_error_led);
>   	if (ret < 0)
> -		goto err1;
> -
> -	ret = led_classdev_register(&pdev->dev, &wrap_extra_led);
> -	if (ret < 0)
> -		goto err2;
> -
> -	return ret;
> +		return ret;
>
> -err2:
> -	led_classdev_unregister(&wrap_error_led);
> -err1:
> -	led_classdev_unregister(&wrap_power_led);
> +	return  devm_led_classdev_register(&pdev->dev, &wrap_extra_led);
>

Removed two extra empty lines end applied, thanks.

> -	return ret;
>   }
>
> -static int wrap_led_remove(struct platform_device *pdev)
> -{
> -	led_classdev_unregister(&wrap_power_led);
> -	led_classdev_unregister(&wrap_error_led);
> -	led_classdev_unregister(&wrap_extra_led);
> -	return 0;
> -}
>
>   static struct platform_driver wrap_led_driver = {
>   	.probe		= wrap_led_probe,
> -	.remove		= wrap_led_remove,
>   	.driver		= {
>   		.name		= DRVNAME,
>   	},
>


-- 
Best Regards,
Jacek Anaszewski
