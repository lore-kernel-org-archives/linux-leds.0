Return-Path: <SRS0=1XfA=AZ=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9E5C433E5
	for <linux-leds@archiver.kernel.org>; Tue, 14 Jul 2020 17:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FAE822464
	for <linux-leds@archiver.kernel.org>; Tue, 14 Jul 2020 17:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgGNRGC (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Jul 2020 13:06:02 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39520 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgGNRGC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Jul 2020 13:06:02 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7F86D1C0BD5; Tue, 14 Jul 2020 19:05:59 +0200 (CEST)
Date:   Tue, 14 Jul 2020 19:05:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: Re: Query on using leds-gpio driver on a. GPIO with ACTIVE_HIGH
Message-ID: <20200714170559.GA16610@amd>
References: <30E1B20C-676E-45E2-9394-643262B5D04A@linux.vnet.ibm.com>
 <7a6f99d7-efaf-8771-9272-5fb5a555823f@gmail.com>
 <C025D36C-5408-494F-BAB6-B3BAD89FBB63@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <C025D36C-5408-494F-BAB6-B3BAD89FBB63@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> <html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word;

Please don't use html on the lists.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8N5fcACgkQMOfwapXb+vIj9gCeISzFMsrS+pP6AtpkeP99cGKc
JocAn0fdRygRUJhFNGYsBGva06ZlvStx
=Djpd
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
