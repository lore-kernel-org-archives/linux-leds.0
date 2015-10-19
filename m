From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-net48xx: Use devm_led_classdev_register
Date: Mon, 19 Oct 2015 10:16:28 +0200
Message-ID: <5624A6DC.50503@samsung.com>
References: <1445038377-11547-1-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40487 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753452AbbJSIQc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2015 04:16:32 -0400
In-reply-to: <1445038377-11547-1-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Chris Boot <bootc@bootc.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Muhammad,

On 10/17/2015 01:32 AM, Muhammad Falak R Wani wrote:
> Use devm_led_classdev_register instead of led_classdev_register,
> removing the redundant net48xx_led_remove function.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-net48xx.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
> index ec3a2e8..0d214c2 100644
> --- a/drivers/leds/leds-net48xx.c
> +++ b/drivers/leds/leds-net48xx.c
> @@ -39,18 +39,11 @@ static struct led_classdev net48xx_error_led = {
>
>   static int net48xx_led_probe(struct platform_device *pdev)
>   {
> -	return led_classdev_register(&pdev->dev, &net48xx_error_led);
> -}
> -
> -static int net48xx_led_remove(struct platform_device *pdev)
> -{
> -	led_classdev_unregister(&net48xx_error_led);
> -	return 0;
> +	return devm_led_classdev_register(&pdev->dev, &net48xx_error_led);
>   }
>
>   static struct platform_driver net48xx_led_driver = {
>   	.probe		= net48xx_led_probe,
> -	.remove		= net48xx_led_remove,
>   	.driver		= {
>   		.name		= DRVNAME,
>   	},
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
