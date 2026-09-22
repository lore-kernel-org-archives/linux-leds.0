Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB73911D6;
	Tue, 22 Sep 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088518; cv=none; b=qKvbePvptBhPQlZdfU7T7bNg7TCLb11EJVxchO/UW8clSGClNWpm5XsK4k7lm3l3D6+hiBsIjAUp62cDq7hEv7sk7kNJEg0YOWLISo/+WhLIZSAzVp0uUFJeeRacprCBQfGVFQNDmpPJKve8LrUcz0tTaAEjPoTeV00c85AhIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088518; c=relaxed/simple;
	bh=Aq1pLEdqVsyPCq7NAajxaF/25xutVxMfutUIWD7qBds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QbCjQ8FrdngdVVciICWjzJhH1WsQsVj7MUk5wFr6DGwdVD/avbr+p5HgI1Ko4tDGI1pLc1wJdULeifw2KDmSb3KUKXoWDe0bTiv3j2+ocKhYkc6VQ75gyCK/MaThb9ci3KO+OqUMKQkthhMO/h7KGxRRh5D69FeLsnaeoYeA0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=miN1jFQ6; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="miN1jFQ6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=j8v1elqs7zW00gnUpHmNxsDqCTyeBmas5xfMBDnBJOg=; b=miN1jFQ627EFgeQhrQzJhSzVnu
	RUt0wDO+Z0s8pbXO9UpHTKLhibCQFm3oYP9tk8rvr/m8d0XjLHsgO095pFRuAaBMv31lnhYdQ4Onk
	qjiWB5YKgomsu/mRR8hPjmUTT3hFxDn3U0+VFWzK5Z2u4KhIXTEue+IRydM9hcqf9o+eUCZCdHl+7
	2ZLxQdDsqGkw6yfwSzCXxh03YLHdOVgXMNcQVcBy73LSAxqqmfvQ6DaMBU2F+0d7FPXXBuB3Nkw7s
	6LI8yZK7PsoiC9XZgpQy6jWEK4+EhTd4KPeSXMpCjJRww0Y2gJng41Yty8yQ2xu9wHrZVRU8Uk1pB
	+gLSjTew==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nI-000Mih-0d;
	Tue, 22 Sep 2026 16:48:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nH-000PP0-2A;
	Tue, 22 Sep 2026 16:48:27 +0200
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
Subject: [PATCH v3 08/10] leds: pca995x: Add sysfs files for error reporting
Date: Tue, 22 Sep 2026 16:47:55 +0200
Message-ID: <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28131/Tue Sep 22 08:27:06 2026)

The PCA995x has builtin failure detection. Provide sysfs files for
individual LED status (reporting "okay", "short-circuit" or
"open-circuit") as well as a global "has_errors" flag. has_errors is
sticky and must be cleared by writing "clear" to the sysfs file.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 112 +++++++++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 13cce0c3fdc19..57b5d2d6e035d 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -8,6 +8,7 @@
  * Copyright 2023 Marek Vasut
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -24,6 +25,12 @@
 /* Auto-increment disabled. Normal mode */
 #define PCA995X_MODE1_CFG		0x00
 
+#define PCA995X_MODE2_CLRERR		BIT(4)
+#define PCA995X_MODE2_ERROR		BIT(6)
+
+/* Clear errors on probe, group brightness control, linear adjustment */
+#define PCA995X_MODE2_CFG		PCA995X_MODE2_CLRERR
+
 /* LED select registers determine the source that drives LED outputs */
 #define PCA995X_LED_OFF			0x0
 #define PCA995X_LED_ON			0x1
@@ -37,30 +44,37 @@
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
@@ -112,6 +126,83 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
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
+	if (!sysfs_streq(buf, "clear"))
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
@@ -176,6 +267,7 @@ static int pca995x_probe(struct i2c_client *client)
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = pca995x_brightness_set;
 		led->ldev.max_brightness = 255;
+		led->ldev.groups = pca995x_led_groups;
 	}
 
 	/* Disable LED all-call address and set normal mode */
@@ -183,11 +275,20 @@ static int pca995x_probe(struct i2c_client *client)
 	if (ret)
 		goto err_put_nodes;
 
+	/* Clear errors on probe */
+	ret = regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
+	if (ret)
+		goto err_put_nodes;
+
 	/* IREF Output current value for all LEDn outputs */
 	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
 	if (ret)
 		goto err_put_nodes;
 
+	ret = device_add_groups(dev, pca995x_groups);
+	if (ret)
+		goto err_put_nodes;
+
 	for (i = 0; i < chipdef->num_leds; i++) {
 		struct led_init_data init_data = {};
 
@@ -202,7 +303,7 @@ static int pca995x_probe(struct i2c_client *client)
 		if (ret < 0) {
 			dev_err_probe(dev, ret, "Could not register LED %s\n",
 				      chip->leds[i].ldev.name);
-			goto err_put_nodes;
+			goto err_remove_groups;
 		}
 
 		led_fwnodes[i] = NULL;
@@ -210,6 +311,9 @@ static int pca995x_probe(struct i2c_client *client)
 
 	return 0;
 
+err_remove_groups:
+	device_remove_groups(dev, pca995x_groups);
+
 err_put_nodes:
 	for (i = 0; i < chipdef->num_leds; i++)
 		fwnode_handle_put(led_fwnodes[i]);
@@ -217,6 +321,11 @@ static int pca995x_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void pca995x_remove(struct i2c_client *client)
+{
+	device_remove_groups(&client->dev, pca995x_groups);
+}
+
 static const struct i2c_device_id pca995x_id[] = {
 	{ .name = "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
 	{ .name = "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
@@ -239,6 +348,7 @@ static struct i2c_driver pca995x_driver = {
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

