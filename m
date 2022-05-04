Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A02C433EF
	for <linux-leds@archiver.kernel.org>; Wed,  4 May 2022 18:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376734AbiEDSUZ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 4 May 2022 14:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242019AbiEDSUT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:20:19 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9948532EA;
        Wed,  4 May 2022 10:42:31 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EE7DA1C0BAA; Wed,  4 May 2022 19:42:29 +0200 (CEST)
Date:   Wed, 4 May 2022 19:42:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Antonio Ospite <ao2@ao2.it>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add regulator-led binding
Message-ID: <20220504174229.GC8725@duo.ucw.cz>
References: <20220404203522.2068071-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <20220404203522.2068071-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2022-04-04 22:35:20, Linus Walleij wrote:
> The regulator is a LED connected directly to a regulator and with
> its brightness controlled by the voltage of the regulator.

Thank you, applied.

Best regards,
								Pavel
							=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYnK7BQAKCRAw5/Bqldv6
8jr+AJ42/8NJ+mbP2wcOunAYvZliV1DCQgCfVSAklw7SmN7mjpnukSq5Xqzd/QM=
=2dRO
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
