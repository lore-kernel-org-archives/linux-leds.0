Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82ED355F2C;
	Mon, 16 Mar 2026 20:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773692321; cv=none; b=bnkIZlvS1Hg+YRztsaJLBzEgO7Z+y51xitCEKwFyw2sDkZRP6irGn00MlRSQq9qZzidmxLW+kGsTi77sB70gj0PF009Dew+FsuYbH0QCCZzzM7ocvoMR8qJX1dHhNRMaFm60/z9t1qEwTDxvkFhuAQHzznhHkUZOKw1yUJxxSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773692321; c=relaxed/simple;
	bh=7khXt8AubzrNv1skGfAom51RKjnfE08TSaBPAQ+PN28=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uq7eEuznqzxrwOyWap8M1mC4GcadrbSBDPlh7JmbPLqP5lZF80Mb/lUZnLwX7dqqFhgdonQRymNE+N4k3CeV5a2+rHd84c4HCN9SFvwrm7h38nKMJLAF1s34a4oeMeqgcNEsx3ShSkZ9ZBr1JgQYBH/8dFz/tisTrrGNrxMStjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Mar
 2026 21:13:29 +0100
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Mon, 16 Mar 2026 21:13:29 +0100
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Lee Jones
	<lee@kernel.org>, Pavel Machek <pavel@kernel.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] leds: group-multicolor: Add support for initial value.
Date: Mon, 16 Mar 2026 21:13:21 +0100
Message-ID: <20260316201321.2789158-1-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the driver is loaded, it turned off all LEDs in the group. This
patch changes the driver to take over existing LED states and set
the brighness and intensity in the group accordingly.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
Changes in v3:
- Use is_on boolean instead of storing the max_brightness twice
- Link to v2: https://lore.kernel.org/linux-leds/20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com/

Changes in v2:
- Fix multiline comments
- Improve comments
- Link to v1: https://lore.kernel.org/linux-leds/20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com/

---
 drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
index 548c7dd63ba1e..ab46537697d76 100644
--- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
 	struct mc_subled *subled;
 	struct leds_multicolor *priv;
 	unsigned int max_brightness = 0;
+	bool is_on = false;
 	int i, ret, count = 0, common_flags = 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -96,6 +97,13 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 		max_brightness = max(max_brightness, led_cdev->max_brightness);
 
+		/*
+		 * If any LED is on, set brightness to the max brightness.
+		 * The actual brightness of the LED is set as intensity value.
+		 */
+		if (led_cdev->brightness)
+			is_on = true;
+
 		count++;
 	}
 
@@ -109,14 +117,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 		subled[i].color_index = led_cdev->color;
 
-		/* Configure the LED intensity to its maximum */
-		subled[i].intensity = max_brightness;
+		/* Configure the LED intensity to its current brightness */
+		subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
+							led_cdev->max_brightness);
 	}
 
 	/* Initialise the multicolor's LED class device */
 	cdev = &priv->mc_cdev.led_cdev;
 	cdev->brightness_set_blocking = leds_gmc_set;
 	cdev->max_brightness = max_brightness;
+	cdev->brightness = is_on ? max_brightness : 0;
 	cdev->color = LED_COLOR_ID_MULTI;
 	priv->mc_cdev.num_colors = count;
 
-- 
2.39.2

