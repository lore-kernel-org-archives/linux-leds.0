Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF616472082;
	Wed,  2 Sep 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351785; cv=none; b=EE6pcRp57+7y7lN+6Wnauk1Am6Yp89RgP8KPvO+NWdB+hs5QQbanRzOrrBe37A9MITNAjl0JPqvn2LM2m6GbTOnvCEV42qexmCPBbPsJCYxTGWD96hN06ag12jb5ylbvR8yhzy7fhJy3HMcdg6z3asE/gx/ecsAJpFkbwYdtjJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351785; c=relaxed/simple;
	bh=8cU9RAT+fhVhvAs1BzST1mC7oG7l4te5SYRZIjgCdV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LDcH3FRn0XTUmZOI+S9GJH6UxOQmuNuiqM48G8iLKeYSLk0V7HKc9+sQr0+CuvZhEa88Fefg6zn8VyT/TTuHfn6RlcDHaxVnahvAC3lC6gdP6qlKAClx9+VZY3Ls1XA5q8pqUBfubdzh9c5efs40ffokM5umgEa/bG8Ri1VAlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Mknufzfm; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Mknufzfm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZBqCSqSCDxOa/HGY7p7y5oMLZmHgm7YnMcTe3KLhs9I=; b=MknufzfmdKLGD7hovMMHVS0wW3
	+fejqhEWhpcgh6OXy/hoI2xY835sTn4hG5i8ZLfuRTJk8m1eGNrPkbszCXcHa/flaCxsJ8S7e6r5S
	6e171ZX5FcPktjQZKAZjDg/bu837o6B5uCoaSApP1uB+ZpJNJSMRMqYBfIplkHyaFvQ1gBTsWT9tF
	EYz1vEaO0RmKZPUtcEjT2+tnzOYoi+95/HcHWbw7YvH1GUMwWj1Bl2bIJcIbwCIjeTOpHUOIqr2iL
	h+/7+qOB4xvDM/gxph+/dhuLCmX6BpEMgF0Gra1+EAUKQ2qP8+11zpTc01WypC2U6HX+3yzwHq79H
	S/775ODw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzX-0006xa-3D;
	Wed, 02 Sep 2026 14:23:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzX-0004kO-1k;
	Wed, 02 Sep 2026 14:22:59 +0200
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
Subject: [PATCH 3/7] leds: pca995x: add support for reset GPIO
Date: Wed,  2 Sep 2026 14:22:11 +0200
Message-ID: <1d5436e3a143d72c04c2bfd1d7fee2674e0af8e5.1788350618.git.nora.schiffer@ew.tq-group.com>
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

The PCA995x has a reset pin. Use it to reset the LED driver if provided
in the Device Tree.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index fee6216cd1bd0..8eb9847b9709f 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -8,6 +8,7 @@
  * Copyright 2023 Marek Vasut
  */
 
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -121,6 +122,7 @@ static int pca995x_probe(struct i2c_client *client)
 	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
 	struct device *dev = &client->dev;
 	const struct pca995x_chipdef *chipdef;
+	struct gpio_desc *reset_gpio;
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
 	int i, j, reg, ret;
@@ -130,6 +132,16 @@ static int pca995x_probe(struct i2c_client *client)
 	if (!dev_fwnode(dev))
 		return -ENODEV;
 
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+				     "failed to request reset GPIO\n");
+	if (reset_gpio) {
+		usleep_range(3, 4);
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

