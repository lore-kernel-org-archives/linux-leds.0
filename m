From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v7 1/5] leds: core: add generic support for RGB LED's
Date: Mon, 07 Mar 2016 09:43:01 +0100
Message-ID: <56DD3F15.20907@samsung.com>
References: <56D9F973.8090207@gmail.com>
 <20160306205158-549-87411-mailpile@palmtree-beeroclock-net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56591 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242AbcCGInF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2016 03:43:05 -0500
In-reply-to: <20160306205158-549-87411-mailpile@palmtree-beeroclock-net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Karl Palsson <karlp@tweak.net.au>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

Hi Karl,

On 03/06/2016 09:55 PM, Karl Palsson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Add generic support for RGB LED's.
>>
>> Basic idea is to use enum led_brightness also for the hue and
>> saturation color components.This allows to implement the color
>> extension w/o changes to struct led_classdev.
>>
>> Select LEDS_RGB to enable building drivers using the RGB
>> extension.
>>
>> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
>> should be overridden even if the provided values are zero.
>>
>> Some examples for writing values to
>> /sys/class/leds/<xx>/brightness: (now also hex notation can be
>> used)
>>
>> 255 -> set full brightness and keep existing color if set 0 ->
>> switch LED off but keep existing color so that it can be
>> restored
>>       if the LED is switched on again later
>> 0x1000000 -> switch LED off and set also hue and saturation to
>> 0 0x00ffff -> set full brightness, full saturation and set hue
>> to 0 (red)
>>
>
>
> I admit I hadn't seen this earlier, and I didn't spend all day
> looking at previous attempts, but what's the motivation for
> putting all this overloaded syntax into the "brightness" file? I
> thought the point was to have a single value in each file, one of
> the references I did find was

With single value per file there would be problems with colour
components setting synchronization.

> http://www.spinics.net/lists/linux-leds/msg02995.html Is there
> some thread where this was decided as advantageous? Surely 0-255
> for _brightness_ is what the brightness entry should do?

You can find a reference to the related discussion in [1].

> I'd like to set the rgb colour of a led (or hsv, that can be it's
> own file too) and separately ramp the brightness up and down. I
> also think it's substantially simpler and easier to use from the
> user's point of view, which is surely the place you want easy
> right?

I'm also not very keen on overloading the brightness attribute
semantics. Nonetheless it seems impossible to add support for
setting three colour components otherwise than through a single
syscall, if we want to make it synchronous and compatible with
LED triggers.

HSV color scheme is also very convenient for adapting monochrome
brightness semantics to the RGB realm.


[1] http://www.spinics.net/lists/linux-leds/msg05477.html

-- 
Best regards,
Jacek Anaszewski
