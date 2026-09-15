Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3541A4E7
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443929; cv=none; b=M+W/QJpr7jKfngvG+BEp9EjJLp4qc4ssfi4EhwkBcuR9AhvRWYVNoXn0cM/LjUdkAvrbmhj+XKxhty1hIzbxdKRZni4hTTjcABiN9KutGnE0lDn4M9b/FRVZjXLx9g4u/dSNCf7cWZBPqNCFNLqCVFC4EU+SAJIpO56Xox/hyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443929; c=relaxed/simple;
	bh=DsRA2h20rhUuI+7isMhpFGaicojrPSIFV4BxcMZAIZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eeKj15Xg9hsJahl5q57mklwYgm5vqlFLuTu1JSLy/vX0dSIkfmvVjaZ4FrSVhKIMiIwTqMBna0LpxHIdwS22RYzXWeSBclI+Z89ufXwZ3ZXvR/DLVtXHPJtn0wVaiklqYS1wAu5itJKH3V3WD16nmHiyLaROTOgp4JmfWbbRh1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXDW/wv9; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXDW/wv9"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc502a179c1so107140a12.1
        for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 20:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789443927; x=1790048727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pK0v73MRZRjcKHkBDz/OjRTYxHLdSrc3c4o/M0OpeOc=;
        b=eXDW/wv9JRUGB7ZPQ2ma5pHMgq5s3A/ToBF9Bx9nucgcVSAELVRgZS5btXyxZLqMov
         m6PG9wqt9axBy6qCq+XHfOVMfAUnwUFnBL9nbJTPmflBthqlnROAe6CN82lJl9hCZ73W
         vBVCc4TzVMLHyamf5bGM2t6MyEpDJ9CtQA0eKrluJ86K5egZiajdUrWl//XH1VGsjkan
         f5F9QxjfnPgIFx74m705jPzo5WpZaye8V3Gr1chEZZDAaz7G3R5YdO13r38p8ihRgxXv
         N7XXSNf3qspr1+f5kvJ94tD8vdFyiuGPpXgxkaeu6WoKX02S6cas5jlAvactagyZy8+U
         dqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789443927; x=1790048727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pK0v73MRZRjcKHkBDz/OjRTYxHLdSrc3c4o/M0OpeOc=;
        b=HYv961D0q+zRzT/r3G8SnPRgNmcRVlO26pNjcpWKo4rhjlMc+lvW00T8GPb9r5nHTj
         P+s9qzY+vWsO07rpUS1nLiuJw+fgRp+Le/AW+GhGbSVGJ/FjG9enXjI9+h0mYhLCLncD
         ri1ihf9W0/XP6yJRT6YpZ3OBCUCCwTsJxaAUafW2fGy6HdfpIASg0h36f6zc1Yf1msY2
         BLprFpO1aqPTwZAymzJKAW3T4DQUUM8pwadBcIpDlSiOp2kvJHuzB+1rWpAXdqE4v86x
         XotB7skvJPWVifF0VbktFE4Tb0YqDUuR+mOhYNou67DCa4kn4wmW0YW6RoFp0pijdu5n
         nDEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXPuaqNkzTsI28vNPnJCDS8td/sZ1fJyVKgLIemMhPZHVipzrTLaDTJ4R+tgdSlNSq5QA/P/Ew3lmg@vger.kernel.org
X-Gm-Message-State: AFuF++l1cVYUWQ+t5h6cZzrVEn3Pgepwrif5xkGPscXa5Of6QxrcIOuG
	F2XWQCG0nIZRBVhYeX87yGHqA/HKVBd31MQ1xbaj6SB8IQt1cpUibuGM
X-Gm-Gg: AYBFou3h5vyhX/ws5XZi2PQa32SZ2CT+G1VpC66nhF2IJ1OKnbKzzsoYv+JwX5YbrnT
	/yUwZpZdQczM++7YyX7tdQxAY5U7ZYpX5aEatLZveUxL4LOurWHSNAamNkhuB/MoursP1XgiOPb
	3/M5g5ilLi9jJho/M3uoB+dMsus9qA5mSwnS5VSRnLFq/dKyytHWjFvUF18PSYzPLTn+dmFpJ+k
	OREztB//depEQJqvVBwafdXCAKhPCms0f4SWf7tasNh7gWrCoR6IHLIun7CJE4f0EaZDclDZ+9H
	AkV/DLCaVi3VHl99XsnGRJfEXkti4zCH1sAXJgvkQu45lVFm4v1KxIAcMyNu4QhUVxPvm1k/ABz
	l6thHkjhFCaxex2PvA5xLLrQ7OKotswMpr2HJODVMsQJzXL0IlSTV5izDo4aWuVNS3BX3wt8Nom
	Pa6+j326h4McPQKSG+986CLowa0GsxcXWeZrczdDnTDHLu4mjlyPCzHYibcSeEU4q1bA4hIpMY1
	hIjDc8iebJ+p64=
X-Received: by 2002:a05:6a00:1312:b0:857:73c3:4466 with SMTP id d2e1a72fcca58-8708c07b769mr2618998b3a.21.1789443926351;
        Mon, 14 Sep 2026 20:45:26 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29abc4basm5347186b3a.39.2026.09.14.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:45:25 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: lm3692x: fix regulator/gpio leak and wrong enabled state on last write failure
Date: Tue, 15 Sep 2026 10:45:15 +0700
Message-Id: <20260915034515.4147981-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every write in lm3692x_leds_enable() checks its return and jumps to
out: on failure -- except the last one, which falls through and sets
led->enabled = true regardless of whether it actually succeeded. Leaks
the regulator on a failing probe, and short-circuits later
brightness_set() calls without retrying.

Route it through out: like every other write here, and only set
enabled = true once it succeeds.

Fixes: 260718b3a35d ("leds: lm3692x: Disable chip on brightness 0")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/leds-lm3692x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 8d2678dc9e4f..9c58d54c5783 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -276,9 +276,11 @@ static int lm3692x_leds_enable(struct lm3692x_led *led)
 
 	ret = regmap_update_bits(led->regmap, LM3692X_EN, LM3692X_ENABLE_MASK,
 				 enable_state | LM3692X_DEVICE_EN);
+	if (ret)
+		goto out;
 
 	led->enabled = true;
-	return ret;
+	return 0;
 out:
 	dev_err(&led->client->dev, "Fail writing initialization values\n");
 
-- 
2.25.1

