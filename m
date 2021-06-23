Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A37EC48BC2
	for <linux-leds@archiver.kernel.org>; Wed, 23 Jun 2021 20:15:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2492A611C1
	for <linux-leds@archiver.kernel.org>; Wed, 23 Jun 2021 20:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWUSH (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:18:07 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35520 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUSF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:18:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D73801C0B76; Wed, 23 Jun 2021 22:15:46 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:15:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 1/1] leds: as3645a: Fix error return code in
 as3645a_parse_node()
Message-ID: <20210623201546.GD8540@amd>
References: <20210515030646.6877-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline
In-Reply-To: <20210515030646.6877-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2021-05-15 11:06:46, Zhen Lei wrote:
> Return error code -ENODEV rather than '0' when the indicator node can not
> be found.
>=20
> Fixes: a56ba8fbcb55 ("media: leds: as3645a: Add LED flash class driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTlnEACgkQMOfwapXb+vKIAACfdnQeK41nx2XrVPvBtqF++UK7
4C8An3JGTDB0NA5kk3Oj/6QfL4F17qmH
=jL2J
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
