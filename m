From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch v1 1/2] mfd: Add Mellanox regmap core driver
Date: Wed, 26 Jul 2017 13:42:50 +0200
Message-ID: <20170726114250.GA7826@amd>
References: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
 <1501001499-21971-2-git-send-email-vadimp@mellanox.com>
 <20170726111846.GB6033@amd>
 <20170726112820.GB1845@nanopsycho>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56272 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751616AbdGZLmw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jul 2017 07:42:52 -0400
Content-Disposition: inline
In-Reply-To: <20170726112820.GB1845@nanopsycho>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jiri Pirko <jiri@resnulli.us>
Cc: Vadim Pasternak <vadimp@mellanox.com>, lee.jones@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-07-26 13:28:20, Jiri Pirko wrote:
> Wed, Jul 26, 2017 at 01:18:46PM CEST, pavel@ucw.cz wrote:
> >Hi!
> >
>=20
> [...]
>=20
>=20
> >
> >> +static void
> >> +mlxreg_core_work_helper(struct mlxreg_core_priv_data *priv,
> >> +			struct mlxreg_core_item *item, u8 is_inverse,
> >> +			u16 off, u32 mask, u32 *cache)
> >> +{
> >> +	struct mlxreg_core_data *data;
> >> +	u32 asserted, regval, bit;
> >> +	int ret;
> >> +
> >> +	/*
> >> +	 * Validate if item related to received signal type is valid.
> >> +	 * It should never happen, excepted the situation when some
> >> +	 * piece of hardware is broken. In such situation just produce
> >> +	 * error message and return. Caller must continue to handle the
> >> +	 * signals from other devices if any.
> >> +	 */
> >> +	if (unlikely(!item)) {
> >> +		dev_err(priv->dev, "False signal is received: register at offset 0x=
%02x, mask 0x%02x.\n",
> >> +			off, mask);
> >
> >Slightly too long line.
>=20
> That is totally ok to have it like that for printables though. Actually,
> wraping the text in half would be wrong.

Wrapping the text would be wrong, yes.

Nothing prevents you from moving text at separate line... or rewording
it to be shorter.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAll4gDoACgkQMOfwapXb+vJ99ACeOsqyMZ0TB/7z7pftw+DC/GNk
TpgAn29L1UmOfwacwGfHPANegPKlNiH2
=zMgx
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
