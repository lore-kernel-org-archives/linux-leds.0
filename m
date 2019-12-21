Return-Path: <SRS0=mbue=2L=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7151C2D0C3
	for <linux-leds@archiver.kernel.org>; Sat, 21 Dec 2019 19:03:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82022206B7
	for <linux-leds@archiver.kernel.org>; Sat, 21 Dec 2019 19:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfLUTDV (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 21 Dec 2019 14:03:21 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41212 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUTDV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:03:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5E3F81C24DF; Sat, 21 Dec 2019 20:03:19 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:03:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Kim Kyuwon <chammoru@gmail.com>
Subject: Re: [PATCH v2] leds: bd2802: Convert to use GPIO descriptors
Message-ID: <20191221190318.GC4199@amd>
References: <20191209004242.18152-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline
In-Reply-To: <20191209004242.18152-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-12-09 01:42:42, Linus Walleij wrote:
> The Rohm BD2802 have no in-kernel users so we can drop the
> GPIO number from the platform data and require users to
> provide the GPIO line using machine descriptors.
>=20
> As the descriptors come with inherent polarity inversion
> semantics, we invert the calls to set the GPIO line such
> that 0 means "unasserted" and 1 means "asserted".
>=20
> Put a note in the driver that machine descriptor tables
> will need to specify that the line is active low.

Thanks, applied.
						Pavel
					=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+bHYACgkQMOfwapXb+vJZSQCgtZHYfw8RDlSxTBYjb5e0/kw8
ND0An1s2pIMq1mL9jdz5iqfLmR/K+ntl
=1Uhk
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
