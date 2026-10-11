Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5033BBB9
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745851; cv=none; b=ONzfbnTyh9tFDSZeRjI6r6vUvXo10oSLvg6s36VMug7AP2IPyFfm407Vos4WIrHiyC/8u80yz0EQ0DZYBhDOVw/5hVeemyT9c8AZJmaB7sMIwTMOYmrunkBDDInxIn2+p0fsnMU0+7MgFc6IzF5mwdIv1JfURBIbZl8Ys7g9z4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745851; c=relaxed/simple;
	bh=4KJPKZfhPGaNSJ584xBrXJX++esbm9JiU+zUzWkZH34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9X4yT6xQ24MYc391eUoX8UAA0JznHdYEHxWCz+JkjrIgTAY7Cn7jscjxCR4B+Y5qRvXLmE3WO9pjVNTA2YWKwc/aelwLKlDLcJnvj9kLexhqqG3rUkTKn9HjuU1BA4EkBJiM0tZb2gFKJ2Ndp5jpvQrSTQB7NxRa+CVxIGrHms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTOzWNEa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTOzWNEa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15339975e9.0
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745847; x=1792350647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhv2CnG2FYdgl8+HPdEE4WFVSjMRZar70ioMHDUdu/s=;
        b=kTOzWNEa1V5xk7RUnRdiHBxzo2nXrgjjXmrovfr8WBQhRjf75WJlFOpTwIHqCjNfSF
         i/RyK1iErkincAz9cObtYkOwuadRBRVqF8IDA8vdM0RZi3aTxpS8fyAfoNy4xSdL/RCR
         0bFA+/RXGubZfDYoLweWBcE3WQz8f2iuyYL5zPFqduNApkIRFEnmvrxZcRcjseatP72W
         Ed/YF1zzBiErzAKq8P26Hwc89HrUxxnXE6lWwRQIoTzl2f5EUJvRzWbsn4EwVQ2apbgi
         ih22xNnuGhxmN6/oRcCIPnGPk4nS0vy62b5uLfHqCu3LjwJbMjiY0zsey8iA/KYOt2gp
         aR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745847; x=1792350647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhv2CnG2FYdgl8+HPdEE4WFVSjMRZar70ioMHDUdu/s=;
        b=cL4OXp3gEeymOPVHnv+S0fHAFGYYMVF6E8VkmaIHTCt0lE0iphRHqdxNMrGE5H8C1e
         6/xGRFcBhWzv4TijMYWCr2D7jW57t8FcY7zLDrmjGxBDQwtlAZSJp05ltlre5l3owM4B
         tHJfQ07B0N1z/aTvjXosWofeGiHEWF09sbb463TgmxUnHp0RhDDX9hoz80QzU2u8d0PJ
         g3DL4Lc08gyG7DXybfEN/pHUi4nqqs08Dz6SmNIWbzJ3I1Cz8yhSZFU4s25xBbXTvRXp
         bqg5aWOMoB11DDTn1FwmFntjKACh+z1OBj6fM2HkZDLP8UNH+F/gUaaPC5hxlQ3d4Rcg
         D2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeeZ37nVErwK9SeLflLRaNbMoCMsJkF9l+NfXzb+kGrYI5EbQr4soALrvBpnuZYMTM89IuK1QwHZ96@vger.kernel.org
X-Gm-Message-State: AFq9FYKvz3hPZKnbO3wn5lMM+oIsw8F1NxXi8+FFKHQrAXhkhkl2Xxvs
	UwtKxMMeX1fXaMsZdW2Emz5StluHwybSAw+emkNWJRKfQoqQtdJs/i0F
X-Gm-Gg: AYBFou1VWRlrQmF36UJoqRlE9JHB0R+mCCSPGxH+nionGvGHAdafeDRB8Hm+CtpDRcz
	mzJ2LalI2vUZltYDrWEA7xwsXiyuTKPsuZMEtM6tnw3NR9quLh1y2/3oaNQ9ov8FLitrULO2vJ9
	EjQNbphRfYX4/P3uH70fiXPsdXNuP8uP7S/s5RXs1Rc3D6SUE/RzEKuIi/BmL5uL/C592bzYXdO
	bcK8kyfr+sUrLeEyq6ib+hHrpQyPeD2pSNVybfivVFyJV8MSns5GF+aSsgxOpnZSwSlzMbnJ4+2
	nXrtMOxC7v3glQhyFmNr0zVu6Tj7F5nDj+BLW5O98Ej+AItR78oY1HiSKRYL7KPZ1vZEcWZYJ+/
	qTDgJjcmZDuMbYXHEnPWQdnXQ41Qxit07t1vXr9VYbKRKhl+meG/EjLTfkRFfU3JcDemfH1WUbR
	6D2mq+8OYl8FIT2ba1YHEMhRurOkWoufaJhpogswxTUd26ycHn1EOkw2uH7MZMpsFad2OjKS7Xb
	+nivKXzwOC+q+IWqdwshJUdbl68Hqp7ZjU=
X-Received: by 2002:a05:600c:3111:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a18e4e14e8mr133241775e9.29.1791745847068;
        Sun, 11 Oct 2026 12:10:47 -0700 (PDT)
Received: from rillian-arch ([90.244.147.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm225209795e9.6.2026.10.11.12.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:46 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes
Date: Sun, 11 Oct 2026 20:09:45 +0100
Message-ID: <20261011191026.149338-4-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011191026.149338-1-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ruslan Koreev <koreev.r@gmail.com>

Lenovo ThinkPads enumerate the LM3643 through ACPI (HID TXNW3643)
without a _DSD, so the device has no LED child nodes and the driver
refuses to probe. On these laptops the chip drives the Windows Hello IR
flood illuminator, with both current sources feeding a single LED, and
Lenovo's Windows driver applies a fixed configuration to any LM3643 it
finds.

Add a DMI table that provides that description as a software node when
the firmware offers none: one IR flash LED on both outputs, with torch
and flash limits well below the chip's maximums. Start with the ThinkPad
X1 Carbon Gen 14.

The description is keyed by DMI instead of being applied to every
TXNW3643 because the wiring is a board property: which output feeds
which LED and how much current the LED tolerates cannot be read from the
chip, and a wrong guess overdrives an LED. The firmware cannot be fixed
from the driver side, and a per-board table is what x86-android-tablets
does for devices whose ACPI tables describe nothing either. Boards with
a _DSD are not affected, the fallback only runs when the device has no
child nodes. The limits are conservative because the LED part is not
documented; the illuminator is bright enough for face authentication at
a fraction of them.

Tested on that laptop: torch through /sys/class/leds/ir:flash lights the
ST VD55G1 IR camera's field of view, and the resulting frames are good
enough for face authentication.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
[rillian: add reg property to match the DT binding]
[rillian: change DMI activation log to dev_dbg()]
[rillian: use DMI_EXACT_MATCH]
Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 drivers/leds/flash/leds-lm3643.c | 93 ++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
index cbe66e90d8e1..18ac75df72e2 100644
--- a/drivers/leds/flash/leds-lm3643.c
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -9,6 +9,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/led-class-flash.h>
@@ -691,6 +692,92 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
 	return lm3643_register_v4l2(dev, led, fwnode);
 }
 
+/*
+ * Lenovo ThinkPads enumerate the chip through ACPI (HID TXNW3643) without a
+ * _DSD, so the LED is not described by firmware. On the boards below it drives
+ * the Windows Hello IR flood illuminator, with both current sources feeding a
+ * single LED. Describe that with a software node, with torch and flash limits
+ * (100 mA and 300 mA per output) well below the chip's maximums.
+ */
+static const u32 lm3643_ir_flood_sources[] = { 0, 1 };
+
+static const struct property_entry lm3643_ir_flood_props[] = {
+	PROPERTY_ENTRY_U32("reg", 0),
+	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
+	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
+	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_IR),
+	PROPERTY_ENTRY_U32("led-max-microamp", 200000),
+	PROPERTY_ENTRY_U32("flash-max-microamp", 600000),
+	PROPERTY_ENTRY_U32("flash-max-timeout-us", 100000),
+	{ }
+};
+
+static const struct software_node lm3643_ir_flood_root = {
+	.name = "lm3643",
+};
+
+static const struct software_node lm3643_ir_flood_led = {
+	.name = "led-0",
+	.parent = &lm3643_ir_flood_root,
+	.properties = lm3643_ir_flood_props,
+};
+
+static const struct software_node *lm3643_ir_flood_nodes[] = {
+	&lm3643_ir_flood_root,
+	&lm3643_ir_flood_led,
+	NULL
+};
+
+static const struct dmi_system_id lm3643_dmi_leds[] = {
+	{
+		/* Lenovo ThinkPad X1 Carbon Gen 14 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
+		},
+		.driver_data = (void *)lm3643_ir_flood_nodes,
+	},
+	{ }
+};
+
+static void lm3643_remove_dmi_leds(void *data)
+{
+	struct device *dev = data;
+	const struct dmi_system_id *id = dmi_first_match(lm3643_dmi_leds);
+
+	set_secondary_fwnode(dev, NULL);
+	if (id)
+		software_node_unregister_node_group(id->driver_data);
+}
+
+static int lm3643_add_dmi_leds(struct device *dev)
+{
+	const struct dmi_system_id *id;
+	const struct software_node **nodes;
+	int ret;
+
+	if (!has_acpi_companion(dev))
+		return 0;
+
+	id = dmi_first_match(lm3643_dmi_leds);
+	if (!id)
+		return 0;
+
+	nodes = id->driver_data;
+	/* The nodes are static: a second chip on the same board cannot reuse them */
+	if (software_node_fwnode(nodes[0]))
+		return dev_err_probe(dev, -EBUSY, "LED description already in use\n");
+
+	ret = software_node_register_node_group(nodes);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register the LED description\n");
+
+	set_secondary_fwnode(dev, software_node_fwnode(nodes[0]));
+	dev_dbg(dev, "no LED nodes in firmware, using the DMI description\n");
+
+	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
+}
+
 static int lm3643_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -701,6 +788,12 @@ static int lm3643_probe(struct i2c_client *client)
 	int ret;
 
 	count = device_get_child_node_count(dev);
+	if (!count) {
+		ret = lm3643_add_dmi_leds(dev);
+		if (ret)
+			return ret;
+		count = device_get_child_node_count(dev);
+	}
 	if (!count || count > LM3643_NUM_CHANNELS)
 		return dev_err_probe(dev, -EINVAL, "%u LED nodes found, expected 1 to %d\n",
 					 count, LM3643_NUM_CHANNELS);
-- 
2.56.0

