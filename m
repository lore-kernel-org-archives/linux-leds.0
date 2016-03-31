From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color LED's
Date: Thu, 31 Mar 2016 10:17:36 +0200
Message-ID: <56FCDD20.6060406@samsung.com>
References: <56D608ED.2090406@gmail.com> <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com> <20160329214323.GA10455@amd>
 <56FB893C.60203@samsung.com> <20160330130319.GB19994@amd>
 <CAFSsGVuzToswt6bh9w3L2LqC6SiVyPw1-wSgUa3i=O14io85kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFSsGVuzToswt6bh9w3L2LqC6SiVyPw1-wSgUa3i=O14io85kg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Heiner,

On 03/30/2016 03:59 PM, Heiner Kallweit wrote:
> On Wed, Mar 30, 2016 at 3:03 PM, Pavel Machek <pavel@ucw.cz> wrote:
>> Hi!
>>
>>>> Ok, so:
>>>>
>>>> a) Do we want RGB leds to be handled by existing subsystem, or do we
>>>> need separate layer on top of that?
>>>>
>>>> b) Does RGB make sense, or HSV? RGB is quite widely used in graphics,
>>>> and it is what hardware implements. (But we'd need to do gamma
>>>> correction).
>>>>
>>>> c) My hardware has "acceleration engine", LED is independend from
>>>> CPU. That's rather big deal. Does yours? It seems to be quite common,
>>>> at least in cellphones.
>>>>
>>>> Ideally, I'd like to have "triggers", but different ones. As in: if
>>>> charging, do yellow " .xX" pattern. If fully charged, do green steady
>>>> light. If message is waiting, do blue " x x" pattern. If none of
>>>> above, do slow white blinking. (Plus priorities of events). But that's
>>>> quite different from existing support...)
>>>
>>> Please note that HSV colour scheme allows to neatly project monochrome
>>> brightness semantics on the RGB realm. I.e. you can have fixed
>>> hue and saturation, and by changing the brightness component a perceived
>>> colour intensity can be altered.
>>
>> I see HSV has some advantages. But we already have LEDs with multiple
>> colors, and kernel already handles them:
>>
>> pavel@duo:~$ ls -1 /sys/class/leds/
>> tpacpi:green:batt
>> tpacpi:orange:batt
>>
>> This is physically 2 leds but hidden under one indicator, so you got
>> "off", "green", "orange" and "green+orange".
>
> That's a good example. As long as you can recognize green+orange as
> separate lights/colors
> (w/o magnifying glass) I wouldn't call it "a LED with multiple colors"
> but "multiple
> LED devices".
>
> In my use case we talk about RGB LEDs like the commonly used 5050 SMD RGB LEDs.
> And it's not only about using a handful of discrete colors but about
> displaying any arbitrary
> color.
> So far the kernel exposes the physical RGB LEDs as separate LEDs only
> and I can't use
> a trigger to e.g. set "magenta with 50% brightness".

I think that we should consult more people before pushing the solution
upstream. Would you mind writing a message with an explanation of the
issue to linux-api list?

Please keep in mind also the information from the "Attributes" section
of Documentation/filesystems/sysfs.txt.

-- 
Best regards,
Jacek Anaszewski
