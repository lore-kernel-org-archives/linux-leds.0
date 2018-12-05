From: Rob Herring <robh@kernel.org>
Subject: [PATCH] leds: 88pm860x: Use of_node_name_eq for node name comparisons
Date: Wed,  5 Dec 2018 13:50:27 -0600
Message-ID: <20181205195050.4759-11-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

For instances using of_node_cmp, this has the side effect of now using
case sensitive comparisons. This should not matter for any FDT based
system which this is.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/leds/leds-88pm860x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 77a104d2b124..036d4a536697 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -130,7 +130,7 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 		return -ENODEV;
 	}
 	for_each_child_of_node(nproot, np) {
-		if (!of_node_cmp(np->name, data->name)) {
+		if (of_node_name_eq(np, data->name)) {
 			of_property_read_u32(np, "marvell,88pm860x-iset",
 					     &iset);
 			data->iset = PM8606_LED_CURRENT(iset);
-- 
2.19.1
