Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E195A9841
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069533; cv=none; b=D2KbYX6//Tk5LWPerxBo27qkt2h327wNO0fNPdzQ9/lvVGh3klrCFIVZVzEYI5BqmIIoZw/Wvuk7k8Fp7LzdnxshB5bgUZnkWnsYxLLVQto3xapnUNdyeQTemEwHVvk1pJbbW58ADP1mh8NUikPIcWgXQnTcRwRxRCWlajO84Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069533; c=relaxed/simple;
	bh=QhX+SC0aYPRnajzGgZCAyqZcT5ZumThFwIdRLkM4lt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RENCVe8+NiBPYqTP/U6xPFJKNwm4mp6ODLUxgiGSbkwtACg8PWO1czKFTcqX0Up3t1ulgWWCP2u/E9jdMtC3qeyWyEFjoFdiL96BaFp1z3CfQZaNoRC4ouE0zMb5Jdx2yVaeni3ypVEQ8sPyYcQPIz/KzdS4+LOxkohGCubpXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ0uh9fu; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ0uh9fu"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-910707254efso1329816d6.3
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 12:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069530; x=1789674330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/3ZGdaWGihAcbh8PThygY3ZNQwZqvA2jilmZZCQz4o=;
        b=eQ0uh9fuf2gq46Jh/5Ao8dtwSXCVkVWM/yBJdwzLyvp2bTmGEEvIjYh3Pn5Qh40nYl
         hZ9jHtsgpNA0gZyYeQMUGfdWINb88JnIpTanKK6hNdXKcIdlv46qtNrLU5J+xD4t0vCz
         MqlDPXr49SttkxfiDsUsQ8uFLfWuliDO5PUfgLDN6TjlKgkK2TWTnVZZXHdQgG2g34ud
         KAI6m/TKMgXrlcNKkZqWFzJK02IqDE39VqENuAM48stJED54wVgZ5M9pvZJ84MDNGhQf
         rLsKbbtFOebezTcmITgtXF4RG6npZcQKZcpg85wfhpnXY5mmwfjf7nUtrvPTKE6rhaYO
         LPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069530; x=1789674330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/3ZGdaWGihAcbh8PThygY3ZNQwZqvA2jilmZZCQz4o=;
        b=GVs/Mz/GdG09JJmlq+Z080II8LaTOsCSHIJZSXKbpBmMOzbkVIcMjS1nQGCOP8kWkT
         JKX/ebjasbX/PJNakcqRFZx/0GgLPj/FpiFLqILpZKViSveFLv+M68/36E1QZ7diXMMP
         r6GyB4oQR99hYZIcmsdT1FJn8oqV9te2GHNmAAZBoaRLiErSIvN9ZZ29xJyUjc++oQ24
         QTneiLRMVLC6/8je9zttEDO1ro04pNbQIKiYrQsWYTkN7r87aqEu8BR0n4RNTqS3rV94
         v4/G9VwxdLiqhKoLgGk9JnZAKFW+VVcohCQWoSwL4LjW6cUIJtZOksJKnILSeB9nSP1F
         8M7Q==
X-Gm-Message-State: AFuF++nDLAOCMtBKkCzQIiBPdqTAR+9KWw4IRXWuzRiH0fQLJDITZ7Z2
	F1Cgueb7wVIRJV4kP+eAlrBxEkvisbngg7dQ5wuAFE2hYcgSUDEJSyLaDrMO
X-Gm-Gg: AYBFou0qJnWsJfl0fWnvZgZNaZ7W9q8Qa+KRm+gej2c4uNxL25VZOTvJMMVCGpj1d2O
	louhrYQMLAwDut90UDrbjoFLnLasqNjBxE5EkIoYe0eTQwWoemDjOopnO24A9jksGMMs6tWbWYa
	EiqpCO1tSm/Q/Ig9+H6k9Sfx5rdWzbedkPlvOHgraC+jtK/1lnhzpwnHz9QPVvfOrTpnD1cpflS
	lBhoPhovbSi1kZ2VS81U6fmf9qNsbQ89I5Rby0lLq0lXzrvqkoj3tbPJxbwge0x5mPhQTo+F5ir
	0J6+rTJQIXKVDIiI7I/gltm2reU8NwvTg2JqreCpldZ/BBTRzYh1UMJuhCrG/eNLYjIKA8WsSFH
	Ki86fauFHCi1Kq2cd+lYPuAeJzRNPTKqh8Q50okYWxgHaMv+MzujDYZWlaxXXvSKJYDsSgf30g1
	S4DxfN9cd7UyDgGNCYZjv0D0Kop3zULKzsG5azlPsfpzCFdPuHaSVTZ7PWYHDB5x8SCNoWB9Q6Y
	o3e/Swq3SIsGlJdyQzvCSdoiZFucEr4CiXsDmoisty8ktzeJ5Qx1PeWFpMScfawwsB/z4MpFY+T
	lY2u2LtPnwsSFc/CQxSMmuXKCXWYNS/9VQ==
X-Received: by 2002:a05:6214:3218:b0:910:42f7:a111 with SMTP id 6a1803df08f44-9121208900emr5796326d6.15.1789069530089;
        Thu, 10 Sep 2026 12:45:30 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d89f9sm3530526d6.47.2026.09.10.12.45.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 12:45:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] leds: ktd2692: Pass context to regulator cleanup
Date: Thu, 10 Sep 2026 15:45:25 -0400
Message-ID: <20260910194525.99654-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

regulator_disable_action() retrieves the driver context from device
driver data.  However, ktd2692_parse_dt() registers the action before
ktd2692_probe() stores the context with platform_set_drvdata().

If devm_add_action_or_reset() cannot allocate the action, it invokes the
callback immediately.  A later probe failure also invokes it during
managed-resource unwinding.  Both paths dereference a NULL context.

Pass the already allocated context directly to the action and retain the
device pointer in it for error reporting.  The context is allocated before
the action is registered, so reverse-order devres unwinding keeps it alive
through the callback.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ee78b9360e14 ("leds: ktd2692: Fix an error handling path")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/leds/flash/leds-ktd2692.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 22fbfccd4873549baf390127d2f7e9aeb9c45465..43d4d55503ab50c6e31b8e83eed430cc33e014e3 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -69,6 +69,8 @@ static const struct expresswire_timing ktd2692_timing = {
 };
 
 struct ktd2692_context {
+	struct device *dev;
+
 	/* Common ExpressWire properties (ctrl GPIO and timing) */
 	struct expresswire_common_props props;
 
@@ -196,13 +198,12 @@ static void ktd2692_setup(struct ktd2692_context *led)
 
 static void regulator_disable_action(void *_data)
 {
-	struct device *dev = _data;
-	struct ktd2692_context *led = dev_get_drvdata(dev);
+	struct ktd2692_context *led = _data;
 	int ret;
 
 	ret = regulator_disable(led->regulator);
 	if (ret)
-		dev_err(dev, "Failed to disable supply: %d\n", ret);
+		dev_err(led->dev, "Failed to disable supply: %d\n", ret);
 }
 
 static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
@@ -233,7 +234,7 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 			dev_err(dev, "Failed to enable supply: %d\n", ret);
 		} else {
 			ret = devm_add_action_or_reset(dev,
-						regulator_disable_action, dev);
+						regulator_disable_action, led);
 			if (ret)
 				return ret;
 		}
@@ -290,6 +291,7 @@ static int ktd2692_probe(struct platform_device *pdev)
 	if (!led)
 		return -ENOMEM;
 
+	led->dev = &pdev->dev;
 	fled_cdev = &led->fled_cdev;
 	led_cdev = &fled_cdev->led_cdev;
 	led->props.timing = ktd2692_timing;
-- 
2.50.1
