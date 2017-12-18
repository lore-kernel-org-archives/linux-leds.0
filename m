From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 18 Dec 2017 13:33:45 +0100
Message-ID: <20171218123344.GA29353@amd>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com>
 <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
 <c6450f50-5c12-dc52-4340-b068c0b38c54@linaro.org>
 <CAFqH_50qgvntzwvZ_n3qhpw+BA2SpYqiJgsxfCMt1piNWzgDmA@mail.gmail.com>
 <20171215205735.GB19442@amd>
 <CAFqH_52z9O+0ZVB-rMTCNzw+55m26fDGKeaj-Fz-ccO74+j_MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqH_52z9O+0ZVB-rMTCNzw+55m26fDGKeaj-Fz-ccO74+j_MA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-12-18 11:40:59, Enric Balletbo Serra wrote:
> Hi Pavel,
>=20
> 2017-12-15 21:57 GMT+01:00 Pavel Machek <pavel@ucw.cz>:
> > Hi!
> >
> >> Yes, I think that how you describe luminance and lightness is right,
> >> and sounds good improve the doc.
> >>
> >> To be clear the correction table for PWM values can be calculated with
> >> this code.
> >>
> >> OUTPUT_SIZE =3D 65535      # Output integer size
> >> INPUT_SIZE =3D 2047
> >>
> >> def cie1931(L):
> >>     L =3D L*100.0
> >>     if L <=3D 8:
> >>         return (L/902.3)
> >>     else:
> >>         return ((L+16.0)/116.0)**3
> >>
> >> x =3D range(0,int(INPUT_SIZE+1))
> >> y =3D [int(round(cie1931(float(L)/INPUT_SIZE)*(OUTPUT_SIZE))) for L in=
 x]
> >
> > Can we just generate the table on the fly? Should not be hard to do in
> > fixed point, right?
>=20
> This was discussed a bit in previous RFC which had the code to
> generate the table on the fly, see [1]. The use of a fixed table or an
> on the fly table is something that I'll let the maintainers to decide.
> I've no strong opinion on use the on the fly table if someone takes
> care to review deeply the fixed point maths :)

You are free to pre-compute the table at boot. And you can even
compare the built-in and pre-computed table at boot, to make sure you
made no mistakes :-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlo3tagACgkQMOfwapXb+vI/aACgqrcr0ogwRL9AgqTUUt1qDjaW
cSMAn33yo6Hss+zyASKcqUg3/UGp63OX
=ywjS
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
