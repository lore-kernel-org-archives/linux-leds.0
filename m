From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds/trigger/activity: add a system activity LED trigger
Date: Wed, 15 Feb 2017 22:10:53 +0100
Message-ID: <20170215211053.GA15358@amd>
References: <1486856514-9634-1-git-send-email-w@1wt.eu>
 <20170215102426.GB29330@amd>
 <20170215104212.GC19195@1wt.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170215104212.GC19195@1wt.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Tarreau <w@1wt.eu>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Wed, Feb 15, 2017 at 11:24:26AM +0100, Pavel Machek wrote:
> > On Sun 2017-02-12 00:41:54, Willy Tarreau wrote:
> > > The "activity" trigger was inspired by the heartbeat one, but aims at
> > > providing instant indication of the immediate CPU usage. Under idle
> > > condition, it flashes 10ms every second. At 100% usage, it flashes
> > > 90ms every 100ms. The blinking frequency increases from 1 to 10 Hz
> > > until either the load is high enough to saturate one CPU core or 50%
> > > load is reached on a single-core system. Then past this point only the
> > > duty cycle increases from 10 to 90%.
> > >=20
> > > This results in a very visible activity reporting allowing one to
> > > immediately tell whether a machine is under load or not, making it
> > > quite suitable to be used in clusters.
> > >=20
> > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> >=20
> > Hmm. Evil question. Why not use LEDS_TRIGGER_CPU instead?
> >=20
> > Recently it gained support for "summarizing" all the cpus onto one
> > led.
>=20
> That's not an evil question, it's perfectly correct as it's the first
> one I've tried :-) But it's basically an all on or all off report, you
> see if the CPU is instantly being used or not. Also, when the CPU is
> idle you have no way to tell the machine is not dead, and when it's
> saturated you have no way to check it's not stuck. In the end I found
> the lack of progressivity in the visual report to be very problematic
> for my typical use case where I want to be able to spot in one second
> if a machine in my build farm is under-loaded.

Well, when I used this kind of LED, it usually did flicker even on
"idle" systems, because system is never idle. But you are right, it is
easy for 100% cpu to be used, and then you could not tell if it is stuck.

> I thought about modifying the cpu trigger to support a different mode
> of reporting but I noticed that the two approaches are quite different
> and very likely suit different purposes, even if there can be some
> overlap for a number of use cases. I think that most users just want
> to see if something is running or draining their battery and CPU is
> better suited there. But to differenciate between 10, 50 and 100%
> usage, it really is not (at least for me).

=2E..so this makes sense.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlikw90ACgkQMOfwapXb+vKMLACgwOGumQYuR3NkqO8vGRgm9Eku
NSMAoIlTOFJqIH3PFdmoJX/pX3tbFTPe
=9/uC
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
