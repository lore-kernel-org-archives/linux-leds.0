Return-Path: <SRS0=GPQo=DB=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B316FC4727D
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 13:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 773D02388A
	for <linux-leds@archiver.kernel.org>; Thu, 24 Sep 2020 13:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgIXNfv (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 24 Sep 2020 09:35:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58698 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbgIXNfv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 09:35:51 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 969191C0BCB; Thu, 24 Sep 2020 15:35:48 +0200 (CEST)
Date:   Thu, 24 Sep 2020 15:35:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Markus Moll <moll.markus@arcor.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] leds: pca9532: correct shift computation in
 pca9532_getled
Message-ID: <20200924133548.GK3933@duo.ucw.cz>
References: <718260256.101908.1600802915869@mail.vodafone.de>
 <20200924122421.GI3933@duo.ucw.cz>
 <5639829.lOV4Wx5bFT@x2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4wkndigzIeYF6Hbg"
Content-Disposition: inline
In-Reply-To: <5639829.lOV4Wx5bFT@x2>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4wkndigzIeYF6Hbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Am Donnerstag, 24. September 2020, 14:24:21 CEST schrieb Pavel Machek:
> >=20
> > Note that default-state =3D keep should _not_ be supported unless
> > someone needs it.
> >=20
>=20
> We are using it (hence the patch), does that count?=20

Yes :-).

> (We actually need it, as on our board U-Boot determines whether the leds=
=20
> should blink during boot, and glitch-free blinking wouldn't otherwise be=
=20
> possible).

Okay with me. I'd just prefer to avoid "there's possibility to do that
in device tree, so let's support it".

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--4wkndigzIeYF6Hbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2ygtAAKCRAw5/Bqldv6
8q66AJ40FaJLkXgu+5VKUWuaY6bSH4F6RACfTmnjWD72n2D/SYQ2W2WbXX7CbJ0=
=0ScX
-----END PGP SIGNATURE-----

--4wkndigzIeYF6Hbg--
