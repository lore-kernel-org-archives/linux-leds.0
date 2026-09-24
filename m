Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF43321C2
	for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270476; cv=none; b=p3R+W9oaqFiM1C+DNAtskXb5DhbKOSLWXvC++PeFbu3wnTX35kK/JV9Lk5ZiwN0iJ5zbaeOeWlkHXs+haBrNz7zNh9zQsUVJFTTpqQ9jxYUm6LYS+nHp4cp3JXJCjDG/cBtNXXpOc/Ia7a88cdB4rUXy/KkJgU7I32JilD4J58I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270476; c=relaxed/simple;
	bh=9hbD4jdGFmGOeRA7tQwWLcXjUa/gKCEjFcT5qzOvuaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb+uFMyXs8on51Cy/nzdI7enF2IM61x9dd+8SgZOnflym4EEaXDGv1lTaO9tnvZrhPgsTmVrcI4/NWoqY5XhlnB5vB4C079H3jOsB4km3L8mMT0sNEBJrrVKga6VVaTHYh5n0mX8u5abemB7jVWNOGl+54POPsBY8RkSAsv6VnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPfqDsq0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPfqDsq0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so42568e87.1
        for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 10:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270472; x=1790875272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqsAA1Z/+A0DL+6b0jsQ5hEaK/NGO6yJObFrFwTQ76E=;
        b=MPfqDsq0n04ySMNTV6CfKYlqAprDwK/9z9OXq0hVkJ2na+1vFt8Lp+AsxXTPgwTRQX
         7qbt9XkOfgEka/nQdE05ndV0+jgSUUwq5C/JpLcj0kobp3mAYO+YvkNrt0rXjjaDfgQ3
         +7WokfBKdb7DNjEcHQwSrSYJiw6p88ZsG4uB17DMUOHovAh8FircdkWxdvYgFP6yDKQU
         H86H1Ikcu6uQMJ7kOJlhHnphPR2x3kP1uTGv6wyZhLM4hQJhOvoAeIwV0AQRDaP5uK3g
         0eGb2KpEVbW6Zb7xzxSuA/+EzqtTd1qVyKxB7I6rPNhe6ayFAQ4Phc6ZBsShpifC1dOl
         4VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270472; x=1790875272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqsAA1Z/+A0DL+6b0jsQ5hEaK/NGO6yJObFrFwTQ76E=;
        b=iaL+DkHOD3Zx3HAY8jYWRwv8j6if0tqqTOfsuMDyowsY12IBaAXo6jaIsY69neCswC
         H+UKmc/OZuJ6j8dG6rJsR8A2OrM4JRxJsfi/13IfPL8M54pSuNhm6EzYy5exScB+uCIQ
         /koRSLr9F2OcSOCN1EA6e/t5tfeW34g00LU90IRbK9SMwcWJDC2sZh1WzqiMjrktmLT6
         jxA9VVDrx0Nsombh4c5YlHaBCmTMdjkOnWflVnKz/OnTJDwKQU7hYqEGsMVpqukDTfn7
         5NPdy6zRVhh3zv4YE6Q/op4JVEpyiLWX/IefQnECyxDOn03/fTryN3xh8nOvBpMI9uTk
         a1iQ==
X-Gm-Message-State: AFuF++lGSzTu88HVGIhUd+VXVMsxyOWcaVz7RchTRtG/iavGFXuqWr1X
	bRd121h8/SB66EeZX9iiv7/o3ztqCd9mZo6tvhpeTpCZuk1CA+8JzAAg
X-Gm-Gg: AYBFou3CvESiad5p0tT+v6LMSNOsj49ITqscM9RV+UB8H86NaOP2VL6xg2Rdbh6xY6h
	vAuEa50SjXrGBeas6swtKIG5Bw24Z1OqTeuUfy/0UNLde9v0DM9doxHMfTW6Nlbi+X/3pUT5PQv
	l22yIyKdtE+w83tJqxwGYDzsP/eOLwReB+wVy85q188eXN0EMU5aroCeT6t01gKJe/KyiOkxTe2
	WWI+O8SxMjjg7AhPdI+15nQ/FtNy9CWbHZNFZjYc2RD30RYv2IFs10yU+6htaDkvCpkOBADVjgi
	HU7MxO7CnJWKkyqOtXZlKx0V0CwuBsmKaXEcuZ1hlW1IigguMVUFjKga7O6K7oQJgcaRHw6pvhy
	grB6NU3kTeFQf67xUWADxMI0JX/HPxl1eQeLvWluCv/ueQbSHHysg/qmiNF2EjhKWkKkd8NyAf7
	M04rw8xi3xK0fiOyRLqWfSWjv8tqqaFM+e6tR6++9BJSL5Mxhr7v07qcTKxgZ9bb6m8Pw+0qp5c
	vroXyQQCfbMXCY=
X-Received: by 2002:a05:6512:104b:b0:5b0:6343:a298 with SMTP id 2adb3069b0e04-5b8df0c3615mr1164514e87.7.1790270471737;
        Thu, 24 Sep 2026 10:21:11 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859505csm1611065e87.74.2026.09.24.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:21:11 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	rillian.grant@gmail.com
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 2/2] leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes
Date: Thu, 24 Sep 2026 20:20:40 +0300
Message-ID: <20260924172040.1185688-3-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924172040.1185688-1-koreev.r@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260924172040.1185688-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/leds/flash/leds-lm3643.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
index bbe9358c9..fa0ecead5 100644
--- a/drivers/leds/flash/leds-lm3643.c
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -9,6 +9,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/led-class-flash.h>
 #include <linux/leds.h>
@@ -690,6 +691,91 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
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
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
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
+	dev_info(dev, "no LED nodes in firmware, using the DMI description\n");
+
+	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
+}
+
 static int lm3643_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -699,6 +785,12 @@ static int lm3643_probe(struct i2c_client *client)
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
2.55.0

