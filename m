Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4E63FC5C9
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 05:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784612959; cv=none; b=O6/MR6ZhBcC7hhTMfPtVeg3hpgZ76pfwqttuYAgwFG3bvJzzY91dAUDaIYTHqha54ODisEgwDX7ObTocpqm7ka27MkoxXUk+olopej1EqXgT6SEwvWXyBIHyxBYPJWlD9RON4FtC19MNRzKh3fABaUhg9/6K4bjUEiAJ8k89lXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784612959; c=relaxed/simple;
	bh=I0g9mEQnJ0J3sRS2ph52PT55oYCYU2gM9I5riHTo60Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHzMUlDuIOh8lIylbf84eYys3Bi4Dt7+6pV/lBLhApHbQ1guGdLSa32IwHQQ27/ejv0nQmavUrYM8A0SvoBbq7XhcKuZefH210lVa8bLkpN57Op8oQtdEdEK7tzsp2RNWGIF1/AWvwNVM90M6SCXJpauvmt2QPBC/JPqztLqtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvoZ7LaR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvoZ7LaR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so10076183a91.3
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784612958; x=1785217758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WAD6W4JUjRhxXLxs7D5Kl21V27mPvIWwiaMzFOQ1E8=;
        b=ZvoZ7LaRuCUnj9MmnY1YW9GtRDoaJ9vVum9tFowal/XTqQDibleZHN9RjP4Ai/jH32
         Ke7Slt4VQNfW/kGwjmn7xl7OCS6Mrh42nA+ddzDRU9/VcC+dtzQGGFWyLhenIROA4Hgp
         SFpYd0o0jF4/MJjQ6kwuInLXXHMVVZSDX2PsNVX3nkWiJRtS2gugHBJ2/VLWBhpgFL6p
         JHOkWLrbEiZySt7FdIhaduCp1bbfkyezIPJMh1zGO6LudVw0xOyQ9uVOz+ppMyRoxVp9
         hlgsyxfUWT5zrOceLu2RV2tL9AGsn4/rxU+75fxmOEqoMHMcpwY4fDj48/fGAxJvwaJH
         RL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784612958; x=1785217758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WAD6W4JUjRhxXLxs7D5Kl21V27mPvIWwiaMzFOQ1E8=;
        b=YOTLPoEYUxykifrjVICB0PQSTHINarlxGDRXcOR4tj+hLocTJjVoWCLmGL1lNJOkNm
         taVMIdjG4DJhGNrNkRRvTKw5iiJW8YbyT/loesjwkg+KOxYPs6tv18JnZmDTdLdxhHi1
         iytlfzfCsTWoe/0zCYjtN7Bxmd1dO6vL3T25Aub0LQPJKHZFcbDvMQ4zs9duV4zeOywT
         C+Ir1OtavnZyJ98CqU/GpF21RGC+2PrykuwNF+jzKfio/kmw2s07bErP8U+Iztc4l3QV
         TU8w3GYCvuaEepoYURgsP44xMpVlooZdijAo0dstmmWOmjJkKm/D6GIAcFTuameWOPzT
         4uCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqncMFgs6SmJl+YFVrz04jCns0l2HL5RSf9R2pkWsVjNCUIkpkT3aU4BVOFLJ7EZ5lN65YrIH083WUu@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcFUcg5SMO7gm0E3XfwteG4ERZcZveXC+S41Pd8vM4oeIwl/1
	/jZ7g69zMeSRiSp34ybxdS775AEIS82E2+G9Z24i525lRxVOV+89mkg=
X-Gm-Gg: AfdE7cmaWdZfgvqIFWPFUodonIgbGfF/UFRECC3ForDzIr1u7EdRg12TeetN+5xNw0V
	NkPEC4iByFGGPm0Mq27HDwERhJCGfR85RrCQXWOBSouR4DEmEolpGYZa63ipUQlKEmzOyhoDnq3
	Oug/thaT/wKk/LSkNdP5R6EW+KCu/nvdTN8HKbrvKpCh+7RAolpnwDbyFtBRdNuVqStrhtBV+L7
	G+UukExWbvchM0yMdY73/0v4VKf1oXWgVLvsWQc3DRnEOMaF+VrsGt6Tj3EGtvJsAZrwLEk69aT
	TP4o10VH5GgjZdqac/532fIARBw4h1cxM9MFzYTggBvsjCa4+6mmvLXRtrambeBYUJJ68SZ9AiN
	hJ/psih1vaSYgfcf/++FVW0rQg3GSYSAhh7+gVrlXnXjXFbZ2z6KUy5EIdvJZyPPW2sJPeQE/o9
	WAMSdLCYTt+KxFRD4Z5j124c80WXE=
X-Received: by 2002:a05:6a21:7a46:b0:3c3:2e2b:29ee with SMTP id adf61e73a8af0-3c3ad9e55e1mr20101659637.55.1784612957657;
        Mon, 20 Jul 2026 22:49:17 -0700 (PDT)
Received: from t-rex ([2401:4900:adc3:1a5d:adf7:50fc:93fc:9a82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm42172695eec.13.2026.07.20.22.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:49:17 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: kauschluss@disroot.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH 1/2] leds: rgb: s2m: wire up of_match_table in platform driver
Date: Tue, 21 Jul 2026 11:18:45 +0530
Message-ID: <20260721054846.34318-2-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721054846.34318-1-kr494167@gmail.com>
References: <20260721054846.34318-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

The driver defines and registers s2m_rgb_of_match_table via
MODULE_DEVICE_TABLE(of, ...) but never assigns it to the platform
driver's .of_match_table field.  As a result the kernel never matches
this driver against a DT node with compatible "samsung,s2mu005-rgb",
making the MODULE_DEVICE_TABLE entry dead code.

Wire the table up so that DT-based probing and module auto-loading
work as intended.

Fixes: 63ccd117f425 ("leds: rgb: Add support for Samsung S2M series PMIC RGB LED device")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/leds/rgb/leds-s2m-rgb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-rgb.c
index d239f54eee90..28964de6920c 100644
--- a/drivers/leds/rgb/leds-s2m-rgb.c
+++ b/drivers/leds/rgb/leds-s2m-rgb.c
@@ -415,6 +415,7 @@ MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
 static struct platform_driver s2m_rgb_driver = {
 	.driver = {
 		.name = "s2m-rgb",
+		.of_match_table = s2m_rgb_of_match_table,
 	},
 	.probe = s2m_rgb_probe,
 	.id_table = s2m_rgb_id_table,
-- 
2.55.0

