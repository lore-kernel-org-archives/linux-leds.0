From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: use config symbol LEDS_CLASS_RGB consistently
Date: Mon, 21 Mar 2016 16:45:04 +0100
Message-ID: <56F01700.30407@samsung.com>
References: <56EFD39A.50800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27882 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756044AbcCUPpW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Mar 2016 11:45:22 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4E0045YBRKC850@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 21 Mar 2016 15:45:20 +0000 (GMT)
In-reply-to: <56EFD39A.50800@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Heiner,

Please note that you don't need to submit incremental patches
for the code that is not in mainline yet. You can send just
a new version and I'll replace the old one with it.

Thanks,
Jacek Anaszewski

On 03/21/2016 11:57 AM, Heiner Kallweit wrote:
> Config symbol LEDS_RGB was renamed to LEDS_CLASS_RGB.
> This makes sense, but the change wasn't done consistently.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/Kconfig  | 4 ++--
>   drivers/leds/Makefile | 2 +-
>   drivers/leds/leds.h   | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 4d819ba..f213c06 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -624,9 +624,9 @@ config LEDS_VERSATILE
>   	  This option enabled support for the LEDs on the ARM Versatile
>   	  and RealView boards. Say Y to enabled these.
>
> -if LEDS_RGB
> +if LEDS_CLASS_RGB
>   comment "RGB LED drivers"
> -endif # LEDS_RGB
> +endif # LEDS_CLASS_RGB
>
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 9419dbf..e36ef69 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -2,7 +2,7 @@
>   # LED Core
>   obj-$(CONFIG_NEW_LEDS)			+= led-core-objs.o
>   led-core-objs-y				:= led-core.o
> -led-core-objs-$(CONFIG_LEDS_RGB)	+= led-rgb-core.o
> +led-core-objs-$(CONFIG_LEDS_CLASS_RGB)	+= led-rgb-core.o
>   obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
>   obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
>   obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index b853f54..9c5f3fe 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -35,7 +35,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   				enum led_brightness value);
>   void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>   				enum led_brightness value);
> -#if IS_ENABLED(CONFIG_LEDS_RGB)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS_RGB)
>   enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
>   					   enum led_brightness value);
>   #else
>
