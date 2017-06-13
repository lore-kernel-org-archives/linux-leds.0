From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [[PATCH]] Revert "leds: handle suspend/resume in heartbeat
 trigger"
Date: Tue, 13 Jun 2017 09:31:24 +0200
Message-ID: <20170613073124.GA16077@amd>
References: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48248 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbdFMHb1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jun 2017 03:31:27 -0400
Content-Disposition: inline
In-Reply-To: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Zhang Bo <bo.zhang@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linus.walleij@linaro.org, ulf.hansson@linaro.org, grygorii.strashko@ti.com, linux-leds@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-06-13 10:39:20, Zhang Bo wrote:
> This reverts commit 5ab92a7cb82c66bf30685583a38a18538e3807db.
>=20
> System cannot enter suspend mode because of heartbeat led trigger.
> In autosleep_wq, try_to_suspend function will try to enter suspend
> mode in specific period. it will get wakeup_count then call pm_notifier
> chain callback function and freeze processes.
> Heartbeat_pm_notifier is called and it call led_trigger_unregister to
> change the trigger of led device to none. It will send uevent message
> and the wakeup source count changed. As wakeup_count changed, suspend
> will abort.
>=20
> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>

Yes, this makes sense. Turning led off should be done at driver level.

As this fixes a regression, it would be kind of nice to get it to
v4.12...

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlk/lMwACgkQMOfwapXb+vIXZgCeK4qfkwlip1ntu5d+4CCcqR6o
yJ4AoI88+TPGEgJOQBA2+RHvbmccXcri
=mBsD
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
