From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 3/5] documention: leds: Add multicolor class
 documentation
Date: Mon, 1 Apr 2019 23:27:10 +0200
Message-ID: <20190401212709.GA14681@amd>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401173400.14238-4-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +Under the "colors" directory there are two files created "sync" and
> +"sync_enable". The sync_enable file controls whether the LED brightness
> +value is set real time or if the LED brightness value setting is deferre=
d until
> +the "sync" file is written.  If sync_enable is set then writing to each =
LED
> +"brightness" file will store the brightness value.  Once the "sync" file=
 is
> +written then each LED color defined in the node will write the brightnes=
s of
> +the LED in the device driver.
> +
> +If "sync_enable" is not set then writing the brightness value of the LED=
 to the
> +device driver is done immediately.  Writing the "sync" file has no
> affect.

I believe better solutions exists for this problem.

One was discussed before -- have single file which contains
coefficients for r/g/b channels.

Or at least... you should not really need separate sync and
sync_enable files. One should do.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyigi0ACgkQMOfwapXb+vLJEQCglrQD1CyGUjgfMgOATusshQBp
qZoAoMAH1gMgUSg48K2AADxlgrGvPy0I
=WtxB
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
