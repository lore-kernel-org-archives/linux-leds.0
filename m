Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9684908BA;
	Mon,  5 Oct 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208485; cv=none; b=VWD4R0iXupye4L15Ho+QMgfJhcWrFT/u5VwRXE5kWSHxe3Ohrxxg7ELme6w4uKu2X9d5tw8veTn/YBgUxD0AJnsJ2e4s6zX18chkA8EHCwMoeDXIlTUWx7apHgTmYgKGcT0Ws393eEVZj1a66xaJ4Orqi/N6ZsCjNoEdZdAuOR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208485; c=relaxed/simple;
	bh=x34LHTwBatjlELoJlVjVjMc0ih2t5zfVwePL41nvduw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3Hhvd8+evMVVNOAQUf59JYrZzMQPEe7CwjHkWoibCMPgW+t/1VOXszBtpbvaoZz9gOgkXZd3S2OjWzK8NA+KqUQJO3UQKIbDylsrdnuo7omGOUF6khXg/3oeO46k2HnPBz27M0riagHrjpWZgCtV6Co8HYelcFcnVJgvlI7WMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kNRdQz7h; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kNRdQz7h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7/9j/ZIB/tsoCyWFj5gYto+ZmNGdvuaACBD0+J0poL0=; b=kNRdQz7hp5QMYRsB7Mbdhn/yVW
	bySEuhLGVWmEiwP0yv9RvfUKeuOkRBDsYe5KOYWt08cjolS/bPt7GHLlQxM0m/AqpdjWON6u+idF1
	ObHhcclcCrQ2D2x685N8I3d25hO7tqeT7H4nEXsjsabG69UssWg1mU887siDttAUU1lcMhPMPEmif
	9b5LOyghFH9FwloyELQUGbIK2VkV8HDpVE2VVyDlBk+AqtAqXaJ75mtdaCk5XvMGg89ESplDc00Ry
	gZhSqPxuVWybjnsFyDoxYvR0fMcEzgqudrWvciXnNekrENXZMFi2/Tf1QxTOK/WeSJQ8tXfDmaUei
	1f72rcGA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9H-000OzF-2U;
	Mon, 05 Oct 2026 15:54:35 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9G-000HEr-33;
	Mon, 05 Oct 2026 15:54:35 +0200
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
Subject: [PATCH v5 06/11] leds: pca995x: Add support for reset GPIO
Date: Mon,  5 Oct 2026 15:53:30 +0200
Message-ID: <fd45facac5cdf1930f2ca1666a66cd06cd1f659c.1791207391.git.nora.schiffer@ew.tq-group.com>
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

