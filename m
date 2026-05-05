Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E686E38F65D
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992866; cv=none; b=hk9rQQZig6hjUNvReF56EdmOmyhK9BxR/yXvIJT6ob3sVKuZLnMXs0gwfVRk/qqHJz8PM1ZZ/LJUAh8kvNK1G9CLKZGLTtfAWVR/ykJqPlSlJBamnSMGcOtLWl2aoqMFQ+aOCVExB6YHCUGQLO+V4fQitIUhMRozD7MC0TjMe7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992866; c=relaxed/simple;
	bh=rJN52vTb2DVVuKymo7O4iUq004FKxr0emIM9+MX9QxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMXYDBNqxsxCVYHETM4keXfB90pDme4AoHMJeUoXD2yWVPp8+kLuldx1GnT02HE6jtXsv2oDIllkhpiNcALH+rfLSJyFmySzTUG2l6SMJmHcV5CuE7VBuSQQNM9F9FulSzfStObrc5wPxbXZppE+joh0iKgGO1ktIUcaRTwBqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G80iUVQ3; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G80iUVQ3"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso7211366eec.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992864; x=1778597664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLqW9rxflpuyRlX0XQVgp9ELHjKVrvnXV/39TSeRZw0=;
        b=G80iUVQ3AgLw7l++g4FWaQ7q7K96kVthl8miu03B7UshH8o0JpUtasXZUbA86oV/ls
         IlhJ9px5s2hT44hNrJuAgBGrGibxB/CVNeC+8vU6lzrf0oTyaifPR502bi0dzQC7PTQN
         l8XCyLb6ASN8th8JaTbaKO/ugNOOg6hjx8D7yb5qVbIDiBL+X2JR0uqGL+QlDlb+vP4J
         Wz4PTrJ2wN/0fPWxPW6J3bwoaguVCq2XYbbyfSnHn4OAXFFMsw50lKQb5jRyd2xNc40B
         MB2PL/DBOIYJHA3/0A+SPmCThENbeTjfpAzNHOnAkoZqOQ3MV5wP0uQsb5nvxwBkWSX6
         oIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992864; x=1778597664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLqW9rxflpuyRlX0XQVgp9ELHjKVrvnXV/39TSeRZw0=;
        b=iZXDmqTIx5aw8Ihjn4W3CdY41x2ZZbw/uDpgUnroLzb4LDG+q2OzgyrMYB4W7/Ajb3
         ZsQR/d2CD8XD0ENLgk1LlGgvaJXv32B6sMMm1SuFMDEMAuwkV9LejNlpEOqWdDoCg7dg
         w00UcIe+VQM4e0vzQlYMfRREJjhT+rUlpM7tjV328evWs4AW/blVDklcRP6zvibZXJE8
         3PgNWiUXgIp3GCJZgAx0DqnoBGQa09pqfaeAfJHI+u/Zf/i6/SnD0IUHGvF/figWy303
         XtGNz1UKaDE3gEeRAZtWxTSQudnAkhuHtTqpkdk4mMjOTzTChKVUpOtXYlgZs2LzB35J
         IQ2A==
X-Forwarded-Encrypted: i=1; AFNElJ8FXrQ98bGPXEU9aB6Vtoh6WtfsxRoEQk/YABoVIpJa27bqah4Fn7rCAZf0kWq3Xp6Mwc3EtOJwTbN1@vger.kernel.org
X-Gm-Message-State: AOJu0YwtciNEMB8jaaL/wZEv/zKwWGKbdYK11wVldfDp+2Flto2djCkd
	sPPz46/6YxYcyGJhr8CMZNr3XMahVHDRHzpHsvVkxP2EFv1wQcxEKpA+1QQ4Dw==
X-Gm-Gg: AeBDietfTA9uY8bC1JN2pllcHuTkO5GK/YYTBFFXMh7eld7XLZkpNuYtEfVbNuG1UYI
	Ebc2Bk1zgamFMPHNz+AAeM0t6+3D0lNkehIkn/0rMM1AEOg4EQ3fSQ9g1nRBnIaPbivO27KzBSO
	7AIix66FVZUIlpOF4y6irrRFTenS7A60mtViDE2nzKsqOE/KGhrCX14Yc2uyPBzzMaqw+mHia/8
	l+IAy5gF1lDxy6dL5abvS+eqBTsMkJlS+fuFG3f8PBOcdzBFFbEMH89n56Tk1CR8fMQrXClgz2H
	9CfcBZBpwDxJN/2tZxsb3ngFcgjxCFnALCPBw6gF174Po6LI0KAcootv7rkkM+lDlKFmiSnR0nC
	hBni8iNol9SUJtcwL9BjG2gHxaW1K1thAMxHGiNpdt75XtrKF+nu6PrAophGAgBA6q3qK88wYXs
	z1bHVgD6N56comUX0oGUYvEdcVvtF/hD8=
X-Received: by 2002:a05:7300:5726:b0:2ed:e14:42e5 with SMTP id 5a478bee46e88-2f40a18f7eamr1466264eec.30.1777992863942;
        Tue, 05 May 2026 07:54:23 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:23 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Tue,  5 May 2026 22:53:54 +0800
Message-ID: <20260505145354.1267095-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 57d779e07a62..750f8d899513 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -488,6 +488,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.53.0

