Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCDFC5519F
	for <linux-leds@archiver.kernel.org>; Wed, 25 Nov 2020 11:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B335320665
	for <linux-leds@archiver.kernel.org>; Wed, 25 Nov 2020 11:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKYLBI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 25 Nov 2020 06:01:08 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37376 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgKYLBI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 06:01:08 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 49C191C0B87; Wed, 25 Nov 2020 12:01:06 +0100 (CET)
Date:   Wed, 25 Nov 2020 12:01:05 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
Message-ID: <20201125110105.GH25562@amd>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IbVRjBtIbJdbeK1C"
Content-Disposition: inline
In-Reply-To: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IbVRjBtIbJdbeK1C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 23:05:15, Christophe JAILLET wrote:
> In case of memory allocation failure, we must release some resources as
> done in all other error handling paths of the function.
>=20
> 'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
> is called when we break out of a 'device_for_each_child_node' loop.
>=20
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED =
driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, applied.

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--IbVRjBtIbJdbeK1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++OXEACgkQMOfwapXb+vKXnACgkMTa2dISLqXMqzMQj+tAOgUF
mXcAoJTgoFHTSKW3ivAiNiznNo/aX0If
=Fc+b
-----END PGP SIGNATURE-----

--IbVRjBtIbJdbeK1C--
