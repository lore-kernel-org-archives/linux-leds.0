From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 1/2] mfd: cpcap: Add missing include dependencies
Date: Thu, 23 Mar 2017 02:00:05 +0100
Message-ID: <20170323010005.xc3phqrimdcrbti4@earth>
References: <20170322000912.24210-1-sre@kernel.org>
 <20170322092708.GA26771@amd>
 <20170322155716.GC10760@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r33pvsik226nkcrw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170322155716.GC10760-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--r33pvsik226nkcrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 22, 2017 at 08:57:16AM -0700, Tony Lindgren wrote:
> * Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> [170322 02:29]:
> > On Wed 2017-03-22 01:09:11, Sebastian Reichel wrote:
> > > This fixes compilation for files, that try to include the
> > > cpcap header in alphabetically sorted #include lists.
> > >=20
> > > Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >=20
> > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>=20
> Hmm I wonder why I never ran into this so far. No objections
> to the patch though if it fixes the issue with all the necessary
> headers included.

Because you usually sort includes differently moving headers
=66rom linux/subdir/XYZ after linux/XYZ. That way regmap.h and
device.h will already be included when the compiler includes
motorola-cpcap.h.

-- Sebastian

--r33pvsik226nkcrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAljTHhIACgkQ2O7X88g7
+pqZaA/9FkTpwUyE5w4QKvskYnRBUEcqaXA07+rNOCs+hBMUSEBdfEHsDqxcKoPa
RGxMnMM+j+nH7MfrFmRrnu6k+S2GZPANnr7JxvdlOQg0Mj036K6AVughkjTrc9Gf
o2nRPjFkTjRgLvsctqjD97IY4Qb3Wg8AovwMArY2glO1Nw0Wijl6yUFlzIao0JD4
8f59++YeYXXEhp7E25iKCChmC7IqdwoVQqDIUARBvgL3zXeTvySeHgWNf6wHK6/P
+qYWqcD4qJZmwsazJq4QLifBWfTP5hhzcoO9lcLIpPi5DRAeBfu1w1uITLKR0V82
CnPqyJkXVQWUdVCkUKzhCL9fVltFA1lm+gp0wv4Ju14MlasNxpkvFIKTVPA+vfd0
GI4mEx+SHuF+aDRNK5kI5qy4RSDssQDtREvo9C0uDMHniqaqcBSNuxFkHpJj+vP8
hgITd2iY5IDo6VhqtBohLIknS7M1tLJESDamj4GT8Wdni/0rxFlZBz7Kz58Ijg6X
avA5xgvy9rUV9izJxmZEwEcNTG99JLyneqA3WWQT4CKXGe6BjTBCwaUAA/tVm6JK
ZMj0if3vb3uQpyt4WjO7jeEAPxmxmc1opKuh6ksLziTPas0+cgzY67ybOQZKJO5y
tSh/BFk3YRsPQrdLNa01paR1ciYGQGn2NweAFcVqd0wKcx9wmZo=
=yT+p
-----END PGP SIGNATURE-----

--r33pvsik226nkcrw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
