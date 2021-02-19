Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80061C433DB
	for <linux-leds@archiver.kernel.org>; Fri, 19 Feb 2021 11:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39F8B64E67
	for <linux-leds@archiver.kernel.org>; Fri, 19 Feb 2021 11:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhBSLXv (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 19 Feb 2021 06:23:51 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:49702 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhBSLWh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:22:37 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 19AEB1C0B8A; Fri, 19 Feb 2021 12:21:56 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:21:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Andreas Eberlein <foodeas@aeberlein.de>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
Message-ID: <20210219112155.GL19207@duo.ucw.cz>
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/ZYM6PqDyfNytx60"
Content-Disposition: inline
In-Reply-To: <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/ZYM6PqDyfNytx60
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >   MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
> > @@ -173,7 +182,7 @@ static int __init apu_led_init(void)
> >   	int err;
> >   	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
> > -	      dmi_match(DMI_PRODUCT_NAME, "APU"))) {
> > +	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NA=
ME, "apu1")))) {
> >   		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, en=
able CONFIG_PCENGINES_APU2\n");
> >   		return -ENODEV;
> >   	}
> >=20
>=20
> Looks good to me. But don't dare giving official ack, since I don't
> have an apu1 board for testing.
>=20
> Is Alan Mizrahi (original author) still here ?

People are usually not that careful with thier acks.

Applied, thanks.

BR,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--/ZYM6PqDyfNytx60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+fUwAKCRAw5/Bqldv6
8u3LAKCOlUj93I++Noi0Mq3LOAv0TNPwKACfTpPo0lUz8Lws0Tyni/w3+DoKVSQ=
=nK2r
-----END PGP SIGNATURE-----

--/ZYM6PqDyfNytx60--
