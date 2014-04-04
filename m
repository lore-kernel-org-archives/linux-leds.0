From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] leds: 88pm860x: Fix missing refcount decrement for parent
 of_node
Date: Fri, 04 Apr 2014 09:51:20 +0200
Message-ID: <1396597880-2325-2-git-send-email-k.kozlowski@samsung.com>
References: <1396597880-2325-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1396597880-2325-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-leds@vger.kernel.org

The driver obtained the reference to parent->of_node but immediately it
was overwritten by reference to child node 'leds'. The of_node_put at
the end of DT parsing function decremented only the child 'leds' so
effectively the reference to parent of_node leaked.

Getting reference to parent->of_node is not needed at all so get rid of
it to fix the reference count.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/leds/leds-88pm860x.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 2f9ee538f30d..fb7c310e9f20 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -131,10 +131,9 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 	struct device_node *nproot, *np;
 	int iset = 0;
 
-	nproot = of_node_get(pdev->dev.parent->of_node);
-	if (!nproot)
+	if (!pdev->dev.parent->of_node)
 		return -ENODEV;
-	nproot = of_get_child_by_name(nproot, "leds");
+	nproot = of_get_child_by_name(pdev->dev.parent->of_node, "leds");
 	if (!nproot) {
 		dev_err(&pdev->dev, "failed to find leds node\n");
 		return -ENODEV;
-- 
1.7.9.5
