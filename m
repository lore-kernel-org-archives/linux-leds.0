Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2A4379989;
	Tue, 15 Sep 2026 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481683; cv=none; b=ZYMHdHXri6jsg109tTDf1pYap9bM+Z52O/Fch12EL3c9eKulGxY94l6+ufHOk3gTKReRrCU2eSYthZ/Th6TDR8UZ+TeYO2GvLmgHZrAsPJxT8RSGkVm5cJH3a+ML/lE6KiMcSyEqtUJnq5edkXN5sir/lgBwlU8nUDtpZjGBXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481683; c=relaxed/simple;
	bh=NAaJ1W4E9DvHUMQgZ1hSbDhvaXdrf93e5HjrB1W3iGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3l7Bf/lExmrtEA3PmxhnfFAVXqaFPUyaP2AHLnmk6HkIin7v4eF0Puc/XkX55ygdB+EErHYJ/UqFhoCuxkun5I5Q1dagRT4C15GlH+Jvj4Pl6XTsJYHCqKTTLSKg1awTu+ISWLy094wkQ4bu6LX5fW9bMiPUg7Xf8kPncCbUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RI+v6v16; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RI+v6v16"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vX4iB8NG9ET87lWHhkor0dIFdLlSTt0+7+NaW/fN6fE=; b=RI+v6v16/Y4w6Xa+gGonY/84/k
	7qK4+C83tgmrz+1ylJKcTUu79m0n2kF0xx9E12F9EPw2gwnOhXQMuzou4UXarESEzYpaeXIOxLMT4
	kFT7ksIbpt30rtf72aBN4uyLACunyhmZdWU+auqG2MhV6uhkY9QJ/n3jqh2Q6OgT65ASQwiwUVLDb
	A/0O/+8qkj38CT6JzL7292yqSl+yNmS8mq/OtLIshljvvHTszYREWzmPngDydFQClAFWcGPFUwfE9
	i72AmthZYTEffmOjSsNqSQFlPex8cZI1Xbc+qfC7wkOAr1j4kTmtOAA0cXkzvZO7FfUafX4YlWv+Y
	C6rDZiWQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTK-0003iX-0k;
	Tue, 15 Sep 2026 15:45:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTJ-000FKf-1h;
	Tue, 15 Sep 2026 15:45:17 +0200
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
Subject: [PATCH v2 7/8] leds: pca995x: Do not use full on LED mode
Date: Tue, 15 Sep 2026 15:43:55 +0200
Message-ID: <9f44869a2f046f5c5784a8bc9b3e7769436ebdf0.1789477502.git.nora.schiffer@ew.tq-group.com>
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

LEDs in full on mode are unaffected by group dimming. Avoid using it,
so group dimming is applied consistently.

This slightly changes the brightness at maximum (from 100% to 255/256
duty cycle), which should be imperceptible; arguably it is also more
consistent with the other brightness levels, as it will now scale
linearly from 0/256 to 255/256 over the whole range.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: No changes

 drivers/leds/leds-pca995x.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index a9e312aaf0ad1..963e453ce117d 100644
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
