Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100778;
	b=VliSfSYW1aQWPTunmWVY0rnlNc6fv1eCAnzxQTn5y1XLCMJVgBW9WZKgO+mYpr5Fy+C+
	 XeHkbhez4zhAMWuKsR7unk3kyulb93zURrxfhwgkzuI9E4tTyXWou2JUcsy2S4ts+R2h7
	 S0F1GryGzNspyQ0bwSXTN+YCAg+TKQjl5uET2MVMiIWrgprFhLeD/jc1AFrHj9x+GXRWR
	 YamVKKMwDWfQ2aVcM5sxYnrY3FdokX6ocxurDeNZmLkiCvEp7tWBLSJrJufE5chU6AY5J
	 agrbg+krFoNcJ+iqfEeoshXG/BwsQTPiNrklopms1NjFJ/XYwk55j01yFmtFxDpd1wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
	b=UYbUZI45p0FjRBKEC9I2dCoK+l9jblYTCKSyzDanrgFjgiGj8BWK3tNlIFilHDpS+Z6v
	 gdF5ImRKoaTtPHsApu+ivr/avJFvF36laoJ7LfAOaAzi12TdXa/BGhoGOhHTzoR3PmNS3
	 nBt+8RYSHs5n7UmHoFU5MFKqhJgsr61G8G5L7AqgynHRLQFTPA6o4l39UPlnWtN+yKM/S
	 y1nKZNbsNnFgnr4cX6LR5SG0xPpvPWD+5BwTPsIYh8FtpS00dl7ZJm1qSJidXemEWeFud
	 9EC1MNREM5piUOYnr+t+V3Yy8e5WcpilfaWDL44mVMmJ2A+fBinyvU4et+6YYO+wjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McUPc2ZN;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3260A3811
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C3260A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McUPc2ZN
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c43373ae89aso609006666b.3
        for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100776; x=1793705576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=McUPc2ZN2aivcQ4l5tOOBGiPLL+Gr9rSzpYH80ieeVbvD4G4q/IbNcWuqBjIz42m/6
         80b8xn/DgVTwcYdsvPzshoVOoLegZeY1+2peDLDUoBGFP4AAz7I2HZ1rifvwj9uv9ZdW
         sgZrA/xDqxMiUHIhYs1SlCGA9QsQJVOm8CtTjFUl5u+OXqISoH694nMDxXibSaoqwlW9
         t9q2MFlrcQC0iR+CaYEJ3QDfetJfz2sf4wqP1fBeGmFtBzuiqMGiQUMi89VvLEKkf1FM
         gfmVMW39WZxDrAES66K6HlarB86IgQr50FXRThVp8I9q4EKz2xivJvjKsEDenPGlMHgu
         eE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100776; x=1793705576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=viNO9fBTLhnktlOaqZjSgstVELFjFTwlN/xf0qdF6tKrgrA5qri8hEArWvNoUP8kIb
         XYV2Kns4xz3W2OprZNhoxjlXVSDpggkgEV1fUMvRbdzeo7Bj56bEVkJxNjjzyYLRbEsN
         eyo326FP3kpwqV4NouS1k7wK5tklRFZ5hEGvrMQDLkn1DkdXDGITBdGnsGotKJ0VvwQh
         0f5m/+p7G76TeQ+iNa30B7U0GwDC3TCyVY3xNf3MV7YJOZl05gmLr2JaWHvenPG93y2S
         J9Y/OkMI+y2x2lN+V7VF5lbERUJRbZsr7YE0zL8fYTXMfb6U1l/20kT1Ou8rAfRmoXYl
         paxA==
X-Gm-Message-State: AFq9FYJyfVWLt+xKBFFH5L4jFAC4lko1msp9DzrvOe0gY8lnOPVwebKp
	bAspQJanDypZppLbiwmcwFRBstoRFIeildcoh+xkneE/azUyRlUc6B4y
X-Gm-Gg: AYBFou0Ct+rQHpKahKn66pJg6AJnJUnT8S/p94wG4q3HT0IJtFlep3cpDgMn0+vOlQf
	t3KW/6p1UXm7VvOfVHxNhJdqedGQ/qPNFaJIho8EkNI9EFEB+U4A132vCHl12xbufVUSCb9krj5
	v/WOo/4LFporoaR1Brl/uka6hew/uM8ImGdv26gtTrv+3xXCwYlRVTujwylk7pnQUWJwoVU3HnH
	mZIC0ZTxfE71uPpE0vrE1RBgSS6WFIZh82H5bLzdelNnjd/7EJt7Pwe3zTlCeH9wufn4NWoNEII
	Ubl4AhjSuby3HfHHFmxG06+HpO8u5VwCKMlnVjq8PdoeaSc1lGDP0/Esmk8rHS6a1ZlXi+TixCn
	1dty+rVIi8s1RpJ7Yn71V17BCreYTRfrNzABCyS2CcGJ2nSgdYWlMzQtvhd86SUQIKL9v249C4W
	ty6wk2H5k17/7fPcsgYkge6On0GhOpTd9vuQramO0dmVWnMgZLXiMrXnMXrQkn3YjQrhwNylTo6
	GCpfMzv0LChNoOxpNckSLN/XbEv/BrPNsKIYJH+QGCF+6QxrPZA4bFUPkEj7FaDZZNK3+sTMbMT
X-Received: by 2002:a17:907:720f:b0:c46:7fa4:922c with SMTP id a640c23a62f3a-c46bde3211bmr1016964866b.24.1793100775923;
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
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
Subject: [PATCH v5 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Tue, 27 Oct 2026 13:32:28 +0200
Message-ID: <20261027113230.47538-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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

