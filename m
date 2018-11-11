From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] backlight/arcxcnn user proper vendor prefix in device
 tree bindings
Date: Sun, 11 Nov 2018 12:29:15 +0100
Message-ID: <20181111112914.GB27580@amd>
References: <1541111729-26492-1-git-send-email-bdodge09@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1269133230=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1541111729-26492-1-git-send-email-bdodge09@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Brian Dodge <bdodge09@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, linux-kernel@vger.kern, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============1269133230==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-11-01 18:35:29, Brian Dodge wrote:
> The vendor-prefixes.txt file properly refers to ArcticSand
> as "arctic" while the actual backlight driver and the
> device tree bindings for it improperly use "arc". The
> bindings are also modified to support newer backlight chips
> in the arcxcnn family
>=20
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvoEooACgkQMOfwapXb+vILjwCfdxEPGGGtZMdBfoHBkn60kbzC
CNkAnA0qUmxytWiBUvEJE68BVb1bO9mR
=Avfq
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--

--===============1269133230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1269133230==--
