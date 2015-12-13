From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/3] drivers/leds: make leds-syscon.c explicitly non-modular
Date: Sun, 13 Dec 2015 16:45:51 -0500
Message-ID: <1450043151-30820-4-git-send-email-paul.gortmaker@windriver.com>
References: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:39577 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751109AbbLMVsU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 13 Dec 2015 16:48:20 -0500
In-Reply-To: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/leds/Kconfig:config LEDS_SYSCON
drivers/leds/Kconfig:   bool "LED support for LEDs on system controllers"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/leds/leds-syscon.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index b88900d721e4..3be40f74f12a 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -20,7 +20,7 @@
  * MA 02111-1307 USA
  */
 #include <linux/io.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -139,29 +139,17 @@ static int syscon_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int syscon_led_remove(struct platform_device *pdev)
-{
-	struct syscon_led *sled = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&sled->cdev);
-	/* Turn it off */
-	regmap_update_bits(sled->map, sled->offset, sled->mask, 0);
-	return 0;
-}
-
 static const struct of_device_id of_syscon_leds_match[] = {
 	{ .compatible = "register-bit-led", },
 	{},
 };
 
-MODULE_DEVICE_TABLE(of, of_syscon_leds_match);
-
 static struct platform_driver syscon_led_driver = {
 	.probe		= syscon_led_probe,
-	.remove		= syscon_led_remove,
 	.driver		= {
 		.name	= "leds-syscon",
 		.of_match_table = of_syscon_leds_match,
+		.suppress_bind_attrs = true,
 	},
 };
-module_platform_driver(syscon_led_driver);
+builtin_platform_driver(syscon_led_driver);
-- 
2.6.1
