Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5282D0606
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226188; cv=none; b=kE9rDtmc0uRCKccWHpYkJHO9aKLvpXdfztwLoxM+HLnW4bSzYl6UYYZzAqQXJSZrt2q6k+B6yz30cdZfyqFJZC842cUV2KP+002plIfTl1VvZEUwoBlWHB11yVDOVT7WmUV0LuBqndsNutAt2TOG59AAJErraiAWptk8CqhZ+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226188; c=relaxed/simple;
	bh=2YFErkEfWTid63HWff5+u2dUjlWzOX6GXTUxwvfYZsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EePsnzs5c3J1bI8+UOtHMds3FZ9XxU3wRGT1a9jNdPWksuIJCpSaj0wjujJ810akiLbXsNaYc5kZSRa3YZYE9Bzo6AED8IHV7S0eLGqBLanLCab/UJKYfBZ8Q7wh5X4yrZ7GhihTKrNFKUTEELDCsjy44WfpXvZAnHryZ4UHYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3O2WFrp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3O2WFrp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so63786235ad.1
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226180; x=1784830980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttGVBBLV5S7SFqtsKUPChZqO8zfT3Rb+MVyL1uhuCco=;
        b=Q3O2WFrp4ldbolWwLpD37HPl+i7lc7rjMXtXjZ/yxkjuADA2TjXmge+IZ41Hqa8oLE
         DCmYeJi/DCdQEREgkQHXfueB/0AbCsckygIzW08mF3QfAXjtxz3DVY3Czwtl9iDDgIei
         ZTewPLAmniqikBW1qBf0Yua9zsIkOQf+kno2iRvhzi96m/RvG2u7nmzdw6BcsCxmBi0i
         8bnfQavoYnqmtv2Rh1BOiwu809v5VQzsGtpwhQMVQVNmAfndb+ngpfsIy4V4XkhCfPMz
         ghek5covdzFDWmmgPUEPeH7T+eUM8jjKuh5qJSB4j3wiHmQsOJzF76Wa7gsQ3AxnlsPN
         b8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226180; x=1784830980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttGVBBLV5S7SFqtsKUPChZqO8zfT3Rb+MVyL1uhuCco=;
        b=cEvxVd7NUXszvrEr14e6yfumIv4wYC/pqJPXFTCJmhIetdnDDVE7FcJIA83UXOUnvp
         6gRY3FDxqGC76OnQfssVqsPMdQ4nlKg5kEmizIF2AbsiJ901tku+3pD021e2VG5m4x6m
         LSNcVMC1NaibpwaKHaKZ5Hj+V2lhSbCisRhoz5SgotgSLHRQmDz6UqXPbdveZ+pkg09I
         lOQxPW0IyT4KSAkpFdtJUjD0eOfvNN3km9HVx8Hj3t/shF/U7Nf620nfTcnLu5ofVWw6
         5DmhApkQZhLM2ml7pzhgYQ2tgrhw6KByMD0LcNDfgOQOk1TbVdcjOpQYxoVwPLh3/aaX
         yTog==
X-Forwarded-Encrypted: i=1; AHgh+RrRsoZMGo2j3+bZWKWgT1eDZvrc9DodlV58nfsIKQ+QrQNOgpnmPsIAZE+JBELthAGxjHpp++JwLQWv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6K9PUzjDlh3ZGlPaycWu9QyafbM8BLCJTl+1qzZN+Sj2bBOgA
	Zbgg4+3BVlcsoqFYnljtn8xMsbra6oFU3164qUXEfhi4X8Jt3tsxgBC4
X-Gm-Gg: AfdE7ck8fbEx9N9oYne25EL38ssKTjnBHZU4Azjcr9kgeRl5KKTAHiYsj419qwfmeSj
	Q2nIfirCjBjsAmZtcuEkOUIQJEGig664KWsv7hVmiWL/H0QhkuCU+YKhFuVOVcPes56YE52QAnF
	IEEM4uVZavR94hsjtzqatZddbIX74CwdAGELaSq1ZhXEUXhbiOqVymX8Z1f1BocizRzHNRK9N5W
	sKubnjJSiLCjsk+DHChU7h+1/VrZhVZUQTr5HLdnnVMVG7ZW2yGpj7GGY9El/L9aRuG38DGWoen
	UJ612y5e60+UiXFCCkAtaYRQO1tI74u9dQnbaf/z76Unwpp9KptF/nydzBrHPiEaKWat71xnaSh
	rW/LbTLuGo2fDHmfZZM2MZO9uzSLf/Cx2ViE391LBzD0sgIUIivoIxeZZyPU6TwnC2e15Lh4zCZ
	ioqk0Eh3wPBbWINUvgLtsbAwA=
X-Received: by 2002:a05:6a20:d486:b0:3c3:9c95:c0f1 with SMTP id adf61e73a8af0-3c39c95c1afmr2292536637.41.1784226179955;
        Thu, 16 Jul 2026 11:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:321c:1213:a9ae:1111:f32a:a657])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3141dc5154dsm4066939eec.7.2026.07.16.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:22:59 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH 3/4] leds: menf21bmc: convert to dev_err_probe()
Date: Thu, 16 Jul 2026 23:52:47 +0530
Message-Id: <20260716182247.9449-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return pattern with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-menf21bmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 6b1b47160..a7e4db487 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -84,10 +84,8 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
 		leds[i].cdev.brightness_set = menf21bmc_led_set;
 		leds[i].i2c_client = i2c_client;
 		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to register LED device\n");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to register LED device\n");
 	}
 	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");
 
-- 
2.39.5

