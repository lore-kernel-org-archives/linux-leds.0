Return-Path: <SRS0=1z4C=WP=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7234EC3A59D
	for <linux-leds@archiver.kernel.org>; Mon, 19 Aug 2019 10:49:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5299220851
	for <linux-leds@archiver.kernel.org>; Mon, 19 Aug 2019 10:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfHSKtL (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 19 Aug 2019 06:49:11 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34946 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSKtL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 06:49:11 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7FB9B807BD; Mon, 19 Aug 2019 12:48:57 +0200 (CEST)
Date:   Mon, 19 Aug 2019 12:49:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt: lm3532: Add property for full scale current.
Message-ID: <20190819104910.GF21072@amd>
References: <20190813181154.6614-1-dmurphy@ti.com>
 <20190813181154.6614-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Content-Disposition: inline
In-Reply-To: <20190813181154.6614-3-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-08-13 13:11:53, Dan Murphy wrote:
> Add a property for each control bank to configure the
> full scale current setting for the device.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


> @@ -62,6 +62,9 @@ Optional LED child properties:
>  	- label : see Documentation/devicetree/bindings/leds/common.txt
>  	- linux,default-trigger :
>  	   see Documentation/devicetree/bindings/leds/common.txt
> +	- led-max-microamp : Defines the full scale current value for each cont=
rol
> +			  bank.  The range is from 5000uA-29800uA in increments
> +			  of 800uA.
> =20
>  Example:
>  led-controller@38 {
> @@ -85,6 +88,7 @@ led-controller@38 {
>  		reg =3D <0>;
>  		led-sources =3D <2>;
>  		ti,led-mode =3D <1>;
> +		led-max-microamp =3D <21800>;
>  		label =3D ":backlight";
>  		linux,default-trigger =3D "backlight";
>  	};

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1afqYACgkQMOfwapXb+vLKmACeJ+txZeyceT38oTWRDkV0qEdF
E0oAoJFTGQH75MV0pk3vGk9LVT3sZ8es
=4k/Z
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--
