From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH]  leds: leds-hp6xx: Use of devm_classdev_register
Date: Tue, 27 Oct 2015 09:16:56 +0100
Message-ID: <562F32F8.6050701@samsung.com>
References: <1445878828-32514-1-git-send-email-fmthoker@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27482 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590AbbJ0IRA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2015 04:17:00 -0400
In-reply-to: <1445878828-32514-1-git-send-email-fmthoker@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fida Mohammad <fmthoker@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Muhammad Falak <falakreyaz@gmail.com>, Kristoffer <kristoffer.ericson@gmail.com>

Hi Fida,

Thanks for the patch. It doesn't apply smoothly, though.
Please rebase the patch on the top of LED git tree [1], for-next
branch.

[1] 
git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

Best Regards,
Jacek Anaszewski

On 10/26/2015 06:00 PM, Fida Mohammad wrote:
> Use resource managed function devm_classdev_register to make
> error path simpler. Also removed the redundant remove function.
>
> Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
> ---
>   drivers/leds/leds-hp6xx.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
> index 0b84c01..ffb6d5b 100644
> --- a/drivers/leds/leds-hp6xx.c
> +++ b/drivers/leds/leds-hp6xx.c
> @@ -59,28 +59,17 @@ static int hp6xxled_probe(struct platform_device *pdev)
>   {
>   	int ret;
>
> -	ret = led_classdev_register(&pdev->dev, &hp6xx_red_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &hp6xx_red_led);
>   	if (ret < 0)
>   		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &hp6xx_green_led);
> -	if (ret < 0)
> -		led_classdev_unregister(&hp6xx_red_led);
> +	return devm_led_classdev_register(&pdev->dev, &hp6xx_green_led);
>
> -	return ret;
>   }
>
> -static int hp6xxled_remove(struct platform_device *pdev)
> -{
> -	led_classdev_unregister(&hp6xx_red_led);
> -	led_classdev_unregister(&hp6xx_green_led);
> -
> -	return 0;
> -}
>
>   static struct platform_driver hp6xxled_driver = {
>   	.probe		= hp6xxled_probe,
> -	.remove		= hp6xxled_remove,
>   	.driver		= {
>   		.name		= "hp6xx-led",
>   	},
>
