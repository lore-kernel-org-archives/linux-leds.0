Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02038B7DD
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825202; cv=none; b=jiDbmjeOTKCyQUp7FwwBRWqvq5PqrKeSO0akxE2XHrksgykDaIgdZYuCzNIslrjjF0N9tBUepuU99gb2YPUaeZG6ZInqAeXBYqbxMfiYiewGoUlBhoLYVGd2Yldb1OUbE5qnSBNI8nmYLWyg+GiUtd5rdTCnbz3bnuX3vsvRG8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825202; c=relaxed/simple;
	bh=2YFErkEfWTid63HWff5+u2dUjlWzOX6GXTUxwvfYZsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ak0Wq48Q/p4bdkHXM5vrfTsJvzpcvVM+iOLlvn1P8fSkFwQJ/ObTfEoJTu8/p/wRl7D/Cg5HmFm0Qc2MpCZcq5QisTIePWLCDvRspM+3oN6tOtSWjrz/Hh23ablK/o1kjG/6iGQJ9pI4ot2eL8HBSLac97zdDf7vidWB/INkFGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFGiw5ln; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFGiw5ln"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so778054b3a.1
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784825199; x=1785429999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttGVBBLV5S7SFqtsKUPChZqO8zfT3Rb+MVyL1uhuCco=;
        b=cFGiw5lnQRDZc3NhlwDtBG/PSKA/yl1yksjbHxjb3vWya/YmNycYuDytObEFOPGMAk
         ++ai8LMFN4w5h++dsp/S2j4Yh0xnZfZV/5I0YXD/RjS4JW/bV+YdiUWeyzquB5fxJzEK
         7gwaODU7QCCBTp+jDC9vaKHc3chqAIlghTkkw0n6FRdVpShJNFC94kusFfA7Vz4ZJ/Gt
         MGC9/SFYj3dJONSEoENm8HTBZO4Urzo5wYxFF+tig8v7bVrn/VqALp0Rx4uAKvLPQhpU
         Dmx2ic9+reCWqqOf7clMyA7YCKY+xbHP931jQrV69RTcQheeSOf/8txjouGasNlzvBV3
         T4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825199; x=1785429999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttGVBBLV5S7SFqtsKUPChZqO8zfT3Rb+MVyL1uhuCco=;
        b=dsCLu4FJX79feLLaa6DX8o/VBwr/lpolGlt+VZVYHfQczYUaADRBXQsh0s7gCo4rPb
         qhHMfYeGY3R8glJN5Kb2y7kSdrNOcVa4KZkB025HbIYXnUWo/1GXIQSi5DOwKv8QbG6z
         drnfCKKyQQwpz+K2FZJLh8i09wYHsjPDbERF1c3BZO+YMcLyBCHJtm6kKmDkVV/kLAXh
         AyQ1fGNXnYjtb4QbIepeEwibpCdJQtkimpLW2hpE92H6+3X/Ake6QSt4ahejvtV8Hko2
         Yj/UksupNcpnAq8EfsZo37L9+xjeEvjspiefWCPlR6ke5kqxDjWxcNjCoSVlW0Ndf3C9
         uBmg==
X-Forwarded-Encrypted: i=1; AHgh+RrPc4v67vR17xp2IcakBwgxZurdnzWGwG4dFjsrNEPiE+xUN67fGK+hek09+a2WkfrlyPN7kCx/Wtsp@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQ36FlBa75nsZV44XyVAsByCjAMVmCwc/dsgzWCYTGdxlNGF6
	Qux2ZqMj9nwO/APq6F/LwpLm2lVbDIIRezYzVWpf0Y6CKOM5k+z+K/Yb
X-Gm-Gg: AR+sD13ayMYtXFEtJrfRUFlx2m5wUbRUmIg+HXTeWu5UbxvQrNeJ8kP6Fhang5ygJDM
	HgjbvfdtrLH4XgtgWZvUEjzNBZpEm8K1nLekLWrYAm1LPAWJ/mB57R8cNZ/sm39bYA45xyK/zHi
	7r1ZUh7bbrjPHKqK4Bw0Y9zSted21MQ76GLWa64d1zNmXqHFTFKeYIMp+otgUZn3SjO1Bt02IzP
	PRVGHvFl+VgCfTqVU7jEun4oY1wbmqyd76ZpGXRiDiUkmCjx5DqIdd876KQFZXeKcDAalbfVFMf
	E3Df2cJ1HykU/U7LTD4kfZM7ATctXl2Rvl1fXDCRKgtQUAsh86miuJfjXbQeZwOe+3VgmK7Bkvy
	EsJIAawuckKWrUHxNqRraskZZlSZT56gjl0VtN5W8kBNPJ6I2yvaaEgmHZdNV1omgxfj35VKYw7
	5fP+p8uVV/sMjIr0hVNQtsxAs=
X-Received: by 2002:a05:6a21:7103:b0:3bf:ecf8:abe with SMTP id adf61e73a8af0-3c44c4ca0cbmr3953880637.0.1784825199420;
        Thu, 23 Jul 2026 09:46:39 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:1ec6:c93a:535d:aab6:428f:bd63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm22274061eec.2.2026.07.23.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:46:38 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v2 3/4] leds: menf21bmc: convert to dev_err_probe()
Date: Thu, 23 Jul 2026 22:16:11 +0530
Message-Id: <20260723164612.3146-3-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260723164612.3146-1-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return pattern with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-menf21bmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 6b1b47160..a7e4db487 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -84,10 +84,8 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
 		leds[i].cdev.brightness_set = menf21bmc_led_set;
 		leds[i].i2c_client = i2c_client;
 		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to register LED device\n");
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "failed to register LED device\n");
 	}
 	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");
 
-- 
2.39.5

