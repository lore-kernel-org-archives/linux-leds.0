From: Pavel Machek <pavel@ucw.cz>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 17:32:00 +0200
Message-ID: <20190429153200.GA11761@amd>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 08:03:02, Randy Dunlap wrote:
> On 4/29/19 2:03 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20190426:
> >=20
>=20
> on i386:
>=20
> when CONFIG_LEDS_TURRIS_OMNIA=3Dy and CONFIG_I2C=3Dm:
>=20
> Probably should also depend on I2C.
>=20
>=20
> ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_remove':
> leds-turris-omnia.c:(.text+0xb): undefined reference to `i2c_smbus_write_=
byte_data'
> ld: drivers/leds/leds-turris-omnia.o: in function `omnia_led_brightness_s=
et_blocking':
> leds-turris-omnia.c:(.text+0x62): undefined reference to `i2c_smbus_write=
_byte_data'
> ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_probe':
> leds-turris-omnia.c:(.text+0x1d8): undefined reference to `i2c_smbus_writ=
e_byte_data'
> ld: leds-turris-omnia.c:(.text+0x1f6): undefined reference to `i2c_smbus_=
write_byte_data'
> ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_init=
':
> leds-turris-omnia.c:(.init.text+0x8): undefined reference to `i2c_registe=
r_driver'
> ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_exit=
':
> leds-turris-omnia.c:(.exit.text+0x6): undefined reference to `i2c_del_dri=
ver'

Ack.

It can also depend on ARM or even specific ARM soc... unless we are
compile testing. This is for specific router...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHGPAACgkQMOfwapXb+vL9jACcC0cZMF86zp58Y6ZM6xxpAhvi
uv4AoKHilquec+zSgoj4f3eT5nker2ID
=92aw
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
