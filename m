Return-Path: <SRS0=EaiZ=DH=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5518C4727C
	for <linux-leds@archiver.kernel.org>; Wed, 30 Sep 2020 17:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A284520754
	for <linux-leds@archiver.kernel.org>; Wed, 30 Sep 2020 17:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbgI3RX3 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 30 Sep 2020 13:23:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60200 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3RXY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:23:24 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B6A731C0B76; Wed, 30 Sep 2020 19:23:21 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:23:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH leds v2 2/2] leds: ns2: do not guard OF match pointer
 with of_match_ptr
Message-ID: <20200930172321.GH27760@duo.ucw.cz>
References: <20200926201131.23981-1-kabel@kernel.org>
 <20200926201131.23981-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Content-Disposition: inline
In-Reply-To: <20200926201131.23981-3-kabel@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Do not match OF match pointer with of_match_ptr, so that even if
> CONFIG_OF is disabled, the driver can still be bound via another method.
>=20
> Move definition of of_ns2_leds_match just before ns2_led_driver
> definition, since it is not needed sooner.
>=20
> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks, applied.
								Pavel
								--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S/CQAKCRAw5/Bqldv6
8nVPAJ0Up1Qy6dbfUVa/PuyZOl2KSzEKfgCfWBz7vScnCaTfXlesgkFabiuMGlI=
=L36D
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
