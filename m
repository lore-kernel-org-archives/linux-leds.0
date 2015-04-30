From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Thu, 30 Apr 2015 20:11:41 +0300
Message-ID: <5542624D.70701@list.ru>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com> <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553F83DC.8080701@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

28.04.2015 15:58, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> I tried it with Samsung M0 board and
>>> my leds-aat1290 driver. It didn't work well. And for small delay
>>> intervals it will not have a chance to work reliably with all drive=
rs,
>>> especially the ones which use mutex in their brightness_set op,
>>> since mutex can sleep.
>> OK, I can remove the nsec resolution.
>=20
> usec also didn't work, please look at my use case and warning:
>=20
> echo "timer" > trigger
> echo 1 > delay_on
> echo 1 > delay_off
> echo usec > delay_unit
> [  178.584433] hrtimer: interrupt took 300747 ns
>=20
> Only some time later I realized that for AAT1290 brightness is set
> through ASCwire pulse protocol, which takes few ms.
>=20
> Please note that with this approach users would have to wonder why
> they are getting the warnings and why they can't get their LEDs to wo=
rk
> with given settings.
I've now found that the drivers itself use a work queue
when needed. And some drivers, like leds_gpio, even do this:
---
        if (led_dat->can_sleep) {
                led_dat->new_level =3D level;
                schedule_work(&led_dat->work);
        } else {
                set_brightness_now();
        }
---
So it seems the problem is already solved on the per-driver
basis. I don't have leds-aat1290 driver, it is probably not
in the kernel. It is likely forgetting to use the work-queue
the way all other drivers do. So I think my patch is good for
the in-kernel drivers.

There is also a led_cdev->set_brightness_work, and it looks
unused. I could use it for my patch, but for what, if the
drivers already use the work queue when needed?
