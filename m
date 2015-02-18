From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: flash: remove stray include directive
Date: Tue, 17 Feb 2015 16:30:02 -0800
Message-ID: <CAK5ve-+V1ngmk3tOQZBE4TSZJwPv8PXYcrtA5OhPyu7DgBWj0w@mail.gmail.com>
References: <1423843607-3840-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:41390 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749AbbBRAaX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 19:30:23 -0500
Received: by iecrd18 with SMTP id rd18so45071689iec.8
        for <linux-leds@vger.kernel.org>; Tue, 17 Feb 2015 16:30:23 -0800 (PST)
In-Reply-To: <1423843607-3840-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

On Fri, Feb 13, 2015 at 8:06 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Avoid including v4l2-controls.h, as this is stray code from the early
> versions of the LED / V4L2 flash API integration patches. LED Flash
> class doesn't depend on V4L2 subsystem.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>


Thanks, I merged it into my tree.

-Bryan

> ---
>  include/linux/led-class-flash.h |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 5ba2fac..3b5b964 100644
> --- a/include/linux/led-class-flash.h
> +++ b/include/linux/led-class-flash.h
> @@ -13,7 +13,6 @@
>  #define __LINUX_FLASH_LEDS_H_INCLUDED
>
>  #include <linux/leds.h>
> -#include <uapi/linux/v4l2-controls.h>
>
>  struct device_node;
>  struct led_classdev_flash;
> --
> 1.7.9.5
>
