From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Single gpio shared by LED and switch?
Date: Wed, 9 Sep 2015 09:35:07 +0200
Message-ID: <CAMuHMdUkhWCURDKnpoArerLUEsfUsS2U00tus4uuFvDjA1cRPA@mail.gmail.com>
References: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
	<55ED8B36.60108@samsung.com>
	<CAMuHMdUrhrJv_3UX32AMC2Z_f4xp+LABgDCjgWdcJFa6=k9n_g@mail.gmail.com>
	<55EEBDBC.8040408@samsung.com>
	<CACRpkdZ+W8ZBdtjYUUYAy6t+bRvRx9MG7YP0EKno2Cr5C-kzoQ@mail.gmail.com>
	<55EFDEE7.20201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35648 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752410AbbIIHfI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2015 03:35:08 -0400
In-Reply-To: <55EFDEE7.20201@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Jacek,

On Wed, Sep 9, 2015 at 9:25 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 09/08/2015 04:37 PM, Linus Walleij wrote:
>> On Tue, Sep 8, 2015 at 12:51 PM, Jacek Anaszewski
>> <j.anaszewski@samsung.com> wrote:
>>> On 09/07/2015 03:22 PM, Geert Uytterhoeven wrote:
>>>> Something like this?
>>>>
>>>>                        VCC         VCC
>>>>                         |           |
>>>>                         R           R
>>>>                         |           |
>>>>                 __|__   |           |
>>>>             +---o   o---+          _|_
>>>>             |           |          \ /
>>>>             |           |          ---
>>>>            GND          R           |
>>>>                         |           |
>>>>                         |         |-+
>>>>                         |         |<+
>>>> GPIO -----------------+---------|-|
>>>>                                     |
>>>>                                     |
>>>>                                    GND
>>>
>>> You would need also resistor to avoid short-circuit
>>> when the switch is on.
>>
>> There is a resistor AFAICT.
>
> Indeed. For some reason my mind filtered out these 'R'
> characters.

Sorry for the bad drawing, which is a simplified extract from the real
schematic diagram.

>> But consider the GPIO side which is opaque
>> here. When used as input it is often high impedance
>> but when used to drive it is not.
>>
>> Doesn't this mean the output actually has to be
>> open collector (open drain)?

I think the GPIO is just a standard push-pull output in output mode.

> I think that GPIO control register would have to be
> altered to switch between particular modes.
>
> Let's analyze possible modes, assuming that the transistor
> is a bipolar PNP:

Actually it's an N-channel MOSFET.

>>> We'd have to ask Linus if he welcomes drivers for this type
>>> of home-made circuits in mainline. If yes, then probably someone would
>>> have to build the circuit, develop and test the driver on it, and
>>> finally come up with a detailed documentation.
>>> Are you the volunteer? :)
>>
>> Of course he's considering it or he wouldn't write :)

This is not a home-made circuit.
Let's see how it goes when the hardware arrives...

Thanks, now I know no driver exists yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
