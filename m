From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/5] leds: leds-mc13783: Add MC34708 LED support
Date: Sat, 14 Dec 2013 15:00:47 +0400
Message-ID: <1387018850-6974-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fallback6.mail.ru ([94.100.176.134]:34150 "EHLO
	fallback6.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126Ab3LNLF5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 14 Dec 2013 06:05:57 -0500
Received: from smtp40.i.mail.ru (smtp40.i.mail.ru [94.100.177.100])
	by fallback6.mail.ru (mPOP.Fallback_MX) with ESMTP id 78AAD28E022F
	for <linux-leds@vger.kernel.org>; Sat, 14 Dec 2013 15:05:55 +0400 (MSK)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Philippe Retornaz <philippe.retornaz@epfl.ch>, Alexander Shiyan <shc_work@mail.ru>

This patch adds support for two LEDs on MC34708 PMIC.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/leds/Kconfig        |  2 +-
 drivers/leds/leds-mc13783.c | 98 ++++++++++++++++++++++---------------=
--------
 include/linux/mfd/mc13xxx.h |  6 +++
 3 files changed, 55 insertions(+), 51 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e3ca59..9c719fd 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -413,7 +413,7 @@ config LEDS_MC13783
 	depends on MFD_MC13XXX
 	help
 	  This option enable support for on-chip LED drivers found
-	  on Freescale Semiconductor MC13783/MC13892 PMIC.
+	  on Freescale Semiconductor MC13783/MC13892/MC34708 PMIC.
=20
 config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index ca87a1b..e61bdb5 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -1,5 +1,5 @@
 /*
- * LEDs driver for Freescale MC13783/MC13892
+ * LEDs driver for Freescale MC13783/MC13892/MC34708
  *
  * Copyright (C) 2010 Philippe R=C3=A9tornaz
  *
@@ -23,23 +23,23 @@
 #include <linux/workqueue.h>
 #include <linux/mfd/mc13xxx.h>
=20
-#define MC13XXX_REG_LED_CONTROL(x)	(51 + (x))
-
 struct mc13xxx_led_devtype {
 	int	led_min;
 	int	led_max;
 	int	num_regs;
+	u32	ledctrl_base;
 };
=20
 struct mc13xxx_led {
 	struct led_classdev	cdev;
 	struct work_struct	work;
-	struct mc13xxx		*master;
 	enum led_brightness	new_brightness;
 	int			id;
+	struct mc13xxx_leds	*leds;
 };
=20
 struct mc13xxx_leds {
+	struct mc13xxx			*master;
 	struct mc13xxx_led_devtype	*devtype;
 	int				num_leds;
 	struct mc13xxx_led		led[0];
@@ -48,24 +48,15 @@ struct mc13xxx_leds {
 static void mc13xxx_led_work(struct work_struct *work)
 {
 	struct mc13xxx_led *led =3D container_of(work, struct mc13xxx_led, wo=
rk);
-	int reg, mask, value, bank, off, shift;
+	struct mc13xxx_leds *leds =3D led->leds;
+	unsigned int reg, mask, value, bank, off, shift;
=20
 	switch (led->id) {
 	case MC13783_LED_MD:
-		reg =3D MC13XXX_REG_LED_CONTROL(2);
-		shift =3D 9;
-		mask =3D 0x0f;
-		value =3D led->new_brightness >> 4;
-		break;
 	case MC13783_LED_AD:
-		reg =3D MC13XXX_REG_LED_CONTROL(2);
-		shift =3D 13;
-		mask =3D 0x0f;
-		value =3D led->new_brightness >> 4;
-		break;
 	case MC13783_LED_KP:
-		reg =3D MC13XXX_REG_LED_CONTROL(2);
-		shift =3D 17;
+		reg =3D 2;
+		shift =3D 9 + (led->id - MC13783_LED_MD) * 4;
 		mask =3D 0x0f;
 		value =3D led->new_brightness >> 4;
 		break;
@@ -80,26 +71,16 @@ static void mc13xxx_led_work(struct work_struct *wo=
rk)
 	case MC13783_LED_B3:
 		off =3D led->id - MC13783_LED_R1;
 		bank =3D off / 3;
-		reg =3D MC13XXX_REG_LED_CONTROL(3) + bank;
+		reg =3D 3 + bank;
 		shift =3D (off - bank * 3) * 5 + 6;
 		value =3D led->new_brightness >> 3;
 		mask =3D 0x1f;
 		break;
 	case MC13892_LED_MD:
-		reg =3D MC13XXX_REG_LED_CONTROL(0);
-		shift =3D 3;
-		mask =3D 0x3f;
-		value =3D led->new_brightness >> 2;
-		break;
 	case MC13892_LED_AD:
-		reg =3D MC13XXX_REG_LED_CONTROL(0);
-		shift =3D 15;
-		mask =3D 0x3f;
-		value =3D led->new_brightness >> 2;
-		break;
 	case MC13892_LED_KP:
-		reg =3D MC13XXX_REG_LED_CONTROL(1);
-		shift =3D 3;
+		reg =3D (led->id - MC13892_LED_MD) / 2;
+		shift =3D 3 + (led->id - MC13892_LED_MD) * 12;
 		mask =3D 0x3f;
 		value =3D led->new_brightness >> 2;
 		break;
@@ -108,16 +89,24 @@ static void mc13xxx_led_work(struct work_struct *w=
ork)
 	case MC13892_LED_B:
 		off =3D led->id - MC13892_LED_R;
 		bank =3D off / 2;
-		reg =3D MC13XXX_REG_LED_CONTROL(2) + bank;
+		reg =3D 2 + bank;
 		shift =3D (off - bank * 2) * 12 + 3;
 		value =3D led->new_brightness >> 2;
 		mask =3D 0x3f;
 		break;
+	case MC34708_LED_R:
+	case MC34708_LED_G:
+		reg =3D 0;
+		shift =3D 3 + (led->id - MC34708_LED_R) * 12;
+		value =3D led->new_brightness >> 2;
+		mask =3D 0x3f;
+		break;
 	default:
 		BUG();
 	}
=20
-	mc13xxx_reg_rmw(led->master, reg, mask << shift, value << shift);
+	mc13xxx_reg_rmw(leds->master, leds->devtype->ledctrl_base + reg,
+			mask << shift, value << shift);
 }
=20
 static void mc13xxx_led_set(struct led_classdev *led_cdev,
@@ -132,16 +121,17 @@ static void mc13xxx_led_set(struct led_classdev *=
led_cdev,
=20
 static int __init mc13xxx_led_probe(struct platform_device *pdev)
 {
-	struct mc13xxx_leds_platform_data *pdata =3D dev_get_platdata(&pdev->=
dev);
-	struct mc13xxx *mcdev =3D dev_get_drvdata(pdev->dev.parent);
+	struct device *dev =3D &pdev->dev;
+	struct mc13xxx_leds_platform_data *pdata =3D dev_get_platdata(dev);
+	struct mc13xxx *mcdev =3D dev_get_drvdata(dev->parent);
 	struct mc13xxx_led_devtype *devtype =3D
 		(struct mc13xxx_led_devtype *)pdev->id_entry->driver_data;
 	struct mc13xxx_leds *leds;
 	int i, id, num_leds, ret =3D -ENODATA;
-	u32 reg, init_led =3D 0;
+	u32 init_led =3D 0;
=20
 	if (!pdata) {
-		dev_err(&pdev->dev, "Missing platform data\n");
+		dev_err(dev, "Missing platform data\n");
 		return -ENODEV;
 	}
=20
@@ -149,23 +139,23 @@ static int __init mc13xxx_led_probe(struct platfo=
rm_device *pdev)
=20
 	if ((num_leds < 1) ||
 	    (num_leds > (devtype->led_max - devtype->led_min + 1))) {
-		dev_err(&pdev->dev, "Invalid LED count %d\n", num_leds);
+		dev_err(dev, "Invalid LED count %d\n", num_leds);
 		return -EINVAL;
 	}
=20
-	leds =3D devm_kzalloc(&pdev->dev, num_leds * sizeof(struct mc13xxx_le=
d) +
+	leds =3D devm_kzalloc(dev, num_leds * sizeof(struct mc13xxx_led) +
 			    sizeof(struct mc13xxx_leds), GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
=20
 	leds->devtype =3D devtype;
 	leds->num_leds =3D num_leds;
+	leds->master =3D mcdev;
 	platform_set_drvdata(pdev, leds);
=20
 	for (i =3D 0; i < devtype->num_regs; i++) {
-		reg =3D pdata->led_control[i];
-		WARN_ON(reg >=3D (1 << 24));
-		ret =3D mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), reg);
+		ret =3D mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i,
+					pdata->led_control[i]);
 		if (ret)
 			return ret;
 	}
@@ -180,19 +170,18 @@ static int __init mc13xxx_led_probe(struct platfo=
rm_device *pdev)
 		trig =3D pdata->led[i].default_trigger;
=20
 		if ((id > devtype->led_max) || (id < devtype->led_min)) {
-			dev_err(&pdev->dev, "Invalid ID %i\n", id);
+			dev_err(dev, "Invalid ID %i\n", id);
 			break;
 		}
=20
 		if (init_led & (1 << id)) {
-			dev_warn(&pdev->dev,
-				 "LED %i already initialized\n", id);
+			dev_warn(dev, "LED %i already initialized\n", id);
 			break;
 		}
=20
 		init_led |=3D 1 << id;
 		leds->led[i].id =3D id;
-		leds->led[i].master =3D mcdev;
+		leds->led[i].leds =3D leds;
 		leds->led[i].cdev.name =3D name;
 		leds->led[i].cdev.default_trigger =3D trig;
 		leds->led[i].cdev.brightness_set =3D mc13xxx_led_set;
@@ -200,10 +189,9 @@ static int __init mc13xxx_led_probe(struct platfor=
m_device *pdev)
=20
 		INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
=20
-		ret =3D led_classdev_register(pdev->dev.parent,
-					    &leds->led[i].cdev);
+		ret =3D led_classdev_register(dev, &leds->led[i].cdev);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to register LED %i\n", id);
+			dev_err(dev, "Failed to register LED %i\n", id);
 			break;
 		}
 	}
@@ -219,8 +207,8 @@ static int __init mc13xxx_led_probe(struct platform=
_device *pdev)
=20
 static int mc13xxx_led_remove(struct platform_device *pdev)
 {
-	struct mc13xxx *mcdev =3D dev_get_drvdata(pdev->dev.parent);
 	struct mc13xxx_leds *leds =3D platform_get_drvdata(pdev);
+	struct mc13xxx *mcdev =3D leds->master;
 	int i;
=20
 	for (i =3D 0; i < leds->num_leds; i++) {
@@ -229,7 +217,7 @@ static int mc13xxx_led_remove(struct platform_devic=
e *pdev)
 	}
=20
 	for (i =3D 0; i < leds->devtype->num_regs; i++)
-		mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), 0);
+		mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i, 0);
=20
 	return 0;
 }
@@ -238,17 +226,27 @@ static const struct mc13xxx_led_devtype mc13783_l=
ed_devtype =3D {
 	.led_min	=3D MC13783_LED_MD,
 	.led_max	=3D MC13783_LED_B3,
 	.num_regs	=3D 6,
+	.ledctrl_base	=3D 51,
 };
=20
 static const struct mc13xxx_led_devtype mc13892_led_devtype =3D {
 	.led_min	=3D MC13892_LED_MD,
 	.led_max	=3D MC13892_LED_B,
 	.num_regs	=3D 4,
+	.ledctrl_base	=3D 51,
+};
+
+static const struct mc13xxx_led_devtype mc34708_led_devtype =3D {
+	.led_min	=3D MC34708_LED_R,
+	.led_max	=3D MC34708_LED_G,
+	.num_regs	=3D 1,
+	.ledctrl_base	=3D 54,
 };
=20
 static const struct platform_device_id mc13xxx_led_id_table[] =3D {
 	{ "mc13783-led", (kernel_ulong_t)&mc13783_led_devtype, },
 	{ "mc13892-led", (kernel_ulong_t)&mc13892_led_devtype, },
+	{ "mc34708-led", (kernel_ulong_t)&mc34708_led_devtype, },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, mc13xxx_led_id_table);
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index ac22305..f1b13b3 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -106,6 +106,9 @@ enum {
 	MC13892_LED_R,
 	MC13892_LED_G,
 	MC13892_LED_B,
+	/* MC34708 LED IDs */
+	MC34708_LED_R,
+	MC34708_LED_G,
 };
=20
 struct mc13xxx_led_platform_data {
@@ -165,6 +168,9 @@ struct mc13xxx_leds_platform_data {
 #define MC13892_LED_C2_CURRENT_G(x)	(((x) & 0x7) << 21)
 /* MC13892 LED Control 3 */
 #define MC13892_LED_C3_CURRENT_B(x)	(((x) & 0x7) << 9)
+/* MC34708 LED Control 0 */
+#define MC34708_LED_C0_CURRENT_R(x)	(((x) & 0x3) << 9)
+#define MC34708_LED_C0_CURRENT_G(x)	(((x) & 0x3) << 21)
 	u32 led_control[MAX_LED_CONTROL_REGS];
 };
=20
--=20
1.8.3.2
