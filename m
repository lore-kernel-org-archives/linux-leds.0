Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81B379989;
	Tue, 15 Sep 2026 14:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481687; cv=none; b=SMSxgEkLx3CyiAl1RxSf3ajjuXQjtAE/qpBKegO7ynIY6lNRCaFgPxCMEgDud21qxiQwemKMIRO94tV/bP0qzLBk9VjFa0HAEzdtMHlJ+ad0H4T74ugVeXQOnTZ27oAKH8zjApjaqw7tLvL4ndyiSJ+4X8CrqhFqUi2dbKoUGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481687; c=relaxed/simple;
	bh=l0cji5ecpZMG0f1vhoakcvnTBc3UVkLxjij29cnYzLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQf6YuG05WD6VnfHV0vPOcE95kXS/8tSr4r+cm3uzo+rvKaW5EVDjPHKdTq9fRD7SQB8K8KRBl1aO5X+DekoYcOsem50TLe7aHi85ZpEbyOZjfX+69ES0A9B9TPWK4P3oSuFUnS1kz8GJor+acvi6o9EXxl0RYjkuUXc2zDL7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lurelVg+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lurelVg+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hHWKTyYD3w0y6qE3Y3bi+hHgW+AhjT0Tv1QyrWR2gtE=; b=lurelVg+MisMJE/gdy9NG3XVQt
	YB8onY1WdF/9DgBIAl/8pIRQzgTefFvIbP2GYUnRRbfzc3KIEQQAtwRfXZNOajiIoo3/ct0gwyiED
	9pWgr/N8zz3GF/HmdC7nQ3PfU72GjL1lwBvCTuQp9Q5uEA3k8GOmOp2sVtqShqdBevVCxjGKX+Q3C
	K1rlntGVx/CKDKRRNW3bZ+/FgNR5qRlChZPq0NMg9fl5R1k2xyzfdiZBpV7Vj+O5k0DJMc3O/PTE7
	/Wpx7ji8/KdzWf18S/T0abGw+OjB12cSKu401kROGn2IS/wamGUnm5Wiy26/rJ86to6BWimxmmVa8
	ZhY06xnw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTK-0003ik-1n;
	Tue, 15 Sep 2026 15:45:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTJ-000FKf-2k;
	Tue, 15 Sep 2026 15:45:18 +0200
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
Subject: [PATCH v2 8/8] leds: pca995x: Add support for group brightness control
Date: Tue, 15 Sep 2026 15:43:56 +0200
Message-ID: <bb9d86b8891d58eab135038dfde70ae024f244c1.1789477502.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28124/Tue Sep 15 08:27:28 2026)

When LEDs are set to PWM mode with group control enabled, their
brightness can control using a global "group PWM" setting, modulating
the individual LEDs' brightness with a second PWM running at a different
frequency. This lowers the minimum duty cycle from 1/256 to 1/65536
(averaged over the modulated signal). Group brightness control is
particularly useful to adjust for different levels of ambient light.

For simplicity, group PWM mode is always enabled, with the reset default
of 255 as group brightness. This reduces the effective duty cycle by
1/256 at all individual brightness levels (the individual PWM signals
are modulated with the 255/256 duty cycle group PWM), which should be
imperceptible.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: Set GRPPWM register on probe

 drivers/leds/leds-pca995x.c | 46 ++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 963e453ce117d..33da3cd9cbbbf 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -35,6 +35,7 @@
 #define PCA995X_LED_OFF			0x0
 #define PCA995X_LED_ON			0x1
 #define PCA995X_LED_PWM_MODE		0x2
+#define PCA995X_LED_PWM_MODE_GRP	0x3
 #define PCA995X_LDRX_MASK		0x3
 #define PCA995X_LDRX_BITS		2
 
@@ -52,6 +53,7 @@
 struct pca995x_chipdef {
 	unsigned int num_leds;
 	u8 pwm_base;
+	u8 grppwm;
 	u8 irefall;
 	u8 eflag_base;
 };
@@ -59,6 +61,7 @@ struct pca995x_chipdef {
 static const struct pca995x_chipdef pca9952_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x0a,
+	.grppwm		= 0x08,
 	.irefall	= 0x43,
 	.eflag_base	= 0x44,
 };
@@ -66,6 +69,7 @@ static const struct pca995x_chipdef pca9952_chipdef = {
 static const struct pca995x_chipdef pca9955b_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x08,
+	.grppwm		= 0x06,
 	.irefall	= 0x45,
 	.eflag_base	= 0x46,
 };
@@ -73,6 +77,7 @@ static const struct pca995x_chipdef pca9955b_chipdef = {
 static const struct pca995x_chipdef pca9956b_chipdef = {
 	.num_leds	= 24,
 	.pwm_base	= 0x0a,
+	.grppwm		= 0x08,
 	.irefall	= 0x40,
 	.eflag_base	= 0x41,
 };
@@ -114,11 +119,10 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 
 	/*
 	 * Change LDRx configuration to individual brightness via PWM.
-	 * LED will stop blinking if it's doing so.
 	 */
 	return regmap_update_bits(chip->regmap, ledout_addr,
 				  PCA995X_LDRX_MASK << shift,
-				  PCA995X_LED_PWM_MODE << shift);
+				  PCA995X_LED_PWM_MODE_GRP << shift);
 }
 
 static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -190,10 +194,41 @@ static ssize_t has_errors_store(struct device *dev, struct device_attribute *att
 	return ret ?: count;
 }
 
+static ssize_t group_brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(chip->regmap, chip->chipdef->grppwm, &val);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t group_brightness_store(struct device *dev, struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
+	u8 val;
+	int ret;
+
+	ret = kstrtou8(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(chip->regmap, chip->chipdef->grppwm, val);
+
+	return ret ?: count;
+}
+
 static DEVICE_ATTR_RW(has_errors);
+static DEVICE_ATTR_RW(group_brightness);
 
 static struct attribute *pca995x_attrs[] = {
 	&dev_attr_has_errors.attr,
+	&dev_attr_group_brightness.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(pca995x);
@@ -288,11 +323,16 @@ static int pca995x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	/* Clear errors on probe */
+	/* Clear errors on probe, use GRPPWM register for group brightness control */
 	ret = regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
 	if (ret)
 		return ret;
 
+	/* Full group brightness */
+	ret = regmap_write(chip->regmap, chipdef->grppwm, U8_MAX);
+	if (ret)
+		return ret;
+
 	/* IREF Output current value for all LEDn outputs */
 	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
 	if (ret)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/
