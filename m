Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E35238E13F;
	Wed,  2 Sep 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351784; cv=none; b=jh0SJd9YdiUibP3OwXWn1+3MIf2knWm+8Ib/4DSLvB7Ojj5X5gRJPfuRHxxv0DjW/P4ugmmwfPHpLe41HtkBGhc1X90OHAXI5vtr9vvLgVKEDiLXNplE3MKRuKtcyflAsS5u+hZoqrlFm8t1QS+AfJwSgT6eihxeYqTem8SBs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351784; c=relaxed/simple;
	bh=AiVZ7i2CWUu4Gk4gyDTeHJA94oyLcbgEoFbilQvTMhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOtZqT6JtXjbl/P6wGnXR20Y2Znb1sX7nhzNmNyrmlP6UsaEFUKfrpVxCyamy9z4dBBnZugW30kEbEVSqYC49jFMv3EIv97mPNU1VTYqOFERLZkz58NRELv5EFVKvQd/ACeKKuxzxgEttixByL4NRpj5ZLdsPzSg/RzNTfmMhYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OS/u8svC; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OS/u8svC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=THPtaN2btILnQkwdl/DIYuxOkWaGPvab2N0HWQyZVgY=; b=OS/u8svCHYAPVcYm69oAO9UXlO
	ft6dNyrPRTHeR7gjf6K2WOT2yol2LUfktv6DPArwtTqO3OgRjazOTL2hHMq0eYQDpt0ydhNSnH/rR
	FUz7p7PlI6D3kTw2jzJ6OGVwR+lqV1kf3kAWf7CZe2IBtUn8yWjoMkJba1kh+XSifdrA/bN7zs2Tm
	OKMA8yxgWTd7l+PFfK4SkPUPJFglBKGjxWDxvlKMO00uXdIYu6DzDDzfFcY00DZGJ3d4p7c0jk7zq
	JUska7c0tn/LS6fpW6123FAjD1wB7Mwdc2IIKnT6a57BixWWVJWpk3RuDP10hHttbSHzDpiO7ExWC
	tSV+FoYw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzY-0006yZ-2K;
	Wed, 02 Sep 2026 14:23:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzY-0004kO-0j;
	Wed, 02 Sep 2026 14:23:00 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 5/7] leds: pca995x: add sysfs files for error reporting
Date: Wed,  2 Sep 2026 14:22:13 +0200
Message-ID: <69f8e83950d4d0f7c1bf60fe2f4047cf9bee5f79.1788350618.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

The PCA995x has builtin failure detection. Provide sysfs files for
individual LED status (reporting "okay", "short-circuit" or
"open-circuit") as well as a global "has_errors" flag. has_errors is
sticky and must be cleared by writing "clear" to the sysfs file.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 103 +++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index b069b93d39a54..2232b74528a53 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -8,6 +8,7 @@
  * Copyright 2023 Marek Vasut
  */
 
+#include <linux/bits.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -23,6 +24,9 @@
 /* Auto-increment disabled. Normal mode */
 #define PCA995X_MODE1_CFG		0x00
 
+#define PCA995X_MODE2_CLRERR		BIT(4)
+#define PCA995X_MODE2_ERROR		BIT(6)
+
 /* LED select registers determine the source that drives LED outputs */
 #define PCA995X_LED_OFF			0x0
 #define PCA995X_LED_ON			0x1
@@ -36,30 +40,37 @@
 #define PCA995X_IREFALL_FULL_CFG	0xFF
 #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
 
+#define PCA995X_EFLAG_BITS		2
+#define PCA995X_EFLAG_MASK		GENMASK(1, 0)
+
 #define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
 
 struct pca995x_chipdef {
 	unsigned int num_leds;
 	u8 pwm_base;
 	u8 irefall;
+	u8 eflag_base;
 };
 
 static const struct pca995x_chipdef pca9952_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x0a,
 	.irefall	= 0x43,
+	.eflag_base	= 0x44,
 };
 
 static const struct pca995x_chipdef pca9955b_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x08,
 	.irefall	= 0x45,
+	.eflag_base	= 0x46,
 };
 
 static const struct pca995x_chipdef pca9956b_chipdef = {
 	.num_leds	= 24,
 	.pwm_base	= 0x0a,
 	.irefall	= 0x40,
+	.eflag_base	= 0x41,
 };
 
 struct pca995x_led {
@@ -111,6 +122,83 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 	}
 }
 
+static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct pca995x_led *led = ldev_to_led(led_cdev);
+	struct pca995x_chip *chip = led->chip;
+	const struct pca995x_chipdef *chipdef = chip->chipdef;
+	const char *status = "unknown";
+	unsigned int val;
+	int shift, ret;
+	u8 reg;
+
+	reg = chipdef->eflag_base + (led->led_no / PCA995X_OUTPUTS_PER_REG);
+	shift = PCA995X_EFLAG_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
+
+	ret = regmap_read(chip->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	switch ((val >> shift) & PCA995X_EFLAG_MASK) {
+	case 0:
+		status = "okay";
+		break;
+	case 1:
+		status = "short-circuit";
+		break;
+	case 2:
+		status = "open-circuit";
+	}
+
+	return sysfs_emit(buf, "%s\n", status);
+}
+
+static DEVICE_ATTR_RO(status);
+
+static struct attribute *pca995x_led_attrs[] = {
+	&dev_attr_status.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(pca995x_led);
+
+static ssize_t has_errors_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(chip->regmap, PCA995X_MODE2, &val);
+	if (ret)
+		return ret;
+
+
+	return sysfs_emit(buf, "%d\n", !!(val & PCA995X_MODE2_ERROR));
+}
+
+static ssize_t has_errors_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+	int ret;
+
+	if (strcmp(buf, "clear\n"))
+		return -EINVAL;
+
+	ret = regmap_update_bits(chip->regmap, PCA995X_MODE2,
+				 PCA995X_MODE2_CLRERR, PCA995X_MODE2_CLRERR);
+
+	return ret ?: count;
+}
+
+static DEVICE_ATTR_RW(has_errors);
+
+static struct attribute *pca995x_attrs[] = {
+	&dev_attr_has_errors.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(pca995x);
+
 static const struct regmap_config pca995x_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -173,6 +261,7 @@ static int pca995x_probe(struct i2c_client *client)
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = pca995x_brightness_set;
 		led->ldev.max_brightness = 255;
+		led->ldev.groups = pca995x_led_groups;
 	}
 
 	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
@@ -201,7 +290,18 @@ static int pca995x_probe(struct i2c_client *client)
 		return ret;
 
 	/* IREF Output current value for all LEDn outputs */
-	return regmap_write(chip->regmap, chipdef->irefall, iref);
+	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
+	if (ret)
+		return ret;
+
+	return sysfs_create_groups(&dev->kobj, pca995x_groups);
+}
+
+static void pca995x_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+
+	return sysfs_remove_groups(&dev->kobj, pca995x_groups);
 }
 
 static const struct i2c_device_id pca995x_id[] = {
@@ -226,6 +326,7 @@ static struct i2c_driver pca995x_driver = {
 		.of_match_table = pca995x_of_match,
 	},
 	.probe = pca995x_probe,
+	.remove = pca995x_remove,
 	.id_table = pca995x_id,
 };
 module_i2c_driver(pca995x_driver);
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

