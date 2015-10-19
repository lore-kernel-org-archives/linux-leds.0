From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-fsg: Use devm_led_class_register
Date: Mon, 19 Oct 2015 09:48:26 +0200
Message-ID: <5624A04A.6060209@samsung.com>
References: <1445037197-8038-1-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29089 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbbJSHsa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2015 03:48:30 -0400
In-reply-to: <1445037197-8038-1-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Anreas Werner <andreas.werner@men.de>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Muhammad,

On 10/17/2015 01:13 AM, Muhammad Falak R Wani wrote:
> Use resource-managed function devm_led_classdev_register, remove
> redundant function fsg_led_remove.
> Drop unneeded gotos to make the _init code flow clean.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-fsg.c | 52 ++++++++++++-------------------------------------
>   1 file changed, 12 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
> index 2b4dc73..cb01f5e 100644
> --- a/drivers/leds/leds-fsg.c
> +++ b/drivers/leds/leds-fsg.c
> @@ -156,63 +156,35 @@ static int fsg_led_probe(struct platform_device *pdev)
>   	latch_value = 0xffff;
>   	*latch_address = latch_value;
>
> -	ret = led_classdev_register(&pdev->dev, &fsg_wlan_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &fsg_wlan_led);
>   	if (ret < 0)
> -		goto failwlan;
> +		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &fsg_wan_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &fsg_wan_led);
>   	if (ret < 0)
> -		goto failwan;
> +		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &fsg_sata_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &fsg_sata_led);
>   	if (ret < 0)
> -		goto failsata;
> +		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &fsg_usb_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &fsg_usb_led);
>   	if (ret < 0)
> -		goto failusb;
> +		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &fsg_sync_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &fsg_sync_led);
>   	if (ret < 0)
> -		goto failsync;
> +		return ret;
>
> -	ret = led_classdev_register(&pdev->dev, &fsg_ring_led);
> +	ret = devm_led_classdev_register(&pdev->dev, &fsg_ring_led);
>   	if (ret < 0)
> -		goto failring;
> -
> -	return ret;
> -
> - failring:
> -	led_classdev_unregister(&fsg_sync_led);
> - failsync:
> -	led_classdev_unregister(&fsg_usb_led);
> - failusb:
> -	led_classdev_unregister(&fsg_sata_led);
> - failsata:
> -	led_classdev_unregister(&fsg_wan_led);
> - failwan:
> -	led_classdev_unregister(&fsg_wlan_led);
> - failwlan:
> -
> -	return ret;
> -}
> -
> -static int fsg_led_remove(struct platform_device *pdev)
> -{
> -	led_classdev_unregister(&fsg_wlan_led);
> -	led_classdev_unregister(&fsg_wan_led);
> -	led_classdev_unregister(&fsg_sata_led);
> -	led_classdev_unregister(&fsg_usb_led);
> -	led_classdev_unregister(&fsg_sync_led);
> -	led_classdev_unregister(&fsg_ring_led);
> +		return ret;
>
>   	return 0;
>   }
>
> -
>   static struct platform_driver fsg_led_driver = {
>   	.probe		= fsg_led_probe,
> -	.remove		= fsg_led_remove,
>   	.driver		= {
>   		.name		= "fsg-led",
>   	},
>

We've had a similar patch for this driver already. Please refer to
linux-next or LED tree:

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

-- 
Best Regards,
Jacek Anaszewski
