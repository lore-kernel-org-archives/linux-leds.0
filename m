Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B803D668F
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683273; cv=none; b=UqpctI7hyqPh2H0Ry5L1hgmDXn7sfNXbNjFMJIKJbA/K5ywITTGUcE1bTgzS1w8fXzRwtecO9+5maXqP6jTsfJP8WoFHYJJjz52swHqfGCbrZGIr28Kuxlp0VoLf6v0fMDunAzAmM4kn/KI4lOrTHMRmtNJaEB+GWFL6ZIgnJoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683273; c=relaxed/simple;
	bh=Q1JWkYH2GSDGMyhqdA0zssbSLknV+F95UIDG9qxluu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cS2nad4I7ad/lRnbeUGiKc2t/FHpNKYfDyn+yvOGOQDlzrr9cWDtth6/J7HKWEBnOFPznrRfxixSCCtI7BG8RNJSAv120ORD/fdShPVoCwMcKAsixlKr8DzUPFhc7qpcb7HRTv/Q2OoDG9UV+2ZfQV6Xz510SHhggBOa5xf77xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIfIV5sb; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIfIV5sb"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bef1e6423e7so597863766b.1
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683261; x=1782288061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd9XYaCysxrts0G4Y5wJXzVAEaPGW9YIawHblvLTeko=;
        b=bIfIV5sbroPAw97RqiqgQ+MThuJpMEFyw3O3WLVQIPxPBnMkmGKvcckah2q+aG22su
         Hgmu89MMq7FKnF/RBTR/EIkxp3yzNf8cpiT9jadV2zJ0sQgWQzDcB0eR8A+PP4kvrBFD
         ehGD1ARdat+lrWTL2WY0pl0udfmrBZapVacR/nZaDbV6OQwC+UwJ5fr5t2akXDbiRGc5
         oDxCtuaBRg4BNdGWlH/nuwZvWVqEs9safzkRibC7R1w3ntqa2i3iKlY0ToA6sdFxzk4/
         xqGc2N1VWEERlHYnerLklN6fiGGXQoPT3JpgmYb4w6c4euT35PSjs8+wjBJ6tQ1yo88j
         8Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683261; x=1782288061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bd9XYaCysxrts0G4Y5wJXzVAEaPGW9YIawHblvLTeko=;
        b=kQUEEm3zGRVPV2vjs5xaTU14mZNmmnbt3OLPGsFZQZdn2bY24pV2b9TagDCEZJnGhB
         kozTUjWusgtRBJB/mGCM5k/3NQwnBw+N4ChcZsyO8uP4A211Y4xTJL6iv3qhEnSFmKw6
         3pyUxwDDUTN0h9LIAAIT2SqB6cH5hKA7cF6OhQTQUuj+HuVBg5J4TvyUUFtzro/KDaj1
         XLUdTlx9lRJTkJJKI3cawILk/MQW1zld3isvbnSBQNPUQcDJcPX2/io5kKlXcV0Tkkvg
         y9ui4l0qN/N/EgqBc+I09zvz54wpRhYye9wmB1qkR2a9AcC7JvksKX6PWte3/PgZ1ZfD
         ZbmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uceeuip04lHWcDmMsH5YfCRBjy4CQ4B4PzhIgxkvuF1RKD+0g4y/8vd51dpkDHWAtO2lztP+CE3Us@vger.kernel.org
X-Gm-Message-State: AOJu0YwKAFG6Q+hepixtifW8udckEuY7dXOJou1EfZn9YipQ2KMiGkT1
	2OlplNj7kQq3Rg2VNgPLY4JTQto45+K3lxn9+fU7waf/ZCBxdFTOaquz
X-Gm-Gg: Acq92OHDb377NZXK9YZ2Sam8rIfR9d2BunEip0CwTYAV3RnFRcx2dpa0eQQHVcZVF1F
	CVG2G/bVpINQjVWhZrOPdArc1WZdEI6wD3liSlt8rNvVKKJqLA9WswzaT79pXvcuJgymmcPX/SL
	jutwYsH9RHxzh+k+9o6Y+fju7xceh9ifjbmyiMIWTk4pL8DUZ6kndAnWfWdMcwgKLh/ARaWr6Vc
	s7QAsdUDARifnaEl8xQ4CPP2GqR6F8mMWTnTrz+nDaB6AyAT43v/mmtfV0DtmZFAnSGWQSv1uur
	wGkypmzdb+kwbDSuadqsTTmXUPdREkBOhSouZKTtvTq1PCpj1kYgsyjbmND8nGVyqoz2RXISfBE
	bfU9II42AXZIv9UH5FwBg/JRX2u884tnh+8GWhRqWEDesNJCq9B1PJg2j+f4mcgr4CjiIg+RGKX
	DCzQ==
X-Received: by 2002:a17:907:b03:b0:bee:875d:af12 with SMTP id a640c23a62f3a-c05a09bc11dmr128164966b.0.1781683260892;
        Wed, 17 Jun 2026 01:01:00 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:01:00 -0700 (PDT)
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
Subject: [PATCH v5 13/14] video: backlight: lm3533_bl: Implement backlight_scale property
Date: Wed, 17 Jun 2026 11:00:30 +0300
Message-ID: <20260617080031.99156-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the device supports linear and non-linear modes, implement the
backlight_scale property to describe this state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index d003d5802508..c99fc68cb669 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -142,6 +142,7 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
+	struct backlight_device *bd = bl->bd;
 	unsigned long linear;
 	int ret;
 
@@ -153,6 +154,9 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	bd->props.scale = linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
+
 	return len;
 }
 
@@ -295,6 +299,8 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
+	props.scale = bl->linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
 
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
-- 
2.53.0

