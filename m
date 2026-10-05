Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30614A014F;
	Mon,  5 Oct 2026 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209945; cv=none; b=pPvjzYMJH9tJvTxxtSRbHMzM38/nPZilwJWeUwv5tvCStDXAvykMZz2pMl64n6sRxipjfEgIEh6NtqcpOJLzVAESLd3sMe4nig7q3vmYpQjFWOkanmM7VHfg0kXaas8cqmePkbuYzYxhIYDfrGgsY6gTR8VHhh1IyaH9lMaYduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209945; c=relaxed/simple;
	bh=EAXlvM5dJlg0s65oAgYauyX+rol0+GQHUrMPuvK6dYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGC5QUfMLnSnZQ9KIwWGviDKDtaY2GXFAduk/1IC9B7SE5ylFFRJewntAnwI30epJxGgy6neMD4eG9AZOVFRNq5E0VzHbKs/Y3mT/l1CZAT/W/cpGNPvI2Cr5/yHL57azfTrj8fA7OU8j+fzHTLrXRHpJ6W8R3CeT5BHuPALG3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hBHL9NCX; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hBHL9NCX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IJEizh6t5jIVwuWQ8ZXVOwOTAI3zq0m0du1qEnDfbD4=; b=hBHL9NCX171UaOWFEYP0sDyd11
	K5xeZnK+loMVUvfDngXS18sV+6vFG8IZROsd1lZKAK3mjhkwohTcvH+FjJL+kggTi4hXXOrvq9HoV
	NEoHjDFXZTiZCuaI3u+KTjirTLA7rISY8/6aDy5zhvRbop+KpTRwleW/3nHuUnTSyJF/y5dX87zo9
	cgI6Bb8s8kof16etiQoBjvdXSJKKLIEmH5RYSIQdo+6GW19VsXXTSSETqEZ2PBMILrAy/c6haRPcM
	COQuTmMUlmAHxdpAlItUYLzuLZVXpPxRdetYhs0RzxfBg03nSsYaSte3OYVU6mjgKaC/qN69Puw6l
	HGwXZvpA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDjWl-0005ka-0k;
	Mon, 05 Oct 2026 16:18:51 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9J-000HEr-0P;
	Mon, 05 Oct 2026 15:54:37 +0200
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
Subject: [PATCH v5 10/11] leds: pca995x: Do not use full on LED mode
Date: Mon,  5 Oct 2026 15:53:34 +0200
Message-ID: <4d1a741c5b78fe1dc5bf0d0ac47f3f3a161c335e.1791207391.git.nora.schiffer@ew.tq-group.com>
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
index 359803d0030fb..a95193059e747 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -121,28 +121,23 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
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

