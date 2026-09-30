Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1F31A556
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753270; cv=none; b=pmdZzktwfGNFVA2g7dT/wbSOOtyMlY7J2IpGljw5eWPlb7cAnedUUw3iJvOoKytF1jHPZqPNCHrEUtXp17o9CXQKd04iUu5MEpXAO98mCXEMbmLMMPH2Tjb8y/jVLXezesw8vKINvTCrUkY3s6HY6Jh+HzFANsrBEI9lyxGJ4fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753270; c=relaxed/simple;
	bh=tUpEzOCfmUF6KJldh55ia/zdgVa3346cD2y6uHf2ak8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbnVNTGrY5o5hb8zmsaINxA6Ruq6G2nKePqLpovsav8+9EC6HPIH8owgzyw5y22kigQrQrfKUVshsi5GNgvMzXYcV68/fZqaGVpAsVh66FYGu/KDbcTyCsdt0jHUNiAmilBNlAOzRlvxTkPX8xLL8CDS98bFcD7ctFQfIhQkzxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdmQiCaK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdmQiCaK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so24062975e9.3
        for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753266; x=1791358066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=PdmQiCaKbfh73kpKBwwDZrdRadpyvsAXmWhJ0iswV02hW4/xHcSvv+cSnV0R2B6fiK
         gXLd/8lDA5BU7fLz+rRCs9pjYt0ntOs60Ru0FyPxGnTdSk7IGnhDQyBwo9ZxXVPAR1Pf
         ShmEeQ6ZnwY4RdOEfEdSrsA8Ko+jxljYETD1A0vsTQYAvBFbeAqoQOQ3d+kMgMHw+85t
         plbEr5LVJC68fxDlSJNleH8Ndcc9c8aAiC3j9U45VDQ1qUMEGCh7FmuxAih5duCbsxrB
         wynd6mnvftXls2iNbU2SI77NiH8NCzjQShmcbYQ9FpTZx005PVH9nmdDm3WiOlyQ2KSm
         qDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753266; x=1791358066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=pEV2YhwCRdumzyoLiFjgXe+reE6U65MFN1YGwxdrcPTXvAZdwY2Vp0FFFK4L6zg/En
         L0pKWZPTBXK4wL5T5/ZW6rC2yue/ysK5zs3UPwnVw1tU/UE2wuVMN5tRyCrXw9HDTXsW
         vyXv6MxpoiplMyKqt7FNppC3r5iRC81CFGt0obpk4UslBdyE24RfEkt3bHv11qb6r9Zp
         KYp6M72aGaHGHHofAkb4aEzPTFN2HYtsd9oG2W/z95uGfKBMr48MN74xvzffI7LEp+Xv
         QB5skr/JmrZ9ELCtw2Ptu9rH+jq2ha/1Krz3axQwda522gz5rnDXpVVGYp1oUMrE3qPA
         NFUQ==
X-Forwarded-Encrypted: i=1; AKwUvByCqIQ3wAzbMXpaw5ag1DlTAu0wCsT6QeI7BDbLUrRFDLKKFMZdUXlhVWcFO8010JOd6akAiXTjpzCb@vger.kernel.org
X-Gm-Message-State: AFuF++nD16KBNnZZ/7g72q9FOJQAC2Aejxb058VV02/qC0uXirw9wBuK
	jNr4AXXvu2xHMJQbvPfBK90R9fmwIePASzNdPg3btcb/eVLr7sE6n7qJ
X-Gm-Gg: AYBFou0JumRddpKsNvUS7FzK7ZQublkrT/hD0ucNzVXNVCDLRIooc1ht1LxSTP2D3pa
	D3ipzs40KfDOgljXfP/Eu7gQJe66jQJc1gld9mfjjGsYrZSrZOfo/x+bZt85C971JcNC5rt9yyu
	mFMuaxREic9hdC6ZMy416WpQ+RE/J0/hn1s8H7OxK3SKPhpp33Kx7rdLi8qxRAzRTC6sR5CV0+L
	x5QKChT5+7V9QMCYoQ8FGt5oB5wbeACvDXZwbCg9r7+tPmVlAM2NapE4upKar9jeO9IAeEgQL2z
	r2W8XX/zX0lPl1e5QlAw/Na7cpNYekPaYqgBXZcXaNs7CRjDcc33A9Ncx5lzdTmLFVgu3PY602t
	JFCFI1DAOBDBj+bG/w5fyZTKuobaJT0xjqwAu1KWZSsJU0PiWEhtd3CVSH2jYZHfPSq28kyMezM
	fRTSOvZjZgFgtW1ZqYHIKpYJqVUyn0+by/kz/NpRkxHhOXnblzkYgNtvDZ7YQEhAzhGQIhJdNer
	S467nrctkMGn59cB7g=
X-Received: by 2002:a05:600c:8b88:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a01adde996mr6121365e9.9.1790753266400;
        Wed, 30 Sep 2026 00:27:46 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a84419sm27680985e9.1.2026.09.30.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:27:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/1] leds: Add driver for MAX8907 LED cell
Date: Wed, 30 Sep 2026 10:27:31 +0300
Message-ID: <20260930072732.66578-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Svyatoslav Ryhel (1):
  leds: Add driver for MAX8907 LED cell

 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

