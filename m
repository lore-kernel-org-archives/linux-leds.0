Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB05BC433EF
	for <linux-leds@archiver.kernel.org>; Mon, 23 May 2022 20:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiEWUGU (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 23 May 2022 16:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbiEWUGA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 May 2022 16:06:00 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F0B8BD3E;
        Mon, 23 May 2022 13:05:54 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5ADA11C0B82; Mon, 23 May 2022 22:05:52 +0200 (CEST)
Date:   Mon, 23 May 2022 22:05:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add bindings for the TLC5925
 controller
Message-ID: <20220523200552.GB15554@duo.ucw.cz>
References: <20220523084958.2723943-1-jjhiblot@traphandler.com>
 <20220523084958.2723943-2-jjhiblot@traphandler.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20220523084958.2723943-2-jjhiblot@traphandler.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +                led-satus@0 {

led-status.

						=09
> +                led-alive@24 {
> +                        reg =3D <24>;
> +                        label =3D "green:alive"
> +                };
> +
> +                led-panic@31 {
> +                        reg =3D <31>;
> +                        label =3D "red:panic"
> +                };

Please check documentation, if live and panic leds are common, you may
want to add it there. But better make it green:power or something.


BR,
							Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYovpIAAKCRAw5/Bqldv6
8qtwAJ4hgFsF0tDNUfANoYYQfwhXbMqv7QCdHvZG7cojsTZRdBYPnkGR9+8L5JA=
=YgPQ
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
