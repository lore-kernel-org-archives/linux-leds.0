Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676552ED49
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915508; cv=none; b=mFwolD+oSlKPxBGfVr82Hp/ycOdTJkPk/UhLW/ZJWOeVEp0F6QMBivH5T2MmFg8B6mTokDKsZmoWTGTeMzKkvqa+Jpe0+0ZbMEDZ2j9dxv7sjzllhC4vXdD4dIfnY/RqvotK9BhB2931UsbbUoMs1xwPj83TWKytO7BIK3uQjT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915508; c=relaxed/simple;
	bh=w/TBAy50Xvs1iSh7c83nn17No6fTeGITzboWEa+p8Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU3W9ZpqxHtlCUXw+n2PBcJdOO+M3xQKUOBkCzvWG+oJhqT3gt5QW8gkh9Zn7varIVwYbzHgNOrfrDgjln8J9TVecdzXwXNxf379W46s6jf3iju/6PoHOUTM8ymxBRdysUp/B0LKAHZy2YDJsirtWDEsxO4oUp+vns9yGLSOHRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hN9s9UNR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hN9s9UNR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2987882f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915500; x=1792520300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=us6ZOoOt/pJv9J436y0FFNUQKl2GoWu4INMGlGp+gOM=;
        b=hN9s9UNRS1OfSh3Qb98CQmWdkRJ+uAgeAxiWuEb+T7lDsR6zZsasAsQ8yunzhrAQeT
         NRyIjojihmxhzkq5XX35sV4Ag4RDhsTUybH1BrtbQZP/G7bPeHyb4cfyPJthZIaaJacR
         Te86SamoMJMAd4OxooYRlmTTyJ22UNfFDfWzXx+azBj6G/LGvabGFIL8SDZR+O7py39u
         ntxvqn3UrhlqlTE90RS8PMwSAMRe1kmF4rlYH+uM0ggkc5detDiMqWJTar9aY+4gVjFp
         3HfkuHFTwHEr4ILJYu9d9LTfLOkRgisHp0Wz3srhEoLRDnkGMgiYAAtJ6SDLsA+9Zjwl
         MNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915500; x=1792520300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=us6ZOoOt/pJv9J436y0FFNUQKl2GoWu4INMGlGp+gOM=;
        b=JWvhqpAGUDerhrZbyXFgSy7Vq4iW1CMa/JVsEFZ8dNfFw4CQU2H1m3dT4lnIZx3hbY
         GhhJmQo1cx6HdXcCufLVwZFB2RgIiR6rYVyYn5nAG3RO73NVL5KQVkJY7CdJBG/zY8e9
         o86sNjWMYaIYLvyWx0PZ5mCvN+7tNV0bq+JVi/xUfG/Dgfe79dcn7eaTX33CrDidW0UA
         6uEPwElY8j5oTYRtZzJA7c3wWkMX2n3fagZSGVYz5ORdzfTN+TtLnoBqkS/rqyekreXk
         Y83F1Y7d7I5Kzy1+rXN4A0y7Jy+BOr1k+BZlALUIhzaUAAk/GtVdDOCOVCdZyGB1D50R
         uH/g==
X-Gm-Message-State: AFq9FYKtrBW1SBP7HrYJEDM9TpKJbAIwFc1Mb21PR24UbXEOEFz2J6Jl
	WEuNBHodA1kSk0U3Kham616kYZJxGSs4M0PO1yi7WfOfhuin3cgODYTY
X-Gm-Gg: AYBFou01ksU1bDduYHeGJJNHOGAcJh+y29yJ2lax70bduVHDQE2Ttx2uv4NdLEqoWjn
	lSEl+5Z5C/6DVmV0fJyPzQvHEIbc+Vt69E6JH7oe6hDUJHOVA4zLRXA0AMxtd0JIN0I5IcnLZAw
	8PfpxbF5lkmP7pwq41uRWBm/OtJWoS03wq7eFB2Yc30R+qCQwUUAwZL3BZ/x0sxnupaAesOURnE
	Ym11KuKRCqF8VLZ5hWVGb+ZbbB95/6z2zkwNA3yiFtp2yklOGecsTe8tkm14E3xfLh+HPQdJOL2
	JLVZRBN974fIBwuFt6ETcIsrMWsMS3Yh8MPuh9jL/rfjtAK0rYttHO/Bw+KJT3N/C1QuoItGq1G
	GVz15UbohiJ+sJ+n6jtLJyTnue4pJzbXgxnPSVYUEazfOwOk1ykKTzM83XS7ngoJ8IhWjs98uGk
	QZxDWw2v6Bc3+9/V1ZiDKwUwB2nIaSgKG/Ix5r7qbEYSZX07khSP1ZVEdLipnTOojywY+OvVL6I
	8S7OCm0QpIjILZoyN8=
X-Received: by 2002:a05:6000:2993:20b0:48c:4442:54e with SMTP id ffacd0b85a97d-48dbaae710dmr19310020f8f.30.1791915500238;
        Tue, 13 Oct 2026 11:18:20 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] leds: aat1290: Add support for AAT1270 Current Regulator for Flash LEDs
Date: Tue, 13 Oct 2026 21:18:03 +0300
Message-ID: <20261013181803.496627-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
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
indicate if AS2C is supported, Maximum Movie to Flash Mode Current ratio
and if flash timeout is fixed by the hardware.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/flash/leds-aat1290.c | 91 +++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
index 4bde0b07fe785..cc1771438510d 100644
--- a/drivers/leds/flash/leds-aat1290.c
+++ b/drivers/leds/flash/leds-aat1290.c
@@ -33,8 +33,8 @@
 #define AAT1290_MM_CURRENT_RATIO_ADDR	20
 #define AAT1290_MM_TO_FL_1_92		1
 
-#define AAT1290_MM_TO_FL_RATIO		1000 / 1920
-#define AAT1290_MAX_MM_CURRENT(fl_max)	(fl_max * AAT1290_MM_TO_FL_RATIO)
+#define AAT1270_MM_TO_FL_RATIO		7300
+#define AAT1290_MM_TO_FL_RATIO		1920
 
 #define AAT1290_LATCH_TIME_MIN_US	500
 #define AAT1290_LATCH_TIME_MAX_US	1000
@@ -43,9 +43,6 @@
 #define AAT1290_FLASH_TM_NUM_LEVELS	16
 #define AAT1290_MM_CURRENT_SCALE_SIZE	15
 
-#define AAT1290_NAME			"aat1290"
-
-
 struct aat1290_led_config_data {
 	/* maximum LED current in movie mode */
 	u32 max_mm_current;
@@ -59,6 +56,17 @@ struct aat1290_led_config_data {
 	enum led_brightness max_brightness;
 };
 
+struct aat1290_led_chip_info {
+	/* led controller name */
+	const char *name;
+	/* Maximum Movie to Flash Mode Current Ratio with 1000 presision */
+	u32 mm_to_fl_ratio;
+	/* Advanced Simple Serial Control support */
+	bool as2c;
+	/* Flash timeout is fixed by the hardware */
+	bool fixed_timeout;
+};
+
 struct aat1290_led {
 	/* platform device data */
 	struct platform_device *pdev;
@@ -74,6 +82,10 @@ struct aat1290_led {
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
@@ -101,15 +113,17 @@ static void aat1290_as2cwire_write(struct aat1290_led *led, int addr, int value)
 
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
@@ -150,16 +164,18 @@ static int aat1290_led_brightness_set(struct led_classdev *led_cdev,
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
@@ -178,7 +194,8 @@ static int aat1290_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 	mutex_lock(&led->lock);
 
 	if (state) {
-		aat1290_set_flash_safety_timer(led, timeout->val);
+		if (!led->info->fixed_timeout)
+			aat1290_set_flash_safety_timer(led, timeout->val);
 		gpiod_direction_output(led->gpio_fl_en, 1);
 	} else {
 		gpiod_direction_output(led->gpio_fl_en, 0);
@@ -308,8 +325,10 @@ static int init_mm_current_scale(struct aat1290_led *led,
 		20, 22, 25, 28, 32, 36, 40, 45, 50, 56,
 		63, 71, 79, 89, 100
 	};
-	int i, max_mm_current =
-			AAT1290_MAX_MM_CURRENT(cfg->max_flash_current);
+	int i, max_mm_current;
+
+	max_mm_current = mult_frac(cfg->max_flash_current, 1000,
+				   led->info->mm_to_fl_ratio);
 
 	led->mm_current_scale = devm_kcalloc(&led->pdev->dev,
 					ARRAY_SIZE(max_mm_current_percent),
@@ -360,7 +379,12 @@ static void aat1290_init_flash_timeout(struct aat1290_led *led,
 
 	/* Init flash timeout setting */
 	setting = &fled_cdev->timeout;
-	setting->min = cfg->max_flash_tm / AAT1290_FLASH_TM_NUM_LEVELS;
+
+	if (!led->info->fixed_timeout)
+		setting->min = cfg->max_flash_tm / AAT1290_FLASH_TM_NUM_LEVELS;
+	else
+		setting->min = cfg->max_flash_tm;
+
 	setting->max = cfg->max_flash_tm;
 	setting->step = setting->min;
 	setting->val = setting->max;
@@ -476,6 +500,10 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	fled_cdev->ops = &flash_ops;
 	led_cdev = &fled_cdev->led_cdev;
 
+	led->info = device_get_match_data(dev);
+	if (!led->info)
+		return -ENODEV;
+
 	ret = aat1290_led_get_configuration(led, &led_cfg, &sub_node);
 	if (ret < 0)
 		return ret;
@@ -490,7 +518,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	aat1290_init_flash_timeout(led, &led_cfg);
 
 	init_data.fwnode = of_fwnode_handle(sub_node);
-	init_data.devicename = AAT1290_NAME;
+	init_data.devicename = led->info->name;
 
 	/* Register LED Flash class device */
 	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
@@ -529,8 +557,23 @@ static void aat1290_led_remove(struct platform_device *pdev)
 	mutex_destroy(&led->lock);
 }
 
+static const struct aat1290_led_chip_info aat1290_info = {
+	.name = "aat1290",
+	.mm_to_fl_ratio = AAT1290_MM_TO_FL_RATIO,
+	.as2c = true,
+	.fixed_timeout = false,
+};
+
+static const struct aat1290_led_chip_info aat1270_info = {
+	.name = "aat1270",
+	.mm_to_fl_ratio = AAT1270_MM_TO_FL_RATIO,
+	.as2c = false,
+	.fixed_timeout = true,
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

