Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBF5C433F5
	for <linux-leds@archiver.kernel.org>; Sat, 12 Feb 2022 12:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbiBLMAg (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 12 Feb 2022 07:00:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiBLMAg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Feb 2022 07:00:36 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAAD2613A;
        Sat, 12 Feb 2022 04:00:32 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AB7271C0B80; Sat, 12 Feb 2022 13:00:31 +0100 (CET)
Date:   Sat, 12 Feb 2022 13:00:30 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] leds: remove ide-disk trigger
Message-ID: <20220212120030.GH20866@duo.ucw.cz>
References: <20220208104601.3751852-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zq44+AAfm4giZpo5"
Content-Disposition: inline
In-Reply-To: <20220208104601.3751852-1-clabbe@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zq44+AAfm4giZpo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> No user of ide-disk remains, so remove this deprecated trigger.
> Only a few platforms used this and were fixed in 2016.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Looks good to me but git refuses to apply it. Can I have an updated
version?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--zq44+AAfm4giZpo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYgehXgAKCRAw5/Bqldv6
8pL7AJ4hhTBR9yJgWATqGN7eakEA2qugrACgkKvEANTWHB9Q03dbDl1pZuGLrtc=
=0Rii
-----END PGP SIGNATURE-----

--zq44+AAfm4giZpo5--
