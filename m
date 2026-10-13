Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB824A06D;
	Tue, 13 Oct 2026 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897617; cv=none; b=AdVocoN3hxDGGJ0Lf9TO4FxJ5cMP338Vxfggnv6hRTX1KR4Jwwmb1W3WX4dWkId4yP7/M6tbSy2Y5OOk2lVQLvLAkMpZXuW8Cy4VJfustoF3li6QoFrbDiKWdGj+MDq32yGuc36gL23jhKd8xpLFWDn9jC7+yH2etE6PxqE9NuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897617; c=relaxed/simple;
	bh=Rt33wOIJJitTHfnH+fhCMpQqc0rq5yW2fiqzkBUedkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwTMLCaiN/MUpnf3YQ/E94gA3hFwIcJlFXh+8koQ06M7mOEm3O92/MntQZNscbHqZBwpiqb+Kncq4VkPdqCYbpjPWzS/Q0BlMir/EaDB2s4rGH4qc5NOsB/juBE/g42p3WJmMq6EbnrDrfP5DKtaSHMnznF3FKqIpe9zLdajZ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsfMkCaI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsfMkCaI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818F61F0089A;
	Tue, 13 Oct 2026 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897616;
	bh=fwUkauhzS92GDOPf9cylqjINAbl7pJNuHEZtBuz9rWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GsfMkCaIaJPCUArjtDsYhtTRquPGmUxfpfSWQAOYnsdYOsy/7ffBgwj1yOVkRUWHO
	 UdW61jv2sE5eocJt8uLMAUP/PxvW3y1lkDBIhWvRip3Dd2Gewxg2JRbTj8jxzqpkNl
	 hsJj4m8ykQXR/CcxNRC5fUE2J5IeBSUmk70+6yPVa1FzHNytYU0/n7uu6hJeDH9Lu6
	 1ygEiiohTeSvxhmR0TtqnDNsC66f+ZqbU4KMRNnv5OkuBGSQHI8l3Trbt9TsGTjPoT
	 oqBMRCIPGRQwXkveUBINrDKS2k9Rc4yXw4cuqpcsWPC7JP9r1K8JWs6fnOD8sJxEu8
	 nXCtlLqGyEsoQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 51/53] leds: Add driver for the SGI Fuel and Tezro front-panel LEDs
Date: Tue, 13 Oct 2026 15:17:11 +0200
Message-ID: <bdc0fa8089faf9ce4ff80695035173ab59357227.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SGI Fuel and Tezro front-panel LEDs are set through the L1 system
controller, whose LED request switches off every LED outside its mask,
so send the pattern of both LEDs on each change. Probe takes over the
PROM's state without writing it.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/leds/Kconfig     |  12 ++++
 drivers/leds/Makefile    |   1 +
 drivers/leds/leds-ip35.c | 144 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/leds/leds-ip35.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d3182236be..9ca75364264b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1035,6 +1035,18 @@ config LEDS_IP30
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-ip30.
 
+config LEDS_IP35
+	tristate "LED support for SGI Fuel and Tezro"
+	depends on LEDS_CLASS
+	depends on SGI_IP27
+	help
+	  This option enables support for the red and white front-panel
+	  LEDs of SGI Fuel and Tezro workstations, which the L1 system
+	  controller drives.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-ip35.
+
 config LEDS_ACER_A500
 	tristate "Power button LED support for Acer Iconia Tab A500"
 	depends on LEDS_CLASS && MFD_ACER_A500_EC
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index a68244bd50fb..b45d1d70c431 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
 obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
 obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
+obj-$(CONFIG_LEDS_IP35)			+= leds-ip35.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
diff --git a/drivers/leds/leds-ip35.c b/drivers/leds/leds-ip35.c
new file mode 100644
index 000000000000..fba918265e3d
--- /dev/null
+++ b/drivers/leds/leds-ip35.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED driver for the SGI Fuel and Tezro front panels, which the L1
+ * system controller drives.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/leds/common.h>
+
+#include <asm/sn/l1.h>
+
+struct ip35_leds;
+
+struct ip35_led {
+	struct led_classdev cdev;
+	struct ip35_leds *leds;
+	unsigned int mask;
+	unsigned int state;
+};
+
+struct ip35_leds {
+	struct mutex lock;	/* protects ->state of both LEDs */
+	struct ip35_led led[2];
+};
+
+/*
+ * ON and BLINK switch off every LED outside their mask, so each change
+ * sends the pattern of both LEDs. A steady LED next to a blinking one
+ * cannot be shown; the blinking one wins.
+ */
+static int ip35_led_update(struct ip35_led *led, unsigned int state)
+{
+	struct ip35_leds *leds = led->leds;
+	unsigned int old, on = 0, blink = 0;
+	int i, ret;
+
+	mutex_lock(&leds->lock);
+
+	old = led->state;
+	led->state = state;
+
+	for (i = 0; i < ARRAY_SIZE(leds->led); i++) {
+		if (leds->led[i].state == L1_LED_ON)
+			on |= leds->led[i].mask;
+		else if (leds->led[i].state == L1_LED_BLINK)
+			blink |= leds->led[i].mask;
+	}
+
+	if (blink)
+		ret = l1_set_leds(blink, L1_LED_BLINK);
+	else if (on)
+		ret = l1_set_leds(on, L1_LED_ON);
+	else
+		ret = l1_set_leds(L1_LED_RED | L1_LED_WHITE, L1_LED_OFF);
+
+	if (ret)
+		led->state = old;
+
+	mutex_unlock(&leds->lock);
+
+	return ret;
+}
+
+static int ip35_led_set(struct led_classdev *cdev, enum led_brightness value)
+{
+	struct ip35_led *led = container_of(cdev, struct ip35_led, cdev);
+
+	return ip35_led_update(led, value ? L1_LED_ON : L1_LED_OFF);
+}
+
+/* The L1 blinks at a fixed 2 s period of its own, whatever the delays. */
+static int ip35_led_blink_set(struct led_classdev *cdev,
+			      unsigned long *delay_on,
+			      unsigned long *delay_off)
+{
+	struct ip35_led *led = container_of(cdev, struct ip35_led, cdev);
+
+	*delay_on = 1000;
+	*delay_off = 1000;
+
+	return ip35_led_update(led, L1_LED_BLINK);
+}
+
+/* The PROM leaves the white LED lit and the red one dark. */
+static const struct {
+	const char *name;
+	unsigned int mask;
+	unsigned int state;
+} ip35_led_info[] = {
+	{ "white:" LED_FUNCTION_STATUS, L1_LED_WHITE, L1_LED_ON },
+	{ "red:" LED_FUNCTION_FAULT, L1_LED_RED, L1_LED_OFF },
+};
+
+static int ip35_leds_probe(struct platform_device *pdev)
+{
+	struct ip35_leds *leds;
+	int i, ret;
+
+	leds = devm_kzalloc(&pdev->dev, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &leds->lock);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(leds->led); i++) {
+		struct ip35_led *led = &leds->led[i];
+
+		led->leds = leds;
+		led->mask = ip35_led_info[i].mask;
+		led->state = ip35_led_info[i].state;
+		led->cdev.name = ip35_led_info[i].name;
+		led->cdev.max_brightness = 1;
+		led->cdev.brightness = led->state == L1_LED_ON;
+		led->cdev.brightness_set_blocking = ip35_led_set;
+		led->cdev.blink_set = ip35_led_blink_set;
+
+		ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver ip35_leds_driver = {
+	.probe		= ip35_leds_probe,
+	.driver		= {
+		.name	= "ip35-leds",
+	},
+};
+module_platform_driver(ip35_leds_driver);
+
+MODULE_AUTHOR("Imre Kaloz <kaloz@kernel.org>");
+MODULE_DESCRIPTION("SGI Fuel and Tezro front-panel LED driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:ip35-leds");
-- 
2.47.3

