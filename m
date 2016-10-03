From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] ledtrig-cpu.c: fix english
Date: Mon, 3 Oct 2016 10:13:14 +0200
Message-ID: <20161003081313.GA15499@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48761 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbcJCINT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 04:13:19 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Fix english spelling.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

index 22f0634..9719caf 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -42,7 +42,7 @@ static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
  * @evt: CPU event to be emitted
  *
  * Emit a CPU event on a CPU core, which will trigger a
- * binded LED to turn on or turn off.
+ * bound LED to turn on or turn off.
  */
 void ledtrig_cpu(enum cpu_led_event ledevt)
 {

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfyExkACgkQMOfwapXb+vIqoACghuIXBMVI0ukSvuh9atlh2bnA
AVMAn2icMKDv7H7M/zX8+pex33bVAHdR
=qtxM
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
