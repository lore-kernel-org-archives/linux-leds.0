Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E54390609;
	Tue, 22 Sep 2026 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088515; cv=none; b=PRXPRnL3WBCdFuTxyCmuH0iMaRbWiD9o2HChWPzSSwyyFclkFTE1j1Z7d913x5vUwfR3jlsRmXVUOasvPKhKtHs1MbGp/mi/p2XLvZArT2zTZpM0ueQbm03f5mJzte9rfxtbakMRejinz19VuEv25kVn3hwrSjHSdAFdcAY38Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088515; c=relaxed/simple;
	bh=H9ZTJz1mF5YSrJcLOXtHgxvectDIutM5qdUYktdCdCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyPPRQmRRzb88H0tNZlXFSvZVScqoT7iUFS2iWrTdDbEUQ83WPKGhaZ8XqpUS5TxlD8DLn1xjYimeTl55aT9ySvQxk0AGCJVHG0f5FFibZgIcWhW/iu5JM3E9sdzToYX/7wTZGvcVX4917NEytUAJBrvgYii/gjTsVhdea3ujwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=drPuXw7W; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="drPuXw7W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bp/LIwK91vjxqQflXEqvF0xjrSazqceNniNex5W7jxA=; b=drPuXw7W98Dy1p790t8BmNy4vn
	dh8W/4jNZf6I1H5dAtjo2E84KDKEDfFeYeblpUoUKZzVpUiUKyXlIG3prWElNpysQC/bMqGM9hoZs
	JKngv7eZ9DUpaTqQu86otVVRWfc7aB0/icZe1nkc5Yizf3k3djoi/CwtMW4uFuJ/d9RZWbh5DCDv4
	tJIJIY9znuafVLkC8n1VpXDNjnlnLDXUIMpmraGU856wRbe+dP+rnW7Mms0AR0vZr6GqyTJS7sD22
	m6oq/6OXPncqh2quFsjYrDop75KYm4LCyywFB0ZPWeK1osc4MKod4V9m2loWkGUzgbgr91OBpU+88
	FDS0aVPQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nG-000Mgf-0l;
	Tue, 22 Sep 2026 16:48:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nF-000PP0-2G;
	Tue, 22 Sep 2026 16:48:25 +0200
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
Subject: [PATCH v3 03/10] leds: pca995x: Fix maximum LED index for 16-channel variants
Date: Tue, 22 Sep 2026 16:47:50 +0200
Message-ID: <cb0691ecb93a39e1e5d99af1fc5883d509085664.1790087890.git.nora.schiffer@ew.tq-group.com>
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

The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
correctly sets num_leds to 16, but the value was not actually used when
checking and iterating over the LEDs during probe.

Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
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

