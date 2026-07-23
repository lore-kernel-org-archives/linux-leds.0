Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EC388393
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825200; cv=none; b=I02LkLVmPmGlEgmsF9jK7+QKHbZ7NvVKhRZsvOXhGQVaOIEpiqwtZy44ImNKLIFkUCxJFOgp/VwFrDGhoxJw4S4w5JlYtfU7szwbaoWYk+Ju+pHaOen1vLhB4GlLOoJVIo9r5zSxm/nctDPG53xSyrsmc4xQp7VbISRmtd+Oko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825200; c=relaxed/simple;
	bh=4O/79lYjfH36rUJeWJeqLaWNqBfqFwVt8K2YfiTpeck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RGioqj9Y3ov1tXxejvk3upG5EXND6ZODN3VWTH6Vs66Q76TXNp2bKTj1wfWLhoyMG7QmKRhz859/u77euu7C0zvSAg00WOnUKe5/P1Li3OQb38/kMwY+gJzAZmC7pqRE8ssGfOWnsHmgEb/Zp1IpPTWyuOWXWwwrOeFEQwEkTII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmyvcxB7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmyvcxB7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84864086bfeso861917b3a.1
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784825195; x=1785429995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C/yqr7T4KyDtcTP0jsx9I4AQREpUgRCzIWZwQtd1a8=;
        b=JmyvcxB7bpah+3BkCEuLRfeNOI44L07+agcqaKHRhbUnVsl1CbeXFkpo+aBOPfIuVc
         ld3tQTcj4doskau2bpVYb3AI3cWa5xUZVf9ooaoH5RzTgrViZGMsnOBcXWpSAnR2hv6X
         fE+EkUNfFwX3So6EUxJHORLhKyKcgKJKMeC2mObKuZkGB3/d6C0GJEM72WI+S519HZ1t
         4xwNwmaz2iW778xGPdD+iMD8VqHgsZSnPS7U/kslOxMM1TjtyXfIORsTyTyI3bFYyeX9
         g9L7ywnDdn52ND+2KMQTrXD3sk/Jc7dRyB2Tle8TtZ1SyIqxi4qNC0XQtdrv8vzebY5g
         toVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825195; x=1785429995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C/yqr7T4KyDtcTP0jsx9I4AQREpUgRCzIWZwQtd1a8=;
        b=cdLjfhzTHQWbobvs2ytelXHH/b1aIK+6RBAEObJGvx6jA7JlCZM+t5G6O4ykF4g+Im
         AVRceri74XklDbT4xNuoqRsZERuVMtBnqPBdoNq4ASRNpnD7osNQY2xAZChqdallAd1P
         /634lnZgI6rocVVv8IA9+9keSmk/vUT7w+Y27X3KcUTF7XMJDji64bfPkX0zuq94yTYu
         t9os54++JhoYM4lrREBrfa5FUGOZKpTZCOdnUFR/6T5ETAdTYw+TDuIMWGw29tKOVEpu
         diVH556y7Ae/hlAE8OUSN4zSPl8jwJxd8M5nnaeJRuaUxkN9lqTxpeZAt0TVW0LRySut
         pEPg==
X-Forwarded-Encrypted: i=1; AHgh+RpRguLPa92cZb4APWwduAE5sgkEdoZ/U3XFnp8UVT6Uw3cbVu61VRqggRIrMZ3wshLDP7tLhcWSJiWD@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpm5KphD6Y2eJXdbgAbItvRpoI8Osm2kATg2Uq5CqSik/cvB8
	z6EI78Z0Rxr+fTo6esKoRMI5sVifiKvsCSxHjK8mcMPIwxXoKBoIQ+00
X-Gm-Gg: AR+sD12Vbt9411+biuT2taVoNv2s68eqmqvDTby4CjxUS4OWwClMB0sCV5DI8n67DlO
	MR55PbcOp4WKVhMBcoaGM1DxG0wvaCF+PDk7fIv87VPL2GRQsel2FNA9iFb6/BlM86PYtawRv7K
	4oXJxY1W5+ZJTBoZ5PLiD7diNv45A30CBtOBHSbiWqrrok/SVWRaJ0YFcieBu3ugME4hkPY9v93
	64Jfr32vNwqWx9Er4is40eKB104YwFXiYWr5V38Z2qLBEBTKqZNUw4dsRQU/uGib35hgSC0rKOh
	CWIg5eFJ/tmCM/fV1SHxQWEkAjmMwwpkjiCUB2Dk0+PdHAiSCHUBT1Jx1YDyLuX9GVirIMdyYqI
	TCszY4A/2SKBh97TtN8hKGFMQftFV3TGhnpJfijciah+O4l5osmFauPWDIhbPznJ26WSSmkk9+l
	Jsir9XSk7SSOLtBPgZxB1kqF4dzz5xBFgguQ==
X-Received: by 2002:a05:6a20:748e:b0:3c3:9c95:c0f1 with SMTP id adf61e73a8af0-3c44b190f30mr3884590637.41.1784825194828;
        Thu, 23 Jul 2026 09:46:34 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:1ec6:c93a:535d:aab6:428f:bd63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm22274061eec.2.2026.07.23.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:46:34 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v2 2/4] leds: lp8788: convert to dev_err_probe()
Date: Thu, 23 Jul 2026 22:16:10 +0530
Message-Id: <20260723164612.3146-2-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260723164612.3146-1-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
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

