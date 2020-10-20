Return-Path: <SRS0=t1//=D3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81554C388F9
	for <linux-leds@archiver.kernel.org>; Tue, 20 Oct 2020 12:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D9462222F
	for <linux-leds@archiver.kernel.org>; Tue, 20 Oct 2020 12:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394268AbgJTMVw (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 20 Oct 2020 08:21:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46368 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394212AbgJTMVw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 08:21:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B8CD21C0B8D; Tue, 20 Oct 2020 14:21:49 +0200 (CEST)
Date:   Tue, 20 Oct 2020 14:21:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Message-ID: <20201020122149.GA19856@duo.ucw.cz>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> Yep. It allows hardware to provide different values if it can only
> >> blink at fixed rate.
> >=20
> > Ok, I understand how hardware might make a different choice, but in thi=
s scenario we=E2=80=99re using software to blink, so everything is handled =
by the kernel.  Also, if the interface is hardware enabled, isn=E2=80=99t t=
he path at line 177 used (which returns before the default is set)?
>=20
> Why should software blink need to select a default rate since it should b=
e able to handle all requests (even 0, 0)?
>=20

How can software blink at "0, 0"?

0, 0 simply means "use defaults", for hardware and software. Its old
API, so you'll have to live with it.

								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX47WXQAKCRAw5/Bqldv6
8r/bAJ9AX79ai5TZdFi5U3CrP3QQhvQEowCeLJyGxoEr8NHc+DbfwzTwC82igHE=
=vSVb
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
