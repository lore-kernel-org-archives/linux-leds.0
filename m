From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] ARM: l2c: parse cache properties from ePAPR definitions
Date: Wed, 10 Sep 2014 12:44:16 +0200
Message-ID: <CACRpkdaLJ6Y+5WXyV1f1UUjiSJ5s2YbG=trKvonbwWLv2aDf4g@mail.gmail.com>
References: <1410339572-23694-1-git-send-email-linus.walleij@linaro.org>
	<4196671.LQ3YKNLqVB@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:47286 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550AbaIJKoQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 10 Sep 2014 06:44:16 -0400
Received: by mail-oi0-f44.google.com with SMTP id x69so6854214oia.17
        for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2014 03:44:16 -0700 (PDT)
In-Reply-To: <4196671.LQ3YKNLqVB@wuerfel>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>

On Wed, Sep 10, 2014 at 11:44 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 10 September 2014 10:59:32 Linus Walleij wrote:

>> +     pr_info("L2C OF: override cache size: %d bytes (%dKB)\n",
>> +             cache_size, cache_size >> 10);
>> +     pr_info("L2C OF: override line size: %d bytes\n", line_size);
>> +     pr_info("L2C OF: override way size: %d bytes (%dKB)\n",
>> +             way_size, way_size >> 10);
>> +     pr_info("L2C OF: override associativity: %d\n", *associativity);
>
> I think it would be really nice to print both the original setting
> and the setting from DT here.

There is already some code printing the original setting, even
if it's cryptic, this is in __l2c_init():
L2C: DT/platform modifies aux control register: 0x02020fff -> 0x02030fff

boot value -> augmented value

If you mean that you want me to modify that debug code to provide
more verbose pretty-print I am happy to do so, but as a separate
patch.

The rest of the stuff I have fixed...

Yours,
Linus Walleij
