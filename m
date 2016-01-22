From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] led: core: fix misleading comment after workqueue
 removal from drivers
Date: Fri, 22 Jan 2016 09:37:18 +0100
Message-ID: <56A1EA3E.6070600@samsung.com>
References: <56A1578D.1050101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33982 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751599AbcAVIhV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jan 2016 03:37:21 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1C004B3IM7I000@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 22 Jan 2016 08:37:19 +0000 (GMT)
In-reply-to: <56A1578D.1050101@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

Applied to devel branch of LED git. I will merge it to the
for-next branch after merge window is closed.

Thanks,
Jacek Anaszewski

On 01/21/2016 11:11 PM, Heiner Kallweit wrote:
> Now that workqueues have been removed from individual drivers and
> were replaced with a core-internal workqueue we shouldn't
> encourage people to add new workqueues to drivers.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - make comment simpler and clearer
> ---
>   include/linux/leds.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index bc1476f..e3470e7 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -49,8 +49,10 @@ struct led_classdev {
>   #define LED_SYSFS_DISABLE	(1 << 22)
>   #define LED_DEV_CAP_FLASH	(1 << 23)
>
> -	/* Set LED brightness level */
> -	/* Must not sleep, use a workqueue if needed */
> +	/* Set LED brightness level
> +	 * Must not sleep. Use brightness_set_blocking for drivers
> +	 * that can sleep while setting brightness.
> +	 */
>   	void		(*brightness_set)(struct led_classdev *led_cdev,
>   					  enum led_brightness brightness);
>   	/*
>
