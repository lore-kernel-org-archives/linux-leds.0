Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8972DECCB
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784612972; cv=none; b=KhphbrGbuU2R1SsdRYEcTqrZO5zqYXGTXDD+3p7PiVJHgeqYBxoeI6atLMD8C7H4r3h+/KmKbVn/z9s0xNttEIiuLR5LGudoZU9SmRFE0GMrDh7gjNgERmfRPd6LZoNeN0RI+WifbioS2iZ/badribCHWRZGVHUENJnKqZJA2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784612972; c=relaxed/simple;
	bh=giPUDgJg0l1b8kGwllX6HxnV2JPztzFEkS0s7h6EMmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpZ8SqsZ7QCM7VwGjTwiEwKstFQdwlDlqMbNsZshA8B+ccQWaXO5FsAKy5QBwWq7sB0bwNbItDIJttLJ+hqgWSTBwBrDxRJY5TNbNIuGSXDXZTV7LCPWePM/cJFXNtyY6C3A1OXaWDZbcy/NcT2b5vAJk/mshgF+BvPObCGD7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCYPoSt9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCYPoSt9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so111767905ad.0
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 22:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784612971; x=1785217771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RX6tHFlygNwYjnPzzeR5qmAKXbFUvubC4HqVb9TAwA=;
        b=DCYPoSt92t4IZ6gP5UiSqZs31Y/0cTOSz3BZSeaYpoRqp3VXxwbw4yuQblApqWU5rP
         2BawBNYAuz4k9EHiEei0a0hEcz4H8U5lWxMQe0w5FYvC222FQiobAvssg1yKGTUrEqYb
         4+riUzot+EQtZv17Yoe2d7QFdkXX5N9JZ4AfUmjimPAz/xvZmnXZiK1ASlZl6pvpq//q
         ZD3uVRsQEgKPaQ9J65vxmfUZs/EBj9kVCC3Ap2GHa69NW1gI/ylCo0AhWbiPE34nQpFq
         v8r97ELWasLYGv8v6/V/Wo7Kre4sBZOIPbUHYHlYDzC5cBJR89HdoGmKPeE7FnkiVSVB
         fR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784612971; x=1785217771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RX6tHFlygNwYjnPzzeR5qmAKXbFUvubC4HqVb9TAwA=;
        b=QHvBcAqecNVm9FA7vDeJmMkoJCxJp9d3CL5rxL+KpCa+QJATrw/ACpKkMmkwamvwnq
         SYRyb4jq7ixeHM1P8pvvkTOCWeq9KUHSQgFaGQAP4ds+0H3P0L5+CIQmQjqX5UcBnu9V
         aCR9KnnS5WKjbRPeThbpUH7cqoKi/safZujt3ByLxbuGhUTMCnwzzRLJP8z8bFSXl4X6
         PLr+uxcqVQco9iGP+N39JGEnzippsF0U9Ytw0I1DP6ekjq8Xa141WhyXI5Gxo9H3OC+5
         3VB9zvGhXQ0/GvjO/SbJ/Cgoz9sd5Bxn1q8F9qdIO6ukxwhXZE2QNb1ZQWzTPyhlf4Ut
         Tg5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8oCVSNRl/xRItlVl87G4rdfQmaAR7ZSQzJT/7NfUD4zRt1VbEZ4KP5kc/X6lOvrGaIRpMav8MEcKH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56PWl1pRxwXIPKJYQ1pcvxDGV7XrHyslutMSXvOSJkMwFYMzt
	anIgUS6Xf7Tos1xwITLaaRm+/eLQlDsJLcW3eYzfypS3IQXcXq0MekE=
X-Gm-Gg: AfdE7cmr5i5phbl+CVnBJZJ9n+GCVZa7zyAe6pF7poXWHhAitFlhQexYqjRoTf/mHRT
	UgxHQlv+q3ahRgqIqQPRtNMkGw5Jr/IPGtm2oeRBr03dkMkLD9u4I4i43I+g2zk4K2s0oFZ8JpS
	MEs34eUEXC4xCoSt30f08lN4x1a//7tTXuggMtgjVo19DVSVkRts6Sk+X329DZrnd2mMgx7dsyI
	AzEnoVaxcc8BMhnLIKjR4i2LvYdsP/H/wE2g5jOrDlIAHmJlDHH6kAKeBuZipbUFXWgfB3+hoam
	QV+lcVl3a1ATKVCC7krrdGIJbc/G/Dwktx5pim0KT+ir3wY4HSUgyNa8pZLMV6h8W6FCZbqvFon
	Kr4kKnfLRoHIx6bWd+CG02zyS6HMhszb0L8jBRaB67kLPnJjDt9xZj0KuSVt0jhqO47b5Hxhqhu
	nEygyF3XDyDR5AVW7PgCbE91WPu2A=
X-Received: by 2002:a05:6a21:48f:b0:3b3:1c7b:ff7 with SMTP id adf61e73a8af0-3c3ad9691cdmr17531443637.46.1784612970813;
        Mon, 20 Jul 2026 22:49:30 -0700 (PDT)
Received: from t-rex ([2401:4900:adc3:1a5d:adf7:50fc:93fc:9a82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm42172695eec.13.2026.07.20.22.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:49:30 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: kauschluss@disroot.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH 2/2] leds: flash: s2m: wire up of_match_table in platform driver
Date: Tue, 21 Jul 2026 11:18:46 +0530
Message-ID: <20260721054846.34318-3-kr494167@gmail.com>
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

The driver defines and registers s2m_fled_of_match_table via
MODULE_DEVICE_TABLE(of, ...) but never assigns it to the platform
driver's .of_match_table field.  As a result the kernel never matches
this driver against a DT node with compatible "samsung,s2mu005-flash",
making the MODULE_DEVICE_TABLE entry dead code.

Wire the table up so that DT-based probing and module auto-loading
work as intended.

Fixes: 02149db273a9 ("leds: flash: Add support for Samsung S2M series PMIC flash LED device")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/leds/flash/leds-s2m-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/leds-s2m-flash.c
index 6ee8db094611..2373a70d83eb 100644
--- a/drivers/leds/flash/leds-s2m-flash.c
+++ b/drivers/leds/flash/leds-s2m-flash.c
@@ -339,6 +339,7 @@ MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
 static struct platform_driver s2m_fled_driver = {
 	.driver = {
 		.name = "s2m-flash",
+		.of_match_table = s2m_fled_of_match_table,
 	},
 	.probe = s2m_fled_probe,
 	.id_table = s2m_fled_id_table,
-- 
2.55.0

