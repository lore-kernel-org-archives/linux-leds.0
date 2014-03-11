From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 2/3] ARM/leds: move ARM Versatile LED driver to leds
 subsystem
Date: Tue, 11 Mar 2014 12:23:54 +0000
Message-ID: <1394540634.21334.27.camel@hornet>
References: <1393509500-26002-1-git-send-email-linus.walleij@linaro.org>
	 <1393509500-26002-2-git-send-email-linus.walleij@linaro.org>
	 <1393510075.460580224@f137.i.mail.ru>
	 <CACRpkdb+nLnjM7PUtkzmSJLjEC7FOH65sgOB6m-BUPB8YMzxiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:28087 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752220AbaCKMX4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 11 Mar 2014 08:23:56 -0400
In-Reply-To: <CACRpkdb+nLnjM7PUtkzmSJLjEC7FOH65sgOB6m-BUPB8YMzxiA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Tue, 2014-03-11 at 12:18 +0000, Linus Walleij wrote:
> On Thu, Feb 27, 2014 at 3:07 PM, Alexander Shiyan <shc_work@mail.ru> =
wrote:
> > =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 27 =D1=84=D0=B5=D0=B2=D1=
=80=D0=B0=D0=BB=D1=8F 2014, 14:58 +01:00 =D0=BE=D1=82 Linus Walleij <li=
nus.walleij@linaro.org>:
> >> Now that we have converted this driver to a real platform device
> >> module-based thing, we move the driver down into the LEDs
> >> subsystem and rename the config option to LEDS_VERSATILE.
> >
> > In fact, it can be converted to use basic-mmio-gpio =3D> leds-gpio.
>=20
> Hm, yeah I see what you mean. However this register is not described
> as a GPIO register, and on all Versatile/RealView boards these signal=
s
> are soldered to LEDs, so they are not general purpose at all.
>=20
> On some systems without "real" GPIO the above would lead to
> compiling in the entire gpiolib (149 KB) just to do this.
>=20
> I would agree more with inventing something like leds-mmio as a
> separate refactoring after this, i.e. a driver for any memory-mapped
> LED, which should cover a few cases. What do you think about this
> idea?

Something like this?
http://thread.gmane.org/gmane.linux.kernel/1387110 ;-)

But seriously speaking, I did exactly what Alexander mentioned on VE,
considering the SYS_LED & alikes as "pseudo-gpios".

Pawel
