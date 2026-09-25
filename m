Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D6E411A12
	for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2026 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315395; cv=none; b=QtNMXdXnqpuGfvV2Vw7vjw0CvGF5Gr0ldctB6OPpln2munZ1HvibIT3o43HiVvCylaZ4J/sDjbVPZExPfkWlWFktjIbcLf54ZrgQVh36ZVF7rERsdBZi5B/ewncD5MXXaXXrX98Ntgifqzc3/aWKn/2CbA1gfST1uhCeKSqBfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315395; c=relaxed/simple;
	bh=+akiLsV68L4eC22mChPv/VtHCrGxwZ881tWRoHR5eho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmuUJpEcsxKYPBiR4/LG0eRTiDHzcPGSR/3RrprvfW9jV+Rx9bFz8nWTEi9mKAArXvP3A6gBYQpZeQJ76r2SJJv8gsCggZ+faiAvWxrho2lER2yrjgKg9GQZs3y55EpvjqeGbmlOzs/rglBiX8nMcZmrqnd9hj2h3Vt8qaCHSZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEVJkCc1; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEVJkCc1"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664b752eso301475eec.1
        for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 22:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790315393; x=1790920193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PQz/8SCZaX282p44/fzlA8vUHVzm4CAEJ5eH2DjFzc=;
        b=bEVJkCc1ncuR4XJaMwoOon7w5H6hxnjN4lXlpFD0DJFIKZKc5V24hQWrqQfFnM3LHm
         9Xvu49vCqceyMOB2pM0EwqFZoPryjpHv8PCD6r6w4y1vEJlxx5hgnkDHUY0g5i2uLrD8
         vRYHHcgwnuqO7cTVGS5hAjgugsmFnPaSbo5gZ+0AYUDRl1IIGIXeTTWK4nC3XpJNrxvA
         S+eCrwvSouyIElKqpiN+32jP8vXjVuI2Jr81SQcAVr0mzftMeqg/f0zrj2rZShKmz46H
         dXbH/vLaEHoZ20dc6CLnNVZQ5PzBan/1FqnryK3cqjIMJ3C1sD54iGOJZtJpBX93dECo
         wHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315393; x=1790920193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PQz/8SCZaX282p44/fzlA8vUHVzm4CAEJ5eH2DjFzc=;
        b=EKK4nnSA0yUflwfZWjfL6l9MIIsCxmiY4hYtJbGIzrDAzyh0/JjoDAbwFxJDGrCEl/
         Zs/6HNTB1Mlzco+rvvKTv/dzVoV70shMknGTww0QHOSvv7httlmsgKU7xI2lKTfjRdi2
         8Qj/Nn4rpamNNEYBvUgiEKEGYoGpNR+cfcessHhLJrmOe7QEtKHAVz+ISnb/Jw/ulDsK
         7NE/nI1iMJfLr/ih8qA0EzbmaFA8k/L928j72MFvTjGZ6nEf93Tj534IKznIA1pHcID1
         1YQihWUejJcstCfkhE2mvl3PK4MhSypKccT3UYzZZjan4KvW+ZjQncKGaK+xK7aAfBvB
         m05Q==
X-Gm-Message-State: AFuF++mlOVGCERzw9EKpikNpzEwJhAuitxwjqeG3zhnVC8Ci2dGPWOy2
	BqUbWcJ7eR1wXQQtS9jWTp5TpL+9oGON6S7d0fg9CdK21hEAK4t7bwqXdkOc7tILekv/1A==
X-Gm-Gg: AYBFou30/WZLnHMs+74aj7GBeeu/22/Cfq+P/wHg8Vdh+eKjD1OoescKLeZnQ/a/d7P
	VTPADeOMwhIdXBYEqos/7vTU1Z/lGlYWWU47d2SZ85LFATh+KFBBbjz8/PcljlggFn/oBVe42Q2
	glbLCk08a6Oe+Y0KkP1Epw2Hps+Z2dEWdXDctjJDNos4U/pgo9d73FOiJOtJRH40t8CoiEC9ITU
	JkpvKCPFuxHApUC3ppYx1EjwaX0rrAvILtl79uAD7PdGq8JDpRvLcHnlUZR9V4M8ZC3eYKZgjZb
	KrdwKZPAmavdBS7n/UZJGMTbf1P1MJ2wp3w5ZsJdcM7p7IWWXfHT4F60NXAYPX5UI0pFHP1RIYl
	4QJfGeRHAchWWrJ7X34HLAWmkdtzscvP12nctJ0TpMmJdN5xGJwxowEYo20hRRlmVURRZL8iPqz
	57dJ0ujWJV8Koz0aKvpZq9m+6djoijouPb1WPJYPJyAxodNRphioHrg0ryuwSZUXwvE7oxZ5/x9
	MIFUhx0QXWuW9cuD8VuRdArBWHYkl+wEcK0Dg6h/Sqs6qeLwGyQg5PB10L4M600sULwi+IGzA/I
	G5ILvzqYWYgpfj1FUES2O50Fjfvdnj78DWWeoqJ97Lq9lLJRs1NO+rCBSn4=
X-Received: by 2002:a05:7022:6ba0:b0:13c:d318:5b91 with SMTP id a92af1059eb24-145ee808dcfmr1307339c88.13.1790315393307;
        Thu, 24 Sep 2026 22:49:53 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm3406155eec.28.2026.09.24.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:52 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org
Subject: [PATCH] MAINTAINERS: name the lee/leds for-leds-next branch
Date: Fri, 25 Sep 2026 13:49:49 +0800
Message-ID: <20260925054949.2964878-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entry for LED SUBSYSTEM names lee/leds without a branch.  The
repository's HEAD points to branch master, which mainline already
contains.  linux-next merges the for-leds-next branch of this repository
(Next/Trees).  Name that branch in the entry.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..a9b51745e582 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14782,7 +14782,7 @@ M:	Lee Jones <lee@kernel.org>
 M:	Pavel Machek <pavel@kernel.org>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
 F:	Documentation/devicetree/bindings/leds/
 F:	Documentation/leds/
 F:	drivers/leds/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

