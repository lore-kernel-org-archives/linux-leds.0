Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC0E391E4B;
	Tue, 22 Sep 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088517; cv=none; b=E2x2R8n+lS5NV7r4OCaI6aRRIMiR0ODDNpP38JXb7pEGet96h8LH5mvv4j5b4GQgb1x4UZ8oatkYV5Wy9b9Dh0mPJHSJqhawjRMFVsOl6MTxa+D3oV6cuqgCXVTIJ6bOFOP7cggPvs4BY/sCGJ1PxHnBXcdt5a4aZSR5gXnzkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088517; c=relaxed/simple;
	bh=fMsEYMaJ3Q4u7pflwE7/gzWXjChtDSHAJtkGAzMt7Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evOhehaR4rZWjQg4P1mBPx5GUjJwIqQNBEzL6jEigH4f5vdH0oDrDHd2mOZyuGNMwbTgG9IdeLaCOo7jcBvp+ZIv0teAeI/3B2fbdmP5BIS6Wn5+TWEZO5OZkZbp48I0Oo9q2F/dWzYO3ZFoyg7ey54Kbg/ZTMh2Md5gx3GjK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VWytTBcT; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VWytTBcT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KYuf12bt9LdGnasJY7HDXdK/vvJyApSn9sMWxpyDAoI=; b=VWytTBcT65pcdSLL5atzPErx79
	re8pdZtgPKRCyDru3rKjYSFryZj4qw4GssLlTOS9a2LpMzTCNjX8nF03HS3jbyr06UDlW2CpX0s66
	lObimfJ/TmjHyTLuT+jZfAKC3RMXybsirQONF+JG8CYRBprp8gbghL9hmQWucbJfG4/dZ3tVl/eX4
	IPe5dZi3s1tFRBQ3EFYJv55TPvwWXc7bEyUcTZzehmV6ZPy3ozmIF0uimo8YXurEUCsHFnMzZ5aN6
	ZomP8OdX0zjxNNWDsgazgIKNCypL2tZaygVEmNCWVyGNA5n029lY/gXpjrspUiKJ4I/dFsQ0MyJaW
	z6tTcE4w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nH-000MhF-0A;
	Tue, 22 Sep 2026 16:48:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nG-000PP0-1d;
	Tue, 22 Sep 2026 16:48:26 +0200
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
Subject: [PATCH v3 05/10] leds: pca995x: Write global registers before creating LED devices
Date: Tue, 22 Sep 2026 16:47:52 +0200
Message-ID: <f6acbfe43951f266cf6367e28916dd11646879de.1790087890.git.nora.schiffer@ew.tq-group.com>
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

The hardware setup should be finished before the devices become visible
to userspace.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 079ce3d8f1e49..e6122b33451ed 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -159,6 +159,16 @@ static int pca995x_probe(struct i2c_client *client)
 		led->ldev.max_brightness = 255;
 	}
 
+	/* Disable LED all-call address and set normal mode */
+	ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE1_CFG);
+	if (ret)
+		goto err_put_nodes;
+
+	/* IREF Output current value for all LEDn outputs */
+	ret = regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+	if (ret)
+		goto err_put_nodes;
+
 	for (i = 0; i < chipdef->num_leds; i++) {
 		struct led_init_data init_data = {};
 
@@ -179,13 +189,7 @@ static int pca995x_probe(struct i2c_client *client)
 		led_fwnodes[i] = NULL;
 	}
 
-	/* Disable LED all-call address and set normal mode */
-	ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE1_CFG);
-	if (ret)
-		return ret;
-
-	/* IREF Output current value for all LEDn outputs */
-	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+	return 0;
 
 err_put_nodes:
 	for (i = 0; i < chipdef->num_leds; i++)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

