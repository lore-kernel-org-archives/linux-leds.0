Received: from mta1.migadu.com (out-245.mta1.migadu.com [95.215.58.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF2F3563F6
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 03:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258399; cv=none; b=ewYVaeXAp0CUk8SZBJEhAO1uhMi8LMcHRLqxMD36KR132deqXwIZR+IuS3nchbeL7aHZRwMJzYwwOgVpc9U+ACReL118f9AXyEvtyyI9J4pAQdg9bOn4j8Jx4VxmBWSZJhmu0s7QZcsavtkwqTRABIDNHaZ6EUhI5dA7Rsmj+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258399; c=relaxed/simple;
	bh=GjMgzzmy6YVcSNV9pXbMJdzHhQw87DPZbUzHXRI4fjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJ7hWsgJIG/C5n5Z4nKeVbW7ESJ+Wk+1i5UxOCLkPFHnrX84sGMqn3lqwLtdsiV8RSz6L9EK4296IOfnc8WE1IfpZPKea/BMCMnqOQ+zPuLzfNQAjFmU2haEuZmgkoB6DsQlY2n8UzYd1B2JCiuHrJZOiJYhn4JXjoaPSqFXD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Gu8ZwA+u; arc=none smtp.client-ip=95.215.58.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Gu8ZwA+u"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GjMgzzmy6YVcSNV9pXbMJdzHhQw87DPZbUzHXRI4fjY=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258391; v=1; x=1791863191;
 b=Gu8ZwA+uOTtkHE3MdyJsD25sFZLM3pvz77ltoOP8VfPs+Nu28T3awJIwsicAHe4aZe+uGqoI
 tFHFQN5R8IQbcCrcHZ9aC2loCml7jhk92Q5J23IUwykqfM2sWfl4XGMJUc2Mh2Mxd3vUEQ69gDS
 ZEGUmkLF61XdioiqlaKNy7af1h8bbYgjvTrIcLKv4M3p3kvRCcGokdcaCM+YZ4oqrapYU4sNSKE
 P73iTP2g/afJ9dkr0cUoBh5YZva1qXIBwj+dpU1pXgNr6r8q0ElYH+mOAgoGNzBCF1Yipq4ynFQ
 jm7IPlQa7VUZAfh+ZJ7bitvpLn46yUzPLZp2BSvNRG4eQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5b236f31bed73925;
	Tue, 06 Oct 2026 03:46:30 +0000
X-Mizu-Trace-ID: 5b236f31bed73925
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:06 -0700
Subject: [PATCH v2 5/7] leds: aw2013: Move assignment of chip->num_leds
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-5-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=1194;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=GjMgzzmy6YVcSNV9pXbMJdzHhQw87DPZbUzHXRI4fjY=;
 b=khpBkFVEWnVSiwI4ncKN0rcUFNt7Bqlv5E6wLbC9mrRGOjCLdlduJeCBgRIMpX9FupGOcMXxp
 5GPkSeu3G66Dq/kNixdDcK97/JElVN4ttq5jpuMSJvU0l6czs7ZnMCl
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

devm_led_classdev_register_ext() executes default triggers
synchronously, which call aw20xx_brightness_set().
aw20xx_chip_in_use() silently returns false, skipping chip enablement and
causing unbalanced regulator disables while probe is still running.

Increment chip->num_leds inside the loop, so that each call gets the
correct value for it's default trigger.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 705de95c6eac..5d242e2bab60 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -399,7 +399,7 @@ static int aw20xx_probe_dt(struct aw20xx *chip)
 
 		led->cdev.brightness_set_blocking = aw20xx_brightness_set;
 		led->cdev.blink_set = aw20xx_blink_set;
-
+		chip->num_leds = i + 1;
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
 		if (ret < 0)
@@ -411,8 +411,6 @@ static int aw20xx_probe_dt(struct aw20xx *chip)
 	if (!count)
 		return -EINVAL;
 
-	chip->num_leds = i;
-
 	return 0;
 }
 

-- 
2.55.0

