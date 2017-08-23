From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [[PATCH]] Revert "leds: handle suspend/resume in heartbeat
 trigger"
Date: Wed, 23 Aug 2017 21:34:19 +0200
Message-ID: <20170823193419.GA7965@amd>
References: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
 <CAMuHMdUjZHpEQKmhCGnqtZjw_PK5PeQe2kEH6TTKfS8Ne2+drQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58697 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932576AbdHWTeV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Aug 2017 15:34:21 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjZHpEQKmhCGnqtZjw_PK5PeQe2kEH6TTKfS8Ne2+drQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Zhang Bo <bo.zhang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Tue, Jun 13, 2017 at 4:39 AM, Zhang Bo <bo.zhang@nxp.com> wrote:
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
> While investigating an heartbeat LED issue in v4.9.40-ltsi, I stumpled on=
 this
> revert (commit 436c4c45b5b9562b ("Revert "leds: handle suspend/resume in
> heartbeat trigger"") in v4.12-rc6), which was not backported to v4.9 (yet=
).
>=20
> Interestingly, while running v4.9.x on r8a7791/koelsch with an LED config=
ured
> for heartbeat, I can actually suspend the system using s2ram.
> However, after system resume the heartbeat LED no longer flashes.
> /sys/class/leds/LED6/trigger shows the trigger is still "none", and thus
> wasn't restored to "heartbeat" by the notifier.
> There's no "could not re-register heartbeat trigger" message printed.
>=20
> Backporting the revert fixes this.

You have my Acked-by: if you want to submit this to some -stable
kernels...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmd2LsACgkQMOfwapXb+vLkzwCcDoytlwcdB/qEuzROTJryDzed
kRUAoIG2KKlUqOLWVFiXdcSqqfvnY3Ra
=bb4k
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
