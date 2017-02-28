From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] leds: core: add struct device_node pointer to the
 struct led_classdev
Date: Tue, 28 Feb 2017 22:20:18 +0100
Message-ID: <a535b820-b29f-252f-ba55-25a2f376f773@gmail.com>
References: <20170227222300.2060-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33209 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751473AbdB1Vaw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2017 16:30:52 -0500
Received: by mail-wm0-f67.google.com with SMTP id v77so4358473wmv.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Feb 2017 13:30:14 -0800 (PST)
In-Reply-To: <20170227222300.2060-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

Hi Rafał,

Thanks for the patch. How about following what has been already
done for spi, i.e. adding a wrapper of_led_classdev_register()
(please refer to of_register_spi_device() in drivers/spi/spi.c)?

Best regards,
Jacek Anaszewski

On 02/27/2017 11:22 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This allows every led_classdev_register user to set of_node before
> calling that function. Thanks to this LEDs core code may access DT node
> during LED registration (e.g. to read extra info).
> 
> A small disadvantage of this imlementation is keeping of_node pointer in
> two places: struct led_classdev and struct device.
> Another solutions were:
> 1) Passing pointer with a led_classdev_register call
>    This would require changing & complicating the API.
> 2) Moving allocation part of led_classdev_register to separated function
>    This would make registering LED even more complicated.
> 
> Having duplicated pointer semms like a reasonable trade-off.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  drivers/leds/led-class.c | 1 +
>  include/linux/leds.h     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 326ee6e925a2..9db9d05e4832 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -199,6 +199,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  				led_cdev, led_cdev->groups, "%s", name);
>  	if (IS_ERR(led_cdev->dev))
>  		return PTR_ERR(led_cdev->dev);
> +	led_cdev->dev->of_node = led_cdev->of_node;
>  
>  	if (ret)
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 569cb531094c..7dc4a679f376 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -85,6 +85,7 @@ struct led_classdev {
>  				     unsigned long *delay_off);
>  
>  	struct device		*dev;
> +	struct device_node	*of_node;
>  	const struct attribute_group	**groups;
>  
>  	struct list_head	 node;			/* LED Device list */
> 
