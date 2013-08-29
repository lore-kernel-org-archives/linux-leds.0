From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] leds: wm831x-status: Request a REG resource
Date: Thu, 29 Aug 2013 15:18:14 +0100
Message-ID: <1377785910-30812-1-git-send-email-broonie@kernel.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47369 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788Ab3H2OSx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 29 Aug 2013 10:18:53 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: patches@opensource.wolfsonmicro.com, linux-leds@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

The wm831x-status driver was not converted to use a REG resource when they
were introduced and the rest of the wm831x drivers converted, causing it
to fail to probe due to requesting the wrong resource type.

Signed-off-by: Mark Brown <broonie@linaro.org>
Cc: stable@vger.kernel.org # v3.7+
---
 drivers/leds/leds-wm831x-status.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index c32dad4..0a1a13f 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -230,9 +230,9 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	int id = pdev->id % ARRAY_SIZE(chip_pdata->status);
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	res = platform_get_resource(pdev, IORESOURCE_REG, 0);
 	if (res == NULL) {
-		dev_err(&pdev->dev, "No I/O resource\n");
+		dev_err(&pdev->dev, "No register resource\n");
 		ret = -EINVAL;
 		goto err;
 	}
-- 
1.8.4.rc3

