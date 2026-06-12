Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5483F7A9F
	for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284732; cv=none; b=gK274k4CVDT/YgxYLkfd2QViuvQbfSfUpEOZtIuaoUBma/eBWQt3UkKN4TgrUuAw7FV/brHUJEg7vdBUKvTuXq9p2PiYynH5q16ssuvGhZxvu1KgFTdcSrpU2nP17BF418qAOfhnsakYb77TbR+kDer3mJ+hn4Wmpqm31Ikez8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284732; c=relaxed/simple;
	bh=yVPBwVMtjHWN3su2wCCWfu5/mrm7yRNsCI5ALzLUUgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=RkkA+aRYo6sg3dhGoOalvlpk5vKwPgF/bVd43u91nd38g0X86oCiiDKR9BU1yKLCDhwHyUE9reYjPy02pu2osArIlpPKw8G/O07tbaiE7Zlw4kEr1BTmlU/xuZaijc1kGXEUy/qjZPMbAbPuA1v09qbKBo/raAo90nMXLOq+iIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FldVUUR5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FldVUUR5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso787644a91.0
        for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 10:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781284731; x=1781889531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=swbkGlj1oq37sWL58RG9e7scbRtZucFGbZOgNpgrpEc=;
        b=FldVUUR5QtVbriYZJPjP5llIYbbrM/vlFgaAhuKVpaSXGmSmjeqRVcm3FE5ro3Jdmh
         P2B2LM8BK6lE6uZ4B0qWjFktRSvFHq6MmGVbpr6Z7X15n5Z0CvTEqwntYXPH9itV/SQA
         OPFuH6Glxj4ovDy+BOfj0TW0NC6LBfK9VMfYFbSQfunGXQ8d665XbbfFtNpULAB9qQrj
         WeuJ2V6OKb87nUnvb++KOwGtfRUoagQwqnvc/fmj9Up+4ZRSmuCYzGm+iwTH4NK/wk6B
         V/JGlAoPtxnab9M4kdXdZ5ervAk106JH7tBSB5mUbpLS69I5dncnUzYBddA54Z2Wh4KF
         JqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284731; x=1781889531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swbkGlj1oq37sWL58RG9e7scbRtZucFGbZOgNpgrpEc=;
        b=I37NfaSDk/j9IJFvHMtHLCLdar0P6OG/tfqpKprGpDSpEvtOD5XiWuZm5/5RZnhJyp
         0MsI74zxGBJhqUGgUq5V5FaijZGsUDE3v7pYIlOCeum+Q9V+XXe5C7sGCu4Ad+eHj8/B
         YpN9RMyg43VlWOgpM4dEpoXhuvsE4ErJ4dto+7zJO76S99d67L9pTozkEu2tGBwlASfW
         9McOCN90wfGTp1bNcgTSk6++2YevWNE1DeRJlUP7Ng6qSsjflYTglFfiEEzv0lb7r7Xw
         tQDBjZLlFfeQKp31tGbHJ9BbtPW8XsaVEt3UMm6X9r2At+T/JSlnMSsQgAGYyv1rGgXm
         F1Kg==
X-Forwarded-Encrypted: i=1; AFNElJ80HSASCIZZNq4cwqzq0HKmzl0zkiUek66tMz0sz20ss3i+JrfMYf/Jqja4hcBih4RxCMKpHCOra4vV@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3OUUiHQdwp7ZSWKitfvkDmc2WYNtUKztQserpWPSHbcw7e2r
	oxbfiZyZTylZbuSzHPX50vLIQYpFXbnGK30G07kgtOAhAmReG249SWJ5
X-Gm-Gg: Acq92OGaK5Qi82GkcS45v5dkqCC56odKKz6g7r/ng0zEoQ/ilQ75jyFrZoKitnciguA
	Hbz7rrAVV5u4ovCKDrtASEL7Gejc0bfm8yoYJJu4rBmARQGRCG1hn9/mhLgxgZK9RG96BytgYet
	7w9OyiRuzQmDFyO/nGHUUQW2gTdobMtBq6kB/WFnBs05gk6m7i/hwAb4lQVInIDfkGc+COpFveC
	VYuj5RZMfvcWPg7sHeWdxxoMDmN9QvNtKY0sz1Ty9rYM1znUhiMegYQwwQTCi0+me3fn2DCsorH
	3V6CLVCqbedpu6xAdnPjC3aNq0eX6PBUXUAzwMVDlYpjD6h+R1ciH2y2BvwzK2s/rHHWg9lulyr
	nhAhvl7+jUVnzg2KAvlxoZkIoR/5NpkxYJZcsRvlW51LBB6cXzKTf4RxL1po1vULJJ/ET4qTySc
	drIBNxGWwR6oPrVRVXrAJZqshXnBLBzHz789upKvz2tszZDFvw/iJNdGg24/2uvRqR0ivuzQL20
	Wk3eXg=
X-Received: by 2002:a17:90b:380e:b0:36d:79c6:1563 with SMTP id 98e67ed59e1d1-37a035f00e6mr4074983a91.17.1781284730623;
        Fri, 12 Jun 2026 10:18:50 -0700 (PDT)
Received: from shardul-ThinkPad-P16s-Gen-4-AMD.tail792e28.ts.net ([2401:4900:1c17:d4b4:80cb:f14b:59ec:7cab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a262adbe3sm3249038a91.13.2026.06.12.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:18:50 -0700 (PDT)
From: Shardul Deshpande <iamsharduld@gmail.com>
To: Nam Tran <trannamatk@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: leds: fix broken reference to the multicolor LED ABI
Date: Fri, 12 Jun 2026 22:45:27 +0530
Message-ID: <20260612171528.728111-1-iamsharduld@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference pointed to a non-existent .rst file.  The ABI file is named
sysfs-class-led-multicolor (without extension), so fix the reference to
match the actual file and resolve the warning from
tools/docs/documentation-file-ref-check.

Signed-off-by: Shardul Deshpande <iamsharduld@gmail.com>
---
 Documentation/leds/leds-lp5812.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
index c2a6368d5..12e757d45 100644
--- a/Documentation/leds/leds-lp5812.rst
+++ b/Documentation/leds/leds-lp5812.rst
@@ -20,7 +20,7 @@ Sysfs Interface
 ===============
 
 This driver uses the standard multicolor LED class interfaces defined
-in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
+in Documentation/ABI/testing/sysfs-class-led-multicolor.
 
 Each LP5812 LED output appears under ``/sys/class/leds/`` with its
 assigned label (for example ``LED_A``).
-- 
2.43.0

