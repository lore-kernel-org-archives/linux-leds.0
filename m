From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: chromeos: Use devm_led_classdev_register.
Date: Mon, 22 Feb 2016 09:04:47 +0100
Message-ID: <56CAC11F.1040302@samsung.com>
References: <1452738192-3496-1-git-send-email-aeroevan@gmail.com>
 <1456081624-14058-1-git-send-email-aeroevan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40680 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751705AbcBVIEz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 22 Feb 2016 03:04:55 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2X0003YVS5MD80@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 22 Feb 2016 08:04:53 +0000 (GMT)
In-reply-to: <1456081624-14058-1-git-send-email-aeroevan@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Evan McClain <aeroevan@gmail.com>
Cc: linux-leds@vger.kernel.org, Simon Que <sque@chromium.org>

Hi Evan, Simon,

Please merge these changes with the patch v3 [1] - I've been
waiting for this update and hasn't applied v3 yet.

[1] http://www.spinics.net/lists/linux-leds/msg05353.html

On 02/21/2016 08:07 PM, Evan McClain wrote:
> Also use managed devm_kzalloc.
>
> Signed-off-by: Evan McClain <aeroevan@gmail.com>
> ---
>   drivers/leds/leds-chromeos-keyboard.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
> index 6a6ff75..4e56ede 100644
> --- a/drivers/leds/leds-chromeos-keyboard.c
> +++ b/drivers/leds/leds-chromeos-keyboard.c
> @@ -69,7 +69,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>
> -	cdev = kzalloc(sizeof(struct led_classdev), GFP_KERNEL);
> +	cdev = devm_kzalloc(&pdev->dev, sizeof(struct led_classdev), GFP_KERNEL);
>   	if (!cdev)
>   		return -ENOMEM;
>   	cdev->name = "chromeos::kbd_backlight";
> @@ -78,15 +78,12 @@ static int keyboard_led_probe(struct platform_device *pdev)
>   	cdev->brightness = cdev->max_brightness;
>   	cdev->flags |= LED_CORE_SUSPENDRESUME;
>
> -	ret = led_classdev_register(&pdev->dev, cdev);
> +	ret = devm_led_classdev_register(&pdev->dev, cdev);
>   	if (ret)
> -		goto err;
> +		return ret;
>
>   	platform_set_drvdata(pdev, cdev);
>   	return 0;
> -err:
> -	kfree(cdev);
> -	return ret;
>   }
>
>   static int keyboard_led_remove(struct platform_device *pdev)
> @@ -94,7 +91,6 @@ static int keyboard_led_remove(struct platform_device *pdev)
>   	struct led_classdev *cdev = platform_get_drvdata(pdev);
>
>   	platform_set_drvdata(pdev, NULL);
> -	kfree(cdev);
>   	return 0;
>   }
>
>


-- 
Best regards,
Jacek Anaszewski
