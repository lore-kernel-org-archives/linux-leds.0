From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] leds: s3c24xx: Fix build failure
Date: Tue, 7 Jan 2014 18:41:43 +0100
Message-ID: <CACRpkdbqDHHb+z2eV-hYbQsdVfYYCHajQZ2=63ab4uDfqRaWmg@mail.gmail.com>
References: <1388394595-1347-1-git-send-email-tushar.behera@linaro.org>
	<1388726757-7387-1-git-send-email-tushar.behera@linaro.org>
	<CAK5ve-K0aCVTo+21G47M0aYT8f-vkqLAd9etWxSY+ieib8KfMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:59270 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752485AbaAGRln convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2014 12:41:43 -0500
Received: by mail-ob0-f176.google.com with SMTP id vb8so501025obc.35
        for <linux-leds@vger.kernel.org>; Tue, 07 Jan 2014 09:41:43 -0800 (PST)
In-Reply-To: <CAK5ve-K0aCVTo+21G47M0aYT8f-vkqLAd9etWxSY+ieib8KfMQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

On Fri, Jan 3, 2014 at 7:19 AM, Bryan Wu <cooloney@gmail.com> wrote:
> On Thu, Jan 2, 2014 at 9:25 PM, Tushar Behera <tushar.behera@linaro.o=
rg> wrote:
>> Commit c67d0f29262b ("ARM: s3c24xx: get rid of custom <mach/gpio.h>"=
)
>> removed the usage of mach/gpio.h file, but we need to include
>> plat/gpio-cfg.h to avoid following build error.
>>
>> Fixes following build error.
>> drivers/leds/leds-s3c24xx.c: In function =91s3c24xx_led_probe=92:
>> drivers/leds/leds-s3c24xx.c:100:2: error: implicit declaration of
>> function =91s3c_gpio_setpull=92 [-Werror=3Dimplicit-function-declara=
tion]
>>
>
> I think this patch should go with Linus's patchset.

Patch applied to the GPIO tree. I added your ACK Bryan since
that seems to be implied above ...

Yours,
Linus Walleij
