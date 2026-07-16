Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADD38AC6E
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 18:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226096; cv=none; b=MWRZGTm4Sd0DvjU+w+lB7eWn5ooUwwF3gUzEqZTWuRnDQwd3hs8ktrQRaKB1OJed2maIGfeo9jhM13lShV66jn68l7EauL1O3DKmOGn0nGxbRG5wiSSvhdjgbmQQPdXwMBsSmAw8m0JaTNijQMLLx9hw67scvNKbFClcRTWi3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226096; c=relaxed/simple;
	bh=Itb4XvYtx6yfS17eCf148xsCQWGR39f8bNvG9AWleUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=niQB5xa7Lj1j4WFGch2JXQe0dYNOogZX6mmOlOYJu3IxM9WU2q9PZzWlRE/Sw1HQExzGT3OqGbg5T2SYAv16sy1jTAxUPPZbEi76r6rLlzyFpyJFlJ4bEoeDQPcr4QgovziBg29ql90PE9crR7CnOSKidAfAJ9tAQqC0m1BFDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht8mDzaF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht8mDzaF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c7c61b5292so49655725ad.0
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226085; x=1784830885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9Wzhke0rzEYiey7/Q42zcHEBymWQ0YBz56up1JEZ+c=;
        b=Ht8mDzaFA6LEH7vCD+sTtmVaulESPnQVl++ed76MSfPI98h2DCqlfAbymOBcL4OUlF
         2EoWEvZAzyD1C8YO2/35kpEFlhg35kFMAveUTWzJW2rrf7M2zg7YtWA4li6zQ7zTWqM5
         HAWn1aTfL285MvnYRAmUsB/aU6jCS5/mu/Hwo/nhjPTW1stkgH7mF2dQW7t4PX3po9dS
         0uP6tL+LTc1ECTvlbGEIlxspJHpIETJoOAuqsMbf4UkpoUp6elLMRtr1KIJIrjBRd5wT
         ThOe/GcFauJRniyO84aS4RfKCngDUaZccuWuQLv16xOlkd8jOwv2pyPdYzGa9/eWV1DK
         zfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226085; x=1784830885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9Wzhke0rzEYiey7/Q42zcHEBymWQ0YBz56up1JEZ+c=;
        b=QsYf1uvYLKV7NJ9a2YT7gG/gvvG7zWgWdhc2eAaRovE9rnnHrfgV+GOgp4ur4W8Hac
         q8nh8ObUsAC+UepDzkvTEQN8xmqt4HamvfIFILFxayhjtMkRbeGIUN8SH4XRaEewHh+E
         AZDIrRCQwPUH5NrR+TGs5jrw2DJv4PcfqquA2ibjs4/g7ly8LqQvLlz/JnpXnFp86ncb
         EkU1qE6JLm9FeQ0uZ/OB0hVxnUeCnswCujlAYHItwAIXTRuyJe+oGKIQ+wGsoA64egmH
         /7xne+aPRhlj371nIPYOvvyJGn8I82bGTYgFpHrKjDpwQiBxv/QStQOysjv5eJ7NJz/4
         2h6g==
X-Gm-Message-State: AOJu0Yz3JrAIhIU/GhiuGFVF3q2QKbnw5noAY6CtLDJSAiz5sjTY7U+F
	DN/+AXhVtond/z5RPuHKtLlBXc2nYzTNlueU3buubCMDEA74p96JQeCC
X-Gm-Gg: AfdE7cn+2fUMiEj9NbwWKncdNsMHnjBk7j/3Adn/4vDDWWFc3QVE9xBYPctrxqCr4t1
	2jF4+Vqx+x2s5HRA8NP2xAxHaRcsh+XjFEyVRcCe9N3757zOiYHVcLQ5QJuX+zW7VOr8kWGXOQm
	BSfuCdx5Ehi8IsKio1rLZS5LvUbfTin/Zm9FWmlQRDT1D8yuGtuySJ1D3u+1j9MDshr0HdzTjws
	13woj1xO9932l1/q753YbpTXRKh72Zf7FVXpPlhzA7ntYFQIuQbDVeAnzhQWHbtQTrTag4nDjR2
	YYuaB18womLsZMIi3wws8atvMhoC4U6Iq2wZ4A3UWBDG44R7CDKH51HuFigs49HeUR5yuJrTMoU
	9YIZ5gwXU5gdBRP+OXqVzuvay/KPsSHf3uG5rUeB4HvzUQW6VnAGdFomDcoxfyUW20We/NB2hkU
	HTqKugQRkemaAK3Fxv59t+Dy0=
X-Received: by 2002:a05:6a20:a109:b0:3c0:e6c3:224a with SMTP id adf61e73a8af0-3c3a5d169a2mr292621637.37.1784226085214;
        Thu, 16 Jul 2026 11:21:25 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:321c:1213:a9ae:1111:f32a:a657])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm12127833eec.31.2026.07.16.11.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:21:24 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH 1/4] leds: cobalt-raq: add missing MODULE_DESCRIPTION
Date: Thu, 16 Jul 2026 23:51:00 +0530
Message-Id: <20260716182100.9335-1-arun07172003@gmail.com>
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

