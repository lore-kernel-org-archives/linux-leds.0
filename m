From: Pavel Machek <pavel@ucw.cz>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 18:37:53 +0200
Message-ID: <20190429163753.GA16782@amd>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd>
 <20190429173842.06f02852@nic.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190429173842.06f02852@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 17:38:42, Marek Behun wrote:
> I am sending patch only adding the I2C dep. Theoretically it is
> possible that someone uses the same I2C API in their microcontroller on
> another architecture.

Theoretically. But we both now that probability of that is very low,
and that likely driver would need other updates, too... right?

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHKGEACgkQMOfwapXb+vJBnACeN70fWubChYlk70/V8Tb9hnNv
8yAAn2xWQhTs6fpmAXSZ55//Tlc6mz7M
=2KPW
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
