Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5554A3D3E;
	Mon,  5 Oct 2026 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209946; cv=none; b=FNHsdQOEJa3kbChshsA19tN8ufEDllxxUB4krIHtMivzdagUfGIs7phtrwNFUKsdK8xXjldYRJG5hXvc8myPtVZuaCHfH8a7Ua/SBpPAP1TanYbJkPyQrVpowPic05Egznndaetp7kbvqcDhbNYLKHQ6X7tQCOEh6K+C43G5Xds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209946; c=relaxed/simple;
	bh=ik9WCrLErP3NkeK8pIo7BAYUs6brl++VBbQT42J/sfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STY2CcUNV4+y6Q1udabVGFjcAi4xm6+Wlg0DA51LWS+WyX0jrxftkrkzm1QNA47zuH7WPIWEzg6dxk7qkU0pEUBAHPylWfHe6ekDmASEpF6KpHoIaWlJh2zkKsKQcEaFM15bzPLqj0XDoAZWXfrZAHgz/HV9CPYf/7P5Uv6kGP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aPnkVvG6; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aPnkVvG6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jLFQgWi+S+1E736R0RaCNU6Gnrz2UI/B059uB+wafMM=; b=aPnkVvG6YvuNJieoo54vWZhY1Z
	jTog2ue0xCMh5uZ0zgdrjzY3YLN1t1urbw0V3mSj/iBhIbovrnXPqmR/xpHSEIri+iks+uS6SLnPT
	AYEu78Eu88IyGm2gcZ5y0DMraYqFICpouZ01avb5nF8IXhtRLP33iozMbjGMuQ3oqY+N7p6KA6U6G
	G9O0rVu9aqbunlx5H8Ob+mwQyjFZg+kffDBuh67oJ009zWnXImJFSnPb4u3+3dO1KimiUo7QqdsCK
	1P7EUnQMEtZdQO2CixSTAH14TFPdE/r0+wo+GmV9pjg4jDOTHs/ecQNM2e8FWSuCu2D0IgoOxQHxw
	Y6qCyPWQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDjWl-0005km-2f;
	Mon, 05 Oct 2026 16:18:51 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9J-000HEr-23;
	Mon, 05 Oct 2026 15:54:37 +0200
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
Subject: [PATCH v5 11/11] leds: pca995x: Add support for group brightness control
Date: Mon,  5 Oct 2026 15:53:35 +0200
Message-ID: <268cf89c02f166a012802cdae0c187566b903309.1791207391.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28144/Mon Oct  5 08:24:24 2026)

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
 drivers/leds/leds-pca995x.c | 57 +++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index a95193059e747..302d64d4215fa 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -32,6 +32,7 @@
 #define PCA995X_LED_OFF			0x0
 #define PCA995X_LED_ON			0x1
 #define PCA995X_LED_PWM_MODE		0x2
+#define PCA995X_LED_PWM_MODE_GRP	0x3
 #define PCA995X_LDRX_MASK		0x3
 #define PCA995X_LDRX_BITS		2
 
@@ -51,6 +52,7 @@
 struct pca995x_chipdef {
 	unsigned int num_leds;
 	u8 pwm_base;
+	u8 grppwm;
 	u8 irefall;
 	u8 eflag_base;
 	u8 mode2_cfg;
@@ -70,6 +72,7 @@ ATTRIBUTE_GROUPS(pca995x_led_error);
 static const struct pca995x_chipdef pca9952_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x0a,
+	.grppwm		= 0x08,
 	.irefall	= 0x43,
 	.eflag_base	= PCA995X_EFLAG_UNSUPPORTED,
 	/* Reset default */
@@ -79,6 +82,7 @@ static const struct pca995x_chipdef pca9952_chipdef = {
 static const struct pca995x_chipdef pca9955b_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x08,
+	.grppwm		= 0x06,
 	.irefall	= 0x45,
 	.eflag_base	= 0x46,
 	/* Reset default + clear errors on probe */
@@ -89,6 +93,7 @@ static const struct pca995x_chipdef pca9955b_chipdef = {
 static const struct pca995x_chipdef pca9956b_chipdef = {
 	.num_leds	= 24,
 	.pwm_base	= 0x0a,
+	.grppwm		= 0x08,
 	.irefall	= 0x40,
 	.eflag_base	= 0x41,
 	/* Reset default + clear errors on probe */
@@ -133,13 +138,52 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 
 	/*
 	 * Change LDRx configuration to individual brightness via PWM.
-	 * LED will stop blinking if it's doing so.
 	 */
 	return regmap_update_bits(chip->regmap, ledout_addr,
 				  PCA995X_LDRX_MASK << shift,
-				  PCA995X_LED_PWM_MODE << shift);
+				  PCA995X_LED_PWM_MODE_GRP << shift);
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
+static DEVICE_ATTR_RW(group_brightness);
+
+static struct attribute *pca995x_attrs[] = {
+	&dev_attr_group_brightness.attr,
+	NULL,
+};
+
+static const struct attribute_group pca995x_group = {
+	.attrs = pca995x_attrs,
+};
+
 static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
@@ -290,11 +334,20 @@ static int pca995x_probe(struct i2c_client *client)
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
 		goto err_put_nodes;
 
+	ret = devm_device_add_group(dev, &pca995x_group);
+	if (ret)
+		goto err_put_nodes;
+
 	if (chipdef->eflag_base != PCA995X_EFLAG_UNSUPPORTED) {
 		ret = devm_device_add_group(dev, &pca995x_error_group);
 		if (ret)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

