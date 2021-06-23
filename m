Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3325C48BC2
	for <linux-leds@archiver.kernel.org>; Wed, 23 Jun 2021 20:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87927611C1
	for <linux-leds@archiver.kernel.org>; Wed, 23 Jun 2021 20:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFWU2s (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:28:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36502 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhFWU2s (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:28:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 284031C0B76; Wed, 23 Jun 2021 22:26:29 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:26:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     j.anaszewski@samsung.com, sw0312.kim@samsung.com,
        ingi2.kim@samsung.com, varkabhadram@gmail.com, cooloney@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: ktd2692: Fix an error handling path
Message-ID: <20210623202628.GH8540@amd>
References: <4057d4cb2d47f893039de85e595682d17f4814a4.1621595943.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
Content-Disposition: inline
In-Reply-To: <4057d4cb2d47f893039de85e595682d17f4814a4.1621595943.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-05-21 13:21:01, Christophe JAILLET wrote:
> In 'ktd2692_parse_dt()', if an error occurs after a successful
> 'regulator_enable()' call, we should call 'regulator_enable()'.
>=20
> This is the same in 'ktd2692_probe()', if an error occurs after a
> successful 'ktd2692_parse_dt()' call.
>=20
> Instead of adding 'regulator_enable()' in several places, implement a
> resource managed solution and simplify the remove function accordingly.
>=20
> Fixes: b7da8c5c725c ("leds: Add ktd2692 flash LED driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTmPQACgkQMOfwapXb+vLEoQCeLTA+wEeQ7e7kvDDNwzWp8Rnd
y28An07W7Dm/9ehKFMVeAI1XtUzAODL/
=266f
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--
