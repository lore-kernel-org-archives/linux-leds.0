Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6964DC433E0
	for <linux-leds@archiver.kernel.org>; Sun, 14 Feb 2021 17:14:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3514F64DCD
	for <linux-leds@archiver.kernel.org>; Sun, 14 Feb 2021 17:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhBNROL (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 14 Feb 2021 12:14:11 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46576 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhBNROK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2021 12:14:10 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 898291C0B9E; Sun, 14 Feb 2021 18:13:28 +0100 (CET)
Date:   Sun, 14 Feb 2021 18:13:28 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL 5.11-rc8] LED fix
Message-ID: <20210214171328.GA5314@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I have single fixlet for you at

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-r=
c8-5.11

Please pull it. It should be one patch, and one-line fixing build
problem.

    leds: rt8515: add V4L2_FLASH_LED_CLASS dependency

Unfortunately, for some reason request-pull is not willing to
cooperate, so I'm just doing this manually.

pavel@duo:/data/l/linux-leds$ git request-pull master git://git.kernel.org/=
pub/scm/linux/kernel/git/pavel/linux-leds.git/ 92bf22614b21a2706f4993b27801=
7e437f7785b3 > /tmp/delme for-rc8-5.11=20
warn: No match for commit 92bf22614b21a2706f4993b278017e437f7785b3 found at=
 git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
warn: Are you sure you pushed '92bf22614b21a2706f4993b278017e437f7785b3' th=
ere?
pavel@duo:/data/l/linux-leds$

I see 92bf... using https. Are mirrors out of sync or what?=20

https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit=
/?h=3Dfor-rc8-5.11

Best regards,
							Pavel


--=20
http://www.livejournal.com/~pavelmachek

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYClaOAAKCRAw5/Bqldv6
8s/FAJ9VMVnM3KPAuNJ9zS/6J2Gamt2SBwCgs3yXfcBqmEgECcG7KgTi+fJXdIo=
=xrKq
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
