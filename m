Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BD7417BCA
	for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270464; cv=none; b=SoxIfr2zkyaGBf6a0Mi8snPM2HAp31geKCLWk/3eDcLwLCLLRw5YWrcPuF5tXDfJsujY2UxphRErEgOstuioB6tA94px0d0LpClJDMEZwdlvulj61r4rvgz44de6O6mERSA3MWVFZjvFuSktiXxs4uCd8yT8ixxKhOTaZ/7kAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270464; c=relaxed/simple;
	bh=y91BgDbV1pmNNW7fcDmBjagCNc/lHkbbK5GTaLYoxSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ypz6ij3rL8HBpwt36tIfmRFnk+z0fPyXenmKjp1BDa3e7aKcmvossPhLAzJp+I24Qkw4/hGYUPzxFuzZObnW5RVIFndr1UYJPCR4gzjtkAudGFqE2vuxmiJelLpZusqYBa88MlXChsdTX7xhUqrtnxJJdLXddQi42nKmX4OEba0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khBtcY+Z; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khBtcY+Z"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso93919e87.0
        for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270460; x=1790875260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtw0JhXm0/tmnOTWbZH0chwtlN4HPg9BNssrfKTCcYo=;
        b=khBtcY+ZHfKDik2xBEKBQ3MWLAWsqXwdm8/NJH6GnsmWgcLBWgV4lot3yW8ni4Rus6
         mvdc7XgO/Q59/JhMDxIlHV7IIE0Zh0wncrGQOSCgkkuMzxnt8lDnvjMuAHVIuJTsdqSn
         716k3gC7tdxKyTwL9X9Qc1AwE2S7iHKyaWOPLG3Hxy9klst+JpJ5ZgYVHHVHue2GnESu
         nRYJ4/k1ry5n6go36X9dUGotcWoWo3gywIz0r8dbgwVsAAdQjMc5H3yEF1tyeJLd4DgP
         kABrsvUPJWdl2nZja44htoYABIr5N9m7MBdxHmR+xYksJRv0sLB6crDsXAeVaIf01+uO
         JbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270460; x=1790875260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtw0JhXm0/tmnOTWbZH0chwtlN4HPg9BNssrfKTCcYo=;
        b=r7i1BvDLF3N7chLtihkToQSs8n/KOCWeSc2SPhqsv8CBuLPd1OiKnGBAYdmAu0gyol
         WhjL9F0x0Z47KxYSmh8VmK2icIHdSdfTVyfjiA4VplXUOJz7S3lQrLM/sv1gKI0Upc5G
         b3EBFXhfeIQ6rn6JKWLC2ZXJu8aw8wDs1IixR8iAvHl8fIPqxo6Ioua0SCcRHMWyp7bT
         9vyKqaCymSI3bTKGbiC2ipXfC9nardwbYbah6z37l8ltoRoTIFGZX7Adz+lf+Ji6t36O
         9Ns5ePRQTqs162bgA6f8R1+9DIupdfu6vxvINXmSQij44bzum5EHnkG/3xpIp6rIJIKT
         B48g==
X-Gm-Message-State: AFuF++n2hswc1WmXGTNozyG+xRUi15iplXK2hwem0Rs2LNclIup/vtGX
	uxwuCTd5XXmg70MgXxl3VyyRTvYPuSeq7KXvxPReGIBJFCkdJuZiZbaypIamWEyoglQcu2o+m1E
	=
X-Gm-Gg: AYBFou0ZLdHS7Br+Zuiwx0L5ultXLiNf2bufiMENEF9UGNhyvFRXaP+qr6r2l4rV574
	q8WjwAqc9ma0HVy+TnYKoEteJp6VNNM0JNRVLQCD/52utILWuLwzWZPPeN9kog1/Wju71rqa7yR
	palEcYXm2HSdkbKswJF7ASqrCbd3XGJt2PqWyQtFifQhG6sY1X+rNr9La9AtvtpQ1MpeudT03kJ
	w7hahshGJ6QpNUl+6ZWYem6pAS1kWLYLXvTHC1YIX+yOJmY5v13uEemuHiFGgtEwLwPvaBHiRi1
	0B30TVTVUMeiLso/uvLLnaLNqEIROtpW1kKfGgI+uIV/vB4ckJZAc/YiVfTbv72d01j+AqM+E6E
	MaSz7MGzkmQq0EzzoRRQE+/a7A3CelXcX+JhcAG44LV9SLgRGtms6Ow08De35yTqIf/9rgermOt
	B44keaXY2F2r7QLHBtQra5h70Ua5FNUz2VtDZbVkaha65cnHSxt9tThOJAlOo/Vmn53kAZ6h3TD
	PT8zBTUU0B+mJ0=
X-Received: by 2002:ac2:4a61:0:b0:5b4:a798:2630 with SMTP id 2adb3069b0e04-5b8df0c3aa7mr845664e87.3.1790270460246;
        Thu, 24 Sep 2026 10:21:00 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859505csm1611065e87.74.2026.09.24.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:20:59 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	rillian.grant@gmail.com
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 1/2] leds: flash: lm3643: Return to standby when the last output is switched off
Date: Thu, 24 Sep 2026 20:20:39 +0300
Message-ID: <20260924172040.1185688-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924172040.1185688-1-koreev.r@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260924172040.1185688-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the torch brightness of an output to 0 only cleared its enable
bit and left the mode bits at torch (or flash), so the chip kept its
boost converter running with no output enabled. Likewise switching the
strobe off returned early when the output's enable bit had already been
cleared, leaving the mode bits at flash. Both were flagged by the
Sashiko review of the RFC, which Lee Jones asked to have addressed.

Clear the mode bits together with the enable bit whenever the sibling
output is not active, so that the chip goes back to standby when its
last output is switched off.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/leds/flash/leds-lm3643.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
index 48e164261..bbe9358c9 100644
--- a/drivers/leds/flash/leds-lm3643.c
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -271,9 +271,15 @@ static int lm3643_torch_set_brightness(struct led_classdev *led_cdev,
 	    mode != LM3643_MODE_TORCH)
 		return -EBUSY;
 
-	if (brightness == 0)
-		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
-				chan->enable_bit, 0);
+	if (brightness == 0) {
+		unsigned int mask = chan->enable_bit;
+
+		/* Last active output: leave torch mode, back to standby */
+		if (!(enable & sibling_bit))
+			mask |= LM3643_MODE_MASK;
+
+		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
+	}
 
 	ret = regmap_update_bits(led->regmap, chan->torch_br_reg, LM3643_TORCH_BR_MASK,
 				 LM3643_TORCH_BR_CDEV_TO_CODE(brightness));
@@ -365,11 +371,16 @@ static int lm3643_flash_strobe_set(struct led_classdev_flash *fled_cdev, bool st
 	mode = enable_reg & LM3643_MODE_MASK;
 
 	if (!state) {
-		if (mode != LM3643_MODE_FLASH || !(enable_reg & chan->enable_bit))
+		unsigned int mask = chan->enable_bit;
+
+		if (mode != LM3643_MODE_FLASH)
 			return 0;
 
-		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
-			LM3643_MODE_MASK, LM3643_MODE_STANDBY);
+		/* Leave flash mode once no other output is strobing */
+		if (!(enable_reg & sibling_bit))
+			mask |= LM3643_MODE_MASK;
+
+		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE, mask, 0);
 	}
 	if ((enable_reg & sibling_bit) && mode != LM3643_MODE_STANDBY)
 		return -EBUSY;
-- 
2.55.0

