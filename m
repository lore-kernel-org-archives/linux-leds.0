Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894819D092
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544535; cv=none; b=POgII02FU3RJpc4hh8WIhV61XfxxrdJirQNM5arI4Y00C2raCa+x1VajTZCVprPUnjmpcZXXresUGnrGu89NrLpyNhVeeE/AHZoaNcAMbSi/ZA9N2DoO5ACWuF4nisHCbqBzB38Y/Q7m6+um+OXk2IMtWTJIrYnDfuf/gXDat7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544535; c=relaxed/simple;
	bh=LJuzCx+CwSDIHaoTCD/nuaVQucvqVkumrp/ENtJcW2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDFMDubkaQCDDU90bbw5JNkZfDLWizcrsLXJtuWN5jZoXH2vCXwbXiIBX4OXrwyRQkc+x4TtNTMKbrc2msYqZK7j7FXlcYnbXZ+/v9Swm+iAr+hQcHaM1YhlnWo9hiOVXIbdb6u9zk74xowT/WoeSMsgDG3p6tFOwCCPbsHGah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6p7se1U; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6p7se1U"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5140946a91.0
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784544528; x=1785149328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7ZV/rzDaBwEbn9+Br8OqlL7jtJWmExIDovE73GODao=;
        b=r6p7se1Ui4hkMP2d9+KToNbqrV6IZIXEwu9fzYg/jTg4cYyltimPwuPEmw5H+AIQqV
         OoMO75OPAllRRtYi+iezKd0Duo5y6Huxmq8hEWX8rSy0KQQ//zv1e3JllOj7sBBQILF4
         ajyKuyN7o1yKbZFjLpSCi3YIpMODcl2XoK7oZnP9zaP8sTXjbDEOEDl7x2DWw8ByHJdP
         nctrtspGr62PJ0z66E3m6mq1YHhW28q7V12s0sRZFEF7PjkEyPP5rrWOXchHbcwFSdYw
         nb6ZoDv/ILv5QN5D+t9pVE2VFesbqoyq836G91VB1hx+DyKkCBiAKWArDdlu3+wOSsLM
         2RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544528; x=1785149328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7ZV/rzDaBwEbn9+Br8OqlL7jtJWmExIDovE73GODao=;
        b=W7/6LI/ObYdrWOi4jdP5mAAdmaPON2KofgprhHOP4Z+U41o76J2ae2QntN7/1llWr8
         1oiO9ooBZXRxR9o6U4RHKt0PiHxemUMSbPSekuCNcWnmBzz1+X+iGNKqSb79xYz9LnIi
         /RQxxlZgBFFkoXyHBVjNbZb38vuwLGyk+Y4yW3X5XBUysOHVEGpOfXF9s06WAORUxQob
         7z/15Cd3pIr0lNOfepHNiNHidMqIawA4B8zTdds6ogeWqeSd8x7+4Bb5IIqt1KGVJ/Ep
         rKNf73HqMIMWugu691dC4G8i4WpNAJBv6HI6rcmASOjfUi6jZayZMHthP7nVDZSgM8We
         WuqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+wzHnwCDJVB+PKWXB4gBKSMrgQL2XEkRrxiFBo8izNUZLHL5KoN4w9k4t8oHd4SK/hT++Z6bcXe4b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/nLTJK+RqmmRav9bfIEaFguZQbfe5tozBIJzhK6YrSqceLtW
	AWBD3n/q3dALyFZFpanyceWFreVEmeTIq7+N6/TNmxqDEDJYD4kp68U=
X-Gm-Gg: AR+sD12iEbyj5K5wEUaBk7mV3JvLLsbzJywv0yssdJIdSE07ZJqCZwnQutW+9yycPrq
	wxm0nDpYjcInH19aW/JOjVJWXtqJD57Vz5LsmLCY6rCYLj4VdUJ6Gxj1K56AjTs4MO13eyCz7/D
	mXQqct3bUaunkYCKlVGVFaZlPpj8hVY9nvoOdSZ3RB9hiRODM0hceE/E1crJC5yV14uODmHcsFT
	o1e62ll4LnggUNZMVaBapVl2UxC43TnqF5skGU9KJ5r+O5TILzse2OStAU9FsJGqeqCwAh2/XXE
	yqggYbJ/mqs2pvlGw8ved6Ae6e2bY6/iNRUjxKuOk/RYnW1Rr/UykvQtp+ey/+AcWwmZcMVCx/O
	UWWn9mKpaHEjIiikGKI9dtbo8ysis70aTc1wqdCMMFJegTA7E2eevdVY0PbauaOHBmB7Ox+XdTg
	BNKXwTpXDlSpzOTprpcQOlYdwwGQ==
X-Received: by 2002:a17:90b:2ec6:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38e6a446b78mr4765464a91.0.1784544527676;
        Mon, 20 Jul 2026 03:48:47 -0700 (PDT)
Received: from t-rex ([2401:4900:c200:8f2e:8d2c:f805:595:9600])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm30264247c88.15.2026.07.20.03.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:48:47 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH v2] leds: lp5860: fix init error-path locking
Date: Mon, 20 Jul 2026 16:18:38 +0530
Message-ID: <20260720104838.98101-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

lp5860_device_init() unlocks lp->lock after updating the device mode.
An lp5860_init_dt() failure then jumps to err_disable, which attempts to
unlock the mutex a second time before disabling the chip.

Unlock immediately after the register update and keep the common error
handler lockless.

Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")

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
