From: Maximilian =?ISO-8859-1?Q?G=FCntner?=
	<maximilian.guentner@gmail.com>
Subject: [PATCH] leds: Added driver for the NXP PCA9685 I2C chip
Date: Mon, 14 Oct 2013 19:31:38 +0200
Message-ID: <2819232.mPNW6mO2uH@titan>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-leds <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

The NXP PCA9685 supports 16 channels/leds using a 12-bit PWM (4095
levels of brightness)
This driver supports configuration using platform_data.

Signed-off-by: Maximilian G=FCntner <maximilian.guentner@gmail.com>
---
 drivers/leds/Kconfig                       |  10 ++
 drivers/leds/Makefile                      |   1 +
 drivers/leds/leds-pca9685.c                | 219 +++++++++++++++++++++=
++++++++
 include/linux/platform_data/leds-pca9685.h |  34 +++++
 4 files changed, 264 insertions(+)
 create mode 100644 drivers/leds/leds-pca9685.c
 create mode 100644 include/linux/platform_data/leds-pca9685.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 875bbe4..98268b3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -300,6 +300,16 @@ config LEDS_PCA963X
 	  LED driver chip accessed via the I2C bus. Supported
 	  devices include PCA9633 and PCA9634
=20
+config LEDS_PCA9685
+	tristate "LED support for PCA9685 I2C chip"
+	depends on LEDS_CLASS
+	depends on I2C
+	help
+	  This option enables support for LEDs connected to the PCA9685
+	  LED driver chips accessed via the I2C bus.
+	  The PCA9685 offers 12-bit PWM (4095 levels of brightness) on
+	  16 individual channels.
+
 config LEDS_WM831X_STATUS
 	tristate "LED support for status LEDs on WM831x PMICs"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8979b0b..3cd76db 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_LEDS_OT200)		+=3D leds-ot200.o
 obj-$(CONFIG_LEDS_FSG)			+=3D leds-fsg.o
 obj-$(CONFIG_LEDS_PCA955X)		+=3D leds-pca955x.o
 obj-$(CONFIG_LEDS_PCA963X)		+=3D leds-pca963x.o
+obj-$(CONFIG_LEDS_PCA9685)		+=3D leds-pca9685.o
 obj-$(CONFIG_LEDS_DA903X)		+=3D leds-da903x.o
 obj-$(CONFIG_LEDS_DA9052)		+=3D leds-da9052.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+=3D leds-wm831x-status.o
diff --git a/drivers/leds/leds-pca9685.c b/drivers/leds/leds-pca9685.c
new file mode 100644
index 0000000..a2078bf
--- /dev/null
+++ b/drivers/leds/leds-pca9685.c
@@ -0,0 +1,219 @@
+/*
+ * Copyright 2013 Maximilian G=FCntner <maximilian.guentner@gmail.com>
+ *
+ * This file is subject to the terms and conditions of version 2 of
+ * the GNU General Public License.  See the file COPYING in the main
+ * directory of this archive for more details.
+ *
+ * Based on leds-pca963x.c driver by
+ * Peter Meerwald <p.meerwald@bct-electronic.com>
+ *
+ * Driver for the NXP PCA9685 12-Bit I2C chip.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/delay.h>
+#include <linux/ctype.h>
+#include <linux/leds.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/workqueue.h>
+#include <linux/slab.h>
+
+#include <linux/platform_data/leds-pca9685.h>
+
+/* Register Addresses */
+#define PCA9685_MODE1 0x00
+#define PCA9685_MODE2 0x01
+#define PCA9685_LED0_ON_L 0x06
+#define PCA9685_ALL_LED_ON_L 0xFA
+
+/* MODE1 Register */
+#define PCA9685_ALLCALL 0x00
+#define PCA9685_SLEEP   0x04
+#define PCA9685_AI      0x05
+
+/* MODE2 Register */
+#define PCA9685_INVRT   0x04
+#define PCA9685_OUTDRV  0x02
+
+static const struct i2c_device_id pca9685_id[] =3D {
+	{ "pca9685", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pca9685_id);
+
+struct pca9685_led {
+	struct i2c_client *client;
+	struct work_struct work;
+	u16 brightness;
+	struct led_classdev led_cdev;
+	int led_num; /* 0-15 */
+	char name[32];
+};
+
+static void pca9685_write_msg(struct i2c_client *client, u8 *buf, u8 l=
en)
+{
+	struct i2c_msg msg =3D {
+		.addr =3D client->addr,
+		.flags =3D 0x00,
+		.len =3D len,
+		.buf =3D buf
+	};
+	i2c_transfer(client->adapter, &msg, 1);
+}
+
+static void pca9685_all_off(struct i2c_client *client)
+{
+	u8 i2c_buffer[5] =3D {PCA9685_ALL_LED_ON_L, 0x00, 0x00, 0x00, 0x10};
+	pca9685_write_msg(client, i2c_buffer, 5);
+}
+
+static void pca9685_led_work(struct work_struct *work)
+{
+	struct pca9685_led *pca9685;
+	u16 brightness;
+	u8 i2c_buffer[5];
+	pca9685 =3D container_of(work, struct pca9685_led, work);
+	/*
+	 * 4095 is the maximum brightness, so we set the ON time to 0x1000
+	 * which disables the PWM generator for that LED
+	 */
+	if (pca9685->brightness =3D=3D 4095)
+		brightness =3D 4096;
+	else
+		brightness =3D pca9685->brightness;
+
+	i2c_buffer[0] =3D PCA9685_LED0_ON_L + 4 * pca9685->led_num;
+
+	if (brightness =3D=3D 4096)
+		*((u16 *)(i2c_buffer+1)) =3D cpu_to_le16(0x1000);
+	else
+		*((u16 *)(i2c_buffer+1)) =3D 0x0000;
+	if (brightness =3D=3D 0)
+		*((u16 *)(i2c_buffer+3)) =3D cpu_to_le16(0x1000);
+	else if (brightness =3D=3D 4096)
+		*((u16 *)(i2c_buffer+3)) =3D 0x0000;
+	else
+		*((u16 *)(i2c_buffer+3)) =3D cpu_to_le16(brightness);
+
+	pca9685_write_msg(pca9685->client, i2c_buffer, 5);
+}
+
+static void pca9685_led_set(struct led_classdev *led_cdev,
+		enum led_brightness value)
+{
+	struct pca9685_led *pca9685;
+	pca9685 =3D container_of(led_cdev, struct pca9685_led, led_cdev);
+	pca9685->brightness =3D value;
+
+	schedule_work(&pca9685->work);
+}
+
+static int pca9685_probe(struct i2c_client *client,
+		const struct i2c_device_id *id)
+{
+	struct pca9685_led *pca9685;
+	struct pca9685_platform_data *pdata;
+	int err;
+	u8 i;
+
+	pdata =3D dev_get_platdata(&client->dev);
+
+	if (pdata) {
+		if (pdata->leds.num_leds < 1 || pdata->leds.num_leds > 15) {
+			dev_err(&client->dev, "board info must claim 1-16 LEDs");
+			return -EINVAL;
+		}
+	}
+
+	pca9685 =3D devm_kzalloc(&client->dev, 16 * sizeof(*pca9685), GFP_KER=
NEL);
+
+	if (!pca9685)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, pca9685);
+	pca9685_all_off(client);
+
+	for (i =3D 0; i < 16; i++) {
+		pca9685[i].client =3D client;
+		pca9685[i].led_num =3D i;
+		pca9685[i].name[0] =3D '\0';
+		if (pdata && i < pdata->leds.num_leds) {
+			if (pdata->leds.leds[i].name)
+				strncpy(pca9685[i].name,
+					pdata->leds.leds[i].name,
+					sizeof(pca9685[i].name)-1);
+			if (pdata->leds.leds[i].default_trigger)
+				pca9685[i].led_cdev.default_trigger =3D
+					pdata->leds.leds[i].default_trigger;
+		}
+		if (strlen(pca9685[i].name) =3D=3D 0) {
+			/*
+			 * Write adapter and address to the name as well.
+			 * Otherwise multiple chips attached to one host would
+			 * not work.
+			 */
+			snprintf(pca9685[i].name, sizeof(pca9685[i].name),
+					"pca9685:%d:x%.2x:%d",
+					client->adapter->nr, client->addr, i);
+		}
+		pca9685[i].led_cdev.name =3D pca9685[i].name;
+		pca9685[i].led_cdev.max_brightness =3D 0xfff;
+		pca9685[i].led_cdev.brightness_set =3D pca9685_led_set;
+
+		INIT_WORK(&pca9685[i].work, pca9685_led_work);
+		err =3D led_classdev_register(&client->dev, &pca9685[i].led_cdev);
+		if (err < 0)
+			goto exit;
+	}
+	if (pdata)
+		i2c_smbus_write_byte_data(client, PCA9685_MODE2,
+			pdata->outdrv << PCA9685_OUTDRV |
+			pdata->inverted << PCA9685_INVRT);
+	else
+		i2c_smbus_write_byte_data(client, PCA9685_MODE2,
+			PCA9685_TOTEM_POLE << PCA9685_OUTDRV);
+	/* Enable Auto-Increment, enable oscillator, ALLCALL/SUBADDR disabled=
 */
+	i2c_smbus_write_byte_data(client, PCA9685_MODE1, 1 << PCA9685_AI);
+
+	return 0;
+
+exit:
+	while (i--) {
+		led_classdev_unregister(&pca9685[i].led_cdev);
+		cancel_work_sync(&pca9685[i].work);
+	}
+	return err;
+}
+
+static int pca9685_remove(struct i2c_client *client)
+{
+	struct pca9685_led *pca9685 =3D i2c_get_clientdata(client);
+	u8 i;
+
+	for (i =3D 0; i < 16; i++) {
+		led_classdev_unregister(&pca9685[i].led_cdev);
+		cancel_work_sync(&pca9685[i].work);
+	}
+	pca9685_all_off(client);
+	return 0;
+}
+
+static struct i2c_driver pca9685_driver =3D {
+	.driver =3D {
+		.name =3D "leds-pca9685",
+		.owner =3D THIS_MODULE,
+	},
+	.probe =3D pca9685_probe,
+	.remove =3D pca9685_remove,
+	.id_table =3D pca9685_id,
+};
+
+module_i2c_driver(pca9685_driver);
+
+MODULE_AUTHOR("Maximilian G=FCntner <maximilian.guentner@gmail.com>");
+MODULE_DESCRIPTION("PCA9685 LED Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/platform_data/leds-pca9685.h b/include/linux=
/platform_data/leds-pca9685.h
new file mode 100644
index 0000000..cce28b8
--- /dev/null
+++ b/include/linux/platform_data/leds-pca9685.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright 2013 Maximilian G=FCntner <maximilian.guentner@gmail.com>
+ *
+ * This file is subject to the terms and conditions of version 2 of
+ * the GNU General Public License.  See the file COPYING in the main
+ * directory of this archive for more details.
+ *
+ * Based on leds-pca963x.h by Peter Meerwald <p.meerwald@bct-electroni=
c.com>
+ *
+ * LED driver for the NXP PCA9685 PWM chip
+ *
+ */
+
+#ifndef __LINUX_PCA9685_H
+#define __LINUX_PCA9685_H
+#include <linux/leds.h>
+
+enum pca9685_outdrv {
+	PCA9685_OPEN_DRAIN,
+	PCA9685_TOTEM_POLE,
+};
+
+enum pca9685_inverted {
+	PCA9685_NOT_INVERTED,
+	PCA9685_INVERTED,
+};
+
+struct pca9685_platform_data {
+	struct led_platform_data leds;
+	enum pca9685_outdrv outdrv;
+	enum pca9685_inverted inverted;
+};
+
+#endif /* __LINUX_PCA9685_H */
--=20
1.8.4
