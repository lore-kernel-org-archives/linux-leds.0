From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7 v6] leds: add a driver for syscon-based LEDs
Date: Fri, 12 Sep 2014 10:56:52 +0200
Message-ID: <CACRpkdaZhzaA4RxO7fsUSzxquqF4M0g3WXHXPeG5YyF9HttdHg@mail.gmail.com>
References: <1410176286-32533-1-git-send-email-linus.walleij@linaro.org>
	<1410176286-32533-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:58928 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753002AbaILI4x (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Sep 2014 04:56:53 -0400
Received: by mail-oa0-f46.google.com with SMTP id eb12so313158oac.19
        for <linux-leds@vger.kernel.org>; Fri, 12 Sep 2014 01:56:52 -0700 (PDT)
In-Reply-To: <1410176286-32533-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Sep 8, 2014 at 1:38 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> This makes it possible to create a set of LEDs from a syscon
> MFD instance, which is lean mean and clean on the ARM
> reference designs and can replace the Versatile LEDs driver
> in the long run, as well as other custom syscon LEDs drivers.
>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Augment driver to probe all nodes of a syscon to see if they
>   are "register-bit-led"s, and then allocate them under the syscon
>   if that is the case.
> - Switch compatible string from "syscon-leds" to "register-bit-led"

Bryan can you please ACK this patch if you're OK with it so
it can be pulled in through ARM SoC?

Yours,
Linus Walleij
