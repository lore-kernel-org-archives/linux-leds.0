Return-Path: <SRS0=mbue=2L=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA78C2D0C3
	for <linux-leds@archiver.kernel.org>; Sat, 21 Dec 2019 19:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F4230206B7
	for <linux-leds@archiver.kernel.org>; Sat, 21 Dec 2019 19:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfLUTC0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 21 Dec 2019 14:02:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41156 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfLUTC0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:02:26 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 046CE1C24DF; Sat, 21 Dec 2019 20:02:25 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:02:24 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, andriy.shevchenko@intel.com
Subject: Re: [PATCH 1/1] leds-as3645a: Drop fwnode reference on ignored node
Message-ID: <20191221190224.GA4199@amd>
References: <20191204075642.22070-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <20191204075642.22070-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-04 09:56:42, Sakari Ailus wrote:
> If a node is ignored, do not get a reference to it. Fix the bug by moving
> fwnode_handle_get() where a reference to an fwnode is saved for clarity.
>=20
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, applied.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+bEAACgkQMOfwapXb+vLKfQCeMfH4tJnpxGSpbOt6cGpVDOQG
WD4An2d7xtuEDTGpiBVOnvlZdpbTw2vf
=TGfK
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
