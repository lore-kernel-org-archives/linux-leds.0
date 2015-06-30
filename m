From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH/RFC v2 0/5] Remove work queues from LED class drivers
Date: Tue, 30 Jun 2015 19:39:38 +0300
Message-ID: <5592C64A.3020406@list.ru>
References: <1435672534-4004-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435672534-4004-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@
List-Id: linux-leds@vger.kernel.org

30.06.2015 16:55, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> V2 includes also patches for one LED class driver
> and two LED flash class drivers, that show how the
> drivers will benefit from the optimization being
> introduced in the first patch of this patch set.
>=20
> I was able to test only the LED Flash class drivers.
>=20
> Original message from the patch 483a3122 ("leds: Use set_brightness_w=
ork for
> brightness_set ops that can sleep") that was sent previously as a sin=
gle one:
>=20
> Hi All,
>=20
> Since this patch will affect all the LED subsystem drivers
> I'd like it was tested by as many developers as possible
> to make sure that I haven't missed something.
>=20
> For the drivers which can sleep in their brightness_set ops
> (e.g. use mutex or gpio "cansleep" API) you only need to
> remove the work queues and move the code executed currently
> in the work queue task to the brightness_set op, as now
> LED core does the job.
>=20
> For drivers that are capable of setting brightness with use
> of MMIO you need to set the LED_BRIGHTNESS_FAST flag, so
> that LED core would know that it doesn't have to employ
> work queue.
>=20
> After the patch is positively verified I will create relevant
> patches for every LED class driver.
>=20
> This patch is based on linux-next_20150622.
>=20
> I am looking forward to your cooperation.
=46YI I ported my soft-pwm patches to yours and that seems to
work fine. So I am looking forward for this being applied, then
I'll post them again.

Acked-by: Stas Sergeev <stsp@users.sourceforge.net>
