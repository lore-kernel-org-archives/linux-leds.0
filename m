Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287623C8AE
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736939; cv=none; b=EKBNNg/tTddOssgFM+C2FtttV2WtjZ9Bf+fFKMxyxZ2lLoqxVo5Gtm3+yMiDNzyGKE6KmUUvfOWf/ZzEDpkhnsgDuNG7Y/s1PHgSzBUtuquX70dyqsDVx/K8c/3K6/csyFDl7/QqBuFOsOm8o/tdlzZwvn0U1CLOgQULLts/ZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736939; c=relaxed/simple;
	bh=4e9noxg4gW9fexmQVXBy/R3hIDO6wowLlRjSNAg6LFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prluRVYL4OO91VSfVMbI9sFX1syy8PtYEQoIcoEUjsU6ggVyEILWsfYDxgX4wg06T8OWpcqKCk8KBU7BartoI6HoUCH41nEB3KssecX9LXx5htxBEJLuDfRJ4fBdUAeawAy4EY+x7ehJtdeTIDOJq1OR7aE3ipvnIreWMW6oVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSbLpOnS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSbLpOnS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab973140bso157607095ad.3
        for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736937; x=1785341737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgyfpUxSg7mNM2o1+HqO3P8xmzJlyBeBF1fOdpfpvxI=;
        b=PSbLpOnSOSCJdC0iUJVEU5NleoNWggovpV0kPEqSCx02M+0M6cSJNfncQAu4KMpiQ3
         +V/LOhtMZNt/9zxMrH8mqQgmeQR4P+YXkPvbyEmNiDJ5DGGCu0y7TRDtq5xkgN/8tb/y
         N8IW5TKq08y/EcGhKdcw3y+Ihyf2zr8t3BReVxzFIfjR/eoJ5++zSei5cp+P2hJaaVCn
         G/s2dEg8fYLFsxRb/bGnssf6ek2eFId+1nv4fM0hvhwc6KkQenFZ4QB0nE9LhqLoXGAd
         JTiwss3+VYKmDuaqFn0w9mq0hVbUHNCNncrcq4ztDf2fyPYtGT6OhDAeDviD294RFy45
         MYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736937; x=1785341737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgyfpUxSg7mNM2o1+HqO3P8xmzJlyBeBF1fOdpfpvxI=;
        b=Ca8fzYTlcUEaMV1Ki6tuqqS1SJJkesM8aikgAS3VHqy6weknzG+vEKHEMDnri6Hag9
         FHcZexcRnfUrHCwXwCx2MQk9cBfsJcwyXQAyKUvZy4NwCmBxvUkCHnuifTEvtd3wxL88
         qqZ+2fOd+E365uz3XiupdwziXd41NrjZlRt5VQfEgkGC0dayV3MPG+Qfx+bCbuyEKQii
         L0o/v3Ag9FNhfHC9vFMRCTtGeNDBMJnOxgh7CQwg8iBkgvkzj126/+Z7qNRyGx405iGt
         fGAtOORW4DpCgnOdjYXMP/TqqyJwsTE/8nkwLeou6qBT8tlbip6NmQmI6Jafiw6eNpY8
         lUng==
X-Forwarded-Encrypted: i=1; AHgh+Ro72wX5hA0gIV1BPdT+YKvhdI0nFflaeQqA1K50zzg5a8xAt0AAZgAd0ef5O3Ch4EF0pfIJWH3WrDtn@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6qQLZRjXEVkYZNNqQXWU0GA3+z2C8sbkAQpVmVkBKIdTFXLz
	a/tr95fhxqq0IpPBplTiIIpxEtgzMfB1L/mfFio8RlD3jqmRHRMMGuU=
X-Gm-Gg: AR+sD10WwEW8o32QIqq8xQf9foO8/HMuMoFDZmLFn11iVkOAGiYrp5S+x02se3b4XJv
	BCkNzKM/CVCPgCMkjm2I/5X+Kkr+UIOKYPrGFEGohpYqzSr1jI+xusQpJIfdteXbzKnlHUU3ghv
	JiMCYl2AwE4pnHfi1Hw0HGSATmIK971Jr0f0vC01ZZhzjFlYvUyVLLGwIpn1opFGaj9wSvbZuYy
	k+L9r3I4N+FRKNj5izIFdmDlWKLNJpPorAF0dwQYjihjKSPhOaYKm/YJkJmnaf1nGeQ2mZJ5ZvD
	311PyKoEnnCpcwX/n0K3woUjnZaTzt437s+cNcTFuC6Tje4RMQstyHg3Ht6K4t65ucp5+Z38FL4
	YFZpbPUu7QqKfhX3DATE8TDeatR3XU+Ih0evhqSx2iRocKAHKP7yBCZcQUd3b5x/OajL9SX5n0B
	uBR1nlP2qUs8lzRO7I6zmd/iBc2g==
X-Received: by 2002:a17:902:d987:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2cf3489c64amr271689205ad.21.1784736936808;
        Wed, 22 Jul 2026 09:15:36 -0700 (PDT)
Received: from t-rex ([2401:4900:c212:546e:3d3e:f0d9:52c0:8a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm21024650eec.1.2026.07.22.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:15:36 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: kauschluss@disroot.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra <kr494167@gmail.com>
Subject: [PATCH v2 0/2] leds: s2m: Wire up of_match_table in platform drivers
Date: Wed, 22 Jul 2026 21:45:17 +0530
Message-ID: <20260722161519.9610-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra <kr494167@gmail.com>

This patch series fixes missing .of_match_table assignments in the
Samsung S2M PMIC RGB and Flash LED platform drivers.

Both drivers define and export of_match_table via MODULE_DEVICE_TABLE(of, ...)
but never assign it to .of_match_table in the platform_driver struct.

Changes in v2:
- Capitalize subject line descriptions after subsystem prefix per LED guidelines.
- Validate dev->parent in probe() to prevent NULL pointer dereferences if probed
  without parent MFD driver data.
- Update author name to full name.

Surendra (2):
  leds: rgb: s2m: Wire up of_match_table in platform driver
  leds: flash: s2m: Wire up of_match_table in platform driver

 drivers/leds/flash/leds-s2m-flash.c | 10 +++++++++-
 drivers/leds/rgb/leds-s2m-rgb.c     | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.55.0

