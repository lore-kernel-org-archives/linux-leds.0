Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733122;
	b=cXfIAIQwfKmMRrLwTpKmaMzF3NKw0jjHRawZN/evsYFiwdqaoKadoApL8r4Yr2I1t2qg
	 l/5UJce2xEVqzU5JmhodESRq/igknkYWwNiMYkmhJ1Scgem6P/xpAmfAekYkRkRdtIuRK
	 +5rBKL4lTRqf1kiDnMW3QzS2oqFPbntd6dP0n+jiae2LfIy1rbNzL8sF9De2DNo262TU5
	 WWFk457gqvkrcuuezbyfZ6AEhcRvdyzBTYEVHbvGOduMi5CKzUJextmYx+71xWiqyCLt2
	 qGXDFaxvXlQzgq4VvW0unAo4/cxm3sCbLLPnuk9YNmWmtu7sklcf5dMU9KccgoOhljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
	b=gbrtwv6bSb7cCASpnq+uC7mtmRmZtDf9cYhiMgBQCJ9cQQ4t7yACyYb/d5NtmuILoazF
	 6r13tmO7Scv9TRsJiIm1DJMyrFF+Zc7iona3zpPvpabX6gdATipjG5FYF/zm3weUp7uKV
	 PVinHzxYVOH0lWHY1NbHWODqWEbUrvQiSPs6q5lGQtlLPQRXv3tC+tHp0G4mh7D0oxcJW
	 ckTvWN5HStlJDxejmSbfAa0DP2cEP5Xi2UjECTvzLoQgkVSGPeXLI0o+38ZiqO10pM0i4
	 Wgcg4iHVXCQq6yKg5GjStzjIE+KhIXwPRlhzY111h+QieoTFzrm9KoM614PUrbKI3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOSgHpl9;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0B606A33E
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD0B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOSgHpl9
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50604721c8so430243866b.3
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733120; x=1795337920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=fOSgHpl9GXgR3wKFs6GCGj4bkABY634J8kNAEkL6MydV2DQjJfhj0F3Vl3JV650N3z
         lZ8G0Dkaa5BFPtwTQ3WoUUitg1e85iLEsRZYs/euJV0jjhpzuIYy3b+dpyUd7lVG3Mlj
         q1KVFt6adpKceoZXRyIpVZQBxCXpMF0NIlvlkzHKz+eppMiTAWQLngLgH1fC1nq5B5bP
         B6h6xiVbNo7lQJG2wbY/2sIFL7Ari28PKJMRGflte1ebNW2BFwj3sP92AErsDIEQX53P
         PFBpoC5S1HJj0loHecPjmj3pKrVvgeQ+aouHRMAOM/BsSlpv7Wq1ZAOMm9sTCp+Msc9R
         dCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733120; x=1795337920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=MPLJ/wajhg3i+jAtxtsRsQ4d122Zcyk/Z4N2qIK7pj6evMcH+S6mVNlBrfNZn1h9i0
         C8bKadGxMopDoelNXmQy2fi7rORuckpkapTklCEFexiGndlek8l3SopC1IHhLmAcAHnX
         wsWWteK7MmKlSyJN6VdApAPlir+zzt7/begddvOx59S3vQUsKQK8sYyGxFLi7WNMYT/4
         wNsBHb+dpsMQksfm39Js5cseCia64CriEHagE3syLbgAhs57Yr9dM8y8QYHqSRr86xNw
         MhI0vcfHVFMM9F+ycUNytfajbarfXbtlKVoHHWiU3vtNGGr8BZ0J2mo3PZWd027xXMpN
         tCOQ==
X-Gm-Message-State: APuU4Z9IunB8ASB8NTEYCB4tSx2hFn1YgXoc8bT8ibhQv3klG2rLPAbb
	3Mop8FfdmUmA5lmYMt/P4UhxFhOT/L7wd0laSr9D+EMgAih5N1wgXAyw
X-Gm-Gg: AYBFou0dbiUnjzV21HROrHEoUX2xGrbVRsZe0dxyBs7M+fTeDeb9o64iAkfWwQkIq7t
	zMg65kCmY3IfXtqx4uvC3jd2GoBAj3Tg3KUM9nl9Jj7cJsdE91an6C/RZk51Mt9AqAUdOpRubBn
	2bunfzm1m+XF479DUVV8tEBM2ymMiDC/Sr6P7KixU0DHzFKdYYAT1zemxv8bYE1Xj7DKKTsuEyf
	hkFTpVamQQIw1kT5u2n5p57kk4rf/NCYbnHZR2dTBFdHe/sEAIs+ZOqFf51p+YtbZV+mPm0Xvmi
	xkaGlR+zB5tFUsgpmYdBX1jKdEqVb8xlcie3eBZz7RjHiZYdvn7RpIcmBnhol2Tk/0Ev6FKjY4k
	35G2OTQz7aZ5Yk4slhFPxqPB0ZHliA1a3NVVu6FiwhwAOfJFKk4oXtP9eo3wG4R2x+U8clIffLL
	rNzhpOmXqWK/1fZ91xQhb929rf374t4S8wG3yKmjfafRJBhjTCL3E+Ik03bgGIaenxIFxZEkKDD
	IJoxRNQ6ZIPe3VzXF4n10wBdHP/TbOYxk+22XDvlUR0Vx4dcD0f7F5a19WaY1HpyuwBnTJP9n1i
	PyRx9Dso0mbmCueXdM1VO+W2ix9Lfkb5m/ChEQWxCOTN4fCPgp8QF7YT+c3GtndltgWLXXvxBcm
	jyRPUVTu15auSQqFkRHhnICzFdurMcxw=
X-Received: by 2002:a17:907:3f20:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c509640f665mr613525366b.37.1794733120092;
        Sun, 15 Nov 2026 00:58:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Sun, 15 Nov 2026 10:58:23 +0200
Message-ID: <20261115085826.89641-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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
index 5af36d3784f11..ea955b55bca18 100644
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
@@ -143,15 +131,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
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

