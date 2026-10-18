Received: from out-2uec-a118.jellyfish.systems (out-2uec-a118.jellyfish.systems [63.250.43.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174740BCBB
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353397; cv=none; b=akb5c8q1WrJXLb26EMLgf8AP/zSvzFZd5ljGLPaTGujqjXW6IVn6vPN8BwPl+zgu+ZhBAqKREHTEXvM8k+igiBWgO7F0AMXKQCv+6lPMI8W2/qFljGX40/26mrQHUv6gWxA9tIvMU9pJWwTmcJGkypcDc9/DXaE42f7UqtUDHSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353397; c=relaxed/simple;
	bh=EwLwi1vy0+d8Qjb36rv/G5UkgmcFJkerenRwGDWil1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMeEQKVK7gmt+cMxzYCAVUKl9YvppoQ9NCX1V7L8S7bJfwrLaaksjAbsTaIe6UWBpqxL+CaiAk+TTETpJ1Uk0n1GM0ApdCiMr60gOSJcxgdUPAVoEq7+VvgxwPWhjHMiQPB/3YASSs0/YLglJkdKoQpKncl5a/PHXQfnUMc/96Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=c3n16LqQ; arc=none smtp.client-ip=63.250.43.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="c3n16LqQ"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j78Hr5Z3xz8sWQ;
	Sun, 18 Oct 2026 19:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792352634;
	bh=ODygMlVEDHZ8XOPkugE0UOt/7kwwt4imsdbKXKe2QjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c3n16LqQnnUNpFB7g0oa/x6qG8SP1l+kmYUppySR0/ETHhbOB2iE5Eh0tF5i3Lakh
	 G8W3LevlyXLdD/0CH0CDbtmbva83NZAuQe9E8AVJn8QN8KJ66LI293OU3Wr7IfJ/Bn
	 PlOwzgGt5GOOw074ndD7Z0I4BFPWA8Fl1srwW0d5gbesALfHhGSs8ul3ORnMq7h9Vx
	 MJ8cFuZo8JJFDqtckfkHCPcRMx4v1nudMrxC8CrBVH/3iPwPvB+SQ95u0cdVUCwDzd
	 h9x2uSEUFIyzlSxlMDZQT1YVBpt0g1CtHxlxdbbESAEnjpL12B7GBW45fTCvuSzDnR
	 lJ2nnjP/d7k9Q==
From: Ross Cawston <ross@r-sc.ca>
To: lee@kernel.org,
	pavel@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
Date: Sun, 18 Oct 2026 12:43:38 -0700
Message-ID: <20261018194339.132-4-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018194339.132-1-ross@r-sc.ca>
References: <20261018194339.132-1-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

The RTL9300 switch drives up to four LEDs per port over its LED
interface, serial or scanned. Each normally shows a hardware function
picked by the LED set of the port, but software can take it over: one
enable bit per LED, a 3-bit mode per LED (off, on or one of six blink
rates), kept separately for copper and fibre media, and a load strobe
after which the LED controller applies the modes.

Add a driver for LEDs that boards wire to the switch without a hardware
function, such as PoE status LEDs. It takes the LEDs listed in the
device tree under software control, sets both media alike, exposes them
as LED class devices and hands them back to their hardware function
when it is removed. The register offsets come from the reg of its node,
within the switch's syscon register block.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 MAINTAINERS                      |   7 ++
 drivers/leds/Kconfig             |  13 ++
 drivers/leds/Makefile            |   1 +
 drivers/leds/leds-rtl9300-port.c | 201 +++++++++++++++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 drivers/leds/leds-rtl9300-port.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a1eb0937238..1e099a4cf05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23013,6 +23013,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
 F:	drivers/net/dsa/realtek/*
 
+REALTEK RTL9300 PORT LED DRIVER
+M:	Ross Cawston <ross@r-sc.ca>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml
+F:	drivers/leds/leds-rtl9300-port.c
+
 REALTEK SPI-NAND
 M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
 S:	Maintained
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7ec2c8d7854..d9b2afca2a6 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -676,6 +676,19 @@ config LEDS_REGULATOR
 	help
 	  This option enables support for regulator driven LEDs.
 
+config LEDS_RTL9300_PORT
+	tristate "LED support for Realtek RTL9300 switch port LEDs"
+	depends on LEDS_CLASS
+	depends on MACH_REALTEK_RTL || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  This option enables software control of the port LEDs of the
+	  Realtek RTL9300 switch, for port LEDs that have no hardware
+	  function, such as the PoE status LEDs of PoE switches.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-rtl9300-port.
+
 config LEDS_BD2606MVV
 	tristate "LED driver for BD2606MVV"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4d4b089156e..e1295303738 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_QNAP_MCU)		+= leds-qnap-mcu.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
+obj-$(CONFIG_LEDS_RTL9300_PORT)		+= leds-rtl9300-port.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_ST1202)		+= leds-st1202.o
 obj-$(CONFIG_LEDS_SUN50I_A100)		+= leds-sun50i-a100.o
diff --git a/drivers/leds/leds-rtl9300-port.c b/drivers/leds/leds-rtl9300-port.c
new file mode 100644
index 00000000000..623932a2a41
--- /dev/null
+++ b/drivers/leds/leds-rtl9300-port.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Realtek RTL9300 switch port LEDs under software control
+ *
+ * The RTL9300 drives up to four LEDs per switch port over its LED interface,
+ * serial or scanned. Each one normally shows a hardware function (link,
+ * speed, activity) chosen by the LED set of the port, but software can take
+ * it over and switch it on or off instead. Boards use that for port LEDs
+ * that have no hardware function, such as the PoE status LED of a PoE
+ * switch.
+ *
+ * Software control has a mode per LED, kept separately for copper and fibre
+ * media, and the LED controller picks the new modes up when it is told to
+ * load them. Both media are set alike here. The registers are part of the
+ * switch register block; the node's reg gives their offset in it.
+ *
+ * Copyright (C) 2026 Ross Cawston <ross@r-sc.ca>
+ */
+
+#include <linux/bits.h>
+#include <linux/leds.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+/* Offsets from reg, which is SW_LED_LOAD (0xcc48 on the RTL9301) */
+#define RTL9300_LED_SW_LOAD			0x00
+#define   RTL9300_LED_SW_LOAD_START		BIT(0)
+#define RTL9300_LED_PORT_SW_EN_CTRL(port)	(0x04 + ((port) / 8) * 4)
+#define   RTL9300_LED_PORT_SW_EN(port, led)	BIT(((port) % 8) * 4 + (led))
+#define RTL9300_LED_PORT_SW_CTRL(port)		(0x14 + (port) * 4)
+/* 3-bit mode per LED: 0 off, 7 on, copper LEDs from bit 0, fibre from 12 */
+#define   RTL9300_LED_SW_MODE(led)		((GENMASK(2, 0) | GENMASK(14, 12)) << (3 * (led)))
+
+#define RTL9300_LED_PORTS			28
+#define RTL9300_LED_PER_PORT			4
+
+struct rtl9300_port_leds {
+	struct regmap *map;
+	u32 base;
+};
+
+struct rtl9300_port_led {
+	struct led_classdev cdev;
+	struct rtl9300_port_leds *ctrl;
+	u32 port;
+	u32 led;
+};
+
+static int rtl9300_port_led_load(struct rtl9300_port_leds *ctrl)
+{
+	return regmap_write(ctrl->map, ctrl->base + RTL9300_LED_SW_LOAD,
+			    RTL9300_LED_SW_LOAD_START);
+}
+
+static int rtl9300_port_led_set(struct led_classdev *cdev,
+				enum led_brightness brightness)
+{
+	struct rtl9300_port_led *pled = container_of(cdev, struct rtl9300_port_led, cdev);
+	struct rtl9300_port_leds *ctrl = pled->ctrl;
+	u32 mask = RTL9300_LED_SW_MODE(pled->led);
+	int ret;
+
+	ret = regmap_update_bits(ctrl->map, ctrl->base + RTL9300_LED_PORT_SW_CTRL(pled->port),
+				 mask, brightness ? mask : 0);
+	if (ret)
+		return ret;
+
+	return rtl9300_port_led_load(ctrl);
+}
+
+/* Hand the LED back to its hardware function */
+static void rtl9300_port_led_release(void *data)
+{
+	struct rtl9300_port_led *pled = data;
+	struct rtl9300_port_leds *ctrl = pled->ctrl;
+
+	regmap_clear_bits(ctrl->map, ctrl->base + RTL9300_LED_PORT_SW_EN_CTRL(pled->port),
+			  RTL9300_LED_PORT_SW_EN(pled->port, pled->led));
+	rtl9300_port_led_load(ctrl);
+}
+
+static int rtl9300_port_led_add(struct device *dev, struct rtl9300_port_leds *ctrl,
+				struct fwnode_handle *fwnode)
+{
+	struct led_init_data init_data = { .fwnode = fwnode };
+	struct rtl9300_port_led *pled;
+	enum led_brightness brightness;
+	u32 reg[2], sw_en, val;
+	int ret;
+
+	ret = fwnode_property_read_u32_array(fwnode, "reg", reg, ARRAY_SIZE(reg));
+	if (ret)
+		return dev_err_probe(dev, ret, "%pfw: bad reg\n", fwnode);
+	if (reg[0] >= RTL9300_LED_PORTS || reg[1] >= RTL9300_LED_PER_PORT)
+		return dev_err_probe(dev, -EINVAL, "%pfw: no LED %u of port %u\n",
+				     fwnode, reg[1], reg[0]);
+
+	pled = devm_kzalloc(dev, sizeof(*pled), GFP_KERNEL);
+	if (!pled)
+		return -ENOMEM;
+
+	pled->ctrl = ctrl;
+	pled->port = reg[0];
+	pled->led = reg[1];
+	sw_en = ctrl->base + RTL9300_LED_PORT_SW_EN_CTRL(pled->port);
+
+	switch (led_init_default_state_get(fwnode)) {
+	case LEDS_DEFSTATE_ON:
+		brightness = LED_ON;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		ret = regmap_read(ctrl->map, sw_en, &val);
+		if (ret)
+			return ret;
+		brightness = LED_OFF;
+		if (val & RTL9300_LED_PORT_SW_EN(pled->port, pled->led)) {
+			ret = regmap_read(ctrl->map,
+					  ctrl->base + RTL9300_LED_PORT_SW_CTRL(pled->port),
+					  &val);
+			if (ret)
+				return ret;
+			if (val & RTL9300_LED_SW_MODE(pled->led))
+				brightness = LED_ON;
+		}
+		break;
+	default:
+		brightness = LED_OFF;
+		break;
+	}
+
+	ret = rtl9300_port_led_set(&pled->cdev, brightness);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(ctrl->map, sw_en, RTL9300_LED_PORT_SW_EN(pled->port, pled->led));
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, rtl9300_port_led_release, pled);
+	if (ret)
+		return ret;
+
+	ret = rtl9300_port_led_load(ctrl);
+	if (ret)
+		return ret;
+
+	pled->cdev.brightness = brightness;
+	pled->cdev.max_brightness = LED_ON;
+	pled->cdev.brightness_set_blocking = rtl9300_port_led_set;
+
+	return devm_led_classdev_register_ext(dev, &pled->cdev, &init_data);
+}
+
+static int rtl9300_port_leds_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtl9300_port_leds *ctrl;
+	int ret;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->map = syscon_node_to_regmap(dev_of_node(dev->parent));
+	if (IS_ERR(ctrl->map))
+		return dev_err_probe(dev, PTR_ERR(ctrl->map), "no switch regmap\n");
+
+	ret = device_property_read_u32(dev, "reg", &ctrl->base);
+	if (ret)
+		return dev_err_probe(dev, ret, "no reg\n");
+
+	device_for_each_child_node_scoped(dev, child) {
+		ret = rtl9300_port_led_add(dev, ctrl, child);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id rtl9300_port_leds_of_match[] = {
+	{ .compatible = "realtek,rtl9301-port-leds" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rtl9300_port_leds_of_match);
+
+static struct platform_driver rtl9300_port_leds_driver = {
+	.probe = rtl9300_port_leds_probe,
+	.driver = {
+		.name = "leds-rtl9300-port",
+		.of_match_table = rtl9300_port_leds_of_match,
+	},
+};
+module_platform_driver(rtl9300_port_leds_driver);
+
+MODULE_DESCRIPTION("Realtek RTL9300 switch port LEDs under software control");
+MODULE_LICENSE("GPL");
-- 
2.55.0.windows.5

