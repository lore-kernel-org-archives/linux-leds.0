Return-Path: <SRS0=DJpu=YB=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA37C4360C
	for <linux-leds@archiver.kernel.org>; Tue,  8 Oct 2019 18:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CEC821721
	for <linux-leds@archiver.kernel.org>; Tue,  8 Oct 2019 18:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbfJHS6i (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 8 Oct 2019 14:58:38 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51993 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbfJHS6i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 14:58:38 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 8FA3D80363; Tue,  8 Oct 2019 20:58:21 +0200 (CEST)
Date:   Tue, 8 Oct 2019 20:58:35 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        dmurphy@ti.com
Subject: [PATCH] Add my linux-leds branch to MAINTAINERS
Message-ID: <20191008185835.GA12990@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Add pointer to my git tree to MAINTAINERS. I'd like to maintain
linux-leds for-next branch for 5.5.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

---

I believe normal procedure would be you applying this to leds-fixes
tree, then sending it to with next batch Linus. I can ask for
linux-next inclusion when you apply it to your branch....

Best regards,
								Pavel


diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b..ed49fb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9183,6 +9183,7 @@ M:	Pavel Machek <pavel@ucw.cz>
 R:	Dan Murphy <dmurphy@ti.com>
 L:	linux-leds@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-le=
ds.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/
 F:	drivers/leds/

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2c3FsACgkQMOfwapXb+vLaHwCfTXYunx3wDR0/7iJVTV0wvZ74
UagAniYB1hZLxTEQsphMtdPHzij46n3U
=APX5
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
