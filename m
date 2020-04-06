Return-Path: <SRS0=CrCS=5W=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1FFC2BA1A
	for <linux-leds@archiver.kernel.org>; Mon,  6 Apr 2020 20:42:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 770A52072A
	for <linux-leds@archiver.kernel.org>; Mon,  6 Apr 2020 20:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgDFUmJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 6 Apr 2020 16:42:09 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41454 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFUmJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Apr 2020 16:42:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8EB111C47D1; Mon,  6 Apr 2020 22:42:07 +0200 (CEST)
Date:   Mon, 6 Apr 2020 22:42:03 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Message-ID: <20200406204203.GA12611@amd.ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321153325.GD8386@duo.ucw.cz>
 <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
 <20200328132729.5e628fe6@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20200328132729.5e628fe6@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > NACK for merging this patch in this shape.
>=20
> This was only RFC, please do not merge.

Ok, dropped. But it would be good to merge some basic version, soon,
before we get even more requirements :-).

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXouUGwAKCRAw5/Bqldv6
8pZuAJ9ivNk/opMpSpngq5ToIgY87A9c5QCgj6AACRzUslj8d8mDf7QVQbfHk3Q=
=zFGN
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
