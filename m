Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E82F7F12
	for <linux-leds@vger.kernel.org>; Thu,  6 Aug 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786028145; cv=none; b=sk9fsC66RUmLRIMHUWiG7tITv65MZLIVPqLYcqeB+mQIPAAvJOMsjdO9U+RW88VvyF2/Mcw4k1ti+D+d39ZImuCZXA4SPcrBVJragLhWIU1USPAHunp3xhP7tTe0/AqDzSXp4vYrpjVYesyKxviJhOFB+auTA/eNq7mZUn5uDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786028145; c=relaxed/simple;
	bh=8ApjpPnifbsZQA4eA5usFN/lpdMOzxNoaDndPuxIvWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUj+Yxpxw0mAD+BoQMZ6Abxsei3u3fpCWJfpzFUNjhoSdxsNX4FL8O2Z3Aytb+jJp9wVdI6FKnW6BZMqhQ8L1fnP+spvDKgCCDKWF/g50/hBILV65OjDd9W4BM6wHlpM77kfs9uxHYmFXSSLamLayPsXpecKxQgJrH2GlwUJjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEAY44sT; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEAY44sT"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso812160a12.1
        for <linux-leds@vger.kernel.org>; Thu, 06 Aug 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786028143; x=1786632943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2O2tQ/23yWrtHmczDfN6G5CO0yXq3hNAk7j3DZ4jx8=;
        b=VEAY44sTGGsYW0L9GeCuQHCmXV/Mw5fN6P9saad5ulhJO1hfushfXn70MWWrnh2Y05
         TKYLDfjn8Xm99k7k/VVa7/XpT9ORxf1qT+BSxffiOcxSefZmA97nOPRzw8i94ftqTriM
         a6G0Mo65XRIJALUM/Pk6CdypQKxwPuwKpAGeYF3UU524hIMEa2osKj117ZGmUPWmF50g
         CNUfEUR5i21OtRiEoGj3dXhesbQXpU5Ex5JbE3bdaTgHCsTfLVte3iQZbx7zQzM2cQ0U
         OiTo+0flT8lSnbllV8gE23EWeG/uSHEiy5JtVyxcklI+bMLRPyxHpQhnZ04pP70WIxOs
         ceUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786028143; x=1786632943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2O2tQ/23yWrtHmczDfN6G5CO0yXq3hNAk7j3DZ4jx8=;
        b=nKLm/7XBExRq8pHmY4CvOy27uR9EkPXaARhC82OJ3zRUBMQWY3uxUDSr69FVGIJzL1
         CmAXTssozv5sjzuwujHwV4ZTmbiGYaBfvcBXF8AduqmmPZJXnf9vgM8dP1GWdLqtYhrC
         68CslTdyGUzuBdyS4/52rDHFjqgQRAB2mNubDvtKYrCwSH3fKZuyqaXVfZbMwMI6pnMm
         MTNusn1/KvBRJo1XeG3Vsj6JXaSchT2sTHSbJoZL7WfYZyn8ldyfXxws7K7goK8EWERX
         gVnXgKSD5dtP/y8Zgd19rlK4xszLrOc0S9mY9H+YSlgKPHPF1wdDnswy1mf0g8GcixW7
         lplw==
X-Forwarded-Encrypted: i=1; AHgh+RpD1TvpLXk9K1AOOO2QZBabAo65/XoJUusRO0fxVqirFkOeV5FOlkMNpN7vGCStGCjM1u/D5MXmMIKJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHutzUZvQMWdIb+Gi7Q7zILfMeEoWGeGqdX58HlsJI1yn1G5p
	YSaEYJBTSfJWu1ESD1YWgnL84Gs+mQLecocf/5DNBHrzAg47Nz5aIT0=
X-Gm-Gg: AR+sD135DIUNmSp+EV87P6Fju9ogqXEDurG4TbKdKSfI5u94/IQVQZSPctTbyQLFrpu
	q4vPCLwhVn3i2FpIVsZj3OpyiKffyQfcGm7wFtESyUD25NU3VPq/3ZyfqM/VwXy3y2xfneYz9+z
	HiFY3p9qokcv8FY82HZK10PsAAxOrlW3KT/vJ5trkIbxjLyUIM7rFj67zL0yqofex+aDn6Kb7gJ
	ZFt+RpJznMoMBz89Aa51yB2rQoAD1rmpqDroxMV2prEnVbd3fDMF6sWgofY1uwJ1f7xSDKv/zxD
	OxqV26k10Bqb9u433MWasowU7CfDx+WiZbLZ9PXZ6NuP9Ahh9FWg4q8JW4Umw31yKAh0X7uCa6p
	LtKFKZLe3B/ebfHC7CltL7CqE4cDYhL2MqZnQTHLWpBeZ/2OXF6fz0V0X8czdtXtjVJAQm/gy+4
	Prd0WbmYMCfYeHnYvIFYjNJ4LqjJ/lh3Pnxhi7XrMhUrPR1IPQeLbqhDXG6qEYdp2e9jLU/EppE
	Qn2BbTzBGzSkg==
X-Received: by 2002:a05:6a21:697:b0:3b4:a0c0:6cb7 with SMTP id adf61e73a8af0-3cba2a77cf1mr6475463637.11.1786028142737;
        Thu, 06 Aug 2026 07:55:42 -0700 (PDT)
Received: from t-rex ([2401:4900:7b15:86d8:4160:7e54:6b7b:353d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708c0ebesm2806945a12.19.2026.08.06.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:55:42 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] leds: lp5860: fix LED teardown ordering using devm_add_action_or_reset()
Date: Thu,  6 Aug 2026 20:25:27 +0530
Message-ID: <20260806145527.114844-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

The driver previously disabled the chip in its remove callback before
devres unregistered the LEDs. LED unregistration turns the LEDs off
through the driver brightness callback, which accessed disabled hardware.

Fix this by registering a devm action via devm_add_action_or_reset()
immediately after enabling the chip in lp5860_device_init(). Due to devm
LIFO (Last-In, First-Out) teardown ordering, devm will automatically
unregister all multicolor LEDs before the devm action disables the chip.

This allows removing lp5860_device_remove() and lp5860_remove() completely.
In addition, convert mutex_init() to devm_mutex_init() to ensure proper
devm-managed mutex lifecycle.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
v2:
 - Use full name "Surendra Singh Chouhan" in From header and Signed-off-by.
 - Convert chip disable sequence to devm_add_action_or_reset() as suggested by Lee Jones, allowing removal of lp5860_device_remove() and lp5860_remove() entirely.
 - Use devm_mutex_init() for lock initialization.

 drivers/leds/rgb/leds-lp5860-core.c | 35 ++++++++++++-----------------
 drivers/leds/rgb/leds-lp5860-spi.c  | 14 +++---------
 drivers/leds/rgb/leds-lp5860.h      |  1 -
 3 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index fd0e2f6e6e0f..bbe299e36ad5 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -188,6 +188,13 @@ static int lp5860_init_dt(struct lp5860 *lp)
 	return 0;
 }
 
+static void lp5860_disable_action(void *data)
+{
+	struct lp5860 *lp = data;
+
+	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
+}
+
 int lp5860_device_init(struct device *dev)
 {
 	struct lp5860 *lp = dev_get_drvdata(dev);
@@ -197,38 +204,24 @@ int lp5860_device_init(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, lp5860_disable_action, lp);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set to 8-bit PWM data without VSYNC.
 	 * Data is sent out for display instantly after received.
 	 */
-	mutex_lock(&lp->lock);
+	guard(mutex)(&lp->lock);
 	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
 				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
 	if (ret)
-		goto err_disable;
-	mutex_unlock(&lp->lock);
-
-	ret = lp5860_init_dt(lp);
-	if (ret)
-		goto err_disable;
-
-	return 0;
+		return ret;
 
-err_disable:
-	mutex_unlock(&lp->lock);
-	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
-	return ret;
+	return lp5860_init_dt(lp);
 }
 EXPORT_SYMBOL_GPL(lp5860_device_init);
 
-void lp5860_device_remove(struct device *dev)
-{
-	struct lp5860 *lp = dev_get_drvdata(dev);
-
-	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
-}
-EXPORT_SYMBOL_GPL(lp5860_device_remove);
-
 MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");
 MODULE_DESCRIPTION("TI LP5860 RGB LED core driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
index 5e0c44854a68..13ad90362d5f 100644
--- a/drivers/leds/rgb/leds-lp5860-spi.c
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -61,22 +61,15 @@ static int lp5860_probe(struct spi_device *spi)
 				     "Failed to initialise Regmap.\n");
 
 	lp5860->dev = dev;
-	mutex_init(&lp5860->lock);
+	ret = devm_mutex_init(dev, &lp5860->lock);
+	if (ret)
+		return ret;
 
 	spi_set_drvdata(spi, lp5860);
 
 	return lp5860_device_init(dev);
 }
 
-static void lp5860_remove(struct spi_device *spi)
-{
-	struct lp5860 *lp5860 = spi_get_drvdata(spi);
-
-	mutex_destroy(&lp5860->lock);
-
-	lp5860_device_remove(&spi->dev);
-}
-
 static const struct of_device_id lp5860_of_match[] = {
 	{ .compatible = "ti,lp5860" },
 	{}
@@ -89,7 +82,6 @@ static struct spi_driver lp5860_driver = {
 		.of_match_table = lp5860_of_match,
 	},
 	.probe	= lp5860_probe,
-	.remove = lp5860_remove,
 };
 module_spi_driver(lp5860_driver);
 
diff --git a/drivers/leds/rgb/leds-lp5860.h b/drivers/leds/rgb/leds-lp5860.h
index 940be0c6e8da..88e327347130 100644
--- a/drivers/leds/rgb/leds-lp5860.h
+++ b/drivers/leds/rgb/leds-lp5860.h
@@ -263,6 +263,5 @@ struct lp5860 {
 };
 
 int lp5860_device_init(struct device *dev);
-void lp5860_device_remove(struct device *dev);
 
 #endif /* _DRIVERS_LEDS_RGB_LP5860_H */
-- 
2.55.0

