From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [patch v1 1/2] mfd: Add Mellanox regmap core driver
Date: Wed, 26 Jul 2017 20:25:09 +0200
Message-ID: <20170726182509.GA29978@amd>
References: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
 <1501001499-21971-2-git-send-email-vadimp@mellanox.com>
 <20170726111846.GB6033@amd>
 <AM4PR05MB3330F7C7913391C906CB2069A2B90@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM4PR05MB3330F7C7913391C906CB2069A2B90-n5Jp0YuYvM1LPiJj6BpYmdqRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> > > @@ -0,0 +1,347 @@
> > > +Mellanox programmable device control.
> > > +-------------------------------------
> > > +This binding defines the device control interface over I2C bus for
> > > +Mellanox BMC based switches.
> >=20
> > You'll need to cc dt maintainers here.
>=20
> Hi Pavel,
>=20
> Thank you very much for review.
>=20
> I have in to: Rob Herring and in c: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Aha, sorry, did not notice that.

> Should it be separate mail, or it's OK?

They prefer separate mails, yes.

> > > +	for (i =3D 0; i < priv->item[grp->type]->count; i++, id++, data++) {
> > > +		priv->mlxreg_core_attr[id] =3D
> > > +				&priv-
> > >mlxreg_core_dev_attr[id].dev_attr.attr;
> > > +		if (grp->use_grp_name)
> > > +			priv->mlxreg_core_attr[id]->name =3D
> > > +				devm_kasprintf(priv->dev, GFP_KERNEL,
> > > +					       "%s%u", grp->name, id %
> > > +						priv->item[grp->type]-
> > >count
> > > +						+ 1);
> > > +		else
> > > +			priv->mlxreg_core_attr[id]->name =3D
> > > +				devm_kasprintf(priv->dev, GFP_KERNEL,
> > > +					       data->label);
> >=20
> > Is it really neccessary to dynamically generate it? Static table could =
be
> > simpler...
>=20
> But I don't know how many groups and attributes can be defined for partic=
ular device.
> On the system I am working on know I have four programmable device with d=
ifferent purposes and different set of attributes.
>

I guess that's good reason. But if you could make that code simpler /
easier to follow, it would be nice.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAll43oUACgkQMOfwapXb+vIq7gCgwIi5ZwjF7UGTEax64c96azLB
4fUAn0YSC+owijkOiUo7IxJ+ceZ+iZiG
=kteh
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
