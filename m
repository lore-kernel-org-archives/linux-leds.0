From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: cpcap: new driver
Date: Tue, 11 Apr 2017 22:19:03 +0200
Message-ID: <20170411201903.GA14911@amd>
References: <20170305172234.24120-1-sre@kernel.org>
 <20170306221147.GA24272@amd>
 <20170307171926.wscaogsrdmxc2opz@earth>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170307171926.wscaogsrdmxc2opz@earth>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Mon, Mar 06, 2017 at 11:11:47PM +0100, Pavel Machek wrote:
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
> I got a used one on Ebay for 42=E2=82=AC incl. shipping & customs. The tr=
ick
> is clicking the worldwide option, since they are pretty expensive in
> EU (they only exist with US LTE modem, so they were not sold here
> officially).
>=20
> > 2) How well is it supported?
>=20
> UART + WLAN works with mainline master branch. As written by Tony
> we have a couple of patches ready for 4.12. Big open tasks are the
> cameras and the modems. Cameras are handled via co-processor in the
> stock system (that's about all I know about them so far) and modems are
> connected via USB + GPIOs (and for the 2G/3G modem an additional UART).
> LTE modem support seems simple (USB-CDC based), but does not work
> in EU and 2G/3G looks like much work. Modem voice support will be
> simpler than on N900, though (data goes directly to the audio codec).
> Speaking about audio codec: I'm currently working on that.

Thanks for all the information. It looks like a nice and powerful
machine, but I'm looking for a phone, first. (I'd actually like
something smaller than n900, preferably 3 times smaller... but... as
long as it calls it will have to do :-) ).

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljtOjcACgkQMOfwapXb+vL1mgCcCkFkwzboCiuh1m2JaaDVoOZP
Sr8An0OQsz8X+3/tIaXP10FuMGBRWfIY
=1U34
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
