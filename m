Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9E745D913
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588640; cv=none; b=soBOJ+ZXh7IvHTiYr9qhv4cf8d9pqOzjdGbTVkYnkChrQZLUQF1/XFIC2XZ4B1wR4Od/ye6bwihDzkB4heyUQNOEHN21ceoKZbome6KMBrY0xosnY5TPLPrenw7uXB1mBhiM26uewIPfCsZpzdZl4JqwqTzMuzJnr6gORTqRk1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588640; c=relaxed/simple;
	bh=tgcXAA4/6NPNDZEDRaRyH16KJ3ddhBUJ4Dc4S1yKE4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7Mr+BmyvHOpZYbO6nudZfIPtwrMsQSKEK2gA1VI+rFWonNr+aCvQOQL4+bpITCNh68XO2xyVR0kBUUcL0O0Z/qLRK66RRYynnqznYyr+z3+zDVV5+Fk1wz3TeKBB9kArN1ZFjWLKisnpoj8Nr/csDFPAkMLYUwl6x2aBwfo6tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEugwl2F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEugwl2F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so4071335e9.0
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588634; x=1791193434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/4qbmXpGcKoeTQ+Cysj/bfz869/VjfFa7Egnw0wudk=;
        b=gEugwl2FES012ZN4lxqmPZfkGNqOuseZS4+Q12sP9CN14XLHTPZe9jtvxykR23Ii7o
         oGggDxKPufF74c/XjFY3Nt61P9mqB5pI2+NvfAkZvOReFA/7DOP3OThQJaN/9+BbwoN/
         WWXlmNPUxzVd3tc5fSAfXVH9Y4mrYSyEVJbMYq3odCfCkMEZCJZuyxrcQ+VLTPIJXrWb
         DJR9joXlNapji19HWZ4mITxFUUg3AFLUg8af2nYE8n9w7DWVKXPCT+iEWCZ4IpyaCKpy
         YlA5ghrCxTPbkJCtmj3gk5r0oieFZBFnqJK1NlmgdLA13CRfVEv8FKMPbwiy3wE1O8bW
         V1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588634; x=1791193434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/4qbmXpGcKoeTQ+Cysj/bfz869/VjfFa7Egnw0wudk=;
        b=pw/mTkImLQ3TS+JfLaUeDJwQzRA5lTkBmrGC6WUSMxalJRmZd6nLVnwUGCthG/g7i+
         qbYOM+YgrxFbeQftNHW7N4v2WYAp0SNsybXlfTHgmXM+x8anzXLSIaeVzU435v06HZrR
         EJWe5y9wnXEs+eEz3i9/CWEaHeDPOfYJfY935gvZf2NzukCK2wXntRtQPXfCozxaA7ph
         Dekwdfhz8lVyhxOueR9fH8/bUfGan0hN9gEURCJy9xTbcZwHsLub8E3xIDJu7p/s0Vil
         X15bcq+1mquenF3veXRNsJdXf4nlyLxUqDCzs102H8R+T+bK2hNe1spf/Nf6oIr0i8os
         1vAQ==
X-Forwarded-Encrypted: i=1; AKwUvBycYASqkbjtTmDUhKgmSITRNLkWO+RlZqjZDtaQuy40/KUdnv9sv+Ig8CJIIlLSHkvtdIZFpgl4RdpS@vger.kernel.org
X-Gm-Message-State: AFuF++miPufNKVdrPyO9qMPEhIrHpqvAC5pZdM2uMDMiUp/63+GGgtYJ
	kWiVjDXspO8UahSjzLMvfEvVbMVShyaGxGlRL1xTo4FANgOg9USpw7x8
X-Gm-Gg: AYBFou2uXSI740BAr7T6wRgyl4BQe74YGmpCARuv0b/bPf3ojGxrvjxTp33eJztOlgo
	qpTBohivksCZtE7O182EC4hWs2P5eqV8IlugOjbozZ4uqyQwT2m/XAPVZsGZSHH5Tufs3a+JGYh
	uT0ExrnJGOFAbpXqIanmrEhldfarv0zSQ1pvr8pGXgP7KZzq4HpZPsMaRSg1zcD8JZIu2ITEoUq
	qJ0JQDsnGuB3qEq3oRpdR84RUeT3t9c1nLwguPM0PtP2kwA1tSeP8JlnArNjQjLjMn8ZHi/WlTW
	P2IUcQxd2CASaR/kV1rHelRNac4Dou0lg/Z+gDQZ0isiZ62OsOF3VR5QhZHSIubrKV3f5uslzf8
	VtZ5gVkqkDmW8KJ0mKlZcYoLm97sFAV8ezkXnDyANeBYN32SxAIqReUZA9SboD5zIQxgSMFZLOc
	l9wDmyy2a3cf7WwbSWuhoE3bp9JYUZoVL0Svw6JT9I8+xrp7Vk3WSKsGGNzqGEJ7692wwcZAd0R
	Rwb4WGfd6TYlSWx1ZREsexDyUNeQXnROBQW88m+Spn2
X-Received: by 2002:a05:600c:190b:b0:4a0:53e:b7d6 with SMTP id 5b1f17b1804b1-4a0053eb977mr32496555e9.16.1790588634434;
        Mon, 28 Sep 2026 02:43:54 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:53 -0700 (PDT)
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
Subject: [PATCH v2 3/4] leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes
Date: Mon, 28 Sep 2026 10:42:36 +0100
Message-ID: <20260928094302.86966-4-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
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
[rillian: added reg property to match the DT binding]
Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 drivers/leds/flash/leds-lm3643.c | 93 ++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
index bbe9358c9caa..1c0de38ebcdf 100644
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
@@ -690,6 +691,92 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
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
@@ -699,6 +786,12 @@ static int lm3643_probe(struct i2c_client *client)
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

