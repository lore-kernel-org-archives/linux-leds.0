Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2313876C7;
	Mon,  9 Feb 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657629; cv=none; b=H8vvbwEsmL3ir31kcSuF2NCOE32qlBsdrdJYXGWHWLRE19fMNhfuv8KMWpML8kvN7BVx9dl+owSfX1J7XXupGkxe/o9xdBV1pmVqCtYjXigBz6hFgdCzmSG7ymht+eam1Z2Fp97KjlyBiCj/nmTTLpOWij/+pney7MuCN5xDfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657629; c=relaxed/simple;
	bh=PexCPFP8dA2VPdxDOLGW/mmnlnd3nx2/8N7bHRHxzNw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cbl+1R/doV5YwzivAJOIHrk6kqwAdaPLMVWdqRVkyrmwhQ4dGxkfGU1HvAXy4+/BgoAfk6m0kJ7UVRr+08Zf6gitAFhFGY5EvXGIUGONdR+Tk+9CSI2AGq0qWqbsyx/fmUuNiU+kkrClyIovLyuUbGH2lkB13Z1BfHhh29QYZL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Feb 2026
 18:15:17 +0100
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Mon, 9 Feb 2026 18:15:17 +0100
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] leds: group-multicolor: Add support for initial value.
Date: Mon, 9 Feb 2026 18:15:13 +0100
Message-ID: <20260209171514.3378893-1-martijn.de.gouw@prodrive-technologies.com>
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

