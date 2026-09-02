Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1126463B91;
	Wed,  2 Sep 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351785; cv=none; b=KUC9npddVwaMNYKlFLc418UjNUYx4Hue11eUVUNyBBDJc22bpzbNnlzPlB0HiyWxXNTKTTIW3CnJ6Ixvdd2xloEOH8jt0MDL0s721J0ZuO1b6iklVEydxjZx/LJvBAeGNVxa8+k3y8+VBKo+mD+BBVz/ld9aiooS3clgpTpyRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351785; c=relaxed/simple;
	bh=o0vyR4EMYl6ptpRcjDV6nwGhQSmPY8iV6NWV2pjmvOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEeeEu7TK3a5KvWmsJFpePh2h0nVOq/TwEK7gUkM6Po59UTyntgpNaIz3stf+bdsKa2hVNZEIWGziMMmkTME93LmIxZD1RWUUT/WttZRDQK9chqTPSzEP9cOw4V79QOljJtdeSKyQIvL9mSEESKRHxS1C8+sApz2LJYjn5YwJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CliBbK4B; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CliBbK4B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PxmlhppqENsFWWSaJJzHUOeWkCgXDRKQuMRpcMlNAxY=; b=CliBbK4BJVzILAt9tEyWIJy/5C
	cqMO0q3Ldm6KZs022jT9jL83bfb0LCWNFjy6u3Cd7HcAUElxTWm6ytcnQJjIxq5DHKjEf2gPkJn+b
	/pH9yJBo7sXKgKrbdLjMYunZVUjLIJExNvtYBTf0VVMcTOuBQw6fjGkevJKl5uuAqoGp2FhYHo6SX
	R3OfTtMpIA8vdbRIznY2TK9K72ufdpTmHvr1AAbTa8cE9Qt494CmdqIMUuG+i5hmgf35SAskUdZyT
	U1TgxvkyKPrVJQXFLRNAaIcqvOuy38b5HIgeHspGyqWzOGyABlOYv4r3qj8nrMQfYSRO4LV4ZtVRu
	4ZQWfHWA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzZ-0006yt-05;
	Wed, 02 Sep 2026 14:23:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzY-0004kO-1p;
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
Subject: [PATCH 6/7] leds: pca995x: do not use full on LED mode
Date: Wed,  2 Sep 2026 14:22:14 +0200
Message-ID: <bc5241a0728aa81050d987c26a4c02bdb05d6d20.1788350618.git.nora.schiffer@ew.tq-group.com>
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
index 2232b74528a53..62f2764661b9d 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -98,28 +98,23 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
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

