From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] leds: syscon: handle multiple syscon instances
Date: Fri, 24 Oct 2014 12:57:19 +0200
Message-ID: <1414148239-13016-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:60542 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756497AbaJXK5Z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Oct 2014 06:57:25 -0400
Received: by mail-wi0-f169.google.com with SMTP id q5so846972wiv.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Oct 2014 03:57:24 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Currently the syscon LED driver will only handle LEDs on the
first syscon found in the system. But there can be several of
them, so augment the driver to traverse all syscon nodes and
check for syscon LEDs on them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-syscon.c | 67 +++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index e0ccfc872c2f..6896e2d9ba58 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -66,39 +66,13 @@ static void syscon_led_set(struct led_classdev *led_cdev,
 		dev_err(sled->cdev.dev, "error updating LED status\n");
 }
 
-static const struct of_device_id syscon_match[] = {
-	{ .compatible = "syscon", },
-	{},
-};
-
-static int __init syscon_leds_init(void)
+static int __init syscon_leds_spawn(struct device_node *np,
+				    struct device *dev,
+				    struct regmap *map)
 {
-	const struct of_device_id *devid;
-	struct device_node *np;
 	struct device_node *child;
-	struct regmap *map;
-	struct platform_device *pdev;
-	struct device *dev;
 	int ret;
 
-	np = of_find_matching_node_and_match(NULL, syscon_match,
-					     &devid);
-	if (!np)
-		return -ENODEV;
-
-	map = syscon_node_to_regmap(np);
-	if (IS_ERR(map))
-		return PTR_ERR(map);
-
-	/*
-	 * If the map is there, the device should be there, we allocate
-	 * memory on the syscon device's behalf here.
-	 */
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return -ENODEV;
-	dev = &pdev->dev;
-
 	for_each_available_child_of_node(np, child) {
 		struct syscon_led *sled;
 		const char *state;
@@ -146,7 +120,6 @@ static int __init syscon_leds_init(void)
 				if (ret < 0)
 					return ret;
 			}
-
 		}
 		sled->cdev.brightness_set = syscon_led_set;
 
@@ -156,7 +129,39 @@ static int __init syscon_leds_init(void)
 
 		dev_info(dev, "registered LED %s\n", sled->cdev.name);
 	}
+	return 0;
+}
+
+static int __init syscon_leds_init(void)
+{
+	struct device_node *np;
+
+	for_each_of_allnodes(np) {
+		struct platform_device *pdev;
+		struct regmap *map;
+		int ret;
+
+		if (!of_device_is_compatible(np, "syscon"))
+			continue;
+
+		map = syscon_node_to_regmap(np);
+		if (IS_ERR(map)) {
+			pr_err("error getting regmap for syscon LEDs\n");
+			continue;
+		}
+
+		/*
+		 * If the map is there, the device should be there, we allocate
+		 * memory on the syscon device's behalf here.
+		 */
+		pdev = of_find_device_by_node(np);
+		if (!pdev)
+			return -ENODEV;
+		ret = syscon_leds_spawn(np, &pdev->dev, map);
+		if (ret)
+			dev_err(&pdev->dev, "could not spawn syscon LEDs\n");
+	}
 
-       return 0;
+	return 0;
 }
 device_initcall(syscon_leds_init);
-- 
1.9.3
