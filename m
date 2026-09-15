Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A84044682E;
	Tue, 15 Sep 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479927; cv=none; b=UZEZgPZe4PEec66310gUs5RMROoRQYMFD1iBdrTRh2WIPKF9ZIPRL4LWW1vZRKQHH6zdPDInGmyTfgqXhz+2r2NIEqwL4PSgBvu6NDU1dQY5YD+2XmexLGuA2SdQFjo9YpMJKvS7+ClK6b/pF9qAqTryMXp0Q7NjHll4cd3ZWkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479927; c=relaxed/simple;
	bh=d/eIetOtCM0pLmqWm6eTvPFkyMoPii0u+RP7LoFJ3Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLQdQniTAeR1wgyRWyDITuMnFHfl8KsForz43DL+itkxX5bxuKRvHkKTpGL0RVD1OAJWirne5I9whKja/zgv/t/8wQGw8iYduPyggBTAKX1tTrKUbySu8CxcEMEQbiF/0n3QqxP9oMIGprMa8VCaXse4b6sL8yXlsAEBBbPVPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OV9JYZY7; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OV9JYZY7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=92qmHEmj8CDijWyBznm94VTa74lhMCO5ix225HA0sKY=; b=OV9JYZY7MZN2tHojBLSqG1YYkq
	1WDa6e8Q+wBZZE/sBUm73L8ykHBTAOCTc3UUQyRvADsaMCe4UCuQSFTw7yKYLU81nPf1h6LCkNcR+
	2GvunVz6rCEp89TiO3vW32PsxvPCVNjifZkEs0CAunfORtAPpz180ovbPk+KqyIt95yZZe9qczzn3
	0M6cTPi/dN3Z8olpi12dBPsvgjrM+IlVYtTtmFhLc8OtP0Fg16fwRPgpObXKIFsmZrJwIJUoAtgEH
	N3JkflepoAEM4c+crJqjY4ixkszT1tFcqxnBPteWnCZ57YL00uVFIJfZ8I+K/S8BgLqONXew0v3ex
	nx9388dQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTI-0003gv-2i;
	Tue, 15 Sep 2026 15:45:16 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTI-000FKf-0a;
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
Subject: [PATCH v2 3/8] leds: pca995x: Fix maximum LED index for 16-channel variants
Date: Tue, 15 Sep 2026 15:43:51 +0200
Message-ID: <c8b776cd923443dd455f4229d640e08ea4709d93.1789477502.git.nora.schiffer@ew.tq-group.com>
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

The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
correctly sets num_leds to 16, but the value was not actually used when
checking and iterating over the LEDs during probe.

Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
v2: new patch

 drivers/leds/leds-pca995x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index fee6216cd1bd0..8b05b3f12cf38 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -146,7 +146,7 @@ static int pca995x_probe(struct i2c_client *client)
 		if (ret)
 			return ret;
 
-		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg])
+		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg])
 			return -EINVAL;
 
 		led = &chip->leds[reg];
@@ -157,7 +157,7 @@ static int pca995x_probe(struct i2c_client *client)
 		led->ldev.max_brightness = 255;
 	}
 
-	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
+	for (i = 0; i < chipdef->num_leds; i++) {
 		struct led_init_data init_data = {};
 
 		if (!led_fwnodes[i])
@@ -169,7 +169,7 @@ static int pca995x_probe(struct i2c_client *client)
 						     &chip->leds[i].ldev,
 						     &init_data);
 		if (ret < 0) {
-			for (j = i; j < PCA995X_MAX_OUTPUTS; j++)
+			for (j = i; j < chipdef->num_leds; j++)
 				fwnode_handle_put(led_fwnodes[j]);
 			return dev_err_probe(dev, ret,
 					     "Could not register LED %s\n",
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/
