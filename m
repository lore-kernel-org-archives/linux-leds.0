Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B75446C01
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226167; cv=none; b=jeVopQaMIbux4DKenq2nTTVDWrsw9Atvd+qfsKV+tQVp0PjJjVtggQumafFoWDA0c9DtSH57HIuC1IEwcT0PMAqmd62Bj7dA4uEE4qhHJQH+VEHFaUTvD1g74oEG9frFv+nlddl5waY5wRqJigWozb/JSdnzEy+3QpfzYf7r+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226167; c=relaxed/simple;
	bh=4O/79lYjfH36rUJeWJeqLaWNqBfqFwVt8K2YfiTpeck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IwQAcDgBl8s6WIgnJbhU5fx961LJ7UZkoFAUI7j3E4skhi7RxySKiIIwDiZYqrk7IT4Y1/20zwP7rPUPuFW84B0xrcbPOGt97fs00hq5BETsLxeOm7oxKHgEXZ8smHOecOxN0ua5iTWGhYjvFwd911r7S9AACa+w4I/fxnkuCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWcg82EO; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWcg82EO"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c999f162c9aso4440539a12.3
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226159; x=1784830959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C/yqr7T4KyDtcTP0jsx9I4AQREpUgRCzIWZwQtd1a8=;
        b=jWcg82EOQBv3muSjD6rnJdIbzcbOEdbPhPGFI4u0f9yy2A9y4Ro9qRAZbu/b+0Emv/
         H3hWgDtbRDbu3fD09R6lNty5pBrtaePyR+oJiD7iiYgO+dE73Mc4d1OlaVXnDNPGpDVo
         LMGFIP0ARBm4kuAOT6fNVNIFIeNMklMPLT7KMTNQy4xyWaQ6ba0m4SMzOXTHLMPlOvke
         7ey5R445HJIDt3xQiAhnajtQnxTXFe3N+1wVWDP3NHCkWeTIqEHz70i91mwwr/WAkliZ
         IXDNZIImzTokkcT9iDCWLxrGLkM1DGudFlcjTiEDkr6wTMDJQcOobDZx018wYF5/EPqO
         xxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226159; x=1784830959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C/yqr7T4KyDtcTP0jsx9I4AQREpUgRCzIWZwQtd1a8=;
        b=AfDmErH3OKDULf9jiRmN9kvH2lOS9gUoMpR+TDg33g6Pdejo9z92fHHzyHiAB7Q580
         Zr6/phMRRi0on5zWpH2+7LRJIhWHXGRRz4gXvDXfydDuMKAKY67ErNtlD+AmT1r8JRYp
         t6vjBlY5WFKDnijYzMhjvvL5ChyjBuEt9lwBod4dT5GnWFNqNR/sfAisx5YDcsO9XaO2
         zivbcS/ZJPkmsyDr7L7yqZ1S9DTljlJVlzg5+RzOZQ9IzROYBVMZP+yXeNLx+putlO8a
         KwBY0X4Ab2Zpog9ghNCkOTHfjdG6SMSvomKVeMz3x8A8EHxEbsNOz8WOsiWy4zOY28NJ
         TuUA==
X-Gm-Message-State: AOJu0YyJHHCEJ4BoEH7bN5vwGgtPciRnudJCKvmOw+JIf8a/AjTh2s5B
	wJHiAFoshTRt9lX9VL55K7bve94fFyhxEMtRUzSD3i4UdZ3OKkR7wiMz
X-Gm-Gg: AfdE7cnKenFUjxl/7ielWkt7QtfunbFjVhvKk7VKf1NU4LPus5hIZ6AkXpObcjMLVCq
	/2LCG1nncRHS1219jM2WWILtr+Om3fcTeixmsJib27KeibDLsCZGq5eD7/eJqeWieMEvCwY8SMf
	d53+s4rRZZ/nV0fAHFZb3ZQSduXWxqNdyv45RvE5cIKeXwb29yfWLoDHmIIQm5cvqjc5jS6p7/D
	dFPx4IYe7WzanqTYkdeOGMMTIkIARSy9QWhw2O2hCLSTblHWp/59wMlnwr9FTDEHlBMiXXocfdq
	04m5hCwPGm+oQQyoBRMwXoOSZQ8iKSuFKgyHyRX4FqzNnYgOZId9mqKsLgNwpMfLyI/WSkrXRFJ
	OJUgF/A3n1wEn7CONsIxYD8RcdxmvEGBtsOjchobQKPm+6D0/aK2y4l1FtcoDvAYs0e0/czQ2Ai
	tJbGrXNAoK9GxDK+mAVdblUD8=
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6c05:a4 with SMTP id adf61e73a8af0-3c34d86fd8bmr15868714637.51.1784226159288;
        Thu, 16 Jul 2026 11:22:39 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:321c:1213:a9ae:1111:f32a:a657])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4866sm13665728eec.18.2026.07.16.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:22:38 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH 2/4] leds: lp8788: convert to dev_err_probe()
Date: Thu, 16 Jul 2026 23:52:27 +0530
Message-Id: <20260716182227.9430-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return patterns with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-lp8788.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 9b9525ccc..259ac50e8 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -143,16 +143,12 @@ static int lp8788_led_probe(struct platform_device *pdev)
 	mutex_init(&led->lock);
 
 	ret = lp8788_led_init_device(led, led_pdata);
-	if (ret) {
-		dev_err(dev, "led init device err: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "led init device err\n");
 
 	ret = devm_led_classdev_register(dev, &led->led_dev);
-	if (ret) {
-		dev_err(dev, "led register err: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "led register err\n");
 
 	return 0;
 }
-- 
2.39.5

