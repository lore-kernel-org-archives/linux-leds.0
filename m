Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19436388371
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 17:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785001970; cv=none; b=TAZYtSV1gTSt8buY79wRegisD1IC/7jD1/f+7vHZA6Mu2OUrmL6Ug1fCp4f1CxfornbVt+7xJRXYfRBRHxFUbrmI410JP/04IqruVsGLJhNynQB0FGnKjVKKTz/8IHt76uNK3jMdyh9OiQUIKRtZ6P19mJTxVP4uB0C/qMQmHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785001970; c=relaxed/simple;
	bh=t7uzCuy6CdM/hLZMNSE+z6i2k8FmZ0z+RjcpE79RH4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G/ws5V4+a1PlgMMF/PD7mV/GIimQaO9H6zmCb3YUVuLwrAiWZ8hZcmIZ6QiFc2D1aXDlUSMB0oDSGxM7P68BEfFh6IWr7p5G9gSLfZUE/UdjE/4OjHSxckKF2R1FdAFM5o6SVVnCQVdyP/J2N6QrCtATs3GjY/VNzjEMDfbi+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTioLb0Y; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTioLb0Y"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1629536a12.0
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785001968; x=1785606768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XCJwtknNgL+Lc1tNd+21F6CTvSpJb67tZD7uYf6vvQ=;
        b=FTioLb0Ysusic3ZE382LmlnrdJhf+xrgtG5IjG+COtsbG7fGWlnmJnzGzgVlIl0ibb
         ol3BbDQYLUXyRsghGnhyTsr2moDUUE+wBIDwRZCLteD3MDlRaj1uDSCy3LXpEvseDIND
         ycexqjT+XiopsClnet3cuYMjKcZKKd+F2KBwyPa/K0+Onwr13fj0gHFavwZe7nKHb8p9
         /ZAXO583ilH9FqsMTPWJHeYYGDAJNaz91e4JQmkowjBxMd2wytVG071uocOsN59D4fja
         WSafBfOKPboUaERtKd1G1Y328b1ECzd5qIjFTLHz7QyFLXg+U3rwOklSHw3SVOEm2oiX
         csyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785001968; x=1785606768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XCJwtknNgL+Lc1tNd+21F6CTvSpJb67tZD7uYf6vvQ=;
        b=CLWU7EnVTmD02MQVweCP/kj6yiUzoL+SOUYEiiTodzf7b40DlLdX9zlOrDYY2rwJrV
         6AEOSf6Mam7Jt7IhLLyxJjfL1q6Q6zyMgRYNVOhrfnC2RyZt8IBIDgPkTslg/rny0kA8
         WUMvp1m7HXhddh6Vg7ijOTqe7jY/BrkLFlQ21LVBnIFNamA5SNnyn109sqQNrAgQWVQ4
         U/QJ7WY/0v3+g9C3dUXscdbOJboGBoqmXtH/JIc1y1rkth4GEM39UaSvvmN5N36O+U5j
         W00wZqzseVmRvQvcb36aPlqXwOoCKQozAoJfXPIGU+yjPQ3T6d/aEWWDYxvuwBYIW/tp
         9TgA==
X-Gm-Message-State: AOJu0Yw1qHc8C+qiPv8kuTSx5bsvRnR5ZKm/45ujFW0WY80/KUlYQBjG
	cjQtPmwLcTsbGCqleQGLyujHJGp+CzuLXapabtRJ5Cuea/OQgLY3tbuk
X-Gm-Gg: AR+sD10v6O2GQIbdCJqgLlaadNR377/ecN/A2Xv5VgVZnA22tZS+7nLbZkRmllp2MO1
	dZPmbkHRKX5ElTXWVNHssegIMau5hNhuIEagMzcll3g/nxks2uBhZVpkrKDODvlxFdbVbyn+qh5
	AwqITdersMXOhCyboeukIKQeAIZvVqpSJrCVqw83xtOimtbyT09pPFZh28kMBf5HeAKRQa18CvM
	5HaIhEuMFNkdQj/MWzpbdh3VtW8N3zoEC6LceXCXDArDC2OJ7YszaSa1ce8J3UOkxadi+ngpO+5
	W0kitsYr6oFRyAn7j8R6T5F19gusARzmpf7wiK6QFF3vnhJfUs5yqhzBj8Z+H+C+NE60cIwnwj6
	m75vgvoK8yOfOmY5ctZ0ZMUvWyjGBkFuv5a7xPT7WDqukzsmTMxA/JpNLTDSHLXEKroQZspF1JX
	Q5Z54SP7ulYD+RmV25rJRM
X-Received: by 2002:a05:6a21:3998:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c6723703f9mr5091870637.4.1785001968280;
        Sat, 25 Jul 2026 10:52:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:79f:1f48:d3f7:8b5a:7633:b67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm12448039eec.9.2026.07.25.10.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:52:47 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH 2/2] leds: cobalt-raq: Use devm_led_classdev_register() to fix use-after-unmap
Date: Sat, 25 Jul 2026 23:22:36 +0530
Message-Id: <20260725175236.32015-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260725082003.F423C1F000E9@smtp.kernel.org>
References: <20260725082003.F423C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver had no .remove callback, but registered its LEDs with the
unmanaged led_classdev_register() while the I/O mapping for led_port
was already managed via devres. If the driver was unbound, devres
would unmap led_port, but the LED classdevs would remain registered
with no matching teardown. A subsequent sysfs brightness write would
then dereference the now-unmapped led_port pointer.

Switch to devm_led_classdev_register() so LED registration and the
I/O mapping share the same devres lifetime and are torn down in the
correct order automatically.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-cobalt-raq.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 5b5acaa8c..ecb64ca9d 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -76,19 +76,16 @@ static int cobalt_raq_led_probe(struct platform_device *pdev)
 	if (!led_port)
 		return -ENOMEM;
 
-	retval = led_classdev_register(&pdev->dev, &raq_power_off_led);
+	retval = devm_led_classdev_register(&pdev->dev, &raq_power_off_led);
 	if (retval)
 		goto err_null;
 
-	retval = led_classdev_register(&pdev->dev, &raq_web_led);
+	retval = devm_led_classdev_register(&pdev->dev, &raq_web_led);
 	if (retval)
-		goto err_unregister;
+		goto err_null;
 
 	return 0;
 
-err_unregister:
-	led_classdev_unregister(&raq_power_off_led);
-
 err_null:
 	led_port = NULL;
 
-- 
2.39.5

