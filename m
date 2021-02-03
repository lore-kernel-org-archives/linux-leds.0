Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C323BC433DB
	for <linux-leds@archiver.kernel.org>; Wed,  3 Feb 2021 14:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6535464F6C
	for <linux-leds@archiver.kernel.org>; Wed,  3 Feb 2021 14:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhBCOa0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 3 Feb 2021 09:30:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:47012 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbhBCOaZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 09:30:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E48181C0B9C; Wed,  3 Feb 2021 15:29:40 +0100 (CET)
Date:   Wed, 3 Feb 2021 15:29:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Message-ID: <20210203142940.GB12369@duo.ucw.cz>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline
In-Reply-To: <20210119105312.2636-1-schuchmann@schleissheimer.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In order to use a multicolor-led together with a trigger
> from DT the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
>=20
> This patch adds the ability to set the default intensity
> of each led so that it is turned on from DT.

Do we need this to be configurable from device tree? Can we just set
it to max or something?

Aha, this basically sets the initial color for LEDs the monochromatic
triggers, right?

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYBqzVAAKCRAw5/Bqldv6
8jU+AKDBCWCPYM4oWufL16cUxx/EhAeG3wCdEe7WKm1eaSwXiWafu9dKcu0LneA=
=RLnx
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
