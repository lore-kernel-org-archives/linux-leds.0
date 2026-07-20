Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1D38D40C
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543139; cv=none; b=GTVS5x71KAbgXMmfXTgspdwIoHulUDrThVQLmnqcrv79urbBFVfnFGACrC1BRVsi1CqT7SDfP7XSVclJMOd/pwtRYrgyUP5/ZubDl/HDnof1tuOp9j0zrJ9HJHkr+AfxqTfSClPJAFu6H724wB97qoV64Ns1fboeuAqayW0kbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543139; c=relaxed/simple;
	bh=qOmx65Mtl/hczrJ4Lqp7hXhGWgY3evDoDnfzUoBdXEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORewJndX2HRPzxyEGkWCBph0JHgxSw+TFxuJi85ICNSfqLIWo0WLQy7yUzv91ZoOmOKWMxYYYaM//V2Cp+XJ+JAtC7jo7+fAWo8Uh+8XD/eVxfmLXmODsTqFt4rDlBLsM2zCottIQBhLLmaFBvagXPJEP7J1msNeib505tGIINU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc5Zys1O; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc5Zys1O"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1940787a91.2
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543137; x=1785147937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Xvsuv4UYLFMdXxA6TxEc2E8D85Mfu73an5KPIgCTIg=;
        b=Gc5Zys1O/tHSEhQU0ltgvYOCc2gAbIDKOxKUQ/wbHgLFEN6Wo+unNioUg5eWf0JEib
         Vs71dQskITBWsiilHYfRBs+Zn6Xs2R3NgLX+o87ZvAmKLHVf++TJVKeQ39L+VAX8F7rK
         UCjC28EtR3E5BS27IRXyksqPOu9LreKYjWKsZZWaOPk2bYyLI4AV4qAvSFunXVYo9H52
         TfjIRAdpNZdqSjVRh+7PYkoD9LR8dvIDWclKzwXc+XlNBJ/52rynmOhRJw42bYe8gUhK
         ssgRch6s77stXMMagmGpx36w4k40JRMyWXjLENEsvUtb93ztsIaydCNsYCIWUphX1F/Q
         H3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543137; x=1785147937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Xvsuv4UYLFMdXxA6TxEc2E8D85Mfu73an5KPIgCTIg=;
        b=f+L+33fDhtkR7n4K/XHMKtBpxcL547yCU6l1SbS2KN8LC4MbJHCQ7NtopuWVCmLdhZ
         0vR3xGPm+fsBdtHkQP4jF+GGvuZNV71cJuw76BSp78igm/M6MKWOQkDH0hT2zOElercw
         VOoy13/EbxdnAWomYOseH4LTLH6OgxlVUL/3PMjm0fdO9/ETZYNePkJCal3swrqMaBLa
         KYghMh9+Y3t8kmI1frQB8gK9j+X/8DpAWiqnj/q5egLpQPI7OGE5wlsBB0dvc3amB2JH
         w+bsiJ4ag+hs3lu47udVp4EczjUKPtWBriaPKoXVL/5G++G+OGdn4h3Jp58bEC1vzW8v
         FvqQ==
X-Gm-Message-State: AOJu0YxkZ/P9nTTZlylBHeG/efSPwRc+QSge+cREB+fmuSJ8304009IK
	5UjDJJzdaWhpDDeBXWxj1C5u7u0ak1jCP7CCjX8TGfVOgfGOhm74P0g=
X-Gm-Gg: AfdE7cm9VdciU/kCueuwYg0ebnVqnceATTNR1R5sv6570Tmz1mgOhTI+EnSMrsp5qoa
	nOQ9GqiCHmeGCJRx8yf6PAwXX5wPExwj3ajMajL3OTkM5GBy2u5+2indgj3DHbJg6IWQImaTw/5
	ZsCIANBPtMGIbupOCYT+dfobDkJR3k9b6Zmlcu8Z8Fv/OorsnfZ7I0XCeeoJ/+aSyCyf2YF+TZR
	UYPz0I0IKLrkB2BbSVcwhqh+1poXfd1LYOeE2SRTv0rjgeztMlc6IvMvP8kF5SyqzqEXunWjpp2
	ZsiurUl6D1J7zsK3YvaEbwMwNCrviGZJWE49JRT/lpPDroVM1aYt3qWUVl/ZZzTI+MIQuUD5Mni
	8UWqV1dW6+IyvBow5E7P71WmAidCY/xE10Fv15X+y5eiw841yVMUC6SeE/ZlzNhUEiIWLyH1BDt
	/u39AtUrmew0wF18EqjlIxOVW+3A==
X-Received: by 2002:a17:90a:d646:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-38e4b51be59mr14912702a91.27.1784543137196;
        Mon, 20 Jul 2026 03:25:37 -0700 (PDT)
Received: from t-rex ([2401:4900:c200:8f2e:8d2c:f805:595:9600])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm29322983c88.10.2026.07.20.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:25:36 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] leds: lp5860: fix init error-path locking
Date: Mon, 20 Jul 2026 15:55:25 +0530
Message-ID: <20260720102525.86475-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

lp5860_device_init() jumps to err_disable with the mutex held when
regmap_update_bits() fails. The error handler calls lp5860_chip_enable(),
which tries to acquire the same mutex and deadlocks.

Conversely, an lp5860_init_dt() failure reaches the same handler after the
mutex has been released, causing mutex_unlock() to operate on an unlocked
mutex.

Release the mutex immediately after the register update and keep the error
handler lockless.

Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/leds/rgb/leds-lp5860-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
index fd0e2f6e6e0f..e21d5f2302be 100644
--- a/drivers/leds/rgb/leds-lp5860-core.c
+++ b/drivers/leds/rgb/leds-lp5860-core.c
@@ -204,9 +204,9 @@ int lp5860_device_init(struct device *dev)
 	mutex_lock(&lp->lock);
 	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
 				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
+	mutex_unlock(&lp->lock);
 	if (ret)
 		goto err_disable;
-	mutex_unlock(&lp->lock);
 
 	ret = lp5860_init_dt(lp);
 	if (ret)
@@ -215,7 +215,6 @@ int lp5860_device_init(struct device *dev)
 	return 0;
 
 err_disable:
-	mutex_unlock(&lp->lock);
 	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
 	return ret;
 }
-- 
2.55.0

