Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98C33603D5
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967242; cv=none; b=faweCJITY48808HOXNcxTO9IfVCsUaCaFWfmq3qW3+JuEcS3cZsuPD6ZDTcZebLIgL+kzJuRv9alA93Ojz8N2Fh23a/I0bzlPgiBVxjRfh4//DyIH7OuUt/MPBG7n4dH7/o7XLELbnkFXNfSoVgyovCrL5BkSUFs0n4O8lJhLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967242; c=relaxed/simple;
	bh=Itb4XvYtx6yfS17eCf148xsCQWGR39f8bNvG9AWleUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gWeMq/wLOxRCoIzVuvXj3s9/p4iiwC+qOTwfo5gS1s/QyqMDQXWSSgX+Gw1RUyoOvltzu7oDybnkPS33/7PWsF6hySoqijqkHX8SxBM1hBoTOyaoSPt+M+yIxxjXpz4KDAGQpk+DEgHhuBPsL8bckTHdBQwHNdRaNxs7zLq7uNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2V2U7nX; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2V2U7nX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so1101596a91.3
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967241; x=1785572041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9Wzhke0rzEYiey7/Q42zcHEBymWQ0YBz56up1JEZ+c=;
        b=J2V2U7nXdQqbNllY2jjDtAMZPmMncxTwSjFr63gw5218DjMeLnLhETsm8EPJU/PfOV
         cJJXpS692b+JZb1uQMDfpxdqNX6TzRXt18j2Gh6DGl4ZrmzC8POVKmMsmQlWd2IeRlR5
         g7sxEoRqZxF+HKJHW8NBBfmkLT7rAado3R0mpClykl4sN0Sza1ym0jFn4SRgBIEnu8UW
         2i8yBlTY041h5Cuzn77Hl97FrH+4bn59L2jWxBHDkxApFzWtfybYBFBx1qrGsfXdu3Av
         6K+qOPAM4JFFuIA5lql67Tw5r4CdMVzjVXwVMZWdKb6N8Taz1XIqkpJWd5lBgBtuGFJN
         gAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967241; x=1785572041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9Wzhke0rzEYiey7/Q42zcHEBymWQ0YBz56up1JEZ+c=;
        b=rMvDO0769SqJ6U5x+jA4w2OVSqWw1wGfSqCPJ8Rqlywqd+6YAcqPJZwsLP2KxrliMn
         rp9tG2hDWOvw1AXxl3WSr8X8AsLfptJiEoHLUeIBl2OLTqi+kY6zZ1yKKeRI3pqOtMVB
         rBSSO49J1Cq048gSXHplfYoYWLFDaGOAakXQiQd/K8q/A/j5q7/6TcS1e4ZRX+EzNoMT
         OMBd6dhD2C1Cxs3gnQPPKbVq9FrmKpYl740MRVne1wg9k1r2FJteCLJ8Ob90RWmPDDx5
         j5R29M0FQ6SIcVfEOeQpNYNDi9uHvEUZ9wWGtSpuBUOuWwqjq/x4GBgkiZ8n9OsBqTHc
         G5Vg==
X-Forwarded-Encrypted: i=1; AHgh+RpCbJujEpDol4bV6EPmf8Nm+pZi/rPDCaByt6j0R4jPpA1oMeDF2XvLbEfdvNTtRs+NDHtzG4YTrwqn@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSU+6zKYNtCfyEdfwl3hW4aYp1PadFcZ6SeSKw+bRBTMBHvSP
	v4qUm4WtlHs/helunvXPiJPkK+BnKSBKTURhkzmsUvPzICEMvrQSkRBz
X-Gm-Gg: AR+sD11CJnHtpy9viCzzxcoCfSfJUVdNiRbzOBdix7atEoiWmHuKD0FKwUNyPPAHVKe
	d+wdClMgNnO+Jt5hwX5Zne4ZVejiu2WxGEwgCNJz0koiq8ojYf2W3CRJ6DJTex2PusrdF76YKPv
	Hcx3IkzG38PtrM9RF//cokkM9tHKJf5+2+QTtZdygYigExS3lgfvPLy+X3nVSA4Bdm+JyiaNkWs
	sCrxnvN0N4MzFm6WCnuXzoQUxf+QAioYq4I2fHXrlKmIJRPpkJIjOY1GanA5q6+6MrqqmuEPr1U
	gD2YcjiyPn6ETQkJonYd51x+mMXbJbB6D9yiheOx5hDAp/3+C3pfauPFuhMQ2racYqlRT2ylYq4
	PDUVj8JDITL9dGfp4cAm4YRUYYTKJDdqk71WbKQSTIq6e8qNbhhyVG6IGcpIECe9brLRZaFNz3W
	Wm2Z9wT4H6J4Aq4vGVJVci
X-Received: by 2002:a17:90b:1dcf:b0:38e:69ae:7190 with SMTP id 98e67ed59e1d1-38f29608363mr1631168a91.26.1784967241039;
        Sat, 25 Jul 2026 01:14:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:79f:1f48:d3f7:8b5a:7633:b67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm56487293c88.2.2026.07.25.01.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:14:00 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v3 1/4] leds: cobalt-raq: Add missing MODULE_DESCRIPTION
Date: Sat, 25 Jul 2026 13:43:46 +0530
Message-Id: <20260725081349.8556-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing MODULE_DESCRIPTION() macro, which is required by
modpost and was missing from this driver.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-cobalt-raq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 045c239c7..5b5acaa8c 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -101,5 +101,5 @@ static struct platform_driver cobalt_raq_led_driver = {
 		.name	= "cobalt-raq-leds",
 	},
 };
-
+MODULE_DESCRIPTION("LEDs driver for the Cobalt Raq series");
 builtin_platform_driver(cobalt_raq_led_driver);
-- 
2.39.5

