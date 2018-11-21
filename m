From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] leds: powernv: add of_node_put()
Date: Wed, 21 Nov 2018 07:31:38 -0500
Message-ID: <20181121123138.21870-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-leds@vger.kernel.org

of_find_node_by_path() acquires a reference to the node returned by
it and that reference needs to be dropped by its caller.bl_idle_init()
doesn't do that, so fix it.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/leds/leds-powernv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index b1adbd70ce2e..0b1540029034 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -285,6 +285,7 @@ static int powernv_led_probe(struct platform_device *pdev)
 	struct device_node *led_node;
 	struct powernv_led_common *powernv_led_common;
 	struct device *dev = &pdev->dev;
+	int rc;
 
 	led_node = of_find_node_by_path("/ibm,opal/leds");
 	if (!led_node) {
@@ -295,15 +296,20 @@ static int powernv_led_probe(struct platform_device *pdev)
 
 	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
 					  GFP_KERNEL);
-	if (!powernv_led_common)
-		return -ENOMEM;
+	if (!powernv_led_common){
+		rc = -ENOMEM;
+		goto out;
+	}
 
 	mutex_init(&powernv_led_common->lock);
 	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
 
 	platform_set_drvdata(pdev, powernv_led_common);
 
-	return powernv_led_classdev(pdev, led_node, powernv_led_common);
+	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
+out:
+	of_node_put(led_node);
+	return rc;
 }
 
 /* Platform driver remove */
-- 
2.17.0
