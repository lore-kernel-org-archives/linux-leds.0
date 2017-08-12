From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 19:46:23 +0200
Message-ID: <20170812174623.GA2545@amd>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
 <20170812105620.GA23543@amd>
 <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:42331 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752024AbdHLRqZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Aug 2017 13:46:25 -0400
Content-Disposition: inline
In-Reply-To: <e07da9fe-4875-ad1e-08bc-3b3a7414c6fd@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: linux-leds@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2017-08-12 14:34:02, Oleh Kravchenko wrote:
> On 12.08.17 13:56, Pavel Machek wrote:
> > Hi!
> >=20
> >>> On Sat 2017-08-12 12:09:35, Oleh Kravchenko wrote:
> >>>> This patch adds a LED class driver for the RGB LEDs found on
> >>>> the Crane Merchandising System CR0014114 LEDs board.
> >>>
> >>> What kind of hardware is this?=20
> >>
> >> It's from vending machines produced by Crane Merchandising System http=
://cranems.com/
> >> =20
> >>>> Driver creates LED devices with name written using the following
> >>>> pattern "LABEL-{N}:{red,green,blue}:".
> >>>
> >>> Is the "-{N} suffix needed?
> >>
> >> It's number of RGB LED, board has 6 LEDs.
> >=20
> > Normally label differentiates them...?
>=20
> For example, possible names when two boards connected is:
> /sys/class/leds/board0-0:blue:
> /sys/class/leds/board0-0:green:
> /sys/class/leds/board0-0:red:

Hmm. Well, this works if you can't provide better names. Still "board"
is somehow generic, andsomeone else might want to use it. "board" ->
"crms"?

> >>>> +	while (i--)
> >>>> +		led_classdev_unregister(&priv->leds[i].ldev);
> >>>
> >>> Can devm_* be used to simplify this?
> >>
> >> I think no, because it will cause race condition.
> >=20
> > Please take a look at devm_led_classdev_register() and friends. It
> > should be possible to simplify code without races.
>=20
> I don't understand how I can call destroy_workqueue() after calling unreg=
ister leds.

Do you actually need the workqueues? It should be possible to avoid
them, using workqueue support in the core.
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmPPu8ACgkQMOfwapXb+vIVwQCfa/RvlSd9La8ZKm4tQnYQOlsH
7q0AmwbmkcRingoxX2rMEPTDfxSVKMxx
=y1Cb
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
