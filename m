Return-Path: <SRS0=X5L8=5H=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84846C4332E
	for <linux-leds@archiver.kernel.org>; Sun, 22 Mar 2020 11:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6043720732
	for <linux-leds@archiver.kernel.org>; Sun, 22 Mar 2020 11:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgCVL7I (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 22 Mar 2020 07:59:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60908 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgCVL7I (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Mar 2020 07:59:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 30BCF1C031C; Sun, 22 Mar 2020 12:59:07 +0100 (CET)
Date:   Sun, 22 Mar 2020 12:59:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org
Subject: Cleanups in "next" tree
Message-ID: <20200322115906.GA10623@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've commited some cleanups into LED tree ( git/pavel/linux-leds.git
branch for-next ), if someone wants to review them.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXndTCgAKCRAw5/Bqldv6
8kkOAKCxa+0P/I5fqkmBs5+/YbYdHcK9bwCfcgSG9CBo9s1o8Cm0mPzaDUKt/H0=
=UnMJ
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
