Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE6519DE1;
	Wed, 30 Sep 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778398; cv=none; b=QrS+Xrxs81p6bUvHpLjDSDWPc7JGTcrq7D6iXHVBF2Aef3iv5JZcpiYRTPgUUtDux/PWNxh3QKzW/wDCprCb2li/97V2KDDhMVCPHtz07cGWpcLdQ3M3Ia6okty720c8RBOEbzM9UDkmDvjLaPrwh8ZO2yr2VIQwbkRe2G3Xm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778398; c=relaxed/simple;
	bh=STNrtMWd0J6MwDZit2tpsWi03tkhBgvv9k9MOHFenXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3ibqkt8rJNc+5xBpp8pXIXq+VZah2QPtYPUNMvtM630ArwUsuuLMoordgnBj9Y9wyxq6UyJA5pbJHWpjEwV2qJPEqlzilx2TryYwahmvUCApLeEcOEuwO9dZ3P1nJY9O925uy/nPiKKmmfUluir2DMjm1df6S0mBir+TsIGBMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OkFH8IAp; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OkFH8IAp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Pqk2W16c7hjt0DwB4YbADjjO61OzdBO3mTf1qPi6Oh4=; b=OkFH8IApFDstrsA9/M08CPy8cN
	0RVzvy7b09EWSrh7J4yVYJ+ys0xDwjWzlja2O3w0QjqiYgiMmTAecF3pPA47DnorXP98pMPmkIUYb
	ueTD1i6wPXaJHIr/B5lajJP8sX6h1Zu4YaBWvoSCRiK/+Ea8u0V7Hka4AbtIwy4X58mkpBd5sRuGp
	SnWxTd6TKzk8HD9y1q5ZlDhiKJwo13MAijuH3WRI7BochrHr5COVni0hFH6f7z+AUuFUrEmbry8Ig
	ZiJwI3vOpnqA7MVbN1J1sEHhgKqo0wTNKmHPuv+ReF3AnguFs/WW0IkLEq6E+x9YlqEwI4RPBQJnX
	NyIb2dgQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGE-000Crk-0S;
	Wed, 30 Sep 2026 16:26:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGD-000MAX-1l;
	Wed, 30 Sep 2026 16:26:17 +0200
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
Subject: [PATCH v4 09/10] leds: pca995x: Do not use full on LED mode
Date: Wed, 30 Sep 2026 16:25:48 +0200
Message-ID: <93c090b77e2049c75439a680a1d3b86e2e5a29d3.1790684839.git.nora.schiffer@ew.tq-group.com>
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

LEDs in full on mode are unaffected by group dimming. Avoid using it,
so group dimming is applied consistently.

This slightly changes the brightness at maximum (from 100% to 255/256
duty cycle), which should be imperceptible; arguably it is also more
consistent with the other brightness levels, as it will now scale
linearly from 0/256 to 255/256 over the whole range.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 1fc8de5a77bbc..dd208ee09f352 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -102,28 +102,23 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
 	ledout_addr = PCA995X_LEDOUT0 + (led->led_no / PCA995X_OUTPUTS_PER_REG);
 	shift = PCA995X_LDRX_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
 
-	switch (brightness) {
-	case LED_FULL:
-		return regmap_update_bits(chip->regmap, ledout_addr,
-					  PCA995X_LDRX_MASK << shift,
-					  PCA995X_LED_ON << shift);
-	case LED_OFF:
+	if (brightness == LED_OFF) {
 		return regmap_update_bits(chip->regmap, ledout_addr,
 					  PCA995X_LDRX_MASK << shift, 0);
-	default:
-		/* Adjust brightness as per user input by changing individual PWM */
-		ret = regmap_write(chip->regmap, pwmout_addr, brightness);
-		if (ret)
-			return ret;
-
-		/*
-		 * Change LDRx configuration to individual brightness via PWM.
-		 * LED will stop blinking if it's doing so.
-		 */
-		return regmap_update_bits(chip->regmap, ledout_addr,
-					  PCA995X_LDRX_MASK << shift,
-					  PCA995X_LED_PWM_MODE << shift);
 	}
+
+	/* Adjust brightness as per user input by changing individual PWM */
+	ret = regmap_write(chip->regmap, pwmout_addr, brightness);
+	if (ret)
+		return ret;
+
+	/*
+	 * Change LDRx configuration to individual brightness via PWM.
+	 * LED will stop blinking if it's doing so.
+	 */
+	return regmap_update_bits(chip->regmap, ledout_addr,
+				  PCA995X_LDRX_MASK << shift,
+				  PCA995X_LED_PWM_MODE << shift);
 }
 
 static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

