From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: default-state LED property (was Re: [PATCH v2] Extend pca9532 device
 tree support)
Date: Fri, 7 Apr 2017 13:57:54 +0200
Message-ID: <20170407115754.GA4756@amd>
References: <1490880833-22199-1-git-send-email-fb@ltec.ch>
 <b54c77d5-b4f7-9517-8c5b-9200c766204a@gmail.com>
 <20170406155005.GA10363@amd>
 <a8509d26-6e35-e2f7-9784-90f3c54accbf@gmail.com>
 <ec012568-f540-4e87-d8c4-4065fbcd1c2a@ltec.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ec012568-f540-4e87-d8c4-4065fbcd1c2a-GovowT2ENgg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Brack <fb-GovowT2ENgg@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> This seems to look for "pwm0" and "pwm1" strings, which do not seem to
> >> be documented.
> >>
> >> Plus... is it useful to have default-state? We already have default
> >> trigger. If we keep the value by default (on PC, we do something like
> >> that) this patch should not be neccessary?
> >=20
> > Thanks for the heads-up. Dropping the patch for now.
>=20
> No, please do not drop the patch.
>=20
> > I guess that pwm0/1 got propagated to v2 by an omission.
>=20
> Yes, I agree. However the two strings do not break anything and behave
> analog to the 'on' or 'keep' string. Though this code could be removed
> if absolutely necessary. An alternative would be to add a description
> for the strings. Just to be clear: these strings have nothing to with
> the exposition of device specific registers to the DT.

Well, they should be removed. No need to keep surprises in code.

> > Regarding default-on: Felix, do you have any use case that require
> > default-on set to "keep"?
>=20
> This patch is not about 'default-on' which is a value that could be
> assigned to the property 'linux,default-trigger' (according to DT
> bindings documentation file 'common.txt').
> My patch does not introduce anything new with the'keep' state, it rather
> completes the existing bindings according to the description in
> Documentation/devicetree/bindings/leds/common.txt which states:

Hmm, that was introduce by 1d1a77ddc8acfa3d506f1958e09a12085e71fc69
=2E I don't quite like the patch -- it duplicates default-trigger
functionality without good reason.

IMO we should

1) keep the led state by default

2) deprecate the default-state property

3) use default-triggers to emulate the functionality if someone really
needs it.

> One of my use cases is to turn a LED on by U-Boot. This LED must remain
> on until eventually, under certain conditions, some userland code
> changes it's state.
> Setting 'default-state' to 'keep' is how you can sort of tell the
> kernel, or better the driver, 'not to initialize the LED' which would
> turn it off.

Yes, that's reasonable. Perhaps 'keep' should be the default.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAljnfsIACgkQMOfwapXb+vLSfgCfUtCyK2wJYuIWZ0Rr01Jo1oE1
NWoAn1Vhp5Q+Ts3E8ZIMvdRQlIaR3edO
=sx3p
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
