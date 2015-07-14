From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH/RFC v3 0/7] Remove work queues from LED class drivers
Date: Tue, 14 Jul 2015 16:10:24 +0200
Message-ID: <20150714141024.GC10671@kw.sim.vm.gnt>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:37074 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751558AbbGNOKe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 14 Jul 2015 10:10:34 -0400
Content-Disposition: inline
In-Reply-To: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, phil


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2015 at 03:10:45PM +0200, Jacek Anaszewski wrote:
> This is a third version of the RFC aiming at removing work queues
> from LED class drivers, as well as getting rid of complimentary
> functionalities introduced along with addition of LED flash class
> extension.
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Changes from version 2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - split changes to several incremental patches
> - removed SET_BRIGHTNESS_SYNC and SET_BRIGHTNESS_ASYNC flags
> - fixed led_set_brightness_async function instead of renaming it
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Changes from version 1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> V2 includes also patches for one LED class driver
> and two LED flash class drivers, that show how the
> drivers will benefit from the optimization being
> introduced in the first patch of this patch set.
>=20
> I was able to test only the LED Flash class drivers.
>=20
> Original message from the patch 483a3122 ("leds: Use set_brightness_work =
for
> brightness_set ops that can sleep") that was sent previously as a single =
one:
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
>=20
> Best Regards,
> Jacek Anaszewski
>=20
> Jacek Anaszewski (7):
>   leds: Add led_set_brightness_sync to the public LED subsystem API
>   leds: Improve asynchronous path of setting brightness
>   leds: Add an internal led_set_brightness_nosleep function
>   leds: Improve setting brightness in a non sleeping way
>   leds: Drivers shouldn't enforce SYNC/ASYNC brightness setting
>   media: flash: use led_set_brightness_sync for torch brightness
>   leds: pwm: remove work queue
>=20
>  drivers/leds/led-class-flash.c                 |    7 ---
>  drivers/leds/led-class.c                       |   20 +++++----
>  drivers/leds/led-core.c                        |   42 +++++++++---------
>  drivers/leds/leds-aat1290.c                    |   50 ++++++------------=
---
>  drivers/leds/leds-ktd2692.c                    |   41 +++---------------
>  drivers/leds/leds-max77693.c                   |   55 +++---------------=
------
>  drivers/leds/leds-pwm.c                        |   24 ++---------
>  drivers/leds/leds.h                            |   34 ++++++++-------
>  drivers/leds/trigger/ledtrig-backlight.c       |    8 ++--
>  drivers/leds/trigger/ledtrig-default-on.c      |    2 +-
>  drivers/leds/trigger/ledtrig-gpio.c            |    6 +--
>  drivers/leds/trigger/ledtrig-heartbeat.c       |    4 +-
>  drivers/leds/trigger/ledtrig-oneshot.c         |    4 +-
>  drivers/leds/trigger/ledtrig-transient.c       |    8 ++--
>  drivers/media/v4l2-core/v4l2-flash-led-class.c |    8 ++--
>  include/linux/leds.h                           |   36 +++++++++++-----
>  16 files changed, 124 insertions(+), 225 deletions(-)

Hi Jacek,

I have successfully tested this patch set with both the leds-ns2 and
leds-netxbig drivers and with either sleeping and non-sleeping GPIOs
LEDs.

Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Note that you may want to get rid of the comment
"Must not sleep, use a workqueue if needed" above the member
brightness_set in struct led_classdev.

Regards,

Simon

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlWlGFAACgkQgtp0PDeOcDqwZQCdGtJJBqSJG09L2x9t83qJofJL
z/YAoJ1cZGmdnp69l21HsK1MAATtOLWB
=cVlU
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
