Return-Path: <SRS0=tL0n=BC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1FDC433E0
	for <linux-leds@archiver.kernel.org>; Thu, 23 Jul 2020 19:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61A0B20737
	for <linux-leds@archiver.kernel.org>; Thu, 23 Jul 2020 19:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgGWTjN (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 23 Jul 2020 15:39:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58948 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgGWTjM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Jul 2020 15:39:12 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A75FD1C0BD7; Thu, 23 Jul 2020 21:39:08 +0200 (CEST)
Date:   Thu, 23 Jul 2020 21:39:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723193908.GA26165@amd>
References: <20200723125751.4045-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20200723125751.4045-1-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Many network devices have LEDs with green and orange color, instead of
> green and yellow.

Is it likely that we see device having both yellow and orange LEDs?

I'd simply lie and say those LEDs are yellow...

Because... there are lots of LED colours available, including pink,
various shades of blue, ...

https://www.gme.cz/led-5mm-pink-3800-60-504brc2z-p2f

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8Z51wACgkQMOfwapXb+vICeQCeOTNVualsgz4GvEnOZmpaC47J
0ygAn3PbMFFp/VWZvpLM9UKl+JDXrKXK
=SUay
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
