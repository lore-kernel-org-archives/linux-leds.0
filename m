From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH] leds-pwm: the startup brightness can be specified
Date: Fri, 10 Feb 2017 21:56:14 +0100
Message-ID: <20170210205614.GA6576@amd>
References: <aed1129a-993a-91d9-7b14-13c3424ee0f4@solutionsradio.com>
 <c4aebca4-d5a1-aaa7-d69b-8d0e4d4d8ba8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c4aebca4-d5a1-aaa7-d69b-8d0e4d4d8ba8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jelle Martijn Kok <jmkok-i3KCcyIX/XtmR6Xm/wNWPw@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +        led.default_brightness =3D LED_OFF;
> > +        of_property_read_u32(child, "brightness",
> > +                     &led.default_brightness);
>=20
> At first you would have to submit a patch for
> Documentation/devicetree/bindings/leds/common.txt that would add
> brightness property. The question is whether it is really needed?
> You can set brightness from userspace via sysfs API.
>=20
> By the way, I have a question to DT maintainers: is DT a proper
> place for defining this type of configuration that can be set via
> userspace scripts? Shouldn't DT describe only hardware properties and
> constraints resulting from board configuration?

Well, if the hardware has label "half - power, full - transmitting" on
a LED, we might want kernel to turn it to half power on bootup.

If you have a "disk activity LED" on a PC, it is driven by
hardware. On arm notebook, it would be nice if "disk activity LED"
worked, too. Preferably even when running fsck in init=3D/bin/bash
mode. We already provide that, AFAICT, so having ability to set
constant brightness sounds sane to me.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlieKO0ACgkQMOfwapXb+vIqTQCdGHPO6QE+nyznczYBcyeukNae
KYkAn1Mide5P1hrotu0lfzGM6x05+J8B
=PZ7e
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
