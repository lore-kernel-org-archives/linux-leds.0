From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-fsg: Use devm_led_classdev_register
Date: Mon, 17 Aug 2015 10:27:02 +0200
Message-ID: <55D19AD6.8030506@samsung.com>
References: <20150815102101.GA8323@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:39092 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427AbbHQI1F (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2015 04:27:05 -0400
In-reply-to: <20150815102101.GA8323@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vaishali,

Thanks for the patch. Unfortunately it causes build break.
Please fix the issues and resubmit.

On 08/15/2015 12:21 PM, Vaishali Thakkar wrote:
> Use resource-managed function devm_led_classdev_register instead
> of led_classdev_register to make the error-path simpler.
>
> To be compatible with the change, various gotos are replced with
> direct returns and unneeded labels are dropped. Also, remove
> fsg_led_remove as it is now redundant.
>
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
> ---
>   drivers/leds/leds-fsg.c | 51 ++++++++++++-------------------------------------
>   1 file changed, 12 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
> index 2b4dc73..df0e5da 100644
> --- a/drivers/leds/leds-fsg.c
> +++ b/drivers/leds/leds-fsg.c
> @@ -156,60 +156,33 @@ static int fsg_led_probe(struct platform_device *pdev)
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
> +	ret = devm_classdev_register(&pdev->dev, &fsg_sync_led);
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
> +		return ret;
>
>   	return ret;
>   }
>
> -static int fsg_led_remove(struct platform_device *pdev)
> -{
> -	led_classdev_unregister(&fsg_wlan_led);
> -	led_classdev_unregister(&fsg_wan_led);
> -	led_classdev_unregister(&fsg_sata_led);
> -	led_classdev_unregister(&fsg_usb_led);
> -	led_classdev_unregister(&fsg_sync_led);
> -	led_classdev_unregister(&fsg_ring_led);
> -
> -	return 0;
> -}
> -
> -
>   static struct platform_driver fsg_led_driver = {
>   	.probe		= fsg_led_probe,
>   	.remove		= fsg_led_remove,
>


-- 
Best Regards,
Jacek Anaszewski
