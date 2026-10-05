Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3FE490BE8;
	Mon,  5 Oct 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208486; cv=none; b=MEy/N+xkJLW4BU+eiQV8ZnV001i0J2uBsDMSBSJgcZhh5/oxEcoNjad0oyW4rIT7/bJDe6KhaX/9cdsmUZV26o+RTXY37s1Nwklb3BeRQ4XyfEPK/2udvuxv/mb92PE72nDdwbAVLkPIC8XL7o0D6S1IL/89iYTJKrU6Jy4LR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208486; c=relaxed/simple;
	bh=dJJ+jtoHuVio4vtwzior4Wcb0fe3r/vJC/RSwuWPuLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rukoZ74g5hSBmsBDMJUflXiF6GC/+YGMKkvv6iERN8mBAUIuqfS7MRaMlmCxMRFqThxqaZfQjKTfRehpsPqRj4HKqOnUq1GAAbbMMosq5wYoLnZLxzneOeoNG2ajBzE5ckt/GxgZqlQSUj8d3DFK2DRQoQl8Q6GheQFcS+96Xqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ddMBjFvy; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ddMBjFvy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b4lRe+WjuJ1brrw32YdswdpUR74F3066fd77vFoLVsE=; b=ddMBjFvyUpiIICd531O3G08M5T
	wWYZKhiMlEUx6kVFSz2AyKq9L9i7Gn0d2G5CPDydI4qHbDjAWeErimReif17a7cFowyHtR/bavddY
	Uj0iyzRL6yfKr94vkAThC4slEz5PNy330VSj0y7J6KWztoyuxt2515dSx060Q+m9N9E1GiPS4Xytr
	f7cGDiFjKDW2ZtZtd5ry3sT3hCow86IHBOYnefxU8/zyoRIdx7kEbuq46LBLlMJpxd3KpGAIwjwkC
	r7P8aa8D8DDbO5Zoop+2cS0S8WIDFBtmZQduptoo6ZQ1G4P0NteKT/nFqcDEiaYnarU8lA0Lpi/Kd
	L4b9pIeQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9I-000P01-30;
	Mon, 05 Oct 2026 15:54:36 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9I-000HEr-0J;
	Mon, 05 Oct 2026 15:54:36 +0200
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
Subject: [PATCH v5 08/11] leds: pca995x: Initialize MODE2 register on probe
Date: Mon,  5 Oct 2026 15:53:32 +0200
Message-ID: <c300e9762f8a427d8be5a985228e3317f2b4c9ce.1791207391.git.nora.schiffer@ew.tq-group.com>
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

Ensure that the LED driver is in a known state.

Not all of the bits in the MODE2 register have a function - some are just
reserved bits that always read 1 - so the values given in the PCA9952/
PCA9955B/PCA9956B datasheets are simply specified as hex values.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index df3f7ab2e1f87..3d6053625b1c9 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -43,24 +43,31 @@ struct pca995x_chipdef {
 	unsigned int num_leds;
 	u8 pwm_base;
 	u8 irefall;
+	u8 mode2_cfg;
 };
 
 static const struct pca995x_chipdef pca9952_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x0a,
 	.irefall	= 0x43,
+	/* Reset default */
+	.mode2_cfg	= 0x05,
 };
 
 static const struct pca995x_chipdef pca9955b_chipdef = {
 	.num_leds	= 16,
 	.pwm_base	= 0x08,
 	.irefall	= 0x45,
+	/* Reset default */
+	.mode2_cfg	= 0x01,
 };
 
 static const struct pca995x_chipdef pca9956b_chipdef = {
 	.num_leds	= 24,
 	.pwm_base	= 0x0a,
 	.irefall	= 0x40,
+	/* Reset default */
+	.mode2_cfg	= 0x05,
 };
 
 struct pca995x_led {
@@ -185,6 +192,11 @@ static int pca995x_probe(struct i2c_client *client)
 	if (ret)
 		goto err_put_nodes;
 
+	/* Clear errors on probe */
+	ret = regmap_write(chip->regmap, PCA995X_MODE2, chipdef->mode2_cfg);
+	if (ret)
+		goto err_put_nodes;
+
 	/* IREF Output current value for all LEDn outputs */
 	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
 	if (ret)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

