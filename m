From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 2/3] leds: lp5521/5523: Remove duplicate mutex
Date: Thu, 21 Nov 2013 15:14:20 +0900
Message-ID: <1385014460-6443-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:40050 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752054Ab3KUGO3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 Nov 2013 01:14:29 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Milo Kim <milo.kim@ti.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

It can be a problem when a pattern is loaded via the firmware interface=
=2E
LP55xx common driver has already locked the mutex in 'lp55xx_firmware_l=
oaded()'.
So it should be deleted.

Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5521.c |    4 ----
 drivers/leds/leds-lp5523.c |    4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 26f89ac..4c45ed9 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -258,8 +258,6 @@ static int lp5521_update_program_memory(struct lp55=
xx_chip *chip,
 	if (i % 2)
 		goto err;
=20
-	mutex_lock(&chip->lock);
-
 	for (i =3D 0; i < LP5521_PROGRAM_LENGTH; i++) {
 		ret =3D lp55xx_write(chip, addr[idx] + i, pattern[i]);
 		if (ret) {
@@ -268,8 +266,6 @@ static int lp5521_update_program_memory(struct lp55=
xx_chip *chip,
 		}
 	}
=20
-	mutex_unlock(&chip->lock);
-
 	return size;
=20
 err:
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 2ce1723..7a3b369 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -351,8 +351,6 @@ static int lp5523_update_program_memory(struct lp55=
xx_chip *chip,
 	if (i % 2)
 		goto err;
=20
-	mutex_lock(&chip->lock);
-
 	for (i =3D 0; i < LP5523_PROGRAM_LENGTH; i++) {
 		ret =3D lp55xx_write(chip, LP5523_REG_PROG_MEM + i, pattern[i]);
 		if (ret) {
@@ -361,8 +359,6 @@ static int lp5523_update_program_memory(struct lp55=
xx_chip *chip,
 		}
 	}
=20
-	mutex_unlock(&chip->lock);
-
 	return size;
=20
 err:
--=20
1.7.9.5
