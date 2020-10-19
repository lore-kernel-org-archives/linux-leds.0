Return-Path: <SRS0=Et/J=D2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8105AC433E7
	for <linux-leds@archiver.kernel.org>; Mon, 19 Oct 2020 14:06:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F7D22263
	for <linux-leds@archiver.kernel.org>; Mon, 19 Oct 2020 14:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgJSOGT (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 19 Oct 2020 10:06:19 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39148 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgJSOGT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 10:06:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7EACF1C0B76; Mon, 19 Oct 2020 16:06:17 +0200 (CEST)
Date:   Mon, 19 Oct 2020 16:06:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Message-ID: <20201019140617.GA25480@duo.ucw.cz>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We use the sysfs timer trigger of the led subsystem to control our leds (=
turn on, turn off, and blink).  While doing this we found a strange behavio=
r.  If the values of delay_on and delay_off are ever both zero, the led sub=
system will make the decision to blink at a 500ms on and 500ms off rate.
>=20
> # cd /sys/class/leds/g01
> # cat delay_on
> 0
> # cat delay_off
> 86400
> # echo 0 > delay_off
> # cat delay_on
> 500
> # cat delay_off
> 500
>=20
> drivers/led/led-core.c:184
>     /* blink with 1 Hz as default if nothing specified */
>     if (!*delay_on && !*delay_off)
>         *delay_on =3D *delay_off =3D 500;
>=20
> Is there a reason that the kernel would decide to blink at this default r=
ate instead of leaving the timer disabled?
>

Yep. It allows hardware to provide different values if it can only
blink at fixed rate.
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX42dWQAKCRAw5/Bqldv6
8q97AKDESguAhTYdIkDqGwJdRFJuAq7g0ACeIz76T+kt4gusAkKyX/he1JXp0Vc=
=mboA
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
