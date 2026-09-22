Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C77392802;
	Tue, 22 Sep 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088516; cv=none; b=av9Gfs3qFh4w1R4DCpvA0uuiADvrcQe3YHFvJFg/dxeRDTUp5K0dVNiaEeFRiGnAKJkEEBISLID2ir7hmG/w9kQ+FIrPd5CMQAUmUWX9LAugmdPo1LCEAmmXgK2uISpjh1PJ4jorJqKE/JJjezAW1rathYvKVtnBaSqPwCcGZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088516; c=relaxed/simple;
	bh=x34LHTwBatjlELoJlVjVjMc0ih2t5zfVwePL41nvduw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kvxr8oUYtQki/PJpAsh7nCWLUpnzi1kHJl50gphD9WGaP0mnuEc5itG23DTSFySkLI/ksgi7iV0ryRTAzHkSsc+ZvDmyajPGlyJqiDTq3QMDn/v5SfCL9Us5JBF1VWjScIL4FWPSzx0nfgm4KOPOEYoq2DCQ7RXXruLA1Qv0tso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ohdgG/FH; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ohdgG/FH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7/9j/ZIB/tsoCyWFj5gYto+ZmNGdvuaACBD0+J0poL0=; b=ohdgG/FH1SlqU1ZYDrsXqlNBbM
	Dps89idW2tQlxLalfqGhFW3ooGw7fOaN+XibMRPTes5QhDgvaiX1dhlmESxq7QlANcb1I6URKApRo
	gxLFS0hV90VkRFK4SwWveBI5OxYTGVbhuLDHnvCcmKZhywV6IYJFkma2FIj6kVNVihQgGbc332CxK
	jJHhYH7vTwTp+vObrTPNszn8HkqtKFfeZJWJxlx0OIvsgbH7e1mBbQdtos7KnZOmfXi7dFHmR2I7I
	bQaubwyPno/zEoalw6ADCazsIuTj4c0W9usL9/mmA7jjF9nkbH4eVe/rZJH7BlXfWF3YnqrGWzXVM
	NJu+oFGA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nH-000Mhm-1a;
	Tue, 22 Sep 2026 16:48:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nG-000PP0-2s;
	Tue, 22 Sep 2026 16:48:26 +0200
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
Subject: [PATCH v3 06/10] leds: pca995x: Add support for reset GPIO
Date: Tue, 22 Sep 2026 16:47:53 +0200
Message-ID: <ffbbfaf03a2b7b859a4ee01e18a161026ca319cd.1790087890.git.nora.schiffer@ew.tq-group.com>
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

The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
if provided in the Device Tree.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index e6122b33451ed..b528b2b4990a7 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -8,6 +8,8 @@
  * Copyright 2023 Marek Vasut
  */
 
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -121,6 +123,7 @@ static int pca995x_probe(struct i2c_client *client)
 	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
 	struct device *dev = &client->dev;
 	const struct pca995x_chipdef *chipdef;
+	struct gpio_desc *reset_gpio;
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
 	int i, reg, ret;
@@ -130,6 +133,16 @@ static int pca995x_probe(struct i2c_client *client)
 	if (!dev_fwnode(dev))
 		return -ENODEV;
 
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+				     "failed to request reset GPIO\n");
+	if (reset_gpio) {
+		udelay(3);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		usleep_range(1500, 1600);
+	}
+
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

