From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 1/4] leds: core: add generic support for RGB Color LED's
Date: Fri, 26 Feb 2016 11:03:16 +0100
Message-ID: <56D022E4.5090105@samsung.com>
References: <56CF7C25.4060707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62247 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699AbcBZKDV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 26 Feb 2016 05:03:21 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O3500193FXINP30@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 26 Feb 2016 10:03:18 +0000 (GMT)
In-reply-to: <56CF7C25.4060707@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

I don't see [PATCH v4 2/4]. Have you sent it?

On 02/25/2016 11:11 PM, Heiner Kallweit wrote:
> Add generic support for RGB Color LED's.
>
> Basic idea is to use enum led_brightness also for the hue and saturation
> color components.This allows to implement the color extension w/o
> changes to struct led_classdev.
>
> Select LEDS_RGB to enable building drivers using the RGB extension.
>
> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
> should be overridden even if the provided values are zero.
>
> Some examples for writing values to /sys/class/leds/<xx>/brightness:
> (now also hex notation can be used)
>
> 255 -> set full brightness and keep existing color if set
> 0 -> switch LED off but keep existing color so that it can be restored
>       if the LED is switched on again later
> 0x1000000 -> switch LED off and set also hue and saturation to 0
> 0x00ffff -> set full brightness, full saturation and set hue to 0 (red)
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
[...]

-- 
Best regards,
Jacek Anaszewski
