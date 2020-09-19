Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84808C43464
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 11:59:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486A72100A
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 11:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISL76 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 07:59:58 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57154 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISL76 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 07:59:58 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0BAE91C0B85; Sat, 19 Sep 2020 13:59:57 +0200 (CEST)
Date:   Sat, 19 Sep 2020 13:59:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Markus Moll <moll.markus@arcor.de>
Cc:     linux-leds@vger.kernel.org, Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH 2/2] dt: bindings: pca9532: add description of pwm and
 psc properties
Message-ID: <20200919115956.GB21747@duo.ucw.cz>
References: <1023311712.12962.1600197989828@mail.vodafone.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <1023311712.12962.1600197989828@mail.vodafone.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-15 21:26:29, Markus Moll wrote:
> These new properties allow users to configure the PWM when the device is
> probed. This is useful for e.g. uninterrupted blinking during boot.
>=20
> Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
> ---
> .../devicetree/bindings/leds/leds-pca9532.txt | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Do=
cumentation/devicetree/bindings/leds/leds-pca9532.txt
> index f769c52e364..3aa05eca9df 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> @@ -11,6 +11,14 @@ Required properties:
> "nxp,pca9533"
> - reg - I2C slave address
>=20
> +Optional properties:
> + - nxp,pwm: array of two 8-bit values specifying the blink duty cycle
> + fractions of each pwm (default <0 0>)
> + The duty cycle is pwm/256.
> + - nxp,psc: array of two 8-bit values specifying the blink period of
> + each pwm (default <0 0>)
> + The period is (psc+1)/152 seconds.
> +
> Each led is represented as a sub-node of the nxp,pca9530.

This will need ACK from dt people.

Also patch came whitespace-damaged.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2XyvAAKCRAw5/Bqldv6
8vDzAKCxOIQX3IQpFqYqgGAuDicLj14E0gCfTKWpps/o2YmfFXTefxt8v3LzRYo=
=UiRn
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
