Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC88C43463
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 10:20:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E46DD21D42
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 10:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISKUE (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 06:20:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46484 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKUE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 06:20:04 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9633E1C0B85; Sat, 19 Sep 2020 12:20:01 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:20:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH leds v2 25/50] leds: is31fl319x: compute aggregated max
 current separately
Message-ID: <20200919102001.GD16109@duo.ucw.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-26-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-26-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Parse `led-max-current` property of child nodes and compute aggregated
> value in a separate function. The controller cannot set this value
> separately for every LED, so there is no need to store this value for
> every LED.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>

Nikolaus, can we get some reviews/testing/comments/etc here?

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XbUQAKCRAw5/Bqldv6
8nlEAJ9PMRN8pG05YUuO7Na1vixc+4qPGQCfYkyRGJWnF2ras+CO91D73oT5MZw=
=60OQ
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
