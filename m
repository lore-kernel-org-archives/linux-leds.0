Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787FD3446CE
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229768; cv=none; b=sKLv88P7PvJwrpSK1ksGhMk43UdVaefp9VmIOlCJX5UfAUc+7UGcj0M3hCZcW86R32e7IYiQvt55JjDDKPIH6TFPGjO9W9TBY83EruZnPXgJxa7CIJ00mC9HpZDOiNccPP/J0d+ph1/dnWsIIwIbXgCVMBddDwqDUTxKigA9Jx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229768; c=relaxed/simple;
	bh=1aacAFrJpfNCprPgES36RkWlNl2rUmkGLybrOS647Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNB9mlUXfrN4v7T6GHb+tcrMTEhH3Mw7ZY6qFkd35Ejvl+AbD1O7ustO8iUEfWYvW+0h/7LU0pUZm2DfozxF2TntdAQeDjnvr7z1sgxgLscDbALoSuno9u9VJ3iEfeGAn/cXrmvnRlAlgI60V2IktFcTQmApb5HWrBE1QhZgoIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsrgsYy8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsrgsYy8"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-888b8fe095aso783391b3a.2
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791229767; x=1791834567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=24q49npE6pjQQ1gSDN86TRYKVZaBhieHztgMr+e5WT4=;
        b=ZsrgsYy8EQeF8haRs36TSqs+fpGw0+q6W7pYyInAyRPAg7oL4NVuxHFxlOTSoL/e8C
         BLBIiAfuizQaw2EPgu/gtTEvDDTjZr3lHzbuIziJE/u1RrP/9WalK6B2uJ2hAUvz+c0P
         PXXsH0b1jS1kweSLfGj+3odrTseSQxXRooGfyyxIy3bxLZvJlP4rLUat5x0YETYFpcSH
         jpkIaC3PfIafWsVd4/0vVV6j93Qe9rxZbrwO+1XupEvCiQVHLf4F5wA6P+tD7w2a6gte
         Jat6b1kLjQAYXGTbg5Wf5i1Tszmu4aabmv8kgYCh9Z1vfBvBSWYX2PCT0W8fJRPgDEX4
         pTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791229767; x=1791834567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24q49npE6pjQQ1gSDN86TRYKVZaBhieHztgMr+e5WT4=;
        b=j8u6ag1Vxmn3EmwmZaSGPR/wBCbo0sD+ijiT7irHy1qqtm0QBRQ5lqbOU73TmYNIlp
         ns4m1jxXzM2PQRzV1djZRqWYutwVzmnj91Xa73sffPhJIH3D/Vys5fIUpW42dZ2rOqgN
         wq5pjTXXBHrxbUWY6noyyE7KdomaN2dupGZR6s2qW0dWrQxJx7ejpH0/IGy7/2zyX/jt
         D68wnSzn0P3/HGUwzFs8NTarUB+gTvPVg1zJTE5/BsoryrH/pPmLKlBiLl0/jPNZOwSf
         LEhIbH8c8WtRmTAF3khLKUEOGMUSGwaFRwANI4HNfPFKwx1d6NXkcCzPXP6xZhP+ppED
         dvrA==
X-Gm-Message-State: AFuF++mYt1xERKzjn/oo9SD3bAQEjldh+NKJxxF5rdGs5ADRnFnS2SCt
	VjxKVsh6PmAkIX6jgOpLv8+Whxk3xTI6xB/w9kq58SnJlDjLtFvzfaeHnaouUnW1894=
X-Gm-Gg: AYBFou3lDPC2zFTzC9o+wLsPCGv5TWar4ZctvT5THOAv32RRjkgCq4NRTNeoecdYYfo
	8JdpU/2o9Ag656t4fVtlSqYOzp2A+JvWluT+cCRi7xwPPn0FCJd+92z34E7Ofwg5fwA7T6i/Ape
	IhaVn1kPC99z95h5AjIsKWnZiZ8JytXUUwc+wK/YRONC15Ab+9oAFHgEjg0ry9iCPjtkEGjh2ok
	Wp8L/YOgwDjpL/4Os5+Z17n7cXAc1AtRmjk8bTwVHRdAZ1xghfr86RR2jXmzyVcwIyUQ/SdK31o
	6ScSXbn//MlG34odu0YUIpz7ATrHMV7ECSQUXuTNpaLhGOLNwoSMaQgQykVsf33dsEuC4Qsips7
	P1fFgQzcDKUODW2piIfFGBrmoPZhvaPjIt2+ISZlLTzQtWU/8TXKckS89qhaq5xdw47ZbtGtWjc
	TWQAOQjSK02J/wqVj8W81+c44if6svH5oF+cR/e3/yxUZoZyXMasTDhf16rGCGdcx0Hm/Rqh7tp
	BgsClDA26legqGy8TquzO2r7gOWq98/cZ0OMwe9/SsBvV7miLh+IX9+er0eXzHF+TW0Wyt6qsF8
	ZOD0LY6OCvg/ZTImgUE+ndRRTqxAY7LMpTwuPEiDuPlgYq/u
X-Received: by 2002:a05:6a00:4c87:b0:88b:71cb:8a02 with SMTP id d2e1a72fcca58-88c5d67130amr7579564b3a.0.1791229766638;
        Mon, 05 Oct 2026 12:49:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0bfc3805sm4008252b3a.21.2026.10.05.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:49:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table
Date: Mon,  5 Oct 2026 12:49:23 -0700
Message-ID: <20261005194923.161411-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device binds via the I2C ID table (e.g., fallback matching by
node name, sysfs new_device, or software node),
device_get_match_data() in is31fl32xx_probe() returns NULL because
the is31fl32xx_id table entries have no .driver_data.

Without a NULL check, is31fl32xx_parse_dt() will unconditionally
dereference cdef when checking cdef->output_frequency_setting_reg,
and is31fl32xx_parse_child_dt() will dereference cdef->channels,
leading to a NULL pointer dereference and kernel oops.

Add a NULL check for cdef alongside the existing child count check in
is31fl32xx_probe(), returning -EINVAL if no match data is available.

Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..7bb0295b0b49 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -577,7 +577,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 	cdef = device_get_match_data(dev);
 
 	count = device_get_child_node_count(dev);
-	if (!count)
+	if (!cdef || !count)
 		return -EINVAL;
 
 	priv = devm_kzalloc(dev, struct_size(priv, leds, count),
-- 
2.56.0

