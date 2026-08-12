Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FAB356A37
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542625; cv=none; b=KatbNCj2CPFBInx/lTWZjKFwBFLO+3t071AxL4RlrsBTDAdVeWV5cS4Fik3v/VqvYe67NdHhxIPczWjp/ms6anCcaIERL0jt8nQ30hsz+PJ4okQ6hJNAyXWkT9vBrr7nyCbvRipsTkmgF+FAbBzzuTk/jRTDY254rN0RE1+V7+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542625; c=relaxed/simple;
	bh=i97dpxlmAXpacD2wpR3GaX9cP4BbhX69ACx85zJdMio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTmCD7O0L2if6OiJnsxvuEPNT1Bjloy2xmtihX5Jc2sxPnzT8ITFFxoppB3uNHEwy4s5IF9crIQNx3ummpOYH/Q2Dx4U5A/QGSPo1WHJtRcF+PkiOGokJvVdblXbczrRdavRP/8e4vboQCGgE9fd7tt+umBI5DyTowq6SOU/xxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OD9PZ46v; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD9PZ46v"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1655121a91.1
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786542623; x=1787147423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJpE7NFDH+6cRlLknvTIh7l+50/INiWFxqDUC1EG4Tc=;
        b=OD9PZ46v9fkQH2sWLpTFgADJW5+IlB+bYi37sLnY/LbtiM2B1mJO2P1f0SxUE/cAS6
         0uL959kpe9B4zDIRl3Ios1Yis+tNlZzG0yLt28lwz1TlC05T8z+qgXpIUskLqyR12JVw
         AyxdgGZE/xz/cxNfP6qCHgmv4PiCnLv8wXL9Zj5g3g/BGv7ApMnbp4mq7vTtPvRTY3gi
         UqEWLiFcvbcxZkPGqyww2+7BCULNXAjXP9o+ZosUXbtztveZkDyxbBflJpFLNu48hDzf
         6lBcSwqyaFnbHfUzklgMqFRUUjyHJcyP4+EMbuU9KyuMRO0MYTDqbd19gkQhxS+bUAn4
         Eusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542623; x=1787147423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJpE7NFDH+6cRlLknvTIh7l+50/INiWFxqDUC1EG4Tc=;
        b=hYwUhChGJW71wnZwsoK6Ix+YmasJbycpif0rb3C5YWNCbqXNYs314PtySKv1gqA4J7
         jbjDew41QMP+8IHMzW+7TDV2p8whaeq7ucdAPsbQ7fWGhVroWf86ld8STtl3EGHAihT6
         3TIRwwLckHmMJ35hhLkglz5XmpwIPCTjjcUYhIVdpQuev16+N9qw+HYmgVQm5LYBeRk9
         eKzqP0U1//RjoK9A0O6d+cUJcZ5wowSgDhuNI+fDdno9+SRhtMJN3jv7I80c6HixtUpi
         i0IdFDLJ1u1op2xlhXjsrGW0WXn9n7hz5saXffAzjqht0SGk9ngDxpeZM/EvHVSB5R/j
         6llw==
X-Forwarded-Encrypted: i=1; AHgh+RoG4MLZUSxDxIcBcu/DP7P9WLrDFmL08y8L8mUrp90zsgE0J83rqWm1wFMX2Z+8FXleEqn/12YOD55Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyjqbU3XQ6JgzkkdoSNlj0X04tFCIXfEZnZtRdfX7KbBfgjZLAv
	oUHdBZFcG4B28VaLZF6PNBcLfv2479Nj9sugivB6gEaZEQpqYiS0T5E=
X-Gm-Gg: AR+sD12jzLzKII0wEKsim1CJK7U6p8uSgZQR6x8haJj1MLx7lKeQQJj2c009/zee5Dy
	PU1Y63CrGtWX+Er7NhejQgU9vBsa8fsPRCjtO+FtQzf0SCTIaOj+jBkNeEd2LAA50FP74bBUz4b
	PGeNIYY99vpAooVLsr/vnNYoXbFB6RXg62zU+BpSDG4eGe1YpiG7/tHUd9qBWVqVo7r4w9Mu3NU
	se9+hKlYcpZwxAOA/LLEa1T1ZWnUvS1cJQh/wO9GtwO/wiXacDzg7Pxhq6gQFFvKiJJyp9bZ5A4
	94o4bP/BRWgd/8QyqFHmkoSBU6LG0ADxD+4qJlHgFc+8LEmBTyJ5y1AHLe7v27Ohy5YbI9sg3Q0
	b7Dtvg1sl7+eWi5aIfIyroTE3mvj5i0OsMVXXzcdYFd/cZnSQ+kj9BoC+lNh+w69d5ZkM0wboce
	6iuZPovJRxbGnFbdhq221tfblg/Owlmo1AyYhoMX3KLvh1tS9BFri0xhuueYyaML/pa3mLdBNlM
	8WwYfCXZrOCiCKDzPdPAy0Y
X-Received: by 2002:a17:90b:2f08:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-39301513ef9mr6527723a91.21.1786542622820;
        Wed, 12 Aug 2026 06:50:22 -0700 (PDT)
Received: from t-rex ([2401:4900:adcf:76cf:8f8b:b6e3:7526:681d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141243819eesm10020310c88.0.2026.08.12.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:50:22 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v3] leds: lp5860: Fix LED teardown ordering using devm_add_action_or_reset()
Date: Wed, 12 Aug 2026 19:20:01 +0530
Message-ID: <20260812135001.48949-1-kr494167@gmail.com>
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

In addition, use scoped_guard(mutex, &lp->lock) to restrict the initial
mode setting lock scope, avoiding holding the mutex across
lp5860_init_dt(), which would cause a self-deadlock when registering
subleds.

Finally, convert mutex_init() to devm_mutex_init() and declare the local
variable ret in lp5860_probe(), allowing lp5860_device_remove() and
lp5860_remove() to be removed completely.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
v3:
 - Use scoped_guard(mutex, &lp->lock) in lp5860_device_init() so the lock is released before calling lp5860_init_dt(), preventing a self-deadlock during subled registration.
 - Declare missing local variable 'ret' in lp5860_probe().
 - Capitalize patch title per LED subsystem guidelines.

v2:
 - Use full name "Surendra Singh Chouhan" in From header and Signed-off-by.
 - Convert chip disable sequence to devm_add_action_or_reset() as suggested by Lee Jones.
 - Use devm_mutex_init() for lock initialization.

 drivers/leds/rgb/leds-lp5860-core.c | 42 +++++++++++++----------------
 drivers/leds/rgb/leds-lp5860-spi.c  | 15 +++--------
 drivers/leds/rgb/leds-lp5860.h      |  1 -
 3 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index fd0e2f6e6e0f..bc2eb7bc76d6 100644
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
@@ -197,38 +204,25 @@ int lp5860_device_init(struct device *dev)
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
-	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
-				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
-	if (ret)
-		goto err_disable;
-	mutex_unlock(&lp->lock);
-
-	ret = lp5860_init_dt(lp);
-	if (ret)
-		goto err_disable;
-
-	return 0;
+	scoped_guard(mutex, &lp->lock) {
+		ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
+					 LP5860_MODE_1 << LP5860_MODE_SHIFT);
+		if (ret)
+			return ret;
+	}
 
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
index 5e0c44854a68..5b1a28b63093 100644
--- a/drivers/leds/rgb/leds-lp5860-spi.c
+++ b/drivers/leds/rgb/leds-lp5860-spi.c
@@ -38,6 +38,7 @@ static int lp5860_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct lp5860 *lp5860;
 	unsigned int multi_leds;
+	int ret;
 
 	multi_leds = device_get_child_node_count(dev);
 	if (!multi_leds) {
@@ -61,22 +62,15 @@ static int lp5860_probe(struct spi_device *spi)
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
@@ -89,7 +83,6 @@ static struct spi_driver lp5860_driver = {
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

