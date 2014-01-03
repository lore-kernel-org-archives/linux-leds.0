From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] leds: s3c24xx: Fix build failure
Date: Fri, 3 Jan 2014 10:35:02 +0530
Message-ID: <CAHbNUh3eC7dhEL9Ek4doGT-R=oPeMDm4N7dtE5fNSaXRKCz3mg@mail.gmail.com>
References: <1388394595-1347-1-git-send-email-tushar.behera@linaro.org>
	<CAK5ve-L9RxRouoS=F8CywGW_s_tw4eZzLc4O0=_HdYtaMBVMuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-L9RxRouoS=F8CywGW_s_tw4eZzLc4O0=_HdYtaMBVMuQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org

On 3 January 2014 04:12, Bryan Wu <cooloney@gmail.com> wrote:
> On Mon, Dec 30, 2013 at 1:09 AM, Tushar Behera <tushar.behera@linaro.=
org> wrote:
>> Fixes following build error.
>> drivers/leds/leds-s3c24xx.c: In function =E2=80=98s3c24xx_led_probe=E2=
=80=99:
>> drivers/leds/leds-s3c24xx.c:100:2: error: implicit declaration of
>> function =E2=80=98s3c_gpio_setpull=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>>
>
> I don't see any building error with s3c2410_defconfig. Actually this
> <plat/gpio-cfg.h> is included in
> arch/arm/mach-s3c24xx/include/mach/gpio.h which is in
> arch/arm/include/asm/gpio.h, then <linux/gpio.h>
>

This requires that CONFIG_NEED_MACH_GPIO_H is defined. Following
commit has removed this option for s3c24xx platform.

c67d0f29262b ("ARM: s3c24xx: get rid of custom <mach/gpio.h>").

--=20
Tushar Behera
