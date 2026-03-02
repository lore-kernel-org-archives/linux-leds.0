Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F13019D6
	for <linux-leds@vger.kernel.org>; Mon,  2 Mar 2026 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772432826; cv=none; b=mEleBVM94LE5oXiEMFTuEuU+mJg2isL9o2/JGnNk7gcrmtaUxCfkLayFTBbaZjuV23HFfwQDBYWGLgKDaNUySiGbPLWbOHGXW4otQKdB7GJ4TExa+HAeJujkJuHSZWUBfH2ZcEgvQbZBTnzbSejsDmUHl9yaZ2XC2zbl9ptBAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772432826; c=relaxed/simple;
	bh=di5z0tk/sjP6PaxwrVBiFZPuF8YrU7lI4wKrgR9YVCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYuGttP9ctX6uOpdw2tivgzJlza3WTg/ozeKgCQeqxR/jZj7+p3CFc3whkolUngLe3cBzcuWbMlMhI6qOJU70J9+65B4GaobQfvrvE0ecn8+pSThNO89/kDso1DLsdLNd7pyz7L+5K/W9R0lqy4Mttb7E4M3lvG5IHn7KwMJNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2vDG8Jk; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2vDG8Jk"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6f306faaffso1432629a12.0
        for <linux-leds@vger.kernel.org>; Sun, 01 Mar 2026 22:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772432825; x=1773037625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gV5Tv1ZXaGqFPXCit+EO1rB+qeCSTdaCsSg8aLFDCzg=;
        b=f2vDG8JktF3VH0mlXJRTBupHk2SKSGFydAcqBNQK/OCqxIVRo61+4FU36L68ZQggLc
         s25BHGRmaJEfc2uUo0gh1fkSPfKN7s/n1lkd14RP//pOL+cDvLvMtXKsm3P6jxezkY65
         Xlcv3YcPak0pmCdkP+xvS+kfi/tajzcfvxBEeUm9PVPcVZdsWA9FzAsclG4yYxQ8peEK
         A+97wMP0Y3k9+JPCv4nUMb7yrkrdOjYLJTB4QvK1v8erYJN68O9XzWr324c94D02mqJx
         dgjY/p16ssex6tVt3VlGWlucaXbOktRKJwqBfjHZKzdIBGB8fdNwcDfmLh/62Yv7dbAT
         RnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772432825; x=1773037625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gV5Tv1ZXaGqFPXCit+EO1rB+qeCSTdaCsSg8aLFDCzg=;
        b=EX0LK+sDJuHOjc4VY2xE0L+K6acYTH7lIUVO8Um/A9/D5X3qrbCYktJwQLtsRRvJ3k
         5Co8jTn5Eh0abuiet/+NG9HAj1BN8tOmOz4k03bTxbKI6KpXzGEPIFYcqYrp/epfBk0Y
         gGuLk6OEAFV0I+dk5Uv/+uv4ExkIL2FZRrukkV0M8xik3n8XU8tKjnqp1K+gKiOItQar
         11beEpyyiSFPUjDd0T4gCKR4EmNPn3DunjvSmo2NVcAuAgMCNqudbs5j+VpLQ5FQpyKT
         qcOKLQpatsTbATO1iIL9KOd+nJQxVW16Pud3aq9soOypk1dcxUqEfTD47toY3iJ5ppG7
         ms8w==
X-Forwarded-Encrypted: i=1; AJvYcCW2+fC19a61XiiB64fP8bCscg2+i3s14bJQoaIF1kl96HQypwtyUcgwDGdxVbE1YgFH8fkzh6VN3df4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn0oJSt1UuhAfpNh6X4u8tSG/zcVDI037szpX/CtJAuY0LUYdY
	1PE0yMTpHgACydCKBCnM6oujaI8v+jZWvI5d7phBaXg4P3+jBa4o1JD5
X-Gm-Gg: ATEYQzyoi7i0i5XSApYbcHgHUcEhVnhSrCHsxBszBpc4jgCbxfOzVD6qoxlMJeSmLAA
	IEF4IlqGwlN4qqn3yaAiv0PGwDue/rxpWmeb354qSODZ8E2qB8uoLsPlH0oE2EaB9dXMyDVhSeu
	9GYsZou9zOphkwN4sk3m9wYsxBg3yQ4QjcLhCGdZAZSqj+EhuJSHo4WDzRCSKhG0OjiaalyzSmy
	3ih87TEefJ/4bmwivHYqLgVodtogcl8dzPXwn6l0sRF2A6IrJEMO2+NNequFn5jAtNbaeJhBbYE
	+mAGZ4+2HSbtrwOPjoEyESDRN2lf2t9VonlLxnYftxKBAMuvAF62A/sKfL2HNdnaKb9uqF3Hm4U
	h2Jhfh3cYUwIyJwAw+0Uk8sGR7fzN3AnBcnjBvG5FQBNDs51SkTbZsFUvLdhmLVGM9ubc997cKb
	AtTMDFTTQfABpUhaJ1hyourJsR7faNP2CrKM2uLitGYrWg/ADJn0I=
X-Received: by 2002:a17:903:1905:b0:2ae:59a9:639d with SMTP id d9443c01a7336-2ae59a966e7mr2145075ad.4.1772432824785;
        Sun, 01 Mar 2026 22:27:04 -0800 (PST)
Received: from localhost.localdomain ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm12274234b3a.6.2026.03.01.22.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 22:27:04 -0800 (PST)
From: Bevan Weiss <bevan.weiss@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Bevan Weiss <bevan.weiss@gmail.com>
Subject: [PATCH 1/1] leds/build: allow tristate for leds-syscon
Date: Mon,  2 Mar 2026 17:26:46 +1100
Message-ID: <20260302062646.938576-2-bevan.weiss@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302062646.938576-1-bevan.weiss@gmail.com>
References: <20260302062646.938576-1-bevan.weiss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having leds-syscon as only bool (y/n) config poses issues with OpenWrt
build system where all boards under a subtarget need to share the same
config options. This results in kernel bloat for all boards when only
a few actually need leds-syscon.
This change allows leds-syscon to be tristate (y/m/n), which means it can
be built as a module for all boards, and then selectively packaged for
their unique rootfs's



Signed-off-by: Bevan Weiss <bevan.weiss@gmail.com>
---
 drivers/leds/Kconfig       | 4 ++--
 drivers/leds/leds-syscon.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..ea3afc76a9c6 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -903,8 +903,8 @@ config LEDS_POWERNV
 	  will be called leds-powernv.
 
 config LEDS_SYSCON
-	bool "LED support for LEDs on system controllers"
-	depends on LEDS_CLASS=y
+	tristate "LED support for LEDs on system controllers"
+	depends on LEDS_CLASS
 	depends on MFD_SYSCON
 	depends on OF
 	help
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d633ad519d0c..13a9cdc13367 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -135,3 +135,6 @@ static struct platform_driver syscon_led_driver = {
 	},
 };
 builtin_platform_driver(syscon_led_driver);
+
+MODULE_DESCRIPTION("SYSCON LED driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

