Return-Path: <SRS0=brh8=4O=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F827C4BA12
	for <linux-leds@archiver.kernel.org>; Wed, 26 Feb 2020 13:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2292524683
	for <linux-leds@archiver.kernel.org>; Wed, 26 Feb 2020 13:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgBZNuI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 26 Feb 2020 08:50:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39742 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgBZNuI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 08:50:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 361FF1C0411; Wed, 26 Feb 2020 14:50:07 +0100 (CET)
Date:   Wed, 26 Feb 2020 14:50:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH 1/2 v2] leds: ns2: Absorb platform data
Message-ID: <20200226135006.GF4080@duo.ucw.cz>
References: <20200210101354.287045-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline
In-Reply-To: <20200210101354.287045-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Nothing in the kernel includes the external header
> <linux/platform_data/leds-kirkwood-ns2.h> so just push the
> contents into the ns2 leds driver. If someone wants to use
> platform data or board files to describe this device they
> should be able to do so using GPIO machine descriptors but
> in any case device tree should be the way forward for these
> systems in all cases I can think of, and the driver already
> supports that.
>=20
> Cc: Vincent Donnefort <vdonnefort@gmail.com>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Collect Simon's Tested-by tag

Aha, I applied v1, but collected tested-by tag manually, so we should
be ok.

Sorry for the delay.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ3jgAKCRAw5/Bqldv6
8nDxAKCJ7Qtkasmfjms/7d39Kk9bDGhYRQCgqg0qcOBaxPSFHWrHy0rP7kzzBB4=
=I1r4
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
