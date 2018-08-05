From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce LED pattern trigger
Date: Mon, 6 Aug 2018 00:08:30 +0200
Message-ID: <20180805220829.GA3338@amd>
References: <c43374283744539702023053c896efe3c73b7833.1533441631.git.baolin.wang@linaro.org>
 <3d7e8701-d92b-9f51-befa-a585b5957488@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3d7e8701-d92b-9f51-befa-a585b5957488@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +What:		/sys/class/leds/<led>/repeat
> > +Date:		August 2018
> > +KernelVersion:	4.19
> > +Description:
> > +		Specify a pattern repeat number. 0 means repeat indefinitely.
>=20
> In current implementation this file on read returns the number
> of remaining repeat intervals. I'd add that to this description.

Lets not do this.

LEDs such as the one on N900 can do repeats automatically, in
hardware. But in such case we may not be able to determine how many
repetitions were done (and how many are left).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltndV0ACgkQMOfwapXb+vKzkQCgpivTz+sNMA2LXevhna5JlCWA
QUYAoJJ+ONpBXokwoeo+1XJzUSlEK5Lf
=MqU9
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
