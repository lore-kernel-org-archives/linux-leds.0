From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 4/5] leds: aat1290: Pass dev and dev->of_node to
 v4l2_flash_init()
Date: Wed, 20 May 2015 11:47:26 +0200
Message-ID: <555C582E.8000807@samsung.com>
References: <1432076645-4799-1-git-send-email-sakari.ailus@iki.fi>
 <1432076645-4799-5-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19120 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752950AbbETJra (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 20 May 2015 05:47:30 -0400
In-reply-to: <1432076645-4799-5-git-send-email-sakari.ailus@iki.fi>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, cooloney@gmail.com, g.liakhovetski@gmx.de, s.nawrocki@samsung.com, laurent.pinchart@ideasonboard.com, mchehab@osg.samsung.com

Hi Sakari,

On 05/20/2015 01:04 AM, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@iki.fi>
> ---
>   drivers/leds/leds-aat1290.c |    5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
> index c656a2d..71bf6bb 100644
> --- a/drivers/leds/leds-aat1290.c
> +++ b/drivers/leds/leds-aat1290.c
> @@ -524,9 +524,8 @@ static int aat1290_led_probe(struct platform_device *pdev)
>   	led_cdev->dev->of_node = sub_node;
>
>   	/* Create V4L2 Flash subdev. */
> -	led->v4l2_flash = v4l2_flash_init(fled_cdev,
> -					  &v4l2_flash_ops,
> -					  &v4l2_sd_cfg);
> +	led->v4l2_flash = v4l2_flash_init(dev, NULL, fled_cdev,
> +					  &v4l2_flash_ops, &v4l2_sd_cfg);

Here the first argument should be led_cdev->dev, not dev, which is
&pdev->dev, whereas led_cdev->dev is returned by
device_create_with_groups (it takes dev as a parent) called from 
led_classdev_register.

>   	if (IS_ERR(led->v4l2_flash)) {
>   		ret = PTR_ERR(led->v4l2_flash);
>   		goto error_v4l2_flash_init;
>


-- 
Best Regards,
Jacek Anaszewski
