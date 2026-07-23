Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57167388876
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825198; cv=none; b=ZwOPtYTKqcJS044sWtqAB7E5Ug9I9GNsbcR7VOHVNEzv5yvp+LGLCYb7t/EpvhzvHouHTP2QIqUCbTO1v2DZBvNvhSj/M8ouus/Wpr+f5mLnE5QhmbbCbeyFYuuhjYmZfqtR9IAHcUKOIfRCe4Hf09mVMoUOUlcZhZKJP2kIc5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825198; c=relaxed/simple;
	bh=Itb4XvYtx6yfS17eCf148xsCQWGR39f8bNvG9AWleUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vzt1Hm6ForyK0tGgNz/IgdixmZQFiXeD6/HqYAv4OTbn7egmHYhRPpkxksrnJWjLyYmkNwnK9X+98u5Zh81+sEdNcfIcVesm6QP3/wUEpIdipt4rRthaoqqUNiBCpZst3/eZEqzRH5iE1RfbPQNaAQLSMZ439h/6Q/21s2/4HHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/QY7aqn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/QY7aqn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so10458365ad.3
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784825190; x=1785429990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9Wzhke0rzEYiey7/Q42zcHEBymWQ0YBz56up1JEZ+c=;
        b=H/QY7aqnd+ErG0qJoLz9G/G2iWx2UrU0UIpfmZYNvg3cXXlOi2VWlkxyDElRGZK1EK
         jzFt8+AqWOaf/NkqBvwwcQvL/9s+F6VJ2rVaVCtmwXpBQmf808dHE6XFLA7ZJB8HxwYM
         IZYWGAbvLKl7ztwDz25AJiLnRNS9cO1G1EICrlss39YcYrMWzoNxu5csngBE2YCbqAh+
         EsS9T6snsUSBiAR7MEWW1AEtExoaUh8H38EXvACwN12Mkl/0EE/NQwxil7nt7k9wjFNG
         F6+8YRApIWx/l54kDSvAmgxZpho9UKlmTSR/TALR/MTaa7QEnswJL2f4EUJRhh9Xh5LQ
         leAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825190; x=1785429990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9Wzhke0rzEYiey7/Q42zcHEBymWQ0YBz56up1JEZ+c=;
        b=R5i6X4jy9e58NhfdMhoM1DmBke6YgFkN/BkZ+E2luETkgsqtdw1goYC3FaqSOnrXHS
         XB+fO3FESHM2BQYr3338dytTt23LG0kADnqjI67HdC7r/pnEPqpOA/lHDTJcs1Zw2vP6
         X5sZEGhlqR/WEnGVydiEAaBj2LpF2/axS5RkDrpfT+OXTfbX9eWsPHAYDWSTfYmrr3gt
         LonRT/MSZIJis7l5uJN1fBd6pUhNoec+wc9bUieg23Qj6aSIFc55h/M6t0GX5O+Xb+IL
         RNxtAGiv7jC/AZkm/onuK7gRtQvYeqBCN3CVmxx64i3SrCtjJUy/yGk/zJs9xSQvHB1e
         DrBg==
X-Forwarded-Encrypted: i=1; AHgh+RqYJmPYpfSP2Tqd48C/jcr5v/aAqRoP8ALqv5gpJwco7k9aOhKPJKfWBPA32GzBRiqtg1QB2VZY+PpG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4NbsAQlwfGZS9N15bcz1qPXAk1isJVbDBbl8Hh1SSW6F1kjlS
	vlBeEOujibcw138y2mQvdhM2rFaT/JSba/0dKXEXjMoHQgzydbtCoWVB
X-Gm-Gg: AR+sD137ljBGDBBXvHQty58WK5Eftnd3Uu8UYai9z/ljIgge/IzEAeBiY4OkKk9NnCI
	aq/5f24h7+Le2nzK8+zzgLe4QyIfBW1pJaSb8g8sfwfY3UbCuisaPujz/3bkPjiRiuhJyrHVGw4
	8FVf+go3sRyBgMO4PoG9KVww3Kl7YIQqTJI+ZVqKNDS/EtdqTdXdQDO/CbDqHwGeQ+XT0xZfLrH
	4K70EUSSFDQU7n2BtUsr9uliUXuB0jsSK3FmIgwxX+/rD/u/jf4HyMNezfr1t+/yAkjClNVsbvF
	2NS1WRtCiaUxiG5iYJvrzHyrXmjCI9RbFYGgRU+Xfs92nCELO0kEcbeI+p3wWRm63c1kljRh4Os
	MyDODeh9XRLg+b4KuapphPvtacLydDYpkyaD32gYRZlKSiqDSUXLzO+lJpkUWLT7Yi+oFCWSv9d
	KnsqOC0i31HRo4Ldjk2nQhvk2DW/zsgGXpSw==
X-Received: by 2002:a17:903:3d06:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cfa6d86c4fmr42737785ad.35.1784825190170;
        Thu, 23 Jul 2026 09:46:30 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:1ec6:c93a:535d:aab6:428f:bd63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm22274061eec.2.2026.07.23.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:46:29 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v2 1/4] leds: cobalt-raq: add missing MODULE_DESCRIPTION
Date: Thu, 23 Jul 2026 22:16:09 +0530
Message-Id: <20260723164612.3146-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing MODULE_DESCRIPTION() macro, which is required by
modpost and was missing from this driver.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-cobalt-raq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 045c239c7..5b5acaa8c 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -101,5 +101,5 @@ static struct platform_driver cobalt_raq_led_driver = {
 		.name	= "cobalt-raq-leds",
 	},
 };
-
+MODULE_DESCRIPTION("LEDs driver for the Cobalt Raq series");
 builtin_platform_driver(cobalt_raq_led_driver);
-- 
2.39.5

