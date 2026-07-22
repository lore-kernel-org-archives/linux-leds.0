Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4944322F7
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736947; cv=none; b=on9xFYtC5LZem9VXnfxu6lp5E7MXrcJfGkiruupvAFb8PsUp0ih1/7pqrBDVLTr4imXH0daaz8e5uvddoJUhjE6nzyVLgfuLIUMjsS3AE4OQz+Bic/s6QiUYIZq/tcZzPNS7ndA1FNTZfM4Suy9qPJzFTO73Uf2vp/tdKQkJpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736947; c=relaxed/simple;
	bh=1WjDDJIs2KpwQ8QZiN+WTOjS6oF6XQb/0PQCbzOEvpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wng6g70HDDUhbpLy3roYvZW0gWlSgJssQsiZKR0s1iMyknMjziNB9CZM0Razqfw8H5zHmFwJ9nQn9SK9qgM3ba2OXAxPqqI+3miJMsmnQ87piNx0azeaHkWh3QT8BgW2hSm/TYcZs3ZVaIEMuZSRDXjrd83h4r7NaXS85D7dgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI1Si5cr; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI1Si5cr"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96c92c0980so6207503a12.3
        for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736945; x=1785341745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5y6lwPBQTK8Q5EI0nQrZABCngKWM2qP9sIU4ndSGI4=;
        b=UI1Si5cru3RwicWXcBwdSVSvgLSCfk+K1AqFRfwbu4Y3Kob2jP/227ixbu2Iuc3Rm1
         tA9i1N63yFLtIsNQZfoDg8gkBWgu/je7dfhhdhUei3lD0xY9ZN3YOO5l884a52x+Mfbo
         50bxBu/W6tVtDqhCZ19wvXMctkAqNetZBISpXu2smce+TBiTzVmpOzqYTKBbQfHGCCfX
         DoujCiWYUE4luT+kxBfV3imEwpoY5OvHSngRCT1WwbZHTnvh68Z+NdfBMQ+vbMnAlyPZ
         eD9TSxZdcEoAS8+tZxizfgldWZsh0MBOubzxmCRHQxgUzI3hhW/TZ7LrmYrRtdED+aqA
         TuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736945; x=1785341745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5y6lwPBQTK8Q5EI0nQrZABCngKWM2qP9sIU4ndSGI4=;
        b=BL00JWOPw3ebqom7J3pE5kLBQtYAH2/c+2kzSKDiFLNHj+d1ZSIWOgD4+yyAkXf26A
         OrfJy2TW/EXOIuDwnvBpFmwPqAlJth8OYwLtNuXoAPaULBW2JptLPegpoaLcq87hMe8D
         xHNi31uF+ezA50BXtR4lCB3klC45uQVzae4zamSk/Z02Xix1eqS8XtdVMK1VKjS4m7KS
         GVF0M2LM3yypEi8xnE1Gs+wdppZHphr/ATFr96sCpzZ87xQ7+fYyoEkNm1ZxGGEIj4b6
         v/6xNPU2Dt7khzI4rJbI+Y3MaOiGsc+Txac5gFRNgT7uopHypI4Mq/gR0P9fRBjPX4Lb
         tKug==
X-Forwarded-Encrypted: i=1; AHgh+RquxMR5tZKNFiBkyVFrQQDynO6fC9IQ6zgWyCRzIfLVxVSgFmNSgjkPRe8DFWxkWmTzyc/FDBKVHPoE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc714k+8KQs3P1YYYt8HEaccqxEUWNrfAadWL7H60YcxpZCFlg
	zsBm3SFbQt74Oyg65x8NS4BRQvs5wD6xnZYWBqMcY3i0j2XEVR35qE8=
X-Gm-Gg: AR+sD128W+oQMPlEmfAPKsKVODAFdYssnrBzN1D/v1eJKcVJrCvqfVkCMrA4gPAheD9
	IIfzZbbnzYjwTm9qrKNKXYhSokaM/kHNP2jLbOTyH0mlq8l4wm7pLzew7DELTBTEWl3XDI3S0JJ
	uO1EAN4x4NJUKfCWg8l3G6JLxNVCQZDoot7zBVoJf5EZ6GVLFYH4x36zaHhYHpHrMvy+mri89wM
	Khd6cEu9M0IoiWfeV6iv8sxNfoaKREFToYtCIg/w1Hwf6XqqlMEIvbCLgYOSEmHu9xdxHzKuGgi
	0svsqdPIWRb4BdpUr87kl3ztYf5WcuIyAKpWcLiW3SFdlcdQgnWkmNysUnC/w+BzXV5/5VMFWqa
	gUgDL3yyVBVYiAnyN75tdA3rzEWyJjppiambIQiLV3ShcGCk6WLh+MDopXltJj+TRR0Fz+cgERB
	h0hzj6il6S/kKqdGBJbkJHT5BkRg==
X-Received: by 2002:a05:6a21:6f06:b0:3bf:6c08:2b27 with SMTP id adf61e73a8af0-3c3ada195f6mr26726098637.47.1784736944935;
        Wed, 22 Jul 2026 09:15:44 -0700 (PDT)
Received: from t-rex ([2401:4900:c212:546e:3d3e:f0d9:52c0:8a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm21024650eec.1.2026.07.22.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:15:44 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: kauschluss@disroot.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra <kr494167@gmail.com>
Subject: [PATCH v2 1/2] leds: rgb: s2m: Wire up of_match_table in platform driver
Date: Wed, 22 Jul 2026 21:45:18 +0530
Message-ID: <20260722161519.9610-2-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722161519.9610-1-kr494167@gmail.com>
References: <20260722161519.9610-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra <kr494167@gmail.com>

The driver defines and registers s2m_rgb_of_match_table via
MODULE_DEVICE_TABLE(of, ...) but never assigns it to the platform
driver's .of_match_table field. As a result, the kernel never matches
this driver against a DT node with compatible "samsung,s2mu005-rgb",
making the MODULE_DEVICE_TABLE entry dead code.

Wire the table up so that DT-based probing and module auto-loading
work as intended. In addition, validate dev->parent in s2m_rgb_probe()
to prevent a NULL pointer dereference if probed without parent driver data.

Fixes: 63ccd117f425 ("leds: rgb: Add support for Samsung S2M series PMIC RGB LED device")
Signed-off-by: Surendra <kr494167@gmail.com>
---
 drivers/leds/rgb/leds-s2m-rgb.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-rgb.c
index d239f54eee90..7ac2b1160c1e 100644
--- a/drivers/leds/rgb/leds-s2m-rgb.c
+++ b/drivers/leds/rgb/leds-s2m-rgb.c
@@ -363,11 +363,18 @@ static const struct mc_subled s2mu005_rgb_subled_info[] = {
 static int s2m_rgb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct sec_pmic_dev *pmic_drvdata = dev_get_drvdata(dev->parent);
+	struct sec_pmic_dev *pmic_drvdata;
 	struct s2m_rgb *rgb;
 	struct led_init_data init_data = {};
 	int ret;
 
+	if (!dev->parent)
+		return -ENODEV;
+
+	pmic_drvdata = dev_get_drvdata(dev->parent);
+	if (!pmic_drvdata)
+		return -ENODEV;
+
 	rgb = devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
 	if (!rgb)
 		return -ENOMEM;
@@ -415,6 +422,7 @@ MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
 static struct platform_driver s2m_rgb_driver = {
 	.driver = {
 		.name = "s2m-rgb",
+		.of_match_table = s2m_rgb_of_match_table,
 	},
 	.probe = s2m_rgb_probe,
 	.id_table = s2m_rgb_id_table,
-- 
2.55.0

