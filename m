Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732242;
	b=OZDdBXDPTUyqZ2Ah0Pj3+KEekZ2aKqRvQrweK9yhB++Vn5d1NuBe1z31mIRUQFI+hxbQ
	 iB1+YHehsxhY4lc9UoiPbIVlB6pTlAJurPU5+OGF1vb3M0pfmfK8IU+4VQBDgjEgdrCI6
	 q0v0gFPi/mgqJ7lXu0rSsX+pCu6gPeB/TBL1dy2KGiC/0EQngTSFzkeqtFXhJPJa6uv9i
	 ygtNuEpkqjvDIGW64b11jg93Z5h1A4Qxy+B7XVbZX8vIA2V1L5w/LYeIfS84diMdPXpbE
	 GyGA4qZBH+sYpXBMSaALfpOKJryvITVat5aGsxfXpBBDHc5I8gfWbutl7odwEuUgGYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c8zL0xJ+Nrq3y09bK0+T/gH6VpxbNnLiMK3PaKQzs4A=;
	b=SAoanQ1Y2HAuWbc5QQYKm7otqAyzQy490OjdEsI6ydcZ5C7PGrm0++WV2wL4pZu37Qcv
	 luCX6zPJ7BG4qUccrFVOFvUpRLTyyuIQsHNK/o2DKSeVDp9trh5i7mxuX2tAa+UDZG+sF
	 onNkWRKlk8QIrfkCydmziLw5eaU+4Qt9uuZhzWxE1rwNAiqOw3cwtoz8Q9Wg7gdC1BNXh
	 wRvx6rPmhQTwvfBmtabY8MfnKtUq3DIp+cjsyvz84Bhn8+mX0HkLp7bcIuuMhuMbpv+kD
	 4tmq0G+OKcE9nW0FRX+EJtwPg5z6TC1+J9vq60D6wma1gTRakh1HvdjMyfSRFORNSjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d06OyEq1;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C4F606A331
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C4F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d06OyEq1
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40e30c26a4so479245466b.0
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732240; x=1795337040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8zL0xJ+Nrq3y09bK0+T/gH6VpxbNnLiMK3PaKQzs4A=;
        b=d06OyEq1BafG/SaUh3Z4vQtMBEUMcpXRhHIQakzBBfpa8heva1RzUmeenk76caOJ+h
         7ivY0YmHSc2XFnI4xEwpakiflqtvfOphy1Hnx3OAjCwQFO4TIuRGbRPAbtAHMgKVbZRS
         tbMyZd2h17Q1EgWZ+RgL+CoTqhZ497Utlj7ukpkgfVayDJvAdB5+gEv0roLXyBJC7+W2
         X3GaELUo7w0wdzVUNGQvsbAHu+YvaDPp5dISorpQKGLbmTtDYmPDwymt4KETB58J3XJd
         C+11ulTdhHpHaTnaOsVUN8C5DjJXDRhOMBEs5dE13PEjMvLNebG4ItoyEdsm2AAV/lUX
         vupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732240; x=1795337040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8zL0xJ+Nrq3y09bK0+T/gH6VpxbNnLiMK3PaKQzs4A=;
        b=bw0sjeW2EcsDxxEJTy9ErtIx/7akWUUOOIO7Fs5yFE+W/LITuEfsAyd39aGFB/YTeY
         s6rK81aaX39yaqQQE+QN6eAICWfmxChikLe6VG5MiZF4qJGd90xZcGQFnEQc0MxUVR+7
         z3bof2pxQgstUVWypHZi+NqcrVmYkvykSHpcWAMM9yGRVP9hjkcSn5M67k2wv6zrZYSr
         zIx/sNwFoOC46KtYDF8LM/G2Cqo5YZmOUt7m6CDCee2m2FvtqsFolLx7+xs3CxYWKRdF
         QUI8L4jLt5yQ3PizeqCShoqgmapv8ipHnxiNFOSb3VCc6KUndybdUKRNoXb+7exRyM7W
         0LrA==
X-Gm-Message-State: APuU4Z+LPUpIMiU5VMt/mMiSOb0GNwCMk2yJ1G3yri0NrCkAI0CWMlZD
	1Am+EzmKh8RTF4jbjf4Nh5QrTdB0AocRzowzdFucog3ofmzwQtLaYULd
X-Gm-Gg: AYBFou1Mqay7aRz7kdDe/2xLZTr//0rQPUK9mxAOtw3Z7kx/AUHQH1AWlmsC3ajM6Wp
	P1GXoyQpOewMSoFbwwQNT3/SLrzI2eFHnIcU5pAV5tUVpWC9JgCNEgXO0gvXSndQsY1XeFOwvnV
	vTRviWUrZSBV+hVgpYC6oXP2dUimgiOJ9673c7z+WGWzIXF2SQlbr9h7j2hsxZ+DKQSaeYrMZmE
	XyJqdjlS6Dche651gGPK4sWgCbPqFn/xLd4bVSHtri+VMbrGcx+w4WYClC1LcINS+PDR3XDXFm0
	22dXLIAIj62sq9wKZfHfr+bJ9pTXMTPUljq+6I9RGSM72+Syo/h2m89rXr3jvNuEYpjnFrrgvIe
	9LbtBg9iGPzxFpucdDlJzDpzoKfrsyLWlc5mSMbbQR49IVf7FKHuO1lpqEfR5haaDkCtHShB8pk
	90vwGQVdeRHULgP9ks8y4fonhghnh0mLuPEpbMMQRJl+cooHOTUKVnPfIaF26mcxu9nPDe7iBva
	cHK7o5MHmf6QtvNu+w5tPb5P8vAD+hioKAbGA3N9YRIdHxPVc7/QHaNtnzyyxIGh2z8nxnynxzU
	EA/3H4yacqDE1mL4LEV8VT9DPfEts1zmlEaj8SUtnkhUconFvneezYhN3n4aq5CGSWqOhJQ646Z
	BaTq8o7kfhA==
X-Received: by 2002:a17:907:c0f:b0:c4c:c62a:b9b3 with SMTP id a640c23a62f3a-c50963bda36mr622465166b.22.1794732240230;
        Sun, 15 Nov 2026 00:44:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm288937866b.85.2026.11.15.00.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:43:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] leds: lm3533: Clean up probe and use managed helpers
Date: Sun, 15 Nov 2026 10:43:46 +0200
Message-ID: <20261115084347.70592-2-clamor95@gmail.com>
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

Clean up the lm3533 LED driver probe and remove routines by adopting
managed device helpers and modernizing error handling:

- Introduce a local `struct device *dev` variable to clean up repeated
  `&pdev->dev` references.
- Use `dev_err_probe()` for cleaner error handling on invalid IDs and
  LED class registration failures.
- Switch to `devm_led_classdev_register()` to automatically handle LED
  class device unregistration, removing the need for manual cleanup in
  error paths and the `remove` hook.
- Remove redundant `dev_dbg()` statements and cleanup unused cleanup
  labels.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c | 48 +++++++++++---------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index d5997cbd88dfc..7db1105bee5c2 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -633,22 +633,19 @@ static int lm3533_led_setup(struct lm3533_led *led)
 
 static int lm3533_led_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct lm3533 *lm3533;
 	struct lm3533_led *led;
 	int ret;
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
-	lm3533 = dev_get_drvdata(pdev->dev.parent);
+	lm3533 = dev_get_drvdata(dev->parent);
 	if (!lm3533)
 		return -EINVAL;
 
-	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
-		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
-		return -EINVAL;
-	}
+	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT)
+		return dev_err_probe(dev, -EINVAL, "Illegal LED id %d\n", pdev->id);
 
-	led = devm_kzalloc_obj(&pdev->dev, *led);
+	led = devm_kzalloc_obj(dev, *led);
 	if (!led)
 		return -ENOMEM;
 
@@ -662,14 +659,12 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->cdev.groups = lm3533_led_attribute_groups;
 	led->id = pdev->id;
 
-	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
-					pdev->name, led->id);
+	led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", pdev->name, led->id);
 	if (!led->cdev.name)
 		return -ENOMEM;
 
 	led->cdev.default_trigger = "none";
-	device_property_read_string(&pdev->dev, "linux,default-trigger",
-				    &led->cdev.default_trigger);
+	device_property_read_string(dev, "linux,default-trigger", &led->cdev.default_trigger);
 
 	mutex_init(&led->mutex);
 
@@ -683,45 +678,30 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(&pdev->dev, &led->cdev);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register LED %d\n", pdev->id);
-		return ret;
-	}
+	ret = devm_led_classdev_register(dev, &led->cdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register LED %d\n", pdev->id);
 
 	led->cb.dev = led->cdev.dev;
 
-	device_property_read_u32(&pdev->dev, "led-max-microamp",
-				 &led->max_current);
+	device_property_read_u32(dev, "led-max-microamp", &led->max_current);
 	led->max_current = clamp(led->max_current, LM3533_MAX_CURRENT_MIN,
 				 LM3533_MAX_CURRENT_MAX);
 
-	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
+	device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
 
 	ret = lm3533_led_setup(led);
 	if (ret)
-		goto err_deregister;
-
-	ret = lm3533_ctrlbank_enable(&led->cb);
-	if (ret)
-		goto err_deregister;
-
-	return 0;
-
-err_deregister:
-	led_classdev_unregister(&led->cdev);
+		return ret;
 
-	return ret;
+	return lm3533_ctrlbank_enable(&led->cb);
 }
 
 static void lm3533_led_remove(struct platform_device *pdev)
 {
 	struct lm3533_led *led = platform_get_drvdata(pdev);
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
 	lm3533_ctrlbank_disable(&led->cb);
-	led_classdev_unregister(&led->cdev);
 }
 
 static void lm3533_led_shutdown(struct platform_device *pdev)
-- 
2.53.0

