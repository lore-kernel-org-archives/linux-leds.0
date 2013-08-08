From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 07/10] leds: lp5523: restore legacy device attributes
Date: Thu,  8 Aug 2013 16:59:51 +0900
Message-ID: <1375948794-6286-8-git-send-email-milo.kim@ti.com>
References: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

git commit db6eaf8388a413a5ee1b4547ce78506b9c6456b0
(leds-lp5523: use generic firmware interface) causes an application con=
flict.
This interface should be maintained for compatibility.

Restored device attributes are 'engineN_mode', 'engineN_load' and
'engineN_leds'. (N =3D 1, 2 or 3)
A 'selftest' attribute macro is replaced with LP55xx common macro.
Those are accessed when a LED pattern is run by an application.

Use a mutex in lp5523_update_program_memory()
: This function is called when an user-application writes a 'engineN_lo=
ad' file
or pattern data is loaded from generic firmware interface.
So, writing program memory should be protected.
If an error occurs on accessing this area, just it returns as -EINVAL q=
uickly.
This error code is exact same as old driver function, lp5523_do_store_l=
oad()
because it should be kept for an user-application compatibility.
Even the driver is changed, we can use the application without re-compi=
ling
sources.

Reported-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5523.c |  227 ++++++++++++++++++++++++++++++++++++=
+++++++-
 1 file changed, 223 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 29c8b19..9b8be6f6 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -74,6 +74,9 @@
 #define LP5523_PAGE_ENG1		0
 #define LP5523_PAGE_ENG2		1
 #define LP5523_PAGE_ENG3		2
+#define LP5523_PAGE_MUX1		3
+#define LP5523_PAGE_MUX2		4
+#define LP5523_PAGE_MUX3		5
=20
 /* Program Memory Operations */
 #define LP5523_MODE_ENG1_M		0x30	/* Operation Mode Register */
@@ -98,6 +101,8 @@
 #define LP5523_RUN_ENG2			0x08
 #define LP5523_RUN_ENG3			0x02
=20
+#define LED_ACTIVE(mux, led)		(!!(mux & (0x0001 << led)))
+
 enum lp5523_chip_id {
 	LP5523,
 	LP55231,
@@ -338,10 +343,20 @@ static int lp5523_update_program_memory(struct lp=
55xx_chip *chip,
 		goto err;
=20
 	update_size =3D i;
-	for (i =3D 0; i < update_size; i++)
-		lp55xx_write(chip, LP5523_REG_PROG_MEM + i, pattern[i]);
=20
-	return 0;
+	mutex_lock(&chip->lock);
+
+	for (i =3D 0; i < update_size; i++) {
+		ret =3D lp55xx_write(chip, LP5523_REG_PROG_MEM + i, pattern[i]);
+		if (ret) {
+			mutex_unlock(&chip->lock);
+			return -EINVAL;
+		}
+	}
+
+	mutex_unlock(&chip->lock);
+
+	return size;
=20
 err:
 	dev_err(&chip->cl->dev, "wrong pattern format\n");
@@ -368,6 +383,192 @@ static void lp5523_firmware_loaded(struct lp55xx_=
chip *chip)
 	lp5523_update_program_memory(chip, fw->data, fw->size);
 }
=20
+static ssize_t show_engine_mode(struct device *dev,
+				struct device_attribute *attr,
+				char *buf, int nr)
+{
+	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip =3D led->chip;
+	enum lp55xx_engine_mode mode =3D chip->engines[nr - 1].mode;
+
+	switch (mode) {
+	case LP55XX_ENGINE_RUN:
+		return sprintf(buf, "run\n");
+	case LP55XX_ENGINE_LOAD:
+		return sprintf(buf, "load\n");
+	case LP55XX_ENGINE_DISABLED:
+	default:
+		return sprintf(buf, "disabled\n");
+	}
+}
+show_mode(1)
+show_mode(2)
+show_mode(3)
+
+static ssize_t store_engine_mode(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip =3D led->chip;
+	struct lp55xx_engine *engine =3D &chip->engines[nr - 1];
+
+	mutex_lock(&chip->lock);
+
+	chip->engine_idx =3D nr;
+
+	if (!strncmp(buf, "run", 3)) {
+		lp5523_run_engine(chip, true);
+		engine->mode =3D LP55XX_ENGINE_RUN;
+	} else if (!strncmp(buf, "load", 4)) {
+		lp5523_stop_engine(chip);
+		lp5523_load_engine(chip);
+		engine->mode =3D LP55XX_ENGINE_LOAD;
+	} else if (!strncmp(buf, "disabled", 8)) {
+		lp5523_stop_engine(chip);
+		engine->mode =3D LP55XX_ENGINE_DISABLED;
+	}
+
+	mutex_unlock(&chip->lock);
+
+	return len;
+}
+store_mode(1)
+store_mode(2)
+store_mode(3)
+
+static int lp5523_mux_parse(const char *buf, u16 *mux, size_t len)
+{
+	u16 tmp_mux =3D 0;
+	int i;
+
+	len =3D min_t(int, len, LP5523_MAX_LEDS);
+
+	for (i =3D 0; i < len; i++) {
+		switch (buf[i]) {
+		case '1':
+			tmp_mux |=3D (1 << i);
+			break;
+		case '0':
+			break;
+		case '\n':
+			i =3D len;
+			break;
+		default:
+			return -1;
+		}
+	}
+	*mux =3D tmp_mux;
+
+	return 0;
+}
+
+static void lp5523_mux_to_array(u16 led_mux, char *array)
+{
+	int i, pos =3D 0;
+	for (i =3D 0; i < LP5523_MAX_LEDS; i++)
+		pos +=3D sprintf(array + pos, "%x", LED_ACTIVE(led_mux, i));
+
+	array[pos] =3D '\0';
+}
+
+static ssize_t show_engine_leds(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf, int nr)
+{
+	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip =3D led->chip;
+	char mux[LP5523_MAX_LEDS + 1];
+
+	lp5523_mux_to_array(chip->engines[nr - 1].led_mux, mux);
+
+	return sprintf(buf, "%s\n", mux);
+}
+show_leds(1)
+show_leds(2)
+show_leds(3)
+
+static int lp5523_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
+{
+	struct lp55xx_engine *engine =3D &chip->engines[nr - 1];
+	int ret;
+	u8 mux_page[] =3D {
+		[LP55XX_ENGINE_1] =3D LP5523_PAGE_MUX1,
+		[LP55XX_ENGINE_2] =3D LP5523_PAGE_MUX2,
+		[LP55XX_ENGINE_3] =3D LP5523_PAGE_MUX3,
+	};
+
+	lp5523_load_engine(chip);
+
+	ret =3D lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, mux_page[nr]);
+	if (ret)
+		return ret;
+
+	ret =3D lp55xx_write(chip, LP5523_REG_PROG_MEM , (u8)(mux >> 8));
+	if (ret)
+		return ret;
+
+	ret =3D lp55xx_write(chip, LP5523_REG_PROG_MEM + 1, (u8)(mux));
+	if (ret)
+		return ret;
+
+	engine->led_mux =3D mux;
+	return 0;
+}
+
+static ssize_t store_engine_leds(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip =3D led->chip;
+	struct lp55xx_engine *engine =3D &chip->engines[nr - 1];
+	u16 mux =3D 0;
+	ssize_t ret;
+
+	if (lp5523_mux_parse(buf, &mux, len))
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+
+	chip->engine_idx =3D nr;
+	ret =3D -EINVAL;
+
+	if (engine->mode !=3D LP55XX_ENGINE_LOAD)
+		goto leave;
+
+	if (lp5523_load_mux(chip, mux, nr))
+		goto leave;
+
+	ret =3D len;
+leave:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+store_leds(1)
+store_leds(2)
+store_leds(3)
+
+static ssize_t store_engine_load(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip =3D led->chip;
+
+	mutex_lock(&chip->lock);
+
+	chip->engine_idx =3D nr;
+	lp5523_load_engine_and_select_page(chip);
+
+	mutex_unlock(&chip->lock);
+
+	return lp5523_update_program_memory(chip, buf, len);
+}
+store_load(1)
+store_load(2)
+store_load(3)
+
 static ssize_t lp5523_selftest(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
@@ -467,9 +668,27 @@ static void lp5523_led_brightness_work(struct work=
_struct *work)
 	mutex_unlock(&chip->lock);
 }
=20
-static DEVICE_ATTR(selftest, S_IRUGO, lp5523_selftest, NULL);
+static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engin=
e1_mode);
+static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engin=
e2_mode);
+static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engin=
e3_mode);
+static LP55XX_DEV_ATTR_RW(engine1_leds, show_engine1_leds, store_engin=
e1_leds);
+static LP55XX_DEV_ATTR_RW(engine2_leds, show_engine2_leds, store_engin=
e2_leds);
+static LP55XX_DEV_ATTR_RW(engine3_leds, show_engine3_leds, store_engin=
e3_leds);
+static LP55XX_DEV_ATTR_WO(engine1_load, store_engine1_load);
+static LP55XX_DEV_ATTR_WO(engine2_load, store_engine2_load);
+static LP55XX_DEV_ATTR_WO(engine3_load, store_engine3_load);
+static LP55XX_DEV_ATTR_RO(selftest, lp5523_selftest);
=20
 static struct attribute *lp5523_attributes[] =3D {
+	&dev_attr_engine1_mode.attr,
+	&dev_attr_engine2_mode.attr,
+	&dev_attr_engine3_mode.attr,
+	&dev_attr_engine1_load.attr,
+	&dev_attr_engine2_load.attr,
+	&dev_attr_engine3_load.attr,
+	&dev_attr_engine1_leds.attr,
+	&dev_attr_engine2_leds.attr,
+	&dev_attr_engine3_leds.attr,
 	&dev_attr_selftest.attr,
 	NULL,
 };
--=20
1.7.9.5
