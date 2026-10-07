Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4F645C710
	for <linux-leds@vger.kernel.org>; Wed,  7 Oct 2026 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363323; cv=none; b=W09xI8fK6jlYiv7s3IBcriS4+1yHXS7ZP0vkR/nSGO6MGX7fwsU8sQmPZNBhi+5l4R2+NYw1txOVVH5WugShb+AbSAQ3GyPr7a21FbTGWUOHiwnbWW7nrx1EtiZNQCkWctmbSRhayf6FO1EHvBD97o/fLfARN2uNC/sGv01KXYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363323; c=relaxed/simple;
	bh=5eZ1a4SXgjAw/gIolKNVttasFyWnY6HVJDL80VkEzXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWlGj6KkqPmAVBHYEA5DoJmngVG6xmOrM8ZheRLceCDZ4kqIifx2s0N4a52Sv9nLchO38q/vsD55Cz8UzlahuwZRWU+05hTqZK0VN7uEr2oW3GWzIqvyt7KoEblVS5fOM+R43wA3HRSm7PxsaiBGRLNV8YFwjmyeHH9yA5rR504=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABvmK8ny; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABvmK8ny"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so36437705e9.2
        for <linux-leds@vger.kernel.org>; Wed, 07 Oct 2026 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363320; x=1791968120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6kvoE+4LLN3yBq8dBOtqw46aC8PWIBlFeTpXdaK5sQ=;
        b=ABvmK8nyGmXXQE7Ot0CbymsJPc+c03a/tQLyo62jANzMk+wyWija8wM/R9wr9k+UUw
         ElSADbAAL6GskNfhqkzkVBATYrOk2MAJCpOQ4ZmB5sRptW8TQarHW9uxUsT//IucvKn+
         iUCe9fjE93iia6lVO8WW0+w/iIV953M+IxYbyPOVSrhBlU99GEZX5bIQKYhjO2eiWL0T
         D154WrVPCFjhN/Hi01f6EpMfMqys66b5+DQPFWEZ6foa14idyhKix4sa61OcF9x8yOoT
         qHVgW+mZKRYUnYgw0jkaBx5Tv55hayAVu3qHlydCLOYT07VyX9VDibYQosshULOM5dyO
         KDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363320; x=1791968120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6kvoE+4LLN3yBq8dBOtqw46aC8PWIBlFeTpXdaK5sQ=;
        b=o0RP0FPjA8ptwgSC4ldkgX/TCxeeE5RmIgVd3ou/+TeG6edRhX0Oc4TGIvx3UniUye
         ro0C5z2voDC+rB9Imqcmfx4HNNKWh1A27iyGP30XEY5hxbNM7d4rWT8zHgcimFx39+JQ
         1Eck3aTJ/wuKqVlbAhMNv5q2ux/VUwFgmx58u4/BsXnXblAvYcbj8ucfr8UxzAOIb+gk
         mfKxywfehawOPOEPG3ivDs5rr617c2rfUZan4ntmTfMwXW+n02Zp2pyg3LihIpX20YiE
         wPvVPWn2JU7twdwwh0etj05S0rxt6nOekQgbCN/H3nJgP4LGV311cxNy+j90NuKruFZt
         Qyxw==
X-Gm-Message-State: AFuF++mc94dvqjnw5FqkYmgRo0+Ts9DhS62w26oNBFc8gSZfWwBkamow
	rrGQi8WJmAr81YEdqHXNN5GHsblIt1JTSN0Z1tHj9mhZAWkWUiJtPMTTB+ZCfw==
X-Gm-Gg: AYBFou3LV6qJYkUY402bfBzzN8YQKlU2L4tGcNCGfZkAejmAuRZXgAj8j4ADHqYYXAx
	56es6SEToMDZIF8fVLm/grz1v6gg4LZb5jVc0aIwCxKCS0wx4iLXzUErG7C82aG73T5PJaO+TOL
	7kcHYofL3k3ryABolChe1LHEu4GLP3Nz8qTt9JxyGyEIqeFzYzhEnUnr3mDJVKShmyPZS2YZU/T
	5e/I/HbqPvTcTAC3lgHmWCn75QEOOVNR4HIsI51lFO9JKHQE8dt7xgenOw0OqYqP11dOh3VIfgB
	wdo7R7ctOaJvNhPzXn+tDJ3/MbLoep1zkGZnqBPBa9goMWwrPYuE5Y3NxwI4AhRds6RkRAcqSWx
	1HMNKCYs+Xbs/E2IOLD8lcmKA6x5gXxvOSTSKb+Wuhc4vgQYMoGnOeE+NIYZhD0sFVhutcsidUa
	LyGs1569ZyJDV/iFD5VhVBDr+GmH47UmtspeBpgUHlM5K1Fec7zgG8uUe/6dHGqyXd28B9vWwuf
	sZrzT+lCv0GmhdxY/E=
X-Received: by 2002:a05:600c:810a:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a1802eb4b1mr22567935e9.7.1791363320452;
        Wed, 07 Oct 2026 01:55:20 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current Regulator for Flash LEDs
Date: Wed,  7 Oct 2026 11:54:57 +0300
Message-ID: <20261007085457.98762-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007085457.98762-1-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT1270 is quite similar to the AAT1290, but it does not support the
Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
uses an earlier version of AS2C, namely Simple Serial Control, which lacks
address-sending capabilities.

Differentiate the chips by using a description structure with a flag to
indicate if AS2C is supported, placing all AS2C-only features under a
conditional check.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/flash/leds-aat1290.c | 66 ++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index 49251cfd33509..773cdcc73a9e1 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -43,9 +43,6 @@
 #define AAT1290_FLASH_TM_NUM_LEVELS	16
 #define AAT1290_MM_CURRENT_SCALE_SIZE	15
 
-#define AAT1290_NAME			"aat1290"
-
-
 struct aat1290_led_config_data {
 	/* maximum LED current in movie mode */
 	u32 max_mm_current;
@@ -59,6 +56,13 @@ struct aat1290_led_config_data {
 	enum led_brightness max_brightness;
 };
 
+struct aat1290_led_chip_info {
+	/* led controller name */
+	const char *name;
+	/* Advanced Simple Serial Control support */
+	bool as2c;
+};
+
 struct aat1290_led {
 	/* platform device data */
 	struct platform_device *pdev;
@@ -74,6 +78,10 @@ struct aat1290_led {
 	struct gpio_desc *gpio_fl_en;
 	/* EN|SET pin  */
 	struct gpio_desc *gpio_en_set;
+
+	/* led controller description */
+	const struct aat1290_led_chip_info *info;
+
 	/* movie mode current scale */
 	int *mm_current_scale;
 	/* device mode */
@@ -101,15 +109,17 @@ static void aat1290_as2cwire_write(struct aat1290_led *led, int addr, int value)
 
 	udelay(AAT1290_FLEN_OFF_DELAY_TIME_US);
 
-	/* write address */
-	for (i = 0; i < addr; ++i) {
-		udelay(AAT1290_EN_SET_TICK_TIME_US);
-		gpiod_direction_output(led->gpio_en_set, 0);
-		udelay(AAT1290_EN_SET_TICK_TIME_US);
-		gpiod_direction_output(led->gpio_en_set, 1);
-	}
+	if (led->info->as2c) {
+		/* write address */
+		for (i = 0; i < addr; ++i) {
+			udelay(AAT1290_EN_SET_TICK_TIME_US);
+			gpiod_direction_output(led->gpio_en_set, 0);
+			udelay(AAT1290_EN_SET_TICK_TIME_US);
+			gpiod_direction_output(led->gpio_en_set, 1);
+		}
 
-	usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US);
+		usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US);
+	}
 
 	/* write data */
 	for (i = 0; i < value; ++i) {
@@ -150,16 +160,18 @@ static int aat1290_led_brightness_set(struct led_classdev *led_cdev,
 		led->movie_mode = false;
 	} else {
 		if (!led->movie_mode) {
-			aat1290_as2cwire_write(led,
-				AAT1290_MM_CURRENT_RATIO_ADDR,
-				AAT1290_MM_TO_FL_1_92);
+			if (led->info->as2c)
+				aat1290_as2cwire_write(led,
+					AAT1290_MM_CURRENT_RATIO_ADDR,
+					AAT1290_MM_TO_FL_1_92);
 			led->movie_mode = true;
 		}
 
 		aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CURRENT_ADDR,
 				AAT1290_MAX_MM_CURR_PERCENT_0 - brightness);
-		aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADDR,
-				AAT1290_MOVIE_MODE_ON);
+		if (led->info->as2c)
+			aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADDR,
+					       AAT1290_MOVIE_MODE_ON);
 	}
 
 	mutex_unlock(&led->lock);
@@ -178,7 +190,8 @@ static int aat1290_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 	mutex_lock(&led->lock);
 
 	if (state) {
-		aat1290_set_flash_safety_timer(led, timeout->val);
+		if (led->info->as2c)
+			aat1290_set_flash_safety_timer(led, timeout->val);
 		gpiod_direction_output(led->gpio_fl_en, 1);
 	} else {
 		gpiod_direction_output(led->gpio_fl_en, 0);
@@ -475,6 +488,10 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	fled_cdev->ops = &flash_ops;
 	led_cdev = &fled_cdev->led_cdev;
 
+	led->info = device_get_match_data(dev);
+	if (!led->info)
+		return -ENODEV;
+
 	ret = aat1290_led_get_configuration(led, &led_cfg, &sub_node);
 	if (ret < 0)
 		return ret;
@@ -489,7 +506,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	aat1290_init_flash_timeout(led, &led_cfg);
 
 	init_data.fwnode = of_fwnode_handle(sub_node);
-	init_data.devicename = AAT1290_NAME;
+	init_data.devicename = led->info->name;
 
 	/* Register LED Flash class device */
 	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
@@ -528,8 +545,19 @@ static void aat1290_led_remove(struct platform_device *pdev)
 	mutex_destroy(&led->lock);
 }
 
+static const struct aat1290_led_chip_info aat1290_info = {
+	.name = "aat1290",
+	.as2c = true,
+};
+
+static const struct aat1290_led_chip_info aat1270_info = {
+	.name = "aat1270",
+	.as2c = false,
+};
+
 static const struct of_device_id aat1290_led_dt_match[] = {
-	{ .compatible = "skyworks,aat1290" },
+	{ .compatible = "skyworks,aat1290", .data = &aat1290_info },
+	{ .compatible = "skyworks,aat1270", .data = &aat1270_info },
 	{},
 };
 MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
-- 
2.53.0

