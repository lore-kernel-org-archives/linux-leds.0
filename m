Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55B4DD3B7
	for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979995; cv=none; b=b8BSmnHBYgu6VoTg51iLMMKoDfv7omdZSxOF1DzTHeTJHuOmZQhfpF2co6QNUxH8CA4TxUH5NJEehwdWAi4pseA114959G21I79hx5e7WS24zZDaUHcxe+tVdOWRWGF28kzsohGEuamco+t7ZYXUHoAYhrD+y0mhKEvZUEvZwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979995; c=relaxed/simple;
	bh=tUpEzOCfmUF6KJldh55ia/zdgVa3346cD2y6uHf2ak8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VT85ltAgdpfPsAw96g0LYK+YNKb6qhkenB+6Xay9nRiFCRerO42YsuemBV+XwnuxbrTO5rbpc9M6NH4edmTkvWbpqtGZrxjTDhDFKpbnaoAWEFZJSbOD7+nf68Uf2Jt7ZfDmYbTQ+2rhv9Vyyr54yub6mrEjcZquGQwi/nGKovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEeIHBmz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEeIHBmz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so39240975e9.0
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979992; x=1792584792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=BEeIHBmz6VvHzs+I47BxAh7mI01S0KKAZLTD9rj3MlUBA95ucq2KbzHaC6SQYGR7vI
         NT8e5tYWj3FmzD02T/DtUkO0fJnJ0fD5x0lELbU/59fk8kaTfmUVAa9ZKRFZVLXls1wd
         HPpZj49YgLTWrGWrS/Wd0/CYv/oDs8y45NWSIkNzQM1TO/baDDEms2CUOHqgGaV3mnRe
         8HvOyZHijHzir8rscpFgWWnrFd8WgX/RABQuLICrqNHNlZoelBNGTWvTeM9N/VT+wErH
         4HX2XgCux0OIkclep+iZ0ZB9Dp8PrfreTzyasyAANqf8bxqNuyyEQg/VTUk4g7ibqLt7
         mg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979992; x=1792584792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=NwCQqAE7uOU9rxiwujLs6wGzcR9devHfHCk8+a9p8d7CJl6cQVZoLOZeC35pdVK5Qh
         K6N/9RbaHDJzrHEKKUZ03TNJjldirez/Kh6TG6wbw1GyiMzfuxAeJHskwomOFGxsK+LR
         0UZSqum1fQxLudEsp7PP8Gt9h02qvBJ4o5Qu0CtzxsRC27M6pmTg82nWAY0Sa47OwylP
         4i/OX7055Kj8X4h4/ry0da1VQNA+b3VX1GXDaVt1+/uQVoRu7/r+RnGZK/z3k1crBWka
         1ZdtBewdlo5IEM6/Fyj+YeDstM43QAZvs0LTYMOQS5DszEjPVkRNXNas8JQZyDsb8h8z
         M07g==
X-Forwarded-Encrypted: i=1; AKwUvBx88VjtEVbCZ8Bm6G+8sSJSmv5aAyoizv6yNkwMMv4CO0SJzguQxJS2QufNJuRW6/Wg4KsX55C06kNV@vger.kernel.org
X-Gm-Message-State: AFq9FYLmfHIK3vf2savSEwehC2pD/t6xMOBBLCA6henO8EjfuAEbjxkd
	yMjXcYBHT/6qfQwe0gxK6w0Aa+63aeE9XqZweFDNibZ+ms2JW7R6lsBn
X-Gm-Gg: AYBFou3bMlFMFp4PM4yz2B+NGaQgSNTQ4spe7NKn2HcSp4tDvrCV8v6A2aE/jBbPh9p
	m98pjM+zP3fCXaAKRejxPrf0COQW1N583MELvYPgrtjfZCyrvqA3cmGy+camQvlQRKG3Ys3yH5m
	s8MMWPZe8+gCDZ+bDY9T9yV72aKqoFwdUMrN6H97zdoTDiE5SkGiTdgWKfkqFs5K3ldpiliPIC+
	WzF6RB7a+HsV3hyNpjZgVUEgZ9MOX9IrldsNW7OeE24hB3dTKwV3WMKd/ckbKs3Qu3Tuy2wppd4
	h8d9UuiS3TRBASWazpOvKTyJzkAIKiErvxWmSiVdMSEKrHLLdbxtKLmPm6heCGd+EYQJPLMjWlu
	MWv+nIK+IDSGQ6V0kSs5AHLfVwgyfyDJMEZc2v4ki9tu25snXMBcEaweyOeGsOmZeln/Z8qqEcK
	Rcjbk256lrw8RtWDvza7UwsREgdi0T64Pi+6BhCMx+0BNgOUG93cRS/1aWFobeJGo/Rd6Ms6JUy
	jhiwKGArO9W5TglzFE=
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr171728245e9.6.1791979992192;
        Wed, 14 Oct 2026 05:13:12 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm11420985f8f.48.2026.10.14.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:13:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/1 RESEND] leds: Add driver for MAX8907 LED cell
Date: Wed, 14 Oct 2026 15:12:52 +0300
Message-ID: <20261014121253.133467-1-clamor95@gmail.com>
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

