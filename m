From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Mon, 28 Aug 2017 12:19:52 +0200
Message-ID: <20170828101952.GE18012@amd>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170828001711.19662-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: linux-leds@vger.kernel.org


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-08-28 09:47:10, Andrew Jeffery wrote:
> On Baseboard Management Controller (BMC) systems it's sometimes
> necessary for a LED to retain its state across a BMC reset (which is
> independent of the host system state). Add a devicetree property to
> describe this behaviour. The property would typically be used in
> conjunction with 'default-state =3D "keep"'.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj7kgACgkQMOfwapXb+vL3CgCgplOFTkPz2V1Xp3ZDHDs/gwVz
3TkAn3nXAQgflvygLscshEnRsncfNU25
=fdA/
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
