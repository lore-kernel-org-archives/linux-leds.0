Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D05C5519F
	for <linux-leds@archiver.kernel.org>; Wed, 25 Nov 2020 10:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D569120857
	for <linux-leds@archiver.kernel.org>; Wed, 25 Nov 2020 10:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgKYKmq (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:42:46 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35892 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbgKYKmq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:42:46 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 44A2B1C0B7D; Wed, 25 Nov 2020 11:42:43 +0100 (CET)
Date:   Wed, 25 Nov 2020 11:42:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree v2 2/2] leds: trigger: netdev: parse
 `trigger-sources` from device tree
Message-ID: <20201125104242.GD25562@amd>
References: <20200915152616.20591-1-marek.behun@nic.cz>
 <20200915152616.20591-3-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline
In-Reply-To: <20200915152616.20591-3-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Allow setting netdev LED trigger as default when given LED DT node has
> the `trigger-sources` property pointing to a node corresponding to a
> network device.
>=20
> The specific netdev trigger mode is determined from the `function` LED
> property.

Sounds reasonable.

> +	netdev =3D of_find_net_device_by_node(args.np);
> +	if (!netdev)
> +		return false;
> +
> +	np =3D dev_of_node(led_cdev->dev);
> +	if (!np)
> +		return false;

Missing of_node_put?

> +++ b/include/dt-bindings/leds/common.h
> @@ -77,6 +77,7 @@
>  #define LED_FUNCTION_HEARTBEAT "heartbeat"
>  #define LED_FUNCTION_INDICATOR "indicator"
>  #define LED_FUNCTION_LAN "lan"
> +#define LED_FUNCTION_LINK "link"
>  #define LED_FUNCTION_MAIL "mail"
>  #define LED_FUNCTION_MTD "mtd"
>  #define LED_FUNCTION_PANIC "panic"

We have function "lan" already defined; "link" would do mostly same
thing. Should we use "lan"? Or should we delete "lan" and replace it
with "link"?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++NSIACgkQMOfwapXb+vLlFACfQ+FdwnLyYYYTMXUL+a8qq/q7
qHIAoLi8om3JxCfkbLVI80TKJhbRRJhG
=lUYq
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
