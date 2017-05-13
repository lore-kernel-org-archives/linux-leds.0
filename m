From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Sat, 13 May 2017 13:26:01 +0200
Message-ID: <20170513112601.GA21785@amd>
References: <1494311772-21872-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494311772-21872-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-05-09 08:36:12, C=E9dric Le Goater wrote:
> The PCA955x family of chips are I2C LED blinkers whose pins not used
> to control LEDs can be used as general purpose I/Os (GPIOs).
>=20
> The following adds support for device tree and Open Firmware to be
> able do define different operation modes for each pin. See bindings
> documentation for more details. The pca955x driver is then extended
> with a gpio_chip when pins are operating in GPIO mode.

Actually.. maybe better solution would be to turn this into GPIO
driver, and then use gpio-leds on top...?

What is the difference between pin in GPIO mode and pin in LED mode?

     	    	       	       	      	   	    	   Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkW7UkACgkQMOfwapXb+vKzGACfWXV7JhLdPktnY+YCGt+kb1e/
K8oAoKW7rBaY4VOH+tA4jYU7DTYUocfQ
=Syhz
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
