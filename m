Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320B6C433EF
	for <linux-leds@archiver.kernel.org>; Sun, 12 Sep 2021 07:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03B06610FD
	for <linux-leds@archiver.kernel.org>; Sun, 12 Sep 2021 07:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhILHMY (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 12 Sep 2021 03:12:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50358 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhILHMX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Sep 2021 03:12:23 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AAA461C0B7A; Sun, 12 Sep 2021 09:11:08 +0200 (CEST)
Date:   Sun, 12 Sep 2021 09:11:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: pending patches
Message-ID: <20210912071107.GA16081@amd>
References: <BN9PR12MB538114BC3CA171DD31E420A6AFFD9@BN9PR12MB5381.namprd12.prod.outlook.com>
 <20210820080631.GA22757@amd>
 <BN9PR12MB53811FD7FC0C8DD410F785CEAFD89@BN9PR12MB5381.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <BN9PR12MB53811FD7FC0C8DD410F785CEAFD89@BN9PR12MB5381.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > I have two pending patches:
> > > https://patches.linaro.org/patch/432324/ from 2021-05-07
> >=20
> > I don't understand this one. Are these normal single-color LEDs, or is =
it some
> > kind of weird red/orange/amber/green combination exposed as single LED?
>=20
> This is not single-color LED. LED is controlled by programmable device, c=
olor is
> set by writing relevant bit mask combination to the related LED register.

Not a single-color LED yet using single-color API, and now you are
introducing additional hacks on the top of it. Sorry, no.

> > > https://patches.linaro.org/patch/403538/ from 2021-03-16, which has b=
een
> > re-sent.
> >=20
> > In this case, I don't think i2c bus number is suitable way to identify =
add-on
> > card. Having some way of identifying add-on cards makes sense (as we'll
> > probably have other vendors having "fault" or "activity"
> > light on their cards), but those boards will not neccessarily have i2c =
on them.
>=20
> Line card always has I2C connection, LED color is controlled through a pr=
ogrammable
> device, which is always I2C device. So, this is I2C and bus number identi=
fies topology.

I see it works for your hardware. I don't believe it works for other
vendors having "activity" LED on their card, and I'd like to see
consistent naming across vendors.

> Pavel,
> I have those patches pending very long time. Could you, please, help to g=
et them
> accepted?

Not really, sorry.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmE9qAoACgkQMOfwapXb+vI66ACgpfh/ygDmsnL+shqnc5dsWt1y
Eb8AoJSgTAF0EQM7MNsfFokYfFNZk/KK
=i1uc
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
