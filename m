From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3 3/4] leds: core: add documentation for color extension
Date: Fri, 19 Feb 2016 14:59:20 +0100
Message-ID: <56C71FB8.1060006@samsung.com>
References: <56C637D2.1090805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45803 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425967AbcBSN7W (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2016 08:59:22 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2S004NBS6X0U60@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 19 Feb 2016 13:59:21 +0000 (GMT)
In-reply-to: <56C637D2.1090805@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

On 02/18/2016 10:29 PM, Heiner Kallweit wrote:
> Document the color extension in Documentation/leds/leds-class.txt
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - introduced to patch series
> v3:
> - document extension in more detail
> ---
>   Documentation/leds/leds-class.txt | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index d406d98..d4bf9c1 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -8,6 +8,19 @@ LED is defined in max_brightness file. The brightness file will set the brightne
>   of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
>   brightness support so will just be turned on for non-zero brightness settings.
>
> +If a driver uses the colour extension of the LED core then the brightness
> +file can be used to set hue / saturation / value. The brightness value is
> +interpreted as: <0000000F><HHHHHHHH><SSSSSSSS><VVVVVVVV>
> +Usage of the least byte is identical to monochrome mode. Saturation can be
> +0-255 and hue 0-251 (Colour circle is mapped to 0-252).
> +If hue and saturation both are 0 the current colour is not changed and only
> +the brightness is set. This ensures backwards compatibility with monochrome
> +mode, e.g. in calls like led_set_brightness(LED_FULL).
> +This behavior can be overridden with flag F (LED_SET_COLOR). If this flag
> +is set then hue and saturation are not checked for being 0 and the color
> +components are set unconditionally. Example:
> +0x010000ff sets the LED to white color with full brightness.

When asking for justifying the need for the flag, I had on mind an
explanation of why the flag is needed any not only what are the
implications of setting it. My intention was rather to provide a simple
use case example, e.g. temperature monitoring, when brightness is set
through the trigger, with preset hue and saturation - if I understood
properly your idea.

> +
>   The class also introduces the optional concept of an LED trigger. A trigger
>   is a kernel based source of led events. Triggers can either be simple or
>   complex. A simple trigger isn't configurable and is designed to slot into
> @@ -45,11 +58,12 @@ Is currently of the form:
>
>   "devicename:colour:function"
>
> -There have been calls for LED properties such as colour to be exported as
> -individual led class attributes. As a solution which doesn't incur as much
> -overhead, I suggest these become part of the device name. The naming scheme
> -above leaves scope for further attributes should they be needed. If sections
> -of the name don't apply, just leave that section blank.
> +If the colour extension is used hsv / rgb can be used instead of a specific
> +colour.  There have been calls for LED properties such as colour to be
> +exported as individual led class attributes. As a solution which doesn't
> +incur as much overhead, I suggest these become part of the device name.
> +The naming scheme above leaves scope for further attributes should they be
> +needed. If sections of the name don't apply, just leave that section blank.
>
>
>   Brightness setting API
>


-- 
Best regards,
Jacek Anaszewski
