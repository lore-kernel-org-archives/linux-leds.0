From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [[PATCH]] Revert "leds: handle suspend/resume in heartbeat
 trigger"
Date: Thu, 13 Jul 2017 14:03:34 +0200
Message-ID: <20170713120333.GI1363@amd>
References: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
 <CACRpkdY6-REXoXjWNUrfCuPn3GYHhV0di7Lhbb=wRhBtPC0+mA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50273 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751165AbdGMMDg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jul 2017 08:03:36 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdY6-REXoXjWNUrfCuPn3GYHhV0di7Lhbb=wRhBtPC0+mA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Zhang Bo <bo.zhang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-06-13 11:35:22, Linus Walleij wrote:
> On Tue, Jun 13, 2017 at 4:39 AM, Zhang Bo <bo.zhang@nxp.com> wrote:
>=20
> > This reverts commit 5ab92a7cb82c66bf30685583a38a18538e3807db.
> >
> > System cannot enter suspend mode because of heartbeat led trigger.
> > In autosleep_wq, try_to_suspend function will try to enter suspend
> > mode in specific period. it will get wakeup_count then call pm_notifier
> > chain callback function and freeze processes.
> > Heartbeat_pm_notifier is called and it call led_trigger_unregister to
> > change the trigger of led device to none. It will send uevent message
> > and the wakeup source count changed. As wakeup_count changed, suspend
> > will abort.
> >
> > Signed-off-by: Zhang Bo <bo.zhang@nxp.com>
>=20
> OK I was stupid, lesson learned.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

You may still want to submit patch to turn the LED off over suspend
for your platform...

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllnYZUACgkQMOfwapXb+vI3XwCdHSHbeahObtIInB5CNE76bMGX
0TgAoLm9PvOlroMhkMZP8HPo3MwOz8oH
=+CCV
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--
