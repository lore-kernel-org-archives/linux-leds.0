Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EB31327A
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721924; cv=none; b=UZi+ndxO7AsHwT/K6dtKp+j0CG1lJT025F4kO3NbvCnY7DD1i8QsFII0WEqh5vErAMp2dABnOIQOjvNFGJaI6EdzpvvNglaCySaZrREdi5/JDEvxEls8H3s8qiskY0jAnDirfOGnBR2OdRiRlvkBwZNWOukpp5Lx3qYg7iLMvow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721924; c=relaxed/simple;
	bh=1X3Fe5KMAyI8d0lBSX7gzgdG4WYUQVZ8AWRde1CmRRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XK9TmNJOwitElQVgyVAQfoM0PLhqUYk/KueIzKtCQwY+W97nkTT0lD6CLI4Md0xlJ8LOrnYuogww1X0PQc0IowL7npVNLF4J10hyFYesN5a65YllqAdKOtx/etG/8bAEyo+mgLRlxZBVutzZdJtvn5e3L3HFk+JAfauwx3chLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtSr6VpN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtSr6VpN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec49f7e35eso353349866b.2
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721922; x=1781326722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMzv/S8Y4Icyy6C4SSXqpDWOb9w1xnX2+g+CSvM++O4=;
        b=WtSr6VpNr5A1Ml2hGyJFaVqvyy6fxdgIFVLXIUFtW0YsU3e93OWG6eVDH8OYO/VAXH
         qnqlb2GvKyBGxF+ZNcPHtJeyGzapi/3lhMyI4yUHGvLA4eXjYkHd8e0xqptkOzsX+p8W
         lTXYexnL2obWiFIU7CJRXtRV8/QzFvPgR8ctCxYHSSwshvvUSOM06XPi6V+nd1FcmCMh
         P4s5eYoK/Js6UOp083Gw+pKhrJ6JBvWzgf/Q75tkU4sVMVkl420LeDTV2CBMiCNb5X2V
         KlJ+AW/m8Z4g7n99HixqijrLfpY9aaisaNNkmWbiziId9dTqjRv/aJzhQTAepwRJhyHf
         RCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721922; x=1781326722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMzv/S8Y4Icyy6C4SSXqpDWOb9w1xnX2+g+CSvM++O4=;
        b=lT9DbuTTH2HlbyjxtEvgGEIacJs19tkI9fIg4AQtf/ZkacK9Xe/UcwW/1aTpeoq/Vg
         SlmhZ1uVF1XkQJtbp7g/XibnLSDHtD6BEg9R4GUeHEtKYhVyXmZ+lIoTNEWH5mc1sdmu
         SCLSESeNTU1aGSS+DydzCO+/OmoKWRIZ6Xcmt6pCwe83IePxdQlyKoSKE29cHgALzj6k
         gpQ4MbN2c1+uxg8yen30qM7P4a/5uCMrSVg2CxMkkqdBtZqSydAk3L0dnD4ngbqhDbZE
         9NzufI2TGxALCkzf2DJOk5E3n613P3WNgQ/1uQB/EM7pvLi+3wnBxa33jQXGoNfu1VJt
         ke5g==
X-Forwarded-Encrypted: i=1; AFNElJ9PtrRajDnQ7USggYKqNENRPIrIpOdboIkU2TPiamkTVf6Vovcm5ne+NEqW9gwY2yerLhNUQQzULkob@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSvPVL6yxdF4t8QgA68VQY5hh0ca6SwjOLp2Moi1CT3RFQGe0
	b3sGeiqc+8xphcA+VqNTc24pcQTbjpf0d0V3iQssy/MgETPOUy/Vd5aW
X-Gm-Gg: Acq92OHVVICxN2akGfMwjdu7GNYE1lLELKY8bzMuLCub7nmKzKyfVNIvkqe/Iq54TF9
	mdWIacEbgCopYkdyTHUTSr0nFGvLxNgxbDZ5VeSZ1np7KwBuw2+OenHJatrzNTKqFUIjwfxZ5xK
	YgsEGmXQqjr+yj3CF23zOi2TzMt4H9nWx4AaJy4ko/nEH8HqU85qnvmklUBzq8c4dTRCDl8GJNJ
	mjwaw1Igv9kbslBKPp8qAq4k7mbP4U3Bb/r9pg7h4y+uqZ6Z6XYKMbOwxhEu5u5iqNtCA01bKKk
	FIjT1M4UuheOSUexByeduqb5LqNNJHLSwL7yh+EBMKZlug7B3sF3UpR3XbXlsHstA8Knkl0kdAK
	7UJzI64jS1AmqNTClBeEK/SuAvVCy7lQwpbcR8u+ghobrP83Z/0mE7mBQDkP2rsIQ0KZWaVJZ+L
	jFfyZepIBqgf5hQJr63pp81vhdQI3GOQS45g==
X-Received: by 2002:a17:907:6d05:b0:bed:afd7:185 with SMTP id a640c23a62f3a-bf3737ed359mr332707666b.43.1780721921881;
        Fri, 05 Jun 2026 21:58:41 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 12/14] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Sat,  6 Jun 2026 07:57:36 +0300
Message-ID: <20260606045738.21050-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 9ad7ea1bbbcc..4f8cde9f290d 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -37,6 +37,7 @@ struct lm3533_bl {
 	u32 pwm;
 
 	bool have_als;
+	bool linear;
 };
 
 
@@ -226,8 +227,14 @@ static struct attribute_group lm3533_bl_attribute_group = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), bl->linear);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -281,6 +288,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	props.brightness = default_brightness;
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.53.0

