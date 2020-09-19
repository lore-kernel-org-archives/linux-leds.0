Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3901CC43463
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 09:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDAB121582
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 09:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgISJX0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 05:23:26 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40148 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgISJX0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 05:23:26 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 05:23:25 EDT
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C2DDF1C0B88; Sat, 19 Sep 2020 11:18:20 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:18:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Jaedon Shin <jaedon.shin@gmail.com>
Subject: Re: [PATCH leds v2 12/50] leds: bcm6328: cosmetic: use reverse
 christmas tree
Message-ID: <20200919091820.GA18034@amd>
References: <20200917223338.14164-1-marek.behun@nic.cz>
 <20200917223338.14164-13-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20200917223338.14164-13-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-09-18 00:33:00, Marek Beh=FAn wrote:
> Only a cosmetic change: use reverse christmas tree variables
> declaration.

Yeah. Don't do that. Code changes for no reason.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9lzNwACgkQMOfwapXb+vLJvACcD0vLQD6i6rq1yLChubBfrCj+
9XgAn39SLCKSUnzregAPCR/15/5OW9YD
=J83J
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
