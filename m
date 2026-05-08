Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BD3603DF
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245936; cv=none; b=nfSLfrdmq1Xv/32HHu3AcXtQYga2RI99pX7GBSeXRBgz1AdK8SDpuAvqeLNV6F9/YUTDR+58r8EaZGLMfphVh3vn4dPS08mRZR4e5vi2J31GIl3EL2iLO7NrMhCXGTrZqN5Zrd24L1YU7s58yufcFKdwDAc0HLV2SfgH8kfm++s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245936; c=relaxed/simple;
	bh=rJN52vTb2DVVuKymo7O4iUq004FKxr0emIM9+MX9QxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qm3YYaVjZyS7YzcXMFWAoWJVTHOQa7TBuJNzt7lvE96vcw5HCq77Y3Y2zBCCOqKYzAsourkRb/SqAlLCh9jMITkf7IneJvQVKgstl+p7BYKRgBeQ8Ab6hMgqQvkQL8HL6pbhG4TK0B9OKhzUk3RwrOtDz8U1i61JRqA/vOUHiEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCPCHWS+; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCPCHWS+"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5142591eec.0
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245935; x=1778850735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLqW9rxflpuyRlX0XQVgp9ELHjKVrvnXV/39TSeRZw0=;
        b=oCPCHWS+OC7lcSEFB4Pk0pZFo9xndamktPnTLyjzp81zEtDa9o+4I42J+S0P5mkGO2
         m/8dyVwQVPRWIv/P75hM5YvpNcbSafev1V3P/DOSgfcPKxiiHcWKll433f/ntOcO4Svy
         rg5u/ZqIeD5OidthdDOTKgj3K6Dm1OIxPTMRTZebqi3mwvsQuXECmXuVf/c+5bQuAC5s
         tDBjxvP6lmH39XoiG55DfefVwpvTX7vItyFD8tjOQ9kGPziccQe1zaJnWMjNo69GXkZc
         IAu9Et5jcjyrgCzQkJBl0VJOjRTn4vOyjpG0P3Xf884Nj0mjNjvxec01rk4jxKV1U5BJ
         Kbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245935; x=1778850735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLqW9rxflpuyRlX0XQVgp9ELHjKVrvnXV/39TSeRZw0=;
        b=OkL3wdoPC7HhdySdXT6ng90uihlOZ3xwbQF7eiOh1cBSYC9TWigGKPKbA0Dsk4QYjI
         iYn6arbHoS1bMueO6eBccrz4dSICkvmJSIzX+d6f/Ungz84gexCdlT5YulbR3hjrIBt8
         3jySiQbsOhTyOQG2kj/LPJFVbREsFQH8B2UaN2R17wsCJ1r9PrcP8uJi88HPB5OARugH
         YAZTSXipdEulXy1lesZApK3Z5XbZWpcnl/c3vjVQArsxvLbN4qceWSfch3AWtO6kwOJq
         y61zozs2UTSnAmvhm9xIuVs3SbejkN2l3Ai8HxBib9eemCyTC1M1XEwkLMK2m7A+dLPl
         6aGg==
X-Forwarded-Encrypted: i=1; AFNElJ83sGbtjIKG9BHzFLovQfa2CE9aSAW5H1z7VzQPmzKml1/8zTBhKC8LoXKGGUzt2QYmzUidpQKWOuHB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zhmTX0+aj4zjH5LQKeAGY8IQr9ZcHS33TD4IJ6U2uboRWc7t
	FhO8G3aUFKTDsoVa99s6U7t81WHTwjeC2tmx5i+MDCJzUrSFIKWkqWmh
X-Gm-Gg: Acq92OEN6jYyZR03HRKVMNdwhCOxEJuJIr7HkWdQGRoe5rqLL9ChyyXSmQFLuWK7pMn
	LeiksE+nr+wRAyhJ2GsGje6EmwskjhnhZudzBSTcOdq+FHko0NE78V9IAYuXc0cvyM5iRtmu08t
	c/ZnzxSH6+GzXT5SZwZrkAidakHaWoPWY0BDn0YX8jg6nnYkfpJLgbFrQKLYELkBRhmD+cdTFJc
	i9t7sPZHBAWzqtWIvTV9G+b2fP/BDtps+fjoGH2qroUDvqbyPKuXDNDUePVLEpNLsTZZinI9NVm
	8Xl4gwXQb2CaL7N+PlMc6NlK+Ou4I7WJ5QEs9P0HPATYZFtaZJNW52FcEEK3XgzCXNhP3smPWp1
	+Vl4DGUgo5SVvN/Jxaarj420WMS3RaQ5IndeM62LyJuGQsfpHGKIHexMgAAYgDzdxnjBBNF+3ef
	TlzxGfhvEBTyQPB3b4lg==
X-Received: by 2002:a05:7300:72d1:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-2f548a9b30cmr7053827eec.1.1778245934669;
        Fri, 08 May 2026 06:12:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:12:14 -0700 (PDT)
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
Subject: [PATCH v5 5/5] leds: is31f132xx: Fix missing brightness_steps for is31f13236
Date: Fri,  8 May 2026 21:11:39 +0800
Message-ID: <20260508131139.1523597-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
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

