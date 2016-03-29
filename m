From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Tue, 29 Mar 2016 22:38:00 +0200
Message-ID: <56FAE7A8.2070302@gmail.com>
References: <56D608ED.2090406@gmail.com> <20160329100258.GA24964@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35774 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522AbcC2UnF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Mar 2016 16:43:05 -0400
In-Reply-To: <20160329100258.GA24964@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Greg KH <greg@kroah.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

Am 29.03.2016 um 12:02 schrieb Pavel Machek:
> Hi!
> 
> First, please Cc me on RGB color support.
> 
>> Add generic support for RGB Color LED's.
>>
>> Basic idea is to use enum led_brightness also for the hue and saturation
>> color components.This allows to implement the color extension w/o
>> changes to struct led_classdev.
>>
>> Select LEDS_RGB to enable building drivers using the RGB extension.
>>
>> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
>> should be overridden even if the provided values are zero.
>>
>> Some examples for writing values to /sys/class/leds/<xx>/brightness:
>> (now also hex notation can be used)
>>
>> 255 -> set full brightness and keep existing color if set
>> 0 -> switch LED off but keep existing color so that it can be restored
>>      if the LED is switched on again later
>> 0x1000000 -> switch LED off and set also hue and saturation to 0
>> 0x00ffff -> set full brightness, full saturation and set hue to 0
>> (red)
> 
> Umm, that's rather strange interface -- and three values in single sysfs
> file is actually forbidden.
> 
> Plus, it is very much unlike existing interfaces for RGB LEDs, which
> we already have supported in the tree. (At least nokia N900 and Sony
> motion controller already contain supported three-color LEDs).
> 
> Now... yes, there's work to be done for the 3-color LEDs. Currently,
> they are treated as three different LEDs. (Which makes some sense, you
> can use "battery charging" trigger for LED, and CPU activity trigger
> for green, for example). It would be good to have some kind of
> grouping, so that userspace can tell "these 3 leds are actually
> combined into one light".
> 
At first thanks for the review comments.
Treating the three physical LEDs of a RGB LED as separate LED devices
might have been implemented due to the lack of alternatives.
With one trigger controlling the red LED and another controlling the green
LED we may end up with a yellow light. Not sure whether this is what we want.

One driver for this extension was the idea of triggers using color
to visualize states etc.
Therefore it's not only about userspace controlling the color.
As a trigger is bound to a led_classdev we need a led_classdev
representing a RGB LED device.

And ok: If required the sysfs interface can be splitted into separate
attributes for hue, saturation, and (existing) brightness.

Rgds, Heiner

> 
> Second, we should define that LED brightness has similar gamma to the
> monitor, so that expected colors are displayed when user requests
> them.
> 
> (And then.. I guess we should talk about more advanced stuff, like
> hardware that can drive the LED changes independently of the main
> CPU.)
> 
> Best regards,
> 								Pavel
> 
