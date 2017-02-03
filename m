From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Fri, 3 Feb 2017 12:05:10 +0100
Message-ID: <20170203110510.GB30941@amd>
References: <46084d98-fddb-1b92-e9ca-d55957a442ae@gmail.com>
 <CACna6rx5HsSb=rXCjVth_2ed87tUSBJEZHHxTC_S1YOztLjp1A@mail.gmail.com>
 <ccc870b2-5857-507a-9c54-9a14ea60d3e5@gmail.com>
 <f9bda1d6-4265-8fe6-58ba-d6da5b462a0c@milecki.pl>
 <c4f1d3c4-d972-e305-abb9-a5c6e9e184e9@gmail.com>
 <d3535c2c-2a7c-4e8d-552c-666f76043b7d@gmail.com>
 <93896405-5ee0-ea85-72b1-5774c13a0c36@gmail.com>
 <438140b2-896f-6a58-2529-9d30db6d4fde@gmail.com>
 <f5cd17e7-2560-acdd-79c6-7dc1b0988e73@gmail.com>
 <aa97923a-d46c-ad90-a96a-0017129daeb8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <aa97923a-d46c-ad90-a96a-0017129daeb8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-leds@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>>Is this possible to mix various entries in a list assigned to single
> >>>>property?
> >>>>Let's say:
> >>>>trigger-sources =3D
> >>>>    <&ohci_port1>,
> >>>>    <&ehci_port1>,
> >>>>    <&gpio 1 GPIO_ACTIVE_HIGH>;

Actually... I'm not sure I like the "multiple sources". It is somehow
justified for ohci/ehci_port, because they... represent single
physical port. Could we introduce something for the physical port into
the DTS, too?

> >>>According to my knowledge all elements in the list are elements
> >>>of one array, no matter if they are comma separated or space separated
> >>>in "<>" brackets. DT maintainer would have to confirm that though.
> >>
> >>This matches my knowledge as well.
> >
> >Having that, we would be limited to a list of fixed size
> >tuples IMHO.
>=20
> That sounds OK. Now I spent some time thinking about this I think it can =
work.
> First of all we may need something like #sources-cells to extend our prop=
erty
> in the future.
> Secondly it should be possible to detect type of phandle node by trying t=
hings
> one by one. We should be e.g. able to check is phandle is for GPIO by try=
ing
> of_find_gpiochip_by_xlate.

I am not sure if variable-length parameters here is good idea. Would
be nice to keep it simple... Having the led representing voltage on
gpio line is somehow strange to me. I'd rather have dts explaining
what that voltage means ("it is battery charging signal") and than
have led connected to that...
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliUY+YACgkQMOfwapXb+vLaLwCfcHw8BxwFdm9/AT6fKURzcNn5
bp4AniDnp3zX2+l0PEV7ls/Y675XDNDV
=6Bjy
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
