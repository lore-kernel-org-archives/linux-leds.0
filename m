From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH V2] leds: s3c24xx: Fix build failure
Date: Tue, 7 Jan 2014 09:43:09 -0800
Message-ID: <CAK5ve-+05zO0CjFnb0hJoy_txys6q3orRoqdaXLWv91O0=cdpQ@mail.gmail.com>
References: <1388394595-1347-1-git-send-email-tushar.behera@linaro.org>
 <1388726757-7387-1-git-send-email-tushar.behera@linaro.org>
 <CAK5ve-K0aCVTo+21G47M0aYT8f-vkqLAd9etWxSY+ieib8KfMQ@mail.gmail.com> <CACRpkdbqDHHb+z2eV-hYbQsdVfYYCHajQZ2=63ab4uDfqRaWmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:59264 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753388AbaAGRnb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2014 12:43:31 -0500
In-Reply-To: <CACRpkdbqDHHb+z2eV-hYbQsdVfYYCHajQZ2=63ab4uDfqRaWmg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tushar Behera <tushar.behera@linaro.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>

On Tue, Jan 7, 2014 at 9:41 AM, Linus Walleij <linus.walleij@linaro.org=
> wrote:
> On Fri, Jan 3, 2014 at 7:19 AM, Bryan Wu <cooloney@gmail.com> wrote:
>> On Thu, Jan 2, 2014 at 9:25 PM, Tushar Behera <tushar.behera@linaro.=
org> wrote:
>>> Commit c67d0f29262b ("ARM: s3c24xx: get rid of custom <mach/gpio.h>=
")
>>> removed the usage of mach/gpio.h file, but we need to include
>>> plat/gpio-cfg.h to avoid following build error.
>>>
>>> Fixes following build error.
>>> drivers/leds/leds-s3c24xx.c: In function =91s3c24xx_led_probe=92:
>>> drivers/leds/leds-s3c24xx.c:100:2: error: implicit declaration of
>>> function =91s3c_gpio_setpull=92 [-Werror=3Dimplicit-function-declar=
ation]
>>>
>>
>> I think this patch should go with Linus's patchset.
>
> Patch applied to the GPIO tree. I added your ACK Bryan since
> that seems to be implied above ...
>
Sure, thanks.
-Bryan
