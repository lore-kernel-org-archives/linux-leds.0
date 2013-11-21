From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 1/3] leds: lp5521/5523: Fix multiple engine usage bug
Date: Thu, 21 Nov 2013 15:13:34 +0900
Message-ID: <1385014414-6400-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:53270 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab3KUGOA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Nov 2013 01:14:00 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Milo Kim <milo.kim@ti.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

Whenever the engine is loaded by the user-application, the operation mo=
de is
reset first. But it has a problem in case of multiple engine used becau=
se
previous engine settings are cleared.
The driver should update not whole 8bits but each engine bit by masking=
=2E

On the other hands, whole engines should be reset when the driver is un=
loaded
and on initializing the LP5523 driver.
So, new functions are used for this handling - lp5521/5523_stop_all_eng=
ines().

Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5521.c |   18 ++++++++++++++++--
 drivers/leds/leds-lp5523.c |   20 +++++++++++++++++---
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 0518835..26f89ac 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -152,12 +152,26 @@ static void lp5521_load_engine(struct lp55xx_chip=
 *chip)
 	lp5521_wait_opmode_done();
 }
=20
-static void lp5521_stop_engine(struct lp55xx_chip *chip)
+static void lp5521_stop_all_engines(struct lp55xx_chip *chip)
 {
 	lp55xx_write(chip, LP5521_REG_OP_MODE, 0);
 	lp5521_wait_opmode_done();
 }
=20
+static void lp5521_stop_engine(struct lp55xx_chip *chip)
+{
+	enum lp55xx_engine_index idx =3D chip->engine_idx;
+	u8 mask[] =3D {
+		[LP55XX_ENGINE_1] =3D LP5521_MODE_R_M,
+		[LP55XX_ENGINE_2] =3D LP5521_MODE_G_M,
+		[LP55XX_ENGINE_3] =3D LP5521_MODE_B_M,
+	};
+
+	lp55xx_update_bits(chip, LP5521_REG_OP_MODE, mask[idx], 0);
+
+	lp5521_wait_opmode_done();
+}
+
 static void lp5521_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	int ret;
@@ -568,7 +582,7 @@ static int lp5521_remove(struct i2c_client *client)
 	struct lp55xx_led *led =3D i2c_get_clientdata(client);
 	struct lp55xx_chip *chip =3D led->chip;
=20
-	lp5521_stop_engine(chip);
+	lp5521_stop_all_engines(chip);
 	lp55xx_unregister_sysfs(chip);
 	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 6b553d9..2ce1723 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -187,12 +187,26 @@ static void lp5523_load_engine_and_select_page(st=
ruct lp55xx_chip *chip)
 	lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, page_sel[idx]);
 }
=20
-static void lp5523_stop_engine(struct lp55xx_chip *chip)
+static void lp5523_stop_all_engines(struct lp55xx_chip *chip)
 {
 	lp55xx_write(chip, LP5523_REG_OP_MODE, 0);
 	lp5523_wait_opmode_done();
 }
=20
+static void lp5523_stop_engine(struct lp55xx_chip *chip)
+{
+	enum lp55xx_engine_index idx =3D chip->engine_idx;
+	u8 mask[] =3D {
+		[LP55XX_ENGINE_1] =3D LP5523_MODE_ENG1_M,
+		[LP55XX_ENGINE_2] =3D LP5523_MODE_ENG2_M,
+		[LP55XX_ENGINE_3] =3D LP5523_MODE_ENG3_M,
+	};
+
+	lp55xx_update_bits(chip, LP5523_REG_OP_MODE, mask[idx], 0);
+
+	lp5523_wait_opmode_done();
+}
+
 static void lp5523_turn_off_channels(struct lp55xx_chip *chip)
 {
 	int i;
@@ -303,7 +317,7 @@ static int lp5523_init_program_engine(struct lp55xx=
_chip *chip)
 	}
=20
 out:
-	lp5523_stop_engine(chip);
+	lp5523_stop_all_engines(chip);
 	return ret;
 }
=20
@@ -778,7 +792,7 @@ static int lp5523_remove(struct i2c_client *client)
 	struct lp55xx_led *led =3D i2c_get_clientdata(client);
 	struct lp55xx_chip *chip =3D led->chip;
=20
-	lp5523_stop_engine(chip);
+	lp5523_stop_all_engines(chip);
 	lp55xx_unregister_sysfs(chip);
 	lp55xx_unregister_leds(led, chip);
 	lp55xx_deinit_device(chip);
--=20
1.7.9.5
