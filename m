From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color LED's
Date: Fri, 01 Apr 2016 15:28:59 +0200
Message-ID: <56FE779B.9020602@samsung.com>
References: <56D608ED.2090406@gmail.com> <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com> <20160329214323.GA10455@amd>
 <56FB893C.60203@samsung.com> <20160330130319.GB19994@amd>
 <CAFSsGVuzToswt6bh9w3L2LqC6SiVyPw1-wSgUa3i=O14io85kg@mail.gmail.com>
 <20160401125540.GC11860@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15188 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752684AbcDAN3H (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 1 Apr 2016 09:29:07 -0400
In-reply-to: <20160401125540.GC11860@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

On 04/01/2016 02:55 PM, Pavel Machek wrote:
> Hi!
>
>>> pavel@duo:~$ ls -1 /sys/class/leds/
>>> tpacpi:green:batt
>>> tpacpi:orange:batt
>>>
>>> This is physically 2 leds but hidden under one indicator, so you got
>>> "off", "green", "orange" and "green+orange".
>>
>> That's a good example. As long as you can recognize green+orange as
>> separate lights/colors
>> (w/o magnifying glass) I wouldn't call it "a LED with multiple colors"
>> but "multiple
>> LED devices".
>
> Well, that's how it is currently handled. But for the user, it looks
> as a LED with multiple colors.
>
>> In my use case we talk about RGB LEDs like the commonly used 5050 SMD RGB LEDs.
>> And it's not only about using a handful of discrete colors but about
>> displaying any arbitrary
>> color.
>> So far the kernel exposes the physical RGB LEDs as separate LEDs only
>> and I can't use
>> a trigger to e.g. set "magenta with 50% brightness".
>
> Why not?
>
> What do you do if you want to display magenta on your LCD?
>
> You compute RGB values, then display them.

The main drawback is that you can't set the colour at one go,
but have to set brightness of each LED class device (R,G,B)
separately. It incurs delays between setting each colour component.

It is also impossible to set arbitrary colour from a trigger.
Similarly blinking with arbitrarily chosen colour from RGB palette
is impossible if separate colour components are treated as
separate LEDs.

-- 
Best regards,
Jacek Anaszewski
