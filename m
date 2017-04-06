From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v2] Extend pca9532 device tree support
Date: Thu, 6 Apr 2017 17:50:05 +0200
Message-ID: <20170406155005.GA10363@amd>
References: <1490880833-22199-1-git-send-email-fb@ltec.ch>
 <b54c77d5-b4f7-9517-8c5b-9200c766204a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b54c77d5-b4f7-9517-8c5b-9200c766204a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felix Brack <fb-GovowT2ENgg@public.gmane.org>, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/=
Documentation/devicetree/bindings/leds/leds-pca9532.txt
> > index 198f3ba..8374075 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> > +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> > @@ -17,6 +17,8 @@ Optional sub-node properties:
> >  	- label: see Documentation/devicetree/bindings/leds/common.txt
> >  	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (de=
fault NONE)
> >  	- linux,default-trigger: see Documentation/devicetree/bindings/leds/c=
ommon.txt
> > +	- default-state: see Documentation/devicetree/bindings/leds/common.txt
> > +	  This property is only valid for sub-nodes of type <PCA9532_TYPE_LED=
>.
> > =20
> >  Example:
> >    #include <dt-bindings/leds/leds-pca9532.h>
> > @@ -33,6 +35,14 @@ Example:
> >        label =3D "pca:green:power";
> >        type =3D <PCA9532_TYPE_LED>;
> >      };
> > +    kernel-booting {
> > +    	type =3D <PCA9532_TYPE_LED>;
> > +    	default-state =3D "on";
> > +    };
> > +    sys-stat {
> > +    	type =3D <PCA9532_TYPE_LED>;
> > +    	default-state =3D "keep"; // don't touch, was set by U-Boot
> > +    };
>=20
> Adjusted above indentation to match the preceding lines.

> > @@ -475,6 +494,16 @@ pca9532_of_populate_pdata(struct device *dev, stru=
ct device_node *np)
> >  		of_property_read_u32(child, "type", &pdata->leds[i].type);
> >  		of_property_read_string(child, "linux,default-trigger",
> >  					&pdata->leds[i].default_trigger);
> > +		if (!of_property_read_string(child, "default-state", &state)) {
> > +			if (!strcmp(state, "on"))
> > +				pdata->leds[i].state =3D PCA9532_ON;
> > +			else if (!strcmp(state, "keep"))
> > +				pdata->leds[i].state =3D PCA9532_KEEP;
> > +			else if (!strcmp(state, "pwm0"))
> > +				pdata->leds[i].state =3D PCA9532_PWM0;
> > +			else if (!strcmp(state, "pwm1"))
> > +				pdata->leds[i].state =3D PCA9532_PWM1;
> > +		}
> >  		if (++i >=3D maxleds) {
> >  			of_node_put(child);
> >  			break;

This seems to look for "pwm0" and "pwm1" strings, which do not seem to
be documented.

Plus... is it useful to have default-state? We already have default
trigger. If we keep the value by default (on PC, we do something like
that) this patch should not be neccessary?
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljmY60ACgkQMOfwapXb+vJjTwCfTmzz6spv13i2UXy2qJa4DYtt
7zIAoJM4jqHHzmMOLst0SGNtz9sYj800
=/w/V
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
