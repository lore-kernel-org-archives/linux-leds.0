From: Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH] leds: leds-gpio: Fix the "default-state" property check
Date: Tue, 9 Dec 2014 14:31:54 -0200
Message-ID: <1418142714-29794-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bn1on0114.outbound.protection.outlook.com ([157.56.110.114]:16209
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757891AbaLIQrg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 9 Dec 2014 11:47:36 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rafael.j.wysocki@intel.com
Cc: cooloney@gmail.com, grant.likely@linaro.org, jean-michel.hautbois@vodalys.com, festevam@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>

Commit a43f2cbbb009f9 ("leds: leds-gpio: Make use of device property API")
caused a regression by reading the incorrect string for the "default-state"
property.

Fix the property string check to restore the original behaviour.

Fixes: a43f2cbbb009 (leds: leds-gpio: Make use of device property API)
Reported-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/leds/leds-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 8a8ba11..7ea1ea42 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -203,7 +203,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led.default_trigger);
 
-		if (!fwnode_property_read_string(child, "linux,default_state",
+		if (!fwnode_property_read_string(child, "default-state",
 						 &state)) {
 			if (!strcmp(state, "keep"))
 				led.default_state = LEDS_GPIO_DEFSTATE_KEEP;
-- 
1.9.1
