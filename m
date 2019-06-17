From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL 5.1 033/375] leds: avoid races with workqueue
Date: Mon, 17 Jun 2019 17:57:00 +0200
Message-ID: <20190617155659.GB32544@amd>
References: <20190522192115.22666-1-sashal@kernel.org>
 <20190522192115.22666-33-sashal@kernel.org>
 <20190524225505.GA16076@amd>
 <20190529185143.GH12898@sasha-vm>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529185143.GH12898@sasha-vm>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >Could we hold this patch for now?
>=20
> Sure, dropped. Thanks!

So... fix for this now should be in mainline. But as original problem
is not too severe, I don't think we need to apply this or the fixed
version to stable.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0HuEsACgkQMOfwapXb+vIN9gCghh2mt0P0yiQz64VCwTSsLCGE
8k0AoLxWHBoA6YRevOHIQHADmm7JTh3U
=ve35
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
