From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Date: Sat, 6 Jul 2019 01:23:12 +0200
Message-ID: <20190705232312.uxh7rlin6r6jwn3e@earth.universe>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190705101434.fw5rpctnqt6dwg6e@devuan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0875185171=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190705101434.fw5rpctnqt6dwg6e@devuan>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com, jacek.anaszewski@gmail.com, Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
List-Id: linux-leds@vger.kernel.org


--===============0875185171==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57433k23tjcm5ynk"
Content-Disposition: inline


--57433k23tjcm5ynk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 05, 2019 at 12:14:34PM +0200, Pavel Machek wrote:
> On Mon 2019-07-01 17:14:19, Jean-Jacques Hiblot wrote:
> > This series aims to add a led-backlight driver, similar to pwm-backligh=
t,
> > but using a LED class device underneath.
> >=20
> > A few years ago (2015), Tomi Valkeinen posted a series implementing a
> > backlight driver on top of a LED device:
> > https://patchwork.kernel.org/patch/7293991/
> > https://patchwork.kernel.org/patch/7294001/
> > https://patchwork.kernel.org/patch/7293981/
> >=20
> > The discussion stopped because Tomi lacked the time to work on it.
> >=20
> > This series takes it from there and implements the binding that was
> > discussed in https://patchwork.kernel.org/patch/7293991/. In this new
> > binding the backlight device is a child of the LED controller instead of
> > being another platform device that uses a phandle to reference a LED.
>=20
> Other option would be to have backlight trigger. What are
> advantages/disadvantages relative to that?

One advantage of having something like this is the possibility to
reference the backlight in DT. This means the system has an idea
how backlights are mapped. E.g.:

panelA {
    compatible =3D "random-panel";
    backlight =3D <&backlight1>;
}

panelB {
    compatible =3D "random-panel";
    backlight =3D <&backlight2>;
}

-- Sebastian

--57433k23tjcm5ynk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0f290ACgkQ2O7X88g7
+po9RA//cLYbl7o2nMQIXHn/Oekssa9YS8SFaPCKAo2h6Gho1scrDNc91jMoi1Pa
fHdXgKrJ+QnQUGW5nf6MHBCC9R5QOSMHlerf5Taf63Wr1tvDIcmFhUj0O1JQ5cqq
4J46Vq23ZvL45658vDW5IF8teDkm0A8nELQqnaEg3hrJB8Vw9LOx3XnJxhaJlHAd
xdAmqvPlvTdR5hIUeGCZ7TCK7b3024xIFZiKpvBaEhnL98230azZ4uMdzS76W6o4
cx4c5viE+xK5jplCcoAhN9UsIdzdQKRAYDP565FnEdzpUlOzXCXDSbR63aOfHkoi
j9YoGLDtxnxdUa2WeBiM2gyso7uj97nsfGrZM3QaygXg/zWW2hmDhF3iwpxwdmRP
/PwfwWXsRyd7JokQn4g4AoqvgCSltMK0X8xAoZ88O+207wRhbKCZA3ljCcYTt713
CsEtWzxa/z/UlGAETcSaZbmsFI3IZFNaz9pqkCwkuuyhIPh7PdQNBB0mqze0aiCy
1xRAFLC6yOP0ojORn73Ki2hLluoxYd3f0NU9dVxdYMMUIz4FtNXLaJhnXtBeY/LY
4UI87oha4XdCalCnp2Mg2Ybxe5o3ZPLwBLzs8+3ifeBxGDMDuQ3v/t0uTlFSSrrj
fUN0MXHtt2vAVBKLA4FiXSKAutopgPojYx3YZRmey6YNNUgOaf4=
=9zIH
-----END PGP SIGNATURE-----

--57433k23tjcm5ynk--

--===============0875185171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0875185171==--
