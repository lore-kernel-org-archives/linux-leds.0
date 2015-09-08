From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Single gpio shared by LED and switch?
Date: Tue, 8 Sep 2015 16:37:54 +0200
Message-ID: <CACRpkdZ+W8ZBdtjYUUYAy6t+bRvRx9MG7YP0EKno2Cr5C-kzoQ@mail.gmail.com>
References: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
	<55ED8B36.60108@samsung.com>
	<CAMuHMdUrhrJv_3UX32AMC2Z_f4xp+LABgDCjgWdcJFa6=k9n_g@mail.gmail.com>
	<55EEBDBC.8040408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36334 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932074AbbIHOhz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2015 10:37:55 -0400
Received: by oibi136 with SMTP id i136so59984578oib.3
        for <linux-leds@vger.kernel.org>; Tue, 08 Sep 2015 07:37:54 -0700 (PDT)
In-Reply-To: <55EEBDBC.8040408@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Tue, Sep 8, 2015 at 12:51 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 09/07/2015 03:22 PM, Geert Uytterhoeven wrote:

>> Something like this?
>>
>>                       VCC         VCC
>>                        |           |
>>                        R           R
>>                        |           |
>>                __|__   |           |
>>            +---o   o---+          _|_
>>            |           |          \ /
>>            |           |          ---
>>           GND          R           |
>>                        |           |
>>                        |         |-+
>>                        |         |<+
>> GPIO -----------------+---------|-|
>>                                    |
>>                                    |
>>                                   GND
>
>
> You would need also resistor to avoid short-circuit
> when the switch is on.

There is a resistor AFAICT.

But consider the GPIO side which is opaque
here. When used as input it is often high impedance
but when used to drive it is not.

Doesn't this mean the output actually has to be
open collector (open drain)?

In that case we should enforce that in the software
framework too so we protect people from shooting
themselves in the foot.

> We'd have to ask Linus if he welcomes drivers for this type
> of home-made circuits in mainline. If yes, then probably someone would
> have to build the circuit, develop and test the driver on it, and
> finally come up with a detailed documentation.
> Are you the volunteer? :)

Of course he's considering it or he wouldn't write :)

I'm curious about what comes out of this, this is exactly
the type of problems that the GPIO subsystem is about
to help with.

Yours,
Linus Walleij
