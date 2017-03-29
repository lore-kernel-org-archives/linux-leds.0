From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv3 2/2] leds: cpcap: new driver
Date: Wed, 29 Mar 2017 23:38:42 +0200
Message-ID: <20170329213842.5xsmyfl64iy5qs6n@earth>
References: <20170324084732.31255-1-sre@kernel.org>
 <20170324084732.31255-2-sre@kernel.org>
 <b3a00d96-7eda-4f7f-62f8-364954449b6b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wp3q2qllhnihsrmd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3a00d96-7eda-4f7f-62f8-364954449b6b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--wp3q2qllhnihsrmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 29, 2017 at 09:12:57PM +0200, Jacek Anaszewski wrote:
> On 03/24/2017 09:47 AM, Sebastian Reichel wrote:
> > Motorola CPCAP is a PMIC (power management integrated circuit) found
> > in multiple smartphones. This driver adds support for the chip's LED
> > controllers. This introduces support for all controllers used by the
> > Droid 4. According to Motorola's driver (no datasheets available)
> > there a couple of more LED controllers. I did not add support for
> > them, since I cannot verify that they work with my modifications.
> >=20
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > Signed-off-by: Sebastian Reichel <sre@kernel.org>
> > ---
> > Changes since PATCHv1:
> >  - binding: reference common led binding for label
> >  - drop DEBUG define (leftover)
> >  - s/led/LED/g in debug prints
> >  - order includes alphabetically
> >  - introduce mutex, since led API is not atomic
> >  - register led class after initial register setup
> >  - use GPLv2+ in header
> >  - drop unsupported leds from driver
> >=20
> > Changes since PATCHv2:
> >  - use standard defines instead CPCAP_LED_OFF and CPCAP_LED_ON
> >=20
> > Notes:
> >  - The "motorola" vendor-prefix is added via rtc-next
> > ---
> >  .../devicetree/bindings/leds/cpcap-leds.txt        |  29 +++
> >  drivers/leds/Kconfig                               |   9 +
> >  drivers/leds/Makefile                              |   1 +
> >  drivers/leds/leds-cpcap.c                          | 239 +++++++++++++=
++++++++
> >  4 files changed, 278 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/cpcap-leds.t=
xt
> >  create mode 100644 drivers/leds/leds-cpcap.c
> >=20
> > diff --git a/Documentation/devicetree/bindings/leds/cpcap-leds.txt b/Do=
cumentation/devicetree/bindings/leds/cpcap-leds.txt
> > new file mode 100644
> > index 000000000000..ebf7cdc7f70c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/cpcap-leds.txt
>=20
> I've changed cpcap-leds.txt to leds-cpcap.txt to match the prevailing
> pattern for LED DT bindings file names.
>=20
> Please let me know if you have any objections.

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--wp3q2qllhnihsrmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAljcKWEACgkQ2O7X88g7
+prFhg/+NGlO4VjO16aWok7mHrBgq9o0/fc/12uOYCdTvHZgeHX9z7AchinA3puJ
PvsdIi8UlfEWkifxIzWeRaZXkD4SjrqrRX7qVqclDMUk0soNMgaCybXIU/RNECJ8
Tt3zLBJXqYYvUlzJkPaJy1vlhJwNC+iU8tPKeiV+HUa8j7vO8sPVg6bkb1bvaAhp
bJPP2udu0gXDjZcvTWkGt8dpBhvxbvcITOXSoepFD2zrYSO+xkVbIMX9HT5T3BpV
PX6zh3k2VvDhtYES2eNebz+QspTpgOCG3QBnVcIeB+ctFSyynAVSSfwKtntJKKgt
SQb6Tc4NuxKunWaSxOZF+eDkjAJ09QYEkB9AAaX0xrb9XLO5vJ8wsMAT53Z7jnmp
JjxuH70h29bw45E7fGN66JLgxaqcxYla0MuBsekE/tUvqi7U2JcbU/PJJXbUgnxX
QFNsW92QkuDt0fRwfBkVtZyPE3feURBzQzbIGfdH6L+/Ldk47JUjLIOIK8WLq7Cz
+HBfZB35wxnAaENTpFnOzQSJ7NUYUixLu2SecWaUqts+4I0RuD/9mfkbC1XLp0zd
i4UGJ67WW0iesEu1p8SZw+0OFOJVPoByrTwR+HigTYFBnXaW4ByuUNIrROduWa5p
9dTjlL7moVC4THd8TtNhSU3Hrqgc5lk6q0tOkTZPEWmMbBB8yzA=
=kFod
-----END PGP SIGNATURE-----

--wp3q2qllhnihsrmd--
