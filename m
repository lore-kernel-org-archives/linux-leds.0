Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1010EC433ED
	for <linux-leds@archiver.kernel.org>; Sun, 25 Apr 2021 22:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC906601FF
	for <linux-leds@archiver.kernel.org>; Sun, 25 Apr 2021 22:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhDYWpL (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 25 Apr 2021 18:45:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58622 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhDYWpK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 18:45:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 305641C0B77; Mon, 26 Apr 2021 00:44:29 +0200 (CEST)
Date:   Mon, 26 Apr 2021 00:44:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Juergen Borleis <jbe@pengutronix.de>
Cc:     linux-leds@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH] leds: trigger/tty: feature data direction
Message-ID: <20210425224427.GM10996@amd>
References: <20210422074702.8831-1-jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oiL9LJXJsdjS5rzq"
Content-Disposition: inline
In-Reply-To: <20210422074702.8831-1-jbe@pengutronix.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oiL9LJXJsdjS5rzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The current implementation just signals a visible feedback on all kind of
> activity on the corresponding TTY. But sometimes it is useful to see what
> kind of activity just happens. This change adds the capability to filter
> the direction of TTY's data flow. It enables a user to forward both
> directions to separate LEDs for tx and rx on demand. Default behavior is
> still both directions.

Do you have actual usecase for this?

For most protocols, you get tx and rx at the same time...

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--oiL9LJXJsdjS5rzq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF8MoACgkQMOfwapXb+vLQagCfecm9tipkZxUfaWq9gbJV3BEA
QCEAoJY51Z6aB3D/7RgRLuLPMcXp86QO
=qRXZ
-----END PGP SIGNATURE-----

--oiL9LJXJsdjS5rzq--
