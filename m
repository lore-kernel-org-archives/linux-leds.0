From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/7] leds: add TI LMU backlight driver
Date: Wed, 24 Oct 2018 15:17:16 +0200
Message-ID: <20181024131716.GA11619@amd>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181024091407.GC24997@amd>
 <4afc7944-d6f1-fef1-1ae4-f761e050fec9@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4afc7944-d6f1-fef1-1ae4-f761e050fec9@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-leds@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-10-24 07:27:57, Dan Murphy wrote:
> Pavel
>=20
> On 10/24/2018 04:14 AM, Pavel Machek wrote:
> > On Tue 2018-10-23 12:06:17, Dan Murphy wrote:
> >> From: Pavel Machek <pavel@ucw.cz>
> >>
> >> This adds backlight support for the following TI LMU
> >> chips: LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
> >>
> >> It controls LEDs on Droid 4
> >> smartphone, including keyboard and screen backlights.
> >>
> >> Signed-off-by: Milo Kim <milo.kim@ti.com>
> >> [add LED subsystem support for keyboard backlight and rework DT
> >> binding according to Rob Herrings feedback]
> >> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> >> [remove backlight subsystem support for now]
> >> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> >=20
> > This is not correct way to sign off a patch.
> >=20
> > What is worse, this is very different from patch I submitted; this
> > misses imporant parts while my patch was complete.
> >=20
> > I already submitted better patch for both the driver and device tree
> > bindings. Can we go back and apply that?
> >=20
> > Then you can add your changes on top of that, if they actually make
> > the situation better.
>=20
> Thanks for this.  I wanted to make sure not to loose any authorship or cr=
edit
> in the commit.  Actually removing Milo might help stop getting the bounce=
 back
> from the mail daemon.
>=20
> I was using the RFC patch as my base https://lore.kernel.org/patchwork/pa=
tch/978995/
>=20
> Which contains this sign off.

Yeah, but you need to append your sign-off to the end, preferably
prepending note saying what you modified. [I'm ok with the original
patch, but I'm not ok with your version].

=46rom: Pavel Machek <pavel@ucw.cz>

Is not correct. Original patch is from Milo, if you want to add
explicit From:, I guess it should be his.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQcNwACgkQMOfwapXb+vL9mgCfZ/m3O860tSqL0HBhl1qUP6EV
nUsAn3Sk6DE7p7E0zkedARl61HPpdVuZ
=SUnO
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
