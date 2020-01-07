Return-Path: <SRS0=7gnB=24=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27524C33C8C
	for <linux-leds@archiver.kernel.org>; Tue,  7 Jan 2020 14:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04277208C4
	for <linux-leds@archiver.kernel.org>; Tue,  7 Jan 2020 14:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgAGORo (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 7 Jan 2020 09:17:44 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:49140 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGORo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 09:17:44 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0CAC91C2453; Tue,  7 Jan 2020 15:17:43 +0100 (CET)
Date:   Tue, 7 Jan 2020 15:17:42 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Simon Guinot <simon.guinot@sequanux.org>,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: Re: [PATCH 2/2] leds: ns2: Convert to GPIO descriptors
Message-ID: <20200107141742.GA13954@duo.ucw.cz>
References: <20200107141030.74052-1-linus.walleij@linaro.org>
 <20200107141030.74052-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20200107141030.74052-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This converts the NS2 LED driver to use GPIO descriptors.
> We take care to request the GPIOs "as is" which is what
> the current driver goes to lengths to achieve, then we use
> GPIOs throughout.
>=20
> As the nodes for each LED does not have any corresponding
> device, we need to use the DT-specific accessors to get these
> GPIO descriptors from the device tree.

Ok. But what is motivation for doing this? Was this tested?

Does anyone still use leds-ns2?
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXhSTBgAKCRAw5/Bqldv6
8sO+AKCM68AdCpT/oT0AKQDS+nM6rxZDmQCfcExUXXXGMlNDybHqPL0n00821gw=
=tdhU
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
