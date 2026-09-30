Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5076501F59;
	Wed, 30 Sep 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780334; cv=none; b=I9G4vvb/HTPkYgj+En8LXaQL58c8puj/GkY46l+itsLqzrdj9OugEyT6O5vSlpXCeQDOxt6GImNl0Q37K0wXa6Bsn9PZ30iwwAXlkPUnNIfvBkfJYhLvtKXmegfZ49+4BGm+9TLDx9zEsos+uSb4K1qXEtpx5gBEdpQj5ZXld98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780334; c=relaxed/simple;
	bh=z0at/RvP6oF6B8Ghu79Tz6bfUPAlNoEUCWrczXNiHBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9MHK8dzH0pDMxgpbzUWjVuczdnF+QSMqF1dqmaA/5RAzMIM7haBPk/ZzOclUnDMJ1jz++0G0YOi/1tTqk5XS53ITI/VYJaw0NDsRH1ERQnxCKmjFofFnO1DYwN9wwxKooO9BJo0osxTNxxjq4DF1apChjvp8524/5No/6KRqoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ab6miF21; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ab6miF21"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=w8Eh6MiXo9C4D1W2onvWNtikZdgYJgerl7ZWRNzofXY=; b=ab6miF21dE0O3lShomKRtu8vcB
	9R1EVAzSt2TFRGyFgVVCdzcmdeL8bz9TnF+78JSLZZZG074CpdxJPK8mNHE1swpX5ux+wmGZ/ItWj
	uD/9vsc33/0WUHmfXD9H+3/ufLm3a/MylvOMVwlEbj3/psqYNIMSvQhgdJlcU8Ymd/WP2XVN+QEr6
	bSAo0Heris/uJ/DxdKSvAY4/pPeIhNVsw1M/DRXKrleP7ATDaXt/Suke8SDPtOb4A7QNscu48ecE2
	aK/nKn/+GdFnz6MdbzTODTYKB2rd3Wt/HbRsZeAQlQG+VaddHWwdGe8K+ps41eKcvu4AuTh7gjSIp
	1Q3NNhmw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvlZ-000Iwe-1V;
	Wed, 30 Sep 2026 16:58:41 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGE-000MAX-0W;
	Wed, 30 Sep 2026 16:26:18 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v4 10/10] leds: pca995x: Add support for group brightness control
Date: Wed, 30 Sep 2026 16:25:49 +0200
Message-ID: <45706e11ea287c92de3408991a3c620472669b5d.1790684839.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28139/Wed Sep 30 08:24:18 2026)

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
 drivers/leds/leds-pca995x.c | 46 ++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index dd208ee09f352..8e2c96351d913 100644
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
@@ -189,10 +193,41 @@ static ssize_t has_errors_store(struct device *dev, struct device_attribute *att
 	return ret ?: count;
 }
 
+static ssize_t group_brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pca995x_chip *chip = dev_get_drvdata(dev);
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
+	struct pca995x_chip *chip = dev_get_drvdata(dev);
+	int ret;
+	u8 val;
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
 
@@ -274,11 +309,16 @@ static int pca995x_probe(struct i2c_client *client)
 	if (ret)
 		goto err_put_nodes;
 
-	/* Clear errors on probe */
+	/* Clear errors on probe, use GRPPWM register for group brightness control */
 	ret = regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
 	if (ret)
 		goto err_put_nodes;
 
+	/* Full group brightness */
+	ret = regmap_write(chip->regmap, chipdef->grppwm, U8_MAX);
+	if (ret)
+		goto err_put_nodes;
+
 	/* IREF Output current value for all LEDn outputs */
 	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
 	if (ret)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

