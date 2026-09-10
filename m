Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8B3955F9
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010495; cv=none; b=Z3fXWhnbULjA73xy0wH4ZyYwtd6+rJJFHZZVHfI58jU3iO/tM+9aSCeQ+1lFdLJlJ8bFsiioPUajrU8a3Ax9ik5UD0f6W+xuthZuLLC3Gpw1GUw1l/sYZ4jOC10IQ42pa+zPNeCyYX17KbhyJuTC7s+FNmB/JeOS0kjvCJ4x9y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010495; c=relaxed/simple;
	bh=gHUcDvNC7r65WiaZb3xBsRLpqSj1tHK4me1lBYfrO18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKwsznH4u/HzqQTZyskCc7NuQG9tundzW2GeW4Nujude1exVVfzCuzCLhbYOaiwmxtDs0gMZmL1QP5KCLI9IQ3/IyV7o6N40FS0nXlmT4YRCuLIBQzJLlewmJwPhcHUT8y8ol5m7zZ7v7RmgjUBa0mNY8Is0nHGnHyLub/l5zuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7S6RxnA; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7S6RxnA"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4bdf268bbso212773a34.3
        for <linux-leds@vger.kernel.org>; Wed, 09 Sep 2026 20:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010492; x=1789615292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoyJCop5B+D/2yEHeRAP7f3j2RNXYDtwYezKGq7KmzA=;
        b=O7S6RxnAkSJmJIUGLQ6+XDK821tlpbmzIaJpYgU4VskYHBSRgPm6p5yA4C4OiggeYS
         VEKb2nhbhgbRVgXKPrBWPYSkfmaw1ZLcMDp51VJ1oR4g/gMA/acKnEH+dbomu4Se6Tba
         wRWDABkhCfBNhVIVq7K2Ac6mwvW07ewDTI7KZfSoelaKC8+i8iSPCKCc0cUE4ZTQFzpy
         P+az9K0y4ZpIfj3+cmX2Vrwx33QRg6MsbyJVe/dIzLqaBaee3cyLxPD70wbPPKVTr0+C
         hOGYzrUk9xg2rE7sXrvVzjPluVzDZGzMteP041W5dR/joYglPmBduAJ5R8l6ylsKtXNT
         +1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010492; x=1789615292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DoyJCop5B+D/2yEHeRAP7f3j2RNXYDtwYezKGq7KmzA=;
        b=ICRuvYjw9PWMOWcRF52nwVmOWwhyUnTrMdyGLJyHa64MK1UUjfWkCzFmaknr6pvrfg
         aFftAoha+vn56CCTb9Pr/A0h47kkHobMCbCpb1hD7hsaR2sA0WTz4w9GX35Y/oXp1th7
         U/hbe2ZW9OJldgvJgCnLZIdRJhI/J8SWfm0Xr2XEA7DmnmrFv72UKs+Tb8p5/hnFyysV
         I5G3fp8UbJQdEOrYr9t5K7IKtCWgPZKJRzbJsJq5QdgrDkvLQrPFZN4E8vNDx5PvN2+f
         Yq6ShRn3jKUJ86Pp2P1L7ZoMv4wtIUHZxi4FP1qW9Sp/095wQWg89ADPwkcQM75Vgj3W
         JhAg==
X-Forwarded-Encrypted: i=1; AKwUvBwFp9uboXI5Hblh1eWJRycA9SEzlRcJG8xEJtEdQnmzs1B7iehXjiFq0+RYmoSUakTk9+9E9Q8G7Ub3@vger.kernel.org
X-Gm-Message-State: AFuF++lXiOY3uGeMMAKBf4EefMA4yn47rhbraBJS83x3FTt6v3jVvp6Q
	e2gBqw0Jix6hmZbMP+EBDg0eaTKIhKksoUtW/oKXVTiX+c7ZP+aasRWfdhHz1MRnmC4/q34p
X-Gm-Gg: AYBFou2gsHtp575d8LebcChIx6Ij8Ix5YuwhvQCD4KiICeQbl+AognzfgjwKnA8y/yL
	ZiDvXUvgSWCPz91dyBkVneEMqp1EglPJVDq00C7f3WZ9QAsxyYQGhmX7DnNN1F23kiqzKwTPmOr
	8kXqMX/nMzLDUUTiPF8QamuHrR+893/3qUL5rSfQJAmY05kLIy9uf+KVZy5lzHvGM/IVQz4dicx
	3qxfRNWKHA9ZvDIndHWZ55rhMUfKds9bSnIi1Btc/DOFMP08jf9YI6tcj9In28s5HEucrdok12g
	2xUPqUeexbFZiOVz1f1nzA8QwEETz5H0QxBOBwtsdWjqljz10tg1fJTC8A4/M/+LUv7t/tIs2w7
	jsusdTKr0NUSsmg0uIzrjUOOPxetO+vRHVBhttYlB8P90IS7koyG6qCbUxKLjgpmOOZOp+sQyZ0
	nJOc0N8Gkv0kqLLF/txcVuxSMTTbhAda/Z9C8HRl/wvuf6H0/Q+ssJbYReQhLON7TLLDJjemMH+
	qNeHDi8Mvt0ixqey1kFBY+WbPHXV2zwfw39Esy/boq9lWfLOInU9dU=
X-Received: by 2002:a05:6830:4987:b0:7f3:fdfa:b9a6 with SMTP id 46e09a7af769-7fb7c291268mr18073886a34.3.1789010492486;
        Wed, 09 Sep 2026 20:21:32 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:32 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH 05/15] HID: hid-oxp: fix multicolor LED intensity scaling
Date: Wed,  9 Sep 2026 22:21:05 -0500
Message-ID: <20260910032115.28669-6-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The controller accepts eight-bit RGB components, but the sub-LED channel
maximum currently inherits the 0-100 overall brightness range. This
prevents userspace from selecting channel intensities above 100.

Set each channel maximum to 255 and use the multicolor LED core helper to
scale components with the requested brightness. This also replaces the
private truncating calculation with the LED core's rounded calculation.

Keep the existing Gen1 and Gen2 color packet layouts unchanged.

Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
Assisted-by: LLM
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index c3cfa95..bee1317 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -1088,7 +1088,6 @@ static ssize_t oxp_rgb_status_show(void)
 
 static int oxp_rgb_color_set(void)
 {
-	u8 max_br = drvdata.led_mc->led_cdev.max_brightness;
 	u8 br = drvdata.led_mc->led_cdev.brightness;
 	u16 up = get_usage_page(drvdata.hdev);
 	u8 green, red, blue;
@@ -1096,9 +1095,10 @@ static int oxp_rgb_color_set(void)
 	u8 *data;
 	int i;
 
-	red = br * drvdata.led_mc->subled_info[0].intensity / max_br;
-	green = br * drvdata.led_mc->subled_info[1].intensity / max_br;
-	blue = br * drvdata.led_mc->subled_info[2].intensity / max_br;
+	led_mc_calc_color_components(drvdata.led_mc, br);
+	red = drvdata.led_mc->subled_info[0].brightness;
+	green = drvdata.led_mc->subled_info[1].brightness;
+	blue = drvdata.led_mc->subled_info[2].brightness;
 
 	switch (up) {
 	case GEN1_USAGE_PAGE:
@@ -1383,16 +1383,19 @@ static struct mc_subled oxp_rgb_subled_info[] = {
 	{
 		.color_index = LED_COLOR_ID_RED,
 		.intensity = 0x24,
+		.max_intensity = 0xff,
 		.channel = 0x1,
 	},
 	{
 		.color_index = LED_COLOR_ID_GREEN,
 		.intensity = 0x22,
+		.max_intensity = 0xff,
 		.channel = 0x2,
 	},
 	{
 		.color_index = LED_COLOR_ID_BLUE,
 		.intensity = 0x99,
+		.max_intensity = 0xff,
 		.channel = 0x3,
 	},
 };
