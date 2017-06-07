From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspend
Date: Wed, 7 Jun 2017 09:12:57 +0200
Message-ID: <20170607071256.GA3230@amd>
References: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55104 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbdFGHM7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Jun 2017 03:12:59 -0400
Content-Disposition: inline
In-Reply-To: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Zhang Bo <bo.zhang@nxp.com>, linus.walleij@linaro.org, ulf.hansson@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, jacek.anaszewski@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-06-07 10:50:10, Zhang Bo wrote:
> System cannot enter suspend mode because of heartbeat led trigger.
> In autosleep_wq, try_to_suspend function will try to enter suspend
> mode in specific period. it will get wakeup_count then call pm_notifier
> chain callback function and freeze processes.
> Heartbeat_pm_notifier is called and it call led_trigger_unregister to
> change the trigger of led device to none. It will send uevent message
> and the wakeup source count changed.
>=20
> Add suspend/resume ops to the struct led_trigger, implement these two ops
> for ledtrig-heartbeat. Add led_trigger_suspend/led_trigger_resume funcito=
ns
> to iterate through all LED class devices registered on given trigger and
> call their suspend/resume ops and disable/enable sysfs at the same time.
>=20
> Call led_trigger_suspend{resuem} API in pm_notifier function to
> suspend/resume all led devices listed in given trigger.
>=20
> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>

NAK.

led_trigger should not need special handling over suspend.

> It can also fix my issue by reverting  the commit 5ab92a7cb. But this
> action only does not make
> led_set_brightness_nosleep function to set brightness. The heartbeat
> trigger timer is still
> running even though it is not harmful.

Yes, timers can and should be active over suspend.

Core reason is that 5ab92a7cb is wrong. (Very wrong; it papers over
the issue for one trigger, but we have more than one... Even if
special handling for heartbeat is warranted, that handling would be
"turn the led off" not "unregister the trigger", which is
userland-visible action.) That one should be reverted, then maybe the
driver should be fixed to turn the led off during suspend.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlk3p3gACgkQMOfwapXb+vLRrQCfdcfNcA0IFsOIsx6Kb8ogGONb
9cEAniXHx86/K0ujZvhMAiPze2MSViu7
=gfzQ
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
