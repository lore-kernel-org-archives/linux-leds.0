From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 2/2] leds: trigger: gpio: make ledtrig-gpio useable with
 GPIO drivers requiring threaded irqs
Date: Fri, 12 Sep 2014 09:09:18 +0200
Message-ID: <20140912090918.6e860198@ipc1.ka-ro>
References: <1410248433-24005-1-git-send-email-LW@KARO-electronics.de>
	<1410248433-24005-3-git-send-email-LW@KARO-electronics.de>
	<CAK5ve-+BCvfHZ-JrYD_48KYzaZGE0as=eMe0+XPbgh5DfH9qRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.karo-electronics.de ([81.173.242.67]:49353 "EHLO
	mail.karo-electronics.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752226AbaILHJX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Sep 2014 03:09:23 -0400
In-Reply-To: <CAK5ve-+BCvfHZ-JrYD_48KYzaZGE0as=eMe0+XPbgh5DfH9qRw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

Hi,

Bryan Wu wrote:
> On Tue, Sep 9, 2014 at 12:40 AM, Lothar Wa=C3=9Fmann <LW@karo-electro=
nics.de> wrote:
> > When trying to use the LED GPIO trigger with e.g. the PCA953x GPIO
> > driver, request_irq() fails with -EINVAL, because the GPIO driver
> > requires a nested interrupt handler.
> >
> > Use request_any_context_irq() to be able to use any GPIO driver as =
LED
> > trigger.
> >
>=20
> Hmmm, what about use request_thread_irq() and put the gpio_trig_work(=
)
> in as the thread_func.
>=20
> Felipe, can you take a look at this?
>=20
> Also in the first patch:
> Actually in gpio_trig_irq(), it said:
> /* just schedule_work since gpio_get_value can sleep */
>         schedule_work(&gpio_data->work);
>=20
> Then that means we need to call gpio_get_value_can_sleep() in the
> gpio_trig_work() instead of gpio_get_value(), right?
>=20
That's exactly what my first patch does!


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
