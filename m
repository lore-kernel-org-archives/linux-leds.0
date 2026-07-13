Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37823382F4
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973332; cv=none; b=Tka1juvzgM2irW6ttMGKxZrsz1INRaX+QO3HSg0oC7cIIEzq1tQD6kgFL2e1PgtJZ46uC0cGB03OGk3X2Ih/YcHtOxWyPxoYfpTGy2T3POTRl7QCOwrVHFSl1Ljnb0yPWBAR8aEjuy+LX00aaTsIMERzMfFSoxaNS0zizeNNYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973332; c=relaxed/simple;
	bh=LJE3g8X7w+egYkCP2rXaOfca3XP81M04fwSuY2MnR3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDUM9ALuuDWIP9RSjQzVmOJbNEjJ2PoC19IyQVhYr9+5uNNB/QXpAR3S2Xgv3RSbalmWHnv2ArHpF+MGt2i5mYBnBGftFBJ5iig3ayY9IzqCJsGstNkNcNqqVFBgV1ATsX7PMG9MhCiG1fbcOM3AnbXiSFAINMGGhrpnwff4Ifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHPK/yWp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHPK/yWp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso879418a91.0
        for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973331; x=1784578131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=;
        b=AHPK/yWp4ZEFraQ4SMN4Jls+qSC7knAOmh8myQfVyk7DuMnnZ3HXNJtrPy80y46OFM
         viDnxPv9GaR8Yl7VNSQTrMAEnsY9EOuye8bao1J3rhTUu5cYmwJrYtQvSyY7YBMiNyEI
         TSM3723W9MdSdAPP0uthSF6hEy20Qh+rmZhR3uA4DQHocyUw5otWXH6MCjJww0DJLVqX
         DVTJQI52RER2Z6NGk7aLnc/JGWhBwUQYCvoPsZYag4Z93EGo3IQXL3jnkFUKPJAzztas
         KdhahToxE5bik7Yvpnvu/0cuUhEm5BzraIO303z6RV7RPNt0Vde++V5Ho43oY4yZ4URv
         XRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973331; x=1784578131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=;
        b=D5TKl0GOGbeJEcQP+Uop1Igk0sFnjbeGsZlFy4sJl1YOl5t0JVvYBYkOKKKlQ1LKHh
         KtUma9T8wL72hot1E8UqndcuJGpEGPStGSGkgim8P0NPE66w8XG3VOAzOCQg93Vo5Kiw
         Y7VajtnnNUyaOZE7rq9+UGcfy/eYhGjtQ7MuTNH3/GMJ619oEWNCiNHR6py6xIjqMD6N
         AOeUhRy0KRq3viA1+rDsfWHAWc9RpXp9VytkI0KqjXi/a12wG2Hevh3XpqNqTEcBKxWS
         ZHPH2kYG0Cx+CcKKHF2t4lZTcrTTp0maRN4W7BrfaN0tXT9i+phISzuZyRzj/FIlzxj2
         FD/g==
X-Forwarded-Encrypted: i=1; AHgh+Rppp3OYWN3kmGlSQgKErsZIna5Rj6cONW8AgFY0SIgGKZuRZcjq2wgEn7tIS9Py8RjyvSyC3gGiWl1h@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ulayv05PsH44CKovTRDbCiQb82zppOu3/KfSJnvYhqonwVaO
	s7KflvwKvlGiJ2in2oYv4Ts6N8ocrPDL321NC596WcftaXOr5nmDJexP
X-Gm-Gg: AfdE7ckHiRs90bC5t5pB7aHpyR0V+v9Y67ZtJQxVflb2QA4WIpBCCL7xwgVMUOPQ3+2
	sioeMjBEbQvwk+S2Qpdmnp4/AMAcpK51yTwfyDqpaGcS6qYMe+DRhYJWmd/MhnAcVCgXyDwSQZD
	pY2BSRcvuutX09XSEp+xBHlkbKzHkVIV0TpUaOSrtS5DNeIYrgBQDYAoBoZxU3qTcix3KtoE0ra
	oG+lu7XaGgZHv0n710OeH2A/2eddnfT1gUwMgEocpBrX/OF1Ys700jzF1FRLwJ21ZaIMCnSYlbX
	FHGYwOQDVqfSLpObMdN6JUkSqR/yx/0BBYoGjkn7vfHYPiOZjl10/xpwQzmWnE0QWjed+ajmsEz
	q9y9a17IvgabHdp2n/ogkKmL+Mb9d4NsBDOLc0CbiLNlTVrPrwYNNEyP/QCLsds3yWvJ5IEmEvt
	iJLHtc++uXpcVLdXg1NXVVN1ObP2YSGFokcaStInx+fxWymziZ88jZ1yc+gZIrH/azGAtdLMUPz
	6wqQBVmqYrOYvL+rJ5J3YDeuZ19
X-Received: by 2002:a17:90b:4c4c:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e0dc4412fmr2193622a91.38.1783973331046;
        Mon, 13 Jul 2026 13:08:51 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm68238202eec.4.2026.07.13.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:08:50 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	linux@weissschuh.net,
	krzysztof.kozlowski@oss.qualcomm.com,
	tzungbi@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] leds: bcm63138: Use %pe to print pinctrl error instead of %ld
Date: Tue, 14 Jul 2026 01:37:32 +0530
Message-ID: <20260713200732.2470666-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the pinctrl error pointer directly to %pe to print the
symbolic error name.
Detected by Coccinelle. Tested by compiling.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/leds/blink/leds-bcm63138.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 45c0662df933..12b70ee31b9a 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -236,8 +236,8 @@ static void bcm63138_leds_create_led(struct bcm63138_leds *leds,
 
 	pinctrl = devm_pinctrl_get_select_default(led->cdev.dev);
 	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) != -ENODEV) {
-		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
-			 np, PTR_ERR(pinctrl));
+		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %pe\n",
+			 np, pinctrl);
 	}
 
 	bit = BIT(led->pin);
-- 
2.55.0

