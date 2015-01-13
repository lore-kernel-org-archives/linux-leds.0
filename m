From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/7 v6] leds: add a driver for syscon-based LEDs
Date: Tue, 13 Jan 2015 12:19:01 -0800
Message-ID: <CAK5ve-Jiq88xZXaBtB8QiQ948yA4ZKmYF9neih0TDoFPNGaDMA@mail.gmail.com>
References: <1410176286-32533-1-git-send-email-linus.walleij@linaro.org>
 <1410176286-32533-2-git-send-email-linus.walleij@linaro.org>
 <CACRpkdaZhzaA4RxO7fsUSzxquqF4M0g3WXHXPeG5YyF9HttdHg@mail.gmail.com> <CACRpkdZkYx73VPJpdxyyjuo4uQ=+zJ5ALYh86B7DGZe_vdUiOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:51028 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbAMUTW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jan 2015 15:19:22 -0500
Received: by mail-ie0-f181.google.com with SMTP id rl12so4966624iec.12
        for <linux-leds@vger.kernel.org>; Tue, 13 Jan 2015 12:19:21 -0800 (PST)
In-Reply-To: <CACRpkdZkYx73VPJpdxyyjuo4uQ=+zJ5ALYh86B7DGZe_vdUiOA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh@kernel.org>

On Thu, Sep 18, 2014 at 3:39 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Sep 12, 2014 at 1:56 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, Sep 8, 2014 at 1:38 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>>> This makes it possible to create a set of LEDs from a syscon
>>> MFD instance, which is lean mean and clean on the ARM
>>> reference designs and can replace the Versatile LEDs driver
>>> in the long run, as well as other custom syscon LEDs drivers.
>>>
>>> Cc: Bryan Wu <cooloney@gmail.com>
>>> Cc: Richard Purdie <rpurdie@rpsys.net>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>> ---
>>> ChangeLog v1->v2:
>>> - Augment driver to probe all nodes of a syscon to see if they
>>>   are "register-bit-led"s, and then allocate them under the syscon
>>>   if that is the case.
>>> - Switch compatible string from "syscon-leds" to "register-bit-led"
>>
>> Bryan can you please ACK this patch if you're OK with it so
>> it can be pulled in through ARM SoC?
>
> Ping!
>
> I will send a pull request for this soon anyway.
>
> Yours,
> Linus Walleij

So sorry about this, my Gmail filter out this email. I have no problem
with this.
-Bryan
