Return-Path: <SRS0=X9ll=DC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E93C4363D
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 09:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7CB820756
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 09:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgIYJ1V (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 05:27:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43870 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgIYJ1V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 05:27:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 04B891C0C44; Fri, 25 Sep 2020 11:27:20 +0200 (CEST)
Date:   Fri, 25 Sep 2020 11:27:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel test robot <lkp@intel.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-leds@vger.kernel.org
Subject: Re: [pavel-linux-leds:for-next 61/70]
 drivers/leds/leds-tca6507.c:750:34: warning: unused variable
 'of_tca6507_leds_match'
Message-ID: <20200925092719.GA20659@amd>
References: <202009250524.By2seNuP%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <202009250524.By2seNuP%lkp@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

I patched it up and pushed the result.

Best regards,
							Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9tt/cACgkQMOfwapXb+vJQKwCfRJbcAjEaW2PontJJL80p98i0
rboAnilm7g1cAjY6ia1OVwipmDXBSmGd
=O4cc
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
