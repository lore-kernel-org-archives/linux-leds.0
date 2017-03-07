From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: cpcap: new driver
Date: Tue, 7 Mar 2017 12:55:49 +0100
Message-ID: <20170307115549.GA914@amd>
References: <20170305172234.24120-1-sre@kernel.org>
 <20170306221147.GA24272@amd>
 <20170306233859.GQ20572@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170306233859.GQ20572-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> * Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> [170306 14:13]:
> > > Motorola CPCAP is a PMIC found in multiple smartphones.
> > > This driver adds support for the chip's LED controllers.
> > > It has explicit support for all controllers used by the
> > > Droid 4. Since no datasheets are available the other
> > > available controllers are not supported until somebody
> > > verified, that the register layout matches.
> >=20
> > This of course leads me to two questions:
> >=20
> > 1) Where can I get Droid 4?
>=20
> There's plenty of them available used for a few tens of $/=E2=82=AC
> on ebay as it was a popular phone on Verizon network in the
> US. It works fine on 3G networks outside the U.S, 4G probably
> only works in the US.

Ok, and more importantly, 2G should work outside U.S., too, good.

> > 2) How well is it supported?
>=20
> Basic things like UART, MMC, eMMC, WLAN, I2C, SPI, HDMI,
> clocks, PMIC and regulators work with lots of other dts
> configured devices heading into tomorrow's Linux next in my
> dts branch omap-for-v4.12/dt-droid4. LCD related patches have
> been posted but are not yet in next.
>=20
> Things that currently don't work are ADC, USB, charging,
> audio and modems. The modems are on OHCI/EHCI, audio is on the
> PMIC similar to the twl4030. I'm slowly working on a driver for
> ADC/USB/charging with few more issues to sort out. I do have
> ADC/USB/charging working with my current hacks though.

2 cores and more importantly 1GB of RAM. Nice. OTOH, I'm avoiding N950
due to its crazy "security" system and this one is even worse. RAM and
CPUs are nice, but phone calls are what is important for me. And
battery charging, I guess. Serial port on the USB connector _is_ nice,
OTOH.=20

Anyway, good luck, and thanks for the pointers. I will get Droid 4 if
it is easy. But I guess I'll stick to N900 for now. I want something
that can do voice calls.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAli+n8UACgkQMOfwapXb+vJq4gCdGpQqY2GuDCuWynKx1fboYIhL
dt8AoKp3QQAOXNyXskHhGP2IJgAbmTse
=MFIY
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
