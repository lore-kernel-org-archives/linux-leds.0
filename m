Return-Path: <SRS0=GPQo=DB=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E381C4363D
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 12:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF92121D7F
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 12:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgIXMYx (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 24 Sep 2020 08:24:53 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37708 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgIXMYx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:24:53 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 298241C0BCB; Thu, 24 Sep 2020 14:24:51 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:24:50 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Markus Moll <moll.markus@arcor.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: pca9532: read pwm settings from device tree
Message-ID: <20200924122450.GJ3933@duo.ucw.cz>
References: <198551419.101933.1600803075307@mail.vodafone.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWOmaDnDlrCGjNh4"
Content-Disposition: inline
In-Reply-To: <198551419.101933.1600803075307@mail.vodafone.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pWOmaDnDlrCGjNh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 21:31:15, Markus Moll wrote:
> While the two pca9532 pwms can be configured in the platform data
> struct, there was no corresponding dt binding. Users need to configure
> the pwm if some leds should blink or continue blinking during boot.
>=20
> Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>

Thanks, applied.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pWOmaDnDlrCGjNh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yQEgAKCRAw5/Bqldv6
8hZ2AJ9RbkC+ibbzVG4em/wb0kH2u3odlACggJuJY29VtsW7pLNwdQ2mx5Fkm2Y=
=Mv9T
-----END PGP SIGNATURE-----

--pWOmaDnDlrCGjNh4--
