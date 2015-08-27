From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-cobalt-qube: Use devm_led_classdev_register
Date: Thu, 27 Aug 2015 09:26:53 +0200
Message-ID: <55DEBBBD.9010802@samsung.com>
References: <20150827051302.GA10275@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64624 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725AbbH0H05 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Aug 2015 03:26:57 -0400
In-reply-to: <20150827051302.GA10275@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vaishali,

Thanks for the patch.

On 08/27/2015 07:13 AM, Vaishali Thakkar wrote:
> Use resource-managed function devm_led_classdev_register instead
> of led_classdev_register to make the error-path simpler.
>
> To be compatible with the change, goto is replaced with direct
> return and unneeded label is dropped. Also, remove redundant
> cobalt_qube_led_remove.
>
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
> ---
>   drivers/leds/leds-cobalt-qube.c | 20 ++------------------
>   1 file changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
> index d975220..59818df 100644
> --- a/drivers/leds/leds-cobalt-qube.c
> +++ b/drivers/leds/leds-cobalt-qube.c
> @@ -49,31 +49,15 @@ static int cobalt_qube_led_probe(struct platform_device *pdev)
>   	led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
>   	writeb(led_value, led_port);
>
> -	retval = led_classdev_register(&pdev->dev, &qube_front_led);
> +	retval = devm_led_classdev_register(&pdev->dev, &qube_front_led);
>   	if (retval)
> -		goto err_null;

We can spare more lines by changing this to:

return devm_led_classdev_register(&pdev->dev, &qube_front_led);

You could get rid of retval then, too.

> -
> -	return 0;
> -
> -err_null:
> -	led_port = NULL;
> -
> -	return retval;
> -}
> -
> -static int cobalt_qube_led_remove(struct platform_device *pdev)
> -{
> -	led_classdev_unregister(&qube_front_led);
> -
> -	if (led_port)
> -		led_port = NULL;
> +		return retval;
>
>   	return 0;
>   }
>
>   static struct platform_driver cobalt_qube_led_driver = {
>   	.probe	= cobalt_qube_led_probe,
> -	.remove	= cobalt_qube_led_remove,
>   	.driver	= {
>   		.name	= "cobalt-qube-leds",
>   	},
>


-- 
Best Regards,
Jacek Anaszewski
