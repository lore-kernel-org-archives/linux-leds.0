From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 8 Aug 2017 10:17:11 +0200
Message-ID: <20170808081711.GE12854@amd>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
 <20170807155836.uqa2nezqqheg6so6@dell>
 <AM4PR05MB3330A1043B618D723EFF4C8DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808070211.ikxbzkygymlolavv@dell>
 <AM4PR05MB33301E39B8BB39F68D49B30DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808074523.GA12854@amd>
 <AM4PR05MB33300159962297EEC58F1BDAA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB33300159962297EEC58F1BDAA28A0-n5Jp0YuYvM1LPiJj6BpYmdqRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>, "jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > And such code can't be placed under drivers/platform/x86/.
> >=20
> > So aim for drivers/platform/mlx ...?
> >=20
>=20
> So you suggest to move drivers/platform/x86/mlxcpld-hotplug.c to
> drivers/platform/mellanox/mlxcpld-hotplug.c and extend thr driver
> with DTS support (mlxreg_core_dev_enable/mlxreg_core_dev_disable)?

If this leads to less code duplication -- yes, by all means do that.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmJc4cACgkQMOfwapXb+vJYTACfQQD6hKIWUK5gHcOFQHBqf3Oj
YTQAnjmtLxVhTV6YRSu9mCk6EZBoXyb0
=lZGD
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
