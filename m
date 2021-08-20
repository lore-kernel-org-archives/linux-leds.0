Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9840CC4338F
	for <linux-leds@archiver.kernel.org>; Fri, 20 Aug 2021 09:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7215161131
	for <linux-leds@archiver.kernel.org>; Fri, 20 Aug 2021 09:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbhHTJDX (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 20 Aug 2021 05:03:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45632 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbhHTJDW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Aug 2021 05:03:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 47CD81C0B80; Fri, 20 Aug 2021 11:02:44 +0200 (CEST)
Date:   Fri, 20 Aug 2021 11:02:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 6/7] leds: pca955x: Let the core process the fwnode
Message-ID: <20210820090243.GD22757@amd>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
 <20210716220331.49303-7-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vni90+aGYgRvsTuO"
Content-Disposition: inline
In-Reply-To: <20210716220331.49303-7-eajames@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--vni90+aGYgRvsTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> -			err =3D devm_led_classdev_register(&client->dev, led);
> +			init_data.fwnode =3D pdata->leds[i].fwnode;
> +
> +			if (is_of_node(init_data.fwnode)) {
> +				if (to_of_node(init_data.fwnode)->name[0] =3D=3D
> +				    '\0')
> +					set_default_label =3D true;
> +				else
> +					set_default_label =3D false;
> +			} else {
> +				set_default_label =3D true;
> +			}

I'd write it as

		set_default_label =3D true;
		if (... && ...)
			set_default_label =3D false;

> +			if (set_default_label) {
> +				snprintf(default_label, sizeof(default_label),
> +					 "%d", i);
> +				init_data.default_label =3D default_label;
> +			} else {
> +				init_data.default_label =3D NULL;
> +			}

		init_data.default_label =3D NULL;
		if (...) {
		      set_default_label) {
> +				snprintf(default_label, sizeof(default_label),
> +					 "%d", i);
> +				init_data.default_label =3D default_label;
		}


Thank you,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vni90+aGYgRvsTuO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEfb7MACgkQMOfwapXb+vINNQCgxOB8A6SZDYvoBV4gqdSMkLPn
+OkAoI6ewF8RpHCETWOKUqGRM/AkOI9j
=CMuK
-----END PGP SIGNATURE-----

--vni90+aGYgRvsTuO--
