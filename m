Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F4F47F2F6;
	Wed,  2 Sep 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351785; cv=none; b=Jsq33hcpwKGlyqfFxetwpNhu3KMruELRInN+aLZmTyE8ofOKqxoKkuf96TSjNBrEpiKvl3zBHtT3m0XMpVmGosdZedjNcvixa7dmthjSyNRMm7f0Lee6mCtzXj0EPPA6eg+pdwGeB2e6HUXblAQK0an+4tqCq8QlnxgYO2l9wjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351785; c=relaxed/simple;
	bh=4k6cU/hrRDJlPBVQfsmJn7mLWG3SK7GRtJKw7oJ745Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwgL2Hzz05khu7lDk/U8rsjBt3mHlG96QC2cF/9VgawS3Dg0yKfBzb9hyWuNn1pPZnD9bZHSDtzT/cEOfoCFBXKvuDueU5cAVif6KKy2rsGJ3JhQVFZGUY27pouy0ECaQleXhFNcfC/+ImAtOle37qijSXAiXypSCWiVf43uxdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AwuJ584m; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AwuJ584m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uNpMxw50WQWmtFzdHt0uWzxNiiLzLxkvb3/q5vffgzM=; b=AwuJ584mDYPnwmGWZYKpNcdBh2
	OMO43GpY1+VJ+AF6jaCGyokIU1jxsTDm5DP23YQWJH+K8T8ytSoJ4RiQ6xqEx4mLy3JLsH9MBfoXo
	/kC/s5o7UokrGj01eQCAlCF9nJnVG4PvWbWRM0gfhg2ttej4IFZ4uyyxs8404oMCyDqEGSUNkti9i
	kdw8kLHzWqPx0RlFtVFEyi17lrD+J4peC9Vkrugm4KzoU5bVjegwUc1UxhKm3gIdSP3iw1EsnNZjV
	uelrD8LBefeQzarQIepT97R+3N914wmWc7mfTcD8gSGg31eSR4y2qYNakc0tYouUtWSxKXeQeK0AE
	zHG3x8QQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzZ-0006zH-1D;
	Wed, 02 Sep 2026 14:23:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzY-0004kO-2u;
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
Subject: [PATCH 7/7] leds: pca995x: add support for group brightness control
Date: Wed,  2 Sep 2026 14:22:15 +0200
Message-ID: <225583885966f45079a7dafdbc2b1c419a25fa4b.1788350618.git.nora.schiffer@ew.tq-group.com>
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
 drivers/leds/leds-pca995x.c | 39 +++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 62f2764661b9d..d65c33edc83ab 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -31,6 +31,7 @@
 #define PCA995X_LED_OFF			0x0
 #define PCA995X_LED_ON			0x1
 #define PCA995X_LED_PWM_MODE		0x2
+#define PCA995X_LED_PWM_MODE_GRP	0x3
 #define PCA995X_LDRX_MASK		0x3
 #define PCA995X_LDRX_BITS		2
 
@@ -48,6 +49,7 @@
 struct pca995x_chipdef {
 	unsigned int num_leds;
 	u8 pwm_base;
+	u8 grppwm;
 	u8 irefall;
 	u8 eflag_base;
 };
@@ -55,6 +57,7 @@ struct pca995x_chipdef {
 static const struct pca995x_chipdef pca9952_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x0a,
+	.grppwm		= 0x08,
 	.irefall	= 0x43,
 	.eflag_base	= 0x44,
 };
@@ -62,6 +65,7 @@ static const struct pca995x_chipdef pca9952_chipdef = {
 static const struct pca995x_chipdef pca9955b_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x08,
+	.grppwm		= 0x06,
 	.irefall	= 0x45,
 	.eflag_base	= 0x46,
 };
@@ -69,6 +73,7 @@ static const struct pca995x_chipdef pca9955b_chipdef = {
 static const struct pca995x_chipdef pca9956b_chipdef = {
 	.num_leds	= 24,
 	.pwm_base	= 0x0a,
+	.grppwm		= 0x08,
 	.irefall	= 0x40,
 	.eflag_base	= 0x41,
 };
@@ -110,11 +115,10 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 
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
@@ -186,10 +190,41 @@ static ssize_t has_errors_store(struct device *dev, struct device_attribute *att
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
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

