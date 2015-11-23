From: Saurabh Sengar <saurabh.truth@gmail.com>
Subject: [PATCH] leds/powernv : removing NULL check
Date: Mon, 23 Nov 2015 14:58:16 +0530
Message-ID: <1448270896-23955-1-git-send-email-saurabh.truth@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Saurabh Sengar <saurabh.truth@gmail.com>
List-Id: linux-leds@vger.kernel.org

no need to explicitly check for pointer to be null,
of_prop_next_string anyways return NULL, if passed pointer is NULL
and hence loop will continue

Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
---
 drivers/leds/leds-powernv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 1e75e1f..bc2d76e 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -256,8 +256,6 @@ static int powernv_led_classdev(struct platform_device *pdev,
 
 	for_each_child_of_node(led_node, np) {
 		p = of_find_property(np, "led-types", NULL);
-		if (!p)
-			continue;
 
 		while ((cur = of_prop_next_string(p, cur)) != NULL) {
 			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
-- 
1.9.1
