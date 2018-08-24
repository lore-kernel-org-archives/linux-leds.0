From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 24 Aug 2018 12:11:45 +0200
Message-ID: <20180824101145.GA1510@amd>
References: <1dc5d394324b2bf1ffe229b8e42691fab6d749e0.1533556992.git.baolin.wang@linaro.org>
 <c18fd41f-831c-ab74-57e5-d4151f4b47cc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c18fd41f-831c-ab74-57e5-d4151f4b47cc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I think that it would be more flexible if software pattern fallback
> was applied in case of pattern_set failure. Otherwise, it would
> lead to the situation where LED class devices that support hardware
> blinking couldn't be applied the same set of patterns as LED class
> devices that don't implement pattern_set. The latter will always have to
> resort to using software pattern engine which will accept far greater
> amount of pattern combinations.
>=20
> In this case we need to discuss on what basis the decision will be
> made on whether hardware or software engine will be used.
>=20
> Possible options coming to mind:
> - an interface will be provided to determine max difference between
>   the settings supported by the hardware and the settings requested by
>   the user, that will result in aligning user's setting to the hardware
>   capabilities
> - the above alignment rate will be predefined instead
> - hardware engine will be used only if user requests supported settings
>   on the whole span of the requested pattern
> - in each of the above cases it would be worth to think of the
>   interface to show the scope of the settings supported by hardware

I'd recommend keeping it simple. We use hardware engine if driver
author thinks pattern is "close enough".

If human can not tell the difference, it probably is.

We may want to do something more formal later.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlt/2eEACgkQMOfwapXb+vKtBgCgp15fsv7FX679nW0h33YTmU70
KqwAoLsWGFNPvDCFIabrzTu9n1dvfmgM
=KBsf
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
