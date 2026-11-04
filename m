Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795853;
	b=cOSr3tllGtiIKgjWNMgP2sKl7ho3LeH7u5DM5uxTjI1D9DU8NGPiJz6TYzEonB3mh5Ch
	 l981KyeRHZ6gOWEXOS90SNaTkM94bWZ1aD8OdWwtJNHa+Kup2Db4Ku5bCwnXiZGWmI3MM
	 VpADEze1slGNeIxgvPJio/C3q1zkDpj0sGNYVReFHn7QVn2sjLS8oG4hW9U8vquXE0CPN
	 zodHmRpJmB4/H+h+4/pLCc2JTwY8ikUDT5VaX2asq7mVtiS5DhNKtLcC44YOIQpTk82TJ
	 pyYbcpDWYsVavTgJFxMBuWlSxAgky9oAbauE2Ja+ftWVJ8RSAom4flFTunBSR4bawUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
	b=glX6ti/qMqjBOtCBZEsa1Nz6gS1siPMOniQJ/Ztmad/JfagFCJoY3XyVNaIvoyiIVabM
	 ApYGH7R663Eifmjl89gh1OocJQtNtdicaBK3+qr+p0PbDpt2gNBn4NmZx+1YGJ06qb4TL
	 51QkJi6RBThilgHSmE7FG7nrGrIFGEs6i8BiO4TV1pQrNj4DL/W6UXo3huPQhwoGO33Gk
	 0R8IWrA42D0sGsY9NjaoO7TyGCzH7JmZZWjM31c33vdeIYSoGbrK00hxeBCP8Sw9W1G+9
	 GZYMiCf1fLw2g5ctyXc9R8ggBcFb2c9gnZWhr5pOX/fhaOS3YImVu0pHPignJEgC4hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5Y1OxfR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABF606A330
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 12:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56ABF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5Y1OxfR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3802075e9.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 04:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795852; x=1794400652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=Y5Y1OxfR3iKK0ypVDOdWcQvNfthHypgwkGVNzqCHG2plZTtuULAlXt3pqae1J2hJxB
         hyM6SbdNzXrIDnEVDU2s4Mc9TN1SnHmMkXeiLTEqQ8psc7UrRXxUd+AiXCVVObAwyDHH
         dTyVeyrh4gBUQSpyuTzZzWJLW0ZNlW3xLETnR0SqouXCNNN2KH9e5otVd8dRL+TTxoGm
         viI+HNNP1ODZ0PxpihCigS6B4QFgTNxUyAs67tr7AdhrZTycCcYfhHvksjgmfsGqaa3I
         2hvjhbpWq3zOpLXIMzLCi2nFsehfjOWhW+/8NkETtgtaU3SQKNLE3Z//HkMULMxy8Msz
         mnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795852; x=1794400652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=f5Lpi2HB5HE1KCWGnkCzWBT7PUxOsnmsudtKiNmmxdRqV1UvhEZB2D6JYQoaDAQKgh
         tQZRfy/ywOEcXCzH3gFuruTN+vg7VzdiDV7AMXDinHqMkMp6k7Urj3eB3pYmtkKToZM1
         orMnGVpVxjoB5bxYkC7nqQqYj3+n+VPziFZTcY3T5WbrjKCgLycalLeR0vsESsPRwLgX
         EeMbgbloVYlgFfb95/xzWyRZnBoXG8nZTqZE3jKKX4rf/fFcEIM+RCe+4s8+tneFFPCJ
         Hhu8LIgVRHAVZjNM3IVJhECg2hHJciX4aI74S5jWutTATuX2XbSzKRWns8TS7ZdgaVob
         CCZg==
X-Gm-Message-State: APuU4Z8H9o9qpccKZS7L9p3GBRI0sIHrAI0g1zMctwYEnlwpR+R0hgHN
	eZhwjtEDHQAX+u+dRB+D/f5chTvc3Gtr/HUNAOxHTcujB8o3C6kwUUKd
X-Gm-Gg: AYBFou1EOq3C0CBtJjz45m/tA1AjwgxYW3c/FYs2wJl6AuwbMgBSz5qCLphPBWAJU2c
	Jhs/TKyqhRtgBrI+H/g7m1m8T23brSDvtyIr6T7WYQo6ynPpMpUah1Fzvew8hx7hETZixJy9wLI
	Ug3ArmXiXPwLyIw4NxI8GdyZXBYdzYg58vJp4w+ijTIQzCnwW9dNBR+HWhAegh0lUFXpO2tpAjL
	BcI3aF2K20AjMlzzvsaQY7KonUiLTNT7wzNwdWtvayk9vGNKEFheEgXuNNgOjVDnYCXJZ/BAFq3
	W1GjoaZVUpASnq88XXNybGLdDf+X+6579v4+eir4vW7GYuJlFfpwCCuaPV8fuNZW+JnD+yB1kf7
	D4/hmH40C0wyK8TLN4pdcAkC9uPq/ysBqdSdJrR5/+cBCvBJKfIhqsKVzjlIt9OC4sZJSadxyjP
	Fr8OxonfJ1u/Y8mnuC5g/pbLqXf0vdX3Skz99/dAzg3r/X2i4KYJIlk4Oxf3/kExYDM/BLpfo46
	DXiJ7OlZbVuEZS2Rzu880mIcs2Xp5BYuEiufHbD6tWyXtSaOjXUf9yAXdRlI2jVeDASqJcOBk+Y
	mX+iWXArDTC/uWUshIZm4OSAC0RhbuGNY4aKRv3BjGSmrBIRhA==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr367279085e9.27.1793795851589;
        Wed, 04 Nov 2026 04:37:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Wed,  4 Nov 2026 14:37:12 +0200
Message-ID: <20261104123714.234634-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..e85f2b4d81068 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -20,22 +20,9 @@ struct aat2870_bl_driver_data {
 	struct backlight_device *bd;
 
 	int channels;
-	int max_current;
 	int brightness; /* current brightness */
 };
 
-static inline int aat2870_brightness(struct aat2870_bl_driver_data *aat2870_bl,
-				     int brightness)
-{
-	struct backlight_device *bd = aat2870_bl->bd;
-	int val;
-
-	val = brightness * (aat2870_bl->max_current - 1);
-	val /= bd->props.max_brightness;
-
-	return val;
-}
-
 static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 {
 	struct aat2870_data *aat2870
@@ -69,10 +56,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
 		 bd->props.brightness, bd->props.power, bd->props.state);
 
-	ret = aat2870->write(aat2870, AAT2870_BLM,
-			     (u8)aat2870_brightness(aat2870_bl, brightness));
-	if (ret < 0)
-		return ret;
+	if (brightness) {
+		ret = aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (brightness == 0) {
 		ret = aat2870_bl_disable(aat2870_bl);
@@ -145,15 +133,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->channels = AAT2870_BL_CH_ALL;
 
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
 	if (pdata->max_current > 0)
-		aat2870_bl->max_current = pdata->max_current;
-	else
-		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
-
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
+		bd->props.max_brightness = pdata->max_current;
 	else
-		bd->props.max_brightness = 255;
+		bd->props.max_brightness = AAT2870_CURRENT_27_9;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

