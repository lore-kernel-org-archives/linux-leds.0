From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 3/4] leds: core: add documentation for color extension
Date: Mon, 29 Feb 2016 17:14:16 +0100
Message-ID: <56D46E58.5070508@samsung.com>
References: <56CF7C85.7030005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:59951 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752706AbcB2QOU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 29 Feb 2016 11:14:20 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3B00AW1H3TKX50@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 29 Feb 2016 16:14:17 +0000 (GMT)
In-reply-to: <56CF7C85.7030005@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/25/2016 11:13 PM, Heiner Kallweit wrote:
> Document the color extension in Documentation/leds/leds-class.txt
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - introduced to patch series
> v3:
> - document extension in more detail
> v4:
> - Better explain why flag LED_SET_HUE_SAT is needed
> ---
>   Documentation/leds/leds-class.txt | 27 ++++++++++++++++++++++-----
>   1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index d406d98..b1e4cba 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -8,6 +8,22 @@ LED is defined in max_brightness file. The brightness file will set the brightne
>   of the LED (taking a value 0-max_brightness). Most LEDs don't have hardware
>   brightness support so will just be turned on for non-zero brightness settings.
>
> +If a driver uses the colour extension of the LED core then the brightness
> +file can be used to set hue / saturation / value. The brightness value is
> +interpreted as: <0000000F><HHHHHHHH><SSSSSSSS><VVVVVVVV>
> +Usage of the least byte is identical to monochrome mode. Saturation can be
> +0-255 and hue 0-251 (Colour circle is mapped to 0-252).
> +If hue and saturation both are 0 the current colour is preserved and only
> +the brightness is set. This ensures backwards compatibility with monochrome
> +mode, e.g. for led_set_brightness() calls from triggers.
> +However we might want to have the option to set all HSV components, even
> +if hue and saturation both are 0 (e.g. via brightness sysfs attribute).
> +Use case: Set color to white (hue = 0 and saturation = 0).
> +Therefore the default behaviour can be overridden with flag F (LED_SET_HUE_SAT).
> +If this flag is set then hue and saturation are not checked for being 0 and
> +the color components are set unconditionally. Example:
> +0x010000ff sets the LED to white color with full brightness.

I was thinking especially about highlighting the use case when we set
different hue and sat for different LEDs that are registered on some
trigger, and a driver that is currently unaware of LED RGB extension can
set only brightness and the LEDs will react with changing their
colors but each of them in different manner, according to the hue
and sat set.

>   The class also introduces the optional concept of an LED trigger. A trigger
>   is a kernel based source of led events. Triggers can either be simple or
>   complex. A simple trigger isn't configurable and is designed to slot into
> @@ -45,11 +61,12 @@ Is currently of the form:
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
