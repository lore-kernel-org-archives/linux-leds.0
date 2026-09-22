Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDE3932E5;
	Tue, 22 Sep 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088518; cv=none; b=ESwU5E/hj/liFu6QjEyxs+i7zJY5qSV9oUQHejkYVcH4zmQ9I6NOVgqegiOkJSF/LPKLrTU6gqDwi2rAriERB02LW9f3RSb7W+Xud1HvdTZNLxHk9HOvBepwgjmYK85dmxxExoczIAead5JRG03sRX+GCc/7n+vFO6MGbIa/2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088518; c=relaxed/simple;
	bh=J39ctggg4+o3oRV6PV/FJs5F2Jnk1Zj6qONzpvoRt64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4HFjC7/flnt8BstU54OQa27mEmSzywKTQJbZlpDqrAUbcpMYJ+RMEWGBzHHELPnWoFzQXcYOAOt+EJLa2Gp3EDNb6+AbVg73f0A6vdOg64vl6TwlCAX3oa/yF/Mimnv5fGObL7hDB80gKdTq0gbc0GfumkjZ/WmLDjyzxwy1a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k6ZhoQZS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k6ZhoQZS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=13B7QLUFJtdjEEsKoyqV6NO0BscoDwNdJPCtxIr1RBM=; b=k6ZhoQZSI44KQ/qoIMxjZQTm5J
	hS81C2feRFKdReAf6h0UDFJ54pDXY5HznJknscK3yfBZzsKb/wV6rXB7AA/4IcNwl2QHkBGBwBE2m
	giqfdDo6xxC5+wjQUqVirFTVS1REQ05VnORleZyuwbLBDVktfgMKFj3zp3JNnp255zYGMT09nisbs
	+BrMouG1nOlVoOH0VgpnoQA54bHQfLq3p9yVVQDKThbTseDSaqUKU7LrPLm0n7L4uStJqtEAjdde3
	NVJegnPUdxlz/iRCFi4HnWPZrEQJhPEED/OeWdmbp1AC/ABM88bbPOgAtmvTWYQO+ak0mCBtdNMp/
	oz2dSHtA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nI-000MjF-1x;
	Tue, 22 Sep 2026 16:48:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nI-000PP0-0H;
	Tue, 22 Sep 2026 16:48:28 +0200
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
Subject: [PATCH v3 09/10] leds: pca995x: Do not use full on LED mode
Date: Tue, 22 Sep 2026 16:47:56 +0200
Message-ID: <d1bf0a482f09297b9d166d40f7602c3c93459171.1790087890.git.nora.schiffer@ew.tq-group.com>
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
index 57b5d2d6e035d..61d2581b976ce 100644
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

