From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2] leds: lp5521/5523: Remove duplicate mutex
Date: Tue, 3 Dec 2013 10:21:44 +0900
Message-ID: <1386033704-4117-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:50718 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752291Ab3LCBWB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 2 Dec 2013 20:22:01 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Milo Kim <milo.kim@ti.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

It can be a problem when a pattern is loaded via the firmware interface=
=2E
LP55xx common driver has already locked the mutex in 'lp55xx_firmware_l=
oaded()'.
So it should be deleted.

On the other hand, locks are required in store_engine_load()
on updating program memory.

Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5521.c |   12 ++++--------
 drivers/leds/leds-lp5523.c |   12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 26f89ac..2ec34cf 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -258,18 +258,12 @@ static int lp5521_update_program_memory(struct lp=
55xx_chip *chip,
 	if (i % 2)
 		goto err;
=20
-	mutex_lock(&chip->lock);
-
 	for (i =3D 0; i < LP5521_PROGRAM_LENGTH; i++) {
 		ret =3D lp55xx_write(chip, addr[idx] + i, pattern[i]);
-		if (ret) {
-			mutex_unlock(&chip->lock);
+		if (ret)
 			return -EINVAL;
-		}
 	}
=20
-	mutex_unlock(&chip->lock);
-
 	return size;
=20
 err:
@@ -441,15 +435,17 @@ static ssize_t store_engine_load(struct device *d=
ev,
 {
 	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip =3D led->chip;
+	int ret;
=20
 	mutex_lock(&chip->lock);
=20
 	chip->engine_idx =3D nr;
 	lp5521_load_engine(chip);
+	ret =3D lp5521_update_program_memory(chip, buf, len);
=20
 	mutex_unlock(&chip->lock);
=20
-	return lp5521_update_program_memory(chip, buf, len);
+	return ret;
 }
 store_load(1)
 store_load(2)
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 2ce1723..bf21852 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -351,18 +351,12 @@ static int lp5523_update_program_memory(struct lp=
55xx_chip *chip,
 	if (i % 2)
 		goto err;
=20
-	mutex_lock(&chip->lock);
-
 	for (i =3D 0; i < LP5523_PROGRAM_LENGTH; i++) {
 		ret =3D lp55xx_write(chip, LP5523_REG_PROG_MEM + i, pattern[i]);
-		if (ret) {
-			mutex_unlock(&chip->lock);
+		if (ret)
 			return -EINVAL;
-		}
 	}
=20
-	mutex_unlock(&chip->lock);
-
 	return size;
=20
 err:
@@ -562,15 +556,17 @@ static ssize_t store_engine_load(struct device *d=
ev,
 {
 	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip =3D led->chip;
+	int ret;
=20
 	mutex_lock(&chip->lock);
=20
 	chip->engine_idx =3D nr;
 	lp5523_load_engine_and_select_page(chip);
+	ret =3D lp5523_update_program_memory(chip, buf, len);
=20
 	mutex_unlock(&chip->lock);
=20
-	return lp5523_update_program_memory(chip, buf, len);
+	return ret;
 }
 store_load(1)
 store_load(2)
--=20
1.7.9.5
