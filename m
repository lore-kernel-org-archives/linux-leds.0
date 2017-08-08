From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 8 Aug 2017 09:45:23 +0200
Message-ID: <20170808074523.GA12854@amd>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
 <20170807155836.uqa2nezqqheg6so6@dell>
 <AM4PR05MB3330A1043B618D723EFF4C8DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808070211.ikxbzkygymlolavv@dell>
 <AM4PR05MB33301E39B8BB39F68D49B30DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB33301E39B8BB39F68D49B30DA28A0-n5Jp0YuYvM1LPiJj6BpYmdqRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>, "jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Why don't you extend the support you already provide in drivers/platfor=
m?
> > This seems like a logical place for an all encompassing device which ca=
nnot be
> > split out to individual subsystems.
>=20
> There is a problem to extend for that the existing driver
> drivers/platform/x86/mlxcpld-hotplug.c.
> It has been provided for x86 arch and I am planning to extend it with ACPI
> support.
>=20
> But in mlxreg-core I am using DTS, which is not supported for x86.
> Here I am using the next functions for probing and removing hotplug
> entities:
> static void mlxreg_core_dev_enable(struct device_node *np)
> {
> 	/* Enable and create device. */
> 	of_update_property(np, &mlxreg_core_device_en);
> }
>=20
> static void mlxreg_core_dev_disable(struct device_node *np)
> {
> 	/* Disable and unregister platform device. */
> 	of_update_property(np, &mlxreg_core_device_dis);
> 	of_node_clear_flag(np, OF_POPULATED);
> }
>=20
> And such code can't be placed under drivers/platform/x86/.

So aim for drivers/platform/mlx ...?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmJbBMACgkQMOfwapXb+vK8LgCcC5gj+dXlf778vBUEfmd2HCSp
skYAoIHZvlXp1v8aFg54cxOntLGjNRj5
=6BCr
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
