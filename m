Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F44382F1F;
	Tue, 15 Sep 2026 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481699; cv=none; b=t8UA1+ANFm+7cmH4ffnB3IBPl5NZAzvmTsIQOAvxo5y7jrpS245qKLsNX/MMe2QiZP3l5ojPAWp8+Ofy+M5LJGJPvBCTICXjsVN2hJWj9+dm/010F3yUXIam5F4GBvXyWFiylmMrOctSlfEebo1/YwvVA0dpLmfEVJTwwS8aUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481699; c=relaxed/simple;
	bh=UEFR0To26Qc2TQulCTSJRfqUDPS1C+1DGusP64IBXi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNsYg+rslSzWAanXLYwk+i94hYalHYklgAncA6eWXcFulYz0dSKoTDfjnufsdHYhjqg1zLu50ncumtYKm/sVCdj3ZFq/pPeYpOHH4zWXeZ30z1ZLsUkAKxYWrDhQ7Ye4riHzdHXCxbHP735y8syZZFpzfplWzvD5sWB9DC2W4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cIdoonUv; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cIdoonUv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JQ2KKF8LyYbJb7sroR3tJrc53tC7LaaVtqBUdECEiyo=; b=cIdoonUvDu4MOqy51W1HFYulHv
	SmDUKOWHye04bD2U2nNCpQT/jy+K9IkiBxMqfhgc7tXoQjABDvDWP8EJL+YUSpxj1uARI5UydeaFo
	703xVTp1tmFXQLrX3uwygaUbXn8R5w2Nr8Hc1xs/v+vcmo+4H20rbmGCf4RG5GPFRgq5fcrz/hffx
	QI7491ZelTqGwSxq9qBABsqexJijNBDPdV9fYFG7cjYQiR/Oj7psrewYUSL28SWoTMpY7YKO9KAJt
	VGlqwJFg2pDFsqRUZPcqtljG07jgIxkXU/o/0Z/2AYqprJP1np1idEaJzalAsMtL6/GHr6caQ6y/v
	zsiySjlA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTJ-0003h0-0p;
	Tue, 15 Sep 2026 15:45:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTI-000FKf-1d;
	Tue, 15 Sep 2026 15:45:16 +0200
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
Subject: [PATCH v2 4/8] leds: pca995x: Add support for reset GPIO
Date: Tue, 15 Sep 2026 15:43:52 +0200
Message-ID: <8a1af648c47041ba8ea564884c4322cb766cf9c2.1789477502.git.nora.schiffer@ew.tq-group.com>
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

The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
if provided in the Device Tree.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2:
- Use correct #includes
- Use udelay for small delay
- Use full hardware model names in commit description

 drivers/leds/leds-pca995x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 8b05b3f12cf38..0c0ea57f3225a 100644
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
 	int i, j, reg, ret;
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
