From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 2/2] leds: add BCM6328 LED driver
Date: Sun,  5 Apr 2015 17:08:05 +0200
Message-ID: <1428246485-32305-3-git-send-email-noltari@gmail.com>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com>
 <1428246485-32305-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:37830 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203AbbDEPIH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 5 Apr 2015 11:08:07 -0400
Received: by wiaa2 with SMTP id a2so13252211wia.0
        for <linux-leds@vger.kernel.org>; Sun, 05 Apr 2015 08:08:06 -0700 (PDT)
In-Reply-To: <1428246485-32305-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, cooloney@gmail.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This adds support for the LED controller on Broadcom's BCM6328.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
v2: introduce changes suggested by Florian and Jonas.
 - Improve Kconfig description.
 - Remove unused imports.
 - Fix bug in blink_set so it works for multiple LEDs.
 - "brcm,link-selection" -> "brcm,link-signal-sources".
 - "brcm,activity-selection" -> "brcm,activity-signal-sources".
 - Use of_property_read_bool instead of of_get_property for booleans.
 - Add MODULE_AUTHOR strings.

 drivers/leds/Kconfig        |   8 +
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-bcm6328.c | 409 ++++++++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 418 insertions(+)
 create mode 100644 drivers/leds/leds-bcm6328.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 25b320d..64a12e4 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -42,6 +42,14 @@ config LEDS_88PM860X
 	  This option enables support for on-chip LED drivers found on Marvel=
l
 	  Semiconductor 88PM8606 PMIC.
=20
+config LEDS_BCM6328
+	tristate "LED Support for Broadcom BCM6328"
+	depends on LEDS_CLASS
+	depends on OF
+	help
+	  This option enables support for LEDs connected to the BCM6328
+	  LED HW controller accessed via MMIO registers.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index cbba921..bf69f49 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+=3D led-triggers.o
=20
 # LED Platform Drivers
 obj-$(CONFIG_LEDS_88PM860X)		+=3D leds-88pm860x.o
+obj-$(CONFIG_LEDS_BCM6328)		+=3D leds-bcm6328.o
 obj-$(CONFIG_LEDS_BD2802)		+=3D leds-bd2802.o
 obj-$(CONFIG_LEDS_LOCOMO)		+=3D leds-locomo.o
 obj-$(CONFIG_LEDS_LM3530)		+=3D leds-lm3530.o
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
new file mode 100644
index 0000000..6a63f9c
--- /dev/null
+++ b/drivers/leds/leds-bcm6328.c
@@ -0,0 +1,409 @@
+/*
+ * Driver for BCM6328 memory-mapped LEDs, based on leds-syscon.c
+ *
+ * Copyright 2015 =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
+ * Copyright 2015 Jonas Gorski <jogo@openwrt.org>
+ *
+ * This program is free software; you can redistribute  it and/or modi=
fy it
+ * under  the terms of  the GNU General  Public License as published b=
y the
+ * Free Software Foundation;  either version 2 of the  License, or (at=
 your
+ * option) any later version.
+ */
+#include <linux/io.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define REG_INIT		0x00
+#define REG_MODE_HI		0x04
+#define REG_MODE_LO		0x08
+#define REG_HWDIS		0x0c
+#define REG_STROBE		0x10
+#define REG_LNKACTSEL_HI	0x14
+#define REG_LNKACTSEL_LO	0x18
+#define REG_RBACK		0x1c
+#define REG_SERMUX		0x20
+
+#define LED_MAX_COUNT		24
+#define LED_DEF_DELAY		500
+#define LED_INTERVAL_MS		20
+
+#define LED_INTV_MASK		0x3f
+#define LED_FAST_INTV_SHIFT	6
+#define LED_FAST_INTV_MASK	(LED_INTV_MASK << LED_FAST_INTV_SHIFT)
+#define SERIAL_LED_EN		BIT(12)
+#define SERIAL_LED_MUX		BIT(13)
+#define SERIAL_LED_CLK_NPOL	BIT(14)
+#define SERIAL_LED_DATA_PPOL	BIT(15)
+#define SERIAL_LED_SHIFT_DIR	BIT(16)
+#define LED_SHIFT_TEST		BIT(30)
+#define LED_TEST		BIT(31)
+
+#define LED_MODE_MASK		3
+#define LED_MODE_OFF		0
+#define LED_MODE_FAST		1
+#define LED_MODE_BLINK		2
+#define LED_MODE_ON		3
+#define LED_SHIFT(X)		((X) << 1)
+
+/**
+ * struct bcm6328_led - state container for bcm6328 based LEDs
+ * @cdev: LED class device for this LED
+ * @mem: memory resource
+ * @lock: memory lock
+ * @pin: LED pin number
+ * @blink_leds: blinking LEDs
+ * @blink_del: blinking delay
+ * @active_low: LED is active low
+ */
+struct bcm6328_led {
+	struct led_classdev cdev;
+	void __iomem *mem;
+	spinlock_t *lock;
+	unsigned long pin;
+	unsigned long *blink_leds;
+	unsigned long *blink_del;
+	bool active_low;
+};
+
+static void bcm6328_led_write(void __iomem *reg, unsigned long data)
+{
+	iowrite32be(data, reg);
+}
+
+static unsigned long bcm6328_led_read(void __iomem *reg)
+{
+	return ioread32be(reg);
+}
+
+/**
+ * LEDMode 64 bits / 24 LEDs
+ * bits [31:0] -> LEDs 8-23
+ * bits [47:32] -> LEDs 0-7
+ * bits [63:48] -> unused
+ */
+static unsigned long bcm6328_pin2shift(unsigned long pin)
+{
+	if (pin < 8)
+		return pin + 16; /* LEDs 0-7 (bits 47:32) */
+	else
+		return pin - 8; /* LEDs 8-23 (bits 31:0) */
+}
+
+static void bcm6328_led_mode(struct bcm6328_led *led, unsigned long va=
lue)
+{
+	void __iomem *mode;
+	unsigned long val, shift;
+
+	shift =3D bcm6328_pin2shift(led->pin);
+	if (shift / 16)
+		mode =3D led->mem + REG_MODE_HI;
+	else
+		mode =3D led->mem + REG_MODE_LO;
+
+	val =3D bcm6328_led_read(mode);
+	val &=3D ~(LED_MODE_MASK << LED_SHIFT(shift % 16));
+	val |=3D (value << LED_SHIFT(shift % 16));
+	bcm6328_led_write(mode, val);
+}
+
+static void bcm6328_led_set(struct led_classdev *led_cdev,
+	enum led_brightness value)
+{
+	struct bcm6328_led *led =3D
+		container_of(led_cdev, struct bcm6328_led, cdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(led->lock, flags);
+	*(led->blink_leds) &=3D ~BIT(led->pin);
+	if ((led->active_low && value =3D=3D LED_OFF) ||
+	    (!led->active_low && value !=3D LED_OFF))
+		bcm6328_led_mode(led, LED_MODE_OFF);
+	else
+		bcm6328_led_mode(led, LED_MODE_ON);
+	spin_unlock_irqrestore(led->lock, flags);
+}
+
+static int bcm6328_blink_set(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct bcm6328_led *led =3D
+		container_of(led_cdev, struct bcm6328_led, cdev);
+	unsigned long delay, flags;
+
+	if (!*delay_on)
+		*delay_on =3D LED_DEF_DELAY;
+	if (!*delay_off)
+		*delay_off =3D LED_DEF_DELAY;
+
+	if (*delay_on !=3D *delay_off) {
+		dev_dbg(led_cdev->dev,
+			"fallback to soft blinking (delay_on !=3D delay_off)\n");
+		return -EINVAL;
+	}
+
+	delay =3D *delay_on / LED_INTERVAL_MS;
+	if (delay =3D=3D 0)
+		delay =3D 1;
+	else if (delay > LED_INTV_MASK) {
+		dev_dbg(led_cdev->dev,
+			"fallback to soft blinking (delay > %ums)\n",
+			LED_INTV_MASK * LED_INTERVAL_MS);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(led->lock, flags);
+	if (*(led->blink_leds) =3D=3D 0 ||
+	    *(led->blink_leds) =3D=3D BIT(led->pin) ||
+	    *(led->blink_del) =3D=3D delay) {
+		unsigned long val;
+
+		*(led->blink_leds) |=3D BIT(led->pin);
+		*(led->blink_del) =3D delay;
+
+		val =3D bcm6328_led_read(led->mem + REG_INIT);
+		val &=3D ~LED_FAST_INTV_MASK;
+		val |=3D (delay << LED_FAST_INTV_SHIFT);
+		bcm6328_led_write(led->mem + REG_INIT, val);
+
+		bcm6328_led_mode(led, LED_MODE_BLINK);
+
+		spin_unlock_irqrestore(led->lock, flags);
+	} else {
+		spin_unlock_irqrestore(led->lock, flags);
+		dev_dbg(led_cdev->dev,
+			"fallback to soft blinking (delay already set)\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int bcm6328_hwled(struct device *dev, struct device_node *nc, u=
32 reg,
+			 void __iomem *mem, spinlock_t *lock)
+{
+	int i, cnt;
+	unsigned long flags, val;
+
+	spin_lock_irqsave(lock, flags);
+	val =3D bcm6328_led_read(mem + REG_HWDIS);
+	val &=3D ~BIT(reg);
+	bcm6328_led_write(mem + REG_HWDIS, val);
+	spin_unlock_irqrestore(lock, flags);
+
+	/* Only LEDs 0-7 can be activity/link controlled */
+	if (reg >=3D 8)
+		return 0;
+
+	cnt =3D of_property_count_elems_of_size(nc, "brcm,link-signal-sources=
",
+					      sizeof(u32));
+	for (i =3D 0; i < cnt; i++) {
+		u32 sel;
+		void __iomem *addr;
+
+		if (reg < 4)
+			addr =3D mem + REG_LNKACTSEL_LO;
+		else
+			addr =3D mem + REG_LNKACTSEL_HI;
+
+		of_property_read_u32_index(nc, "brcm,link-signal-sources", i, &sel);
+
+		if (reg / 4 !=3D sel / 4) {
+			dev_warn(dev, "invalid link signal source\n");
+			continue;
+		}
+
+		spin_lock_irqsave(lock, flags);
+		val =3D bcm6328_led_read(addr);
+		val |=3D (BIT(reg) << (((sel % 4) * 4) + 16));
+		bcm6328_led_write(addr, val);
+		spin_unlock_irqrestore(lock, flags);
+	}
+
+	cnt =3D of_property_count_elems_of_size(nc, "brcm,activity-signal-sou=
rces",
+					      sizeof(u32));
+	for (i =3D 0; i < cnt; i++) {
+		u32 sel;
+		void __iomem *addr;
+
+		if (reg < 4)
+			addr =3D mem + REG_LNKACTSEL_LO;
+		else
+			addr =3D mem + REG_LNKACTSEL_HI;
+
+		of_property_read_u32_index(nc, "brcm,activity-signal-sources", i,
+					   &sel);
+
+		if (reg / 4 !=3D sel / 4) {
+			dev_warn(dev, "invalid activity signal source\n");
+			continue;
+		}
+
+		spin_lock_irqsave(lock, flags);
+		val =3D bcm6328_led_read(addr);
+		val |=3D (BIT(reg) << ((sel % 4) * 4));
+		bcm6328_led_write(addr, val);
+		spin_unlock_irqrestore(lock, flags);
+	}
+
+	return 0;
+}
+
+static int bcm6328_led(struct device *dev, struct device_node *nc, u32=
 reg,
+		       void __iomem *mem, spinlock_t *lock,
+		       unsigned long *blink_leds, unsigned long *blink_del)
+{
+	struct bcm6328_led *led;
+	unsigned long flags;
+	const char *state;
+	int rc;
+
+	led =3D devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->pin =3D reg;
+	led->mem =3D mem;
+	led->lock =3D lock;
+	led->blink_leds =3D blink_leds;
+	led->blink_del =3D blink_del;
+
+	if (of_property_read_bool(nc, "active-low"))
+		led->active_low =3D 1;
+
+	led->cdev.name =3D of_get_property(nc, "label", NULL) ? : nc->name;
+	led->cdev.default_trigger =3D of_get_property(nc,
+						    "linux,default-trigger",
+						    NULL);
+
+	if (!of_property_read_string(nc, "default-state", &state)) {
+		spin_lock_irqsave(lock, flags);
+		if (!strcmp(state, "on")) {
+			led->cdev.brightness =3D LED_FULL;
+			bcm6328_led_mode(led, LED_MODE_ON);
+		} else if (!strcmp(state, "keep")) {
+			void __iomem *mode;
+			unsigned long val, shift;
+
+			shift =3D bcm6328_pin2shift(led->pin);
+			if (shift / 16)
+				mode =3D mem + REG_MODE_HI;
+			else
+				mode =3D mem + REG_MODE_LO;
+
+			val =3D bcm6328_led_read(mode) >> (shift % 16);
+			val &=3D LED_MODE_MASK;
+			if (val =3D=3D LED_MODE_ON)
+				led->cdev.brightness =3D LED_FULL;
+			else {
+				led->cdev.brightness =3D LED_OFF;
+				bcm6328_led_mode(led, LED_MODE_OFF);
+			}
+		} else {
+			led->cdev.brightness =3D LED_OFF;
+			bcm6328_led_mode(led, LED_MODE_OFF);
+		}
+		spin_unlock_irqrestore(lock, flags);
+	}
+
+	led->cdev.brightness_set =3D bcm6328_led_set;
+	led->cdev.blink_set =3D bcm6328_blink_set;
+
+	rc =3D led_classdev_register(dev, &led->cdev);
+	if (rc < 0)
+		return rc;
+
+	dev_dbg(dev, "registered LED %s\n", led->cdev.name);
+
+	return 0;
+}
+
+static int bcm6328_leds_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D pdev->dev.of_node;
+	struct device_node *child;
+	struct resource *mem_r;
+	void __iomem *mem;
+	spinlock_t *lock;
+	unsigned long val, *blink_leds, *blink_del;
+
+	mem_r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem_r)
+		return -EINVAL;
+
+	mem =3D devm_ioremap_resource(dev, mem_r);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	lock =3D devm_kzalloc(dev, sizeof(*lock), GFP_KERNEL);
+	if (!lock)
+		return -ENOMEM;
+
+	blink_leds =3D devm_kzalloc(dev, sizeof(*blink_leds), GFP_KERNEL);
+	if (!blink_leds)
+		return -ENOMEM;
+
+	blink_del =3D devm_kzalloc(dev, sizeof(*blink_del), GFP_KERNEL);
+	if (!blink_del)
+		return -ENOMEM;
+
+	spin_lock_init(lock);
+
+	bcm6328_led_write(mem + REG_HWDIS, ~0);
+	bcm6328_led_write(mem + REG_LNKACTSEL_HI, 0);
+	bcm6328_led_write(mem + REG_LNKACTSEL_LO, 0);
+
+	val =3D bcm6328_led_read(mem + REG_INIT);
+	val &=3D ~SERIAL_LED_EN;
+	if (of_property_read_bool(np, "brcm,serial-leds"))
+		val |=3D SERIAL_LED_EN;
+	bcm6328_led_write(mem + REG_INIT, val);
+
+	for_each_available_child_of_node(np, child) {
+		int rc;
+		u32 reg;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg >=3D LED_MAX_COUNT) {
+			dev_err(dev, "invalid LED (>=3D %d)\n", LED_MAX_COUNT);
+			continue;
+		}
+
+		if (of_property_read_bool(child, "brcm,hardware-controlled"))
+			rc =3D bcm6328_hwled(dev, child, reg, mem, lock);
+		else
+			rc =3D bcm6328_led(dev, child, reg, mem, lock,
+					  blink_leds, blink_del);
+
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id bcm6328_leds_of_match[] =3D {
+	{ .compatible =3D "brcm,bcm6328-leds-ctrl", },
+	{ },
+};
+
+static struct platform_driver bcm6328_leds_driver =3D {
+	.probe =3D bcm6328_leds_probe,
+	.driver =3D {
+		.name =3D "leds-bcm6328",
+		.of_match_table =3D bcm6328_leds_of_match,
+	},
+};
+
+module_platform_driver(bcm6328_leds_driver);
+
+MODULE_AUTHOR("=C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>");
+MODULE_AUTHOR("Jonas Gorski <jogo@openwrt.org>");
+MODULE_DESCRIPTION("LED driver for BCM6328 controllers");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:leds-bcm6328");
--=20
1.9.1
