Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732243;
	b=c8/vO03WhheUCPANInKI5GteKniV8QsYScs/q9vk1NUHeVtvBBq9dX2cSzZbx6crx8J4
	 lq+z9Bm23Vo1vybVUlWIUTcsRbUXW38w0mhtUGq5wXmZGNwqCzKB8nXYazcfAOwnd4aPh
	 hD8fchwKqiRU+meKq8FR3wl+fbiZfyxX44jmPPViDRCGLLBZThu5+nGknczijRtM6mhY7
	 sJwvT0Lfs5D5KNv/LAKiDCCCjVxuSOKIlumvF/oHqD54IwM7P06GO6O555pUHpuJmYPiu
	 sWE9noNPF0NUAb6LxMwWaVHuA/t5P/blCmyVJ3SPkUDWCmx0Hxuvrk0QHEu3X4s7OBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k3pKKll9Zt00f038xEIgnuDfHiu+C5SaRqan6FZGPzU=;
	b=Vm9jLbK5Aq5S7rUH9flAAPoTvmUdm0DztCAAdY7a60+Pi20Teh2P3Gkm0308bGfYHtXw
	 UxzfDOjUPCrWo68bdwLz9Gs+fN8TGL9NnY+4VpdNRAu4hqSND/swYNLWap6OM1Ap2H3TD
	 RCHz9i8oMLQIErtdVFqySb1nt1x2XbZahSuNgJmX58Kvcm/FAdP/91gLkEgnqFRTHHSrS
	 mhDiLfcBq0CqDxHzTwdugdOmmSVfU2aOWMrxOfJSP4ccnITkhD+LkClmM7xxLMRKVsPuQ
	 xi6JsUwTSHIgIHRBpg6fi9NumYuXnJHHAb0KYwnNXi6eaq6T/AqgY+FqecXptYT5A3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fWJUg/PA";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B2D606A330
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B2D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fWJUg/PA
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so406405966b.2
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732241; x=1795337041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3pKKll9Zt00f038xEIgnuDfHiu+C5SaRqan6FZGPzU=;
        b=fWJUg/PAS41p4lEVsfrk5bJMI7Eqq2hDoLXIegImlqHI4Dh9jhVu2kYa5EHs/bMi3b
         z7/vK0T0V05W2xSVtMRY1jGSanQ/7sqNdJSehWcwkxSwb2k3k1nMp0pOLRubYMeKj32a
         /vZTeeVpZetoJzu4NN0kJpqX+1A0KyNlbQAmNMxkBdmzyPdf0e72iJ7hwgMa4nY0b16V
         froeoto3eafmzDofrN5ez3W3uGx9cz5rSNCm3O5w4rD11XNz61eza/zPL+MNFX17XsfI
         O5Gfm7flfy5J/yCZVgYTiXgNzaevAwnGNwz2qe0y6GnbUTuXwM6plIiz9KD/Hn3hJ1YQ
         lzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732241; x=1795337041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3pKKll9Zt00f038xEIgnuDfHiu+C5SaRqan6FZGPzU=;
        b=xUlKF6Uzr2RyNUtbrKH8BrbgcnwFDnaUvRdx28eFk/W5A+Un3mImpx0rzM5wLHxmOt
         FN2QKX2PSw6uKmM8yL2KEzAA1segE4vI0arSVF+IzwXdgXAtg5lcWop4WqysQDn/yhji
         lUVewPgc3xSycpczQq1de+u08UkLXGdLx6OuUYbWFQvBvY2nZmDzS5boFwYWTv/3goEd
         hGkAorPMmK3H/3QxxtcQGfuB0m9wRW6Oky2Py7wm8Xdy4lJhWkpingGHi7xqEkfQbum/
         TP6TOxhKkl4pIhYf4o8AsRD2Ddz+uOzs18nGkO0iei/1NE39xxtRMhRbkB9taZTDvCHK
         7NMA==
X-Gm-Message-State: APuU4Z+9R9gpmbETgH0BM6KDa1SUbOeny/VGKfo5hFuJlRI6oyU+kCp3
	34kMuzlBzKdf5uM2PSqOjkf+6Aas/HH/i4nUQhnyJyvfYhThw7BlqSwZ
X-Gm-Gg: AYBFou2sMzCB6CiwYNFWHlsls8KtQhMNNB97Asj5RumWB30qJtBibSVs+HBa4MNCbfg
	/zY5s9sCazB/xcoqdmyvwR8VVCwga5IOBWem90CSqavz4E0767R7gZjcW06MXc5ByU4z6o1BaLP
	FsIWYB2RS+JXFVMAFYHKgr+qyHqf7LguLz9jtd1s3Dh27yvz8dfsP4covHWXIjrqpLFxAqtWjy/
	znUOgD2PKGrb6gnKP9X1ikF9U5deOWunX38myjDUXy0OeB8burShkmHhEaTJwSDlhkLoTFlweCZ
	UWEGwV8Ja/ybKRT9ET0l8TPcUuHGSExTl9sSxa00XtxyLupjAMkxEzgptNBt/u+SE/A2d98+CAO
	Z22kpO7tfaj39e0CxdhxrvDMn68gQw6UuxxTI5lluXZVYAe/BNKe/Ynum8lJZ/5C1NN0LfrLuIk
	co8HqrVkapSlZl0ksPJhgm/XU7YE+qO+my3Y9Ux+hw0IP0l7TEoZLN/u76C/DOzCvnB9IobRb1j
	Y5KDYJN9fSFBDlqKrD7FG8caNTJmXt/NXPrYBWMbgn7M9cxQaGDoIX007ExxTI+qUW0R2Ej+szm
	ZNm9cZVOo0Qqs+upyKEf0jOSOBfKd0nOl5Q7fuc9cm20tqLmMKfgAOqEdXYlxzF7Y/72hf3kA1P
	DAnSwOYWRiw==
X-Received: by 2002:a17:907:d86:b0:c50:4b6e:329 with SMTP id a640c23a62f3a-c5096372173mr567826466b.15.1794732241262;
        Sun, 15 Nov 2026 00:44:01 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm288937866b.85.2026.11.15.00.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:44:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] leds: lm3533: Support getting LED sources from DT
Date: Sun, 15 Nov 2026 10:43:47 +0200
Message-ID: <20261115084347.70592-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115084347.70592-1-clamor95@gmail.com>
References: <20261115084347.70592-1-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the standard `led-sources` device tree property to
configure the mapping between control banks and physical low-voltage LED
(LVLED) outputs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 7db1105bee5c2..ad8bc3751e3e5 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -26,6 +26,14 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_SHIFT			2
+#define   OUTPUT_LVLED_MASK			0x3
+#define   OUTPUT_CONF1_PREP(x)			(((x) << OUTPUT_CONF1_SHIFT) & 0xff)
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_SHIFT			6
+#define   OUTPUT_CONF2_PREP(x)			(((x) >> OUTPUT_CONF2_SHIFT) & 0xff)
+
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -54,6 +62,9 @@ struct lm3533_led {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 leds[LM3533_LVCTRLBANK_MAX];
+
 	bool have_als;
 };
 
@@ -622,8 +633,36 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
 	int ret;
 
+	for (int i = 0; i < led->num_leds; i++) {
+		if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
+			continue;
+
+		output_cfg_shift = led->leds[i] * 2;
+		output_cfg_val |= led->id << output_cfg_shift;
+		output_cfg_mask |= OUTPUT_LVLED_MASK << output_cfg_shift;
+	}
+
+	if (led->num_leds) {
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF1,
+					 OUTPUT_CONF1_PREP(output_cfg_mask),
+					 OUTPUT_CONF1_PREP(output_cfg_val));
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF2,
+					 OUTPUT_CONF2_PREP(output_cfg_mask),
+					 OUTPUT_CONF2_PREP(output_cfg_val));
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
 		return ret;
@@ -690,6 +729,24 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
 
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	led->num_leds = device_property_count_u32(dev, "led-sources");
+	if (led->num_leds > LM3533_LVCTRLBANK_MAX)
+		return dev_err_probe(dev, -EINVAL, "Number of LED sources exceeds max %d: %d\n",
+				     LM3533_LVCTRLBANK_MAX, led->num_leds);
+
+	if (led->num_leds < 0)
+		led->num_leds = 0;
+
+	if (led->num_leds > 0) {
+		ret = device_property_read_u32_array(dev, "led-sources", led->leds, led->num_leds);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to get led-sources\n");
+	}
+
 	ret = lm3533_led_setup(led);
 	if (ret)
 		return ret;
-- 
2.53.0

