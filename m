From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Fri, 11 Aug 2017 17:37:42 +0200
Message-ID: <20170811153742.GA31267@amd>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org>
 <20170811134757.GA22561@amd>
 <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9330f31a-110c-8398-8cd1-764f8dd358e9-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > with minor comments below.
> >=20
> >> @@ -125,6 +130,7 @@ struct pca955x_led {
> >>  	struct led_classdev	led_cdev;
> >>  	int			led_num;	/* 0 .. 15 potentially */
> >>  	char			name[32];
> >> +	u32			type;
> >=20
> > u32 is highly non-standard here. enum pca955x_led_type?
> >
> >=20
> >> +/*
> >> + * Read the INPUT register, which contains the state of LEDs.
> >> + */
> >> +static u8 pca955x_read_input(struct i2c_client *client, int n)
> >> +{
> >> +	return (u8)i2c_smbus_read_byte_data(client, n);
> >> +}
> >=20
> > Is the cast needed? Should you attempt to handle errors?
>=20
> ah. this is a left over. I can fix in a resend.

No need to resend just for this.

Should you WARN_ON() if the read_byte_data returns < 0 or something?

https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-i2c-smbu=
s-read-byte-data.html

> >> +#ifndef _DT_BINDINGS_LEDS_PCA955X_H
> >> +#define _DT_BINDINGS_LEDS_PCA955X_H
> >> +
> >> +#define PCA955X_TYPE_NONE         0
> >> +#define PCA955X_TYPE_LED          1
> >> +#define PCA955X_TYPE_GPIO         2
> >=20
> > And make these into the new enum pca955x_led_type?
>=20
> These are used in the device tree bindings, so we should keep the u32
> I think.

Aha, ok, makes sense.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmNz0YACgkQMOfwapXb+vI0HQCbBMCLB5pi7GcbnlRkSEQdl9kP
7jgAoJL/czbd76sjPWTxcyyppIOMtPC+
=mmO4
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
