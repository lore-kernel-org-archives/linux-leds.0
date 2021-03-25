Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598BFC433DB
	for <linux-leds@archiver.kernel.org>; Thu, 25 Mar 2021 18:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18E0A61A44
	for <linux-leds@archiver.kernel.org>; Thu, 25 Mar 2021 18:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhCYSly (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 25 Mar 2021 14:41:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51466 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYSlm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 14:41:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 725AD1C0B94; Thu, 25 Mar 2021 19:41:40 +0100 (CET)
Date:   Thu, 25 Mar 2021 19:41:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Vesa =?iso-8859-1?B?SuTkc2tlbORpbmVu?= <dachaac@gmail.com>
Cc:     Hermes Zhang <chenhui.zhang@axis.com>, dmurphy@ti.com,
        robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
Subject: Re: [PATCH 2/2] dt-binding: leds: Document leds-multi-gpio bindings
Message-ID: <20210325184140.GA16039@duo.ucw.cz>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-3-chenhui.zhang@axis.com>
 <0648fff2-5b38-66da-7eb0-9969e517421f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <0648fff2-5b38-66da-7eb0-9969e517421f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> See below.

Please trim.

> > +  led-gpios:
> > +    description: Array of one or more GPIOs pins used to control the L=
ED.
> > +    minItems: 1
> > +    maxItems: 8  # Should be enough
>=20
> We also have a case with multi color LEDs (which is probably a more common
> than multi intensity LED. So I am wondering how these both could co-exist.
>=20
> From: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/leds/leds-gpio.yaml?h=3Dv5.12-rc4#n58
>=20
>         led-0 {
>             gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW>;
>             linux,default-trigger =3D "disk-activity";
>             function =3D LED_FUNCTION_DISK;
>         };
>=20
> Now 'gpios' (and in LED context) and 'led-gpios' is very close to each ot=
her
> and could easily be confused.
>=20
> Perhaps this could be something like:
>=20
> intensity-gpios =3D ...
>=20
> or even simplified then just to gpios =3D <...>

=2E..
> How would this sound?

Well, not too bad on a quick look.

Are you willing to implement such multi-color-multi-bit-multi-gpio
driver?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYFzZZAAKCRAw5/Bqldv6
8j45AJ9RFvJxNlBDSt9L+2q8p/Lx9iKqbgCfVle9NynAFaWzAsNFO22CXcPitl4=
=SdkL
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
