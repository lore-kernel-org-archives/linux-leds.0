From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Mon, 4 Apr 2016 23:34:10 +0200
Message-ID: <5702DDD2.2030902@gmail.com>
References: <20160401135748.GD11860@amd> <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34656 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbcDDVel (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 Apr 2016 17:34:41 -0400
In-Reply-To: <20160401211844.GA21768@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com

Hi Pavel,

On 04/01/2016 11:18 PM, Pavel Machek wrote:
> Hi!
>
>>>> It would have the same downsides as in case of having r, g and b in
>>>> separate attributes, i.e. - problems with setting LED colour in
>>>> a consistent way. This way LED blinking in whatever colour couldn't
>>>> be supported reliably. It was one of your primary rationale standing
>>>> behind this design, if I remember correctly. Second - what about
>>>> triggers? We've had a long discussion about it and this design turned
>>>> out to be most fitting.
>>>
>>> Are on/off triggers really that useful for a LED that can produce 16
>>> million colors?
>>>
>>> I believe we should support patterns for RGB LEDs. Something like
>>> [ (time, r, g, b), ... ] . Ok, what about this one?
>>>
>>> Lets say we have
>>>
>>> /sys/class/pattern/lp5533::0
>>> /sys/class/pattern/software::0
>>>
>>> /sys/class/led/n900::red ; default trigger "lp5533::0:0"
>>> /sys/class/led/n900::green ; default trigger "lp5533::0:1"
>>> /sys/class/led/n900::blue ; default trigger "lp5533::0:2"
>>>
>>> Normally, pattern would correspond to one RGB LED. We could have
>>> attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
>>> this pattern.

Could you give an example on how to set a color for RGB LED using
this interface? Would it be compatible with LED triggers?
Where the "pattern" class would be implemented?

>> This involves the same issue you were opposed to: three values per
>> sysfs attribute.
>
> And solves a lot of other things. Like actually being backwards
> compatible.
>
> And yes, it involves three values in a file, but now it is array of
> led brightnesses, and that might actually be acceptable. (At least the
> values have uniform meaning).
 >
> Plus, it is not "issue you were opposed to" it is "something that is
> not permitted by sysfs maintainers".

-- 
Best regards,
Jacek Anaszewski
