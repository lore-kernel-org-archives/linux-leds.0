From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 3/4] leds: core: add documentation for color extension
Date: Wed, 17 Feb 2016 13:34:01 +0100
Message-ID: <56C468B9.20004@samsung.com>
References: <56C37889.9040208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63280 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965076AbcBQMeE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 17 Feb 2016 07:34:04 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2O004DZYWQF3A0@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 17 Feb 2016 12:34:02 +0000 (GMT)
In-reply-to: <56C37889.9040208@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/16/2016 08:29 PM, Heiner Kallweit wrote:
> Document the color extension in Documentation/leds/led-class.txt
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - introduced to patch series
> ---
>   Documentation/leds/leds-class.txt | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index d406d98..fbd9062 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -8,6 +8,14 @@ LED is defined in max_brightness file. The brightness file will set the brightne
>   of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
>   brightness support so will just be turned on for non-zero brightness settings.
>
> +If a driver uses the colour extension of the LED core then the brightness
> +file can be used to set hue / saturation / value. The brightness value is
> +interpreted as: <0000000F><HHHHHHHH><SSSSSSSS><VVVVVVVV>
> +Usage of the least byte is identical to monochrome mode. Saturation can be
> +0-255 and hue 0-251 (Colour circle is mapped to 0-252).
> +If hue and saturation both are 0 the current colour is not changed and only
> +the brightness is set. This can be overridden with flag F (LED_SET_HSV).

Here similarly as in the commit message of 1/4 - more information on why
LED_SET_HSV is needed. btw - I liked LED_SET_COLOR more.

> +
>   The class also introduces the optional concept of an LED trigger. A trigger
>   is a kernel based source of led events. Triggers can either be simple or
>   complex. A simple trigger isn't configurable and is designed to slot into
> @@ -45,11 +53,12 @@ Is currently of the form:
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
