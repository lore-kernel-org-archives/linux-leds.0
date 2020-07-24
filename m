Return-Path: <SRS0=2Xw6=BD=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8596DC433E1
	for <linux-leds@archiver.kernel.org>; Fri, 24 Jul 2020 10:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FDD22074A
	for <linux-leds@archiver.kernel.org>; Fri, 24 Jul 2020 10:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgGXKoS (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 24 Jul 2020 06:44:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45882 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgGXKoR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Jul 2020 06:44:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D447B1C0BD2; Fri, 24 Jul 2020 12:44:15 +0200 (CEST)
Date:   Fri, 24 Jul 2020 12:44:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH] leds: pattern trigger -- check pattern for validity
Message-ID: <20200724104415.2cpxczbb3q3zsn25@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xzxqeegm4fbtshmh"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xzxqeegm4fbtshmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Don't allow invalid brightness in the pattern.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/=
ledtrig-pattern.c
index 3abcafe46278..4d138d5317e9 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -227,10 +227,12 @@ static int pattern_trig_store_patterns_string(struct =
pattern_trig_data *data,
=20
 	while (offset < count - 1 && data->npatterns < MAX_PATTERNS) {
 		cr =3D 0;
-		ccount =3D sscanf(buf + offset, "%d %u %n",
+		ccount =3D sscanf(buf + offset, "%u %u %n",
 				&data->patterns[data->npatterns].brightness,
 				&data->patterns[data->npatterns].delta_t, &cr);
-		if (ccount !=3D 2) {
+
+		if (ccount !=3D 2 ||
+		    data->patterns[data->npatterns].brightness > data->led_cdev->max_bri=
ghtness) {
 			data->npatterns =3D 0;
 			return -EINVAL;
 		}

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xzxqeegm4fbtshmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxq7fwAKCRAw5/Bqldv6
8npdAJ9A5QWyej8qNrUOJCj1la39Gp7bVwCcC3tY7nb8wdADetmFk+ayuSKjU54=
=xK25
-----END PGP SIGNATURE-----

--xzxqeegm4fbtshmh--
