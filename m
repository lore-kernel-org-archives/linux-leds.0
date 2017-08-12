From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Sat, 12 Aug 2017 10:42:13 +0200
Message-ID: <20170812084213.GA20383@amd>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org>
 <20170811134757.GA22561@amd>
 <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org>
 <20170811153742.GA31267@amd>
 <b585f234-6ad6-e63f-f4ec-f7d1efaf83ca@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54510 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbdHLImQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Aug 2017 04:42:16 -0400
Content-Disposition: inline
In-Reply-To: <b585f234-6ad6-e63f-f4ec-f7d1efaf83ca@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
> >>>> +{
> >>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
> >>>> +}
> >>>
> >>> Is the cast needed? Should you attempt to handle errors?
> >>
> >> ah. this is a left over. I can fix in a resend.
> >=20
> > No need to resend just for this.
> >=20
> > Should you WARN_ON() if the read_byte_data returns < 0 or something?
> >=20
> > https://linuxtv.org/downloads/v4l-dvb-internals/device-drivers/API-i2c-=
smbus-read-byte-data.html
>=20
> I don't think so as this is just to read the gpio value.=20
>=20
> I suppose that the i2c layer will output some errors before=20
> if it catches some invalid state.

Normally its driver's job to output errors. (Same for write).

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

iEYEARECAAYFAlmOv2UACgkQMOfwapXb+vIjygCfQtXb+LNcFvkf2dr/Ff6OfAv7
fw0AoIpfinpkgvpeuftrJQt+duapRowm
=IwHr
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
