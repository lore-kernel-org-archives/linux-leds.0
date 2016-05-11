From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3] platform/chrome: Add Chrome OS keyboard backlight
 LEDs support
Date: Wed, 11 May 2016 10:57:55 -0700
Message-ID: <20160511175755.GA21847@localhost>
References: <20160308191246.GA15630@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35908 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627AbcEKTA2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 May 2016 15:00:28 -0400
Received: by mail-pf0-f194.google.com with SMTP id g132so4382091pfb.3
        for <linux-leds@vger.kernel.org>; Wed, 11 May 2016 12:00:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160308191246.GA15630@dtor-ws>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rhard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Duncan Laurie <dlaurie@chromium.org>, Simon Que <sque@chromium.org>, Bryan Wu <cooloney@gmail.com>, Guenter Roeck <groeck@chromium.org>, Evan McClain <aeroevan@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Mar 08, 2016 at 11:12:46AM -0800, Dmitry Torokhov wrote:
> This is a driver for ACPI-based keyboard backlight LEDs found on
> Chromebooks. The driver locates \\_SB.KBLT ACPI device and exports
> backlight as "chromeos::kbd_backlight" LED class device in sysfs.
> 
> Signed-off-by: Simon Que <sque@chromium.org>
> Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
> Tested-by: Evan McClain <aeroevan@gmail.com>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> ---
> 
> Changes from previous submissions:
> 
> v2->v3:
> - dropped call to platform_set_drvdata() as suggested by Guenter
> 
> v1->v2:
> - moved from drivers/leds to drivers/platform/chrome
> - added method to retrieve brightness from ACPI
> - renamed to cros_kbd_led_backlight
> - config option renamed to CROS_KBD_LED_BACKLIGHT
> - no longer setting initial brightness to max brightness (although on
>   Pixel 1 - Link - ACPI initially reports 100 as brightness anyway)

Ugh. I dropped the ball on this and other patches. Applied now.


-Olof
