Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BAEC433EF
	for <linux-leds@archiver.kernel.org>; Sat,  7 May 2022 21:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239670AbiEGVPE (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 7 May 2022 17:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236965AbiEGVPD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 May 2022 17:15:03 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1E013F07
        for <linux-leds@vger.kernel.org>; Sat,  7 May 2022 14:11:15 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 30A181C0BA6; Sat,  7 May 2022 23:11:14 +0200 (CEST)
Date:   Sat, 7 May 2022 23:11:13 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] leds: is31fl32xx: Improve error reporting in .remove()
Message-ID: <20220507211113.GB11004@duo.ucw.cz>
References: <20220504183131.52728-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20220504183131.52728-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Returning an error value in an i2c remove callback results in a generic
> error message being emitted by the i2c core, but otherwise it doesn't make
> a difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> So instead of triggering the generic i2c error message, emit a more helpf=
ul
> message if a problem occurs and return 0 to suppress the generic message.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thank you, applied.

									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnbgcQAKCRAw5/Bqldv6
8nOVAJ9CqzTYK/xAU6agNZ5VnIwIkt6uKQCfYpPqYO9rRIJT7fkkuhy38RIHOPk=
=k8do
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
