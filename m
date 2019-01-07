From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 1/5] dt-bindings: leds: Add pattern initialization
 from Device Tree
Date: Mon, 7 Jan 2019 18:47:28 +0100
Message-ID: <20190107174727.GC933@amd>
References: <1546596524-19863-1-git-send-email-krzk@kernel.org>
 <1546596524-19863-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546596524-19863-2-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-01-04 11:08:40, Krzysztof Kozlowski wrote:
> Document new led-pattern property for initialization of LED triggers.
> The property format is trigger-specific (except being array of
> integers).  For pattern trigger, the explanation of pattern format was
> moved to a common file shared with sysfs ABI.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwzkK8ACgkQMOfwapXb+vL5pQCeO4MLUeeMzDKjRWC35yefPMHF
9FwAnRtlHMrMObXpRTe6v+tAd/9mW9QF
=Uqhn
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
