From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] drivers/leds: don't use module_init in non-modular leds-cobalt-raq.c
Date: Mon, 15 Jun 2015 18:12:47 -0400
Message-ID: <1434406367-32251-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:59463 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866AbbFOWNV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jun 2015 18:13:21 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

This file is built for a bool Kconfig variable, and hence this
code is either present or absent.  It currently can never be
modular, so using module_init as an alias for __initcall can be
somewhat misleading.

Fix this up now, so that we can relocate module_init from
init.h into module.h in the future.  If we don't do this, we'd
have to add module.h to obviously non-modular code, and that
would be a worse thing.

Note that direct use of __initcall is discouraged, vs. one
of the priority categorized subgroups.  As __initcall gets
mapped onto device_initcall, our use of device_initcall
directly in this change means that the runtime impact is
zero -- it will remain at level 6 in initcall ordering.

And since it can't be modular, we remove all the __exitcall
stuff related to module_exit() -- it is dead code that won't
ever be executed.

Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
[
 To be appended to the branch content originally sent as:
 "Replace module_init with device_initcall in non modules"
 https://lkml.kernel.org/r/1432860493-23831-1-git-send-email-paul.gortmaker@windriver.com
]

 drivers/leds/leds-cobalt-raq.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 06dbe18a2065..b316df4a8c1e 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -108,20 +108,8 @@ err_null:
 	return retval;
 }
 
-static int cobalt_raq_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&raq_power_off_led);
-	led_classdev_unregister(&raq_web_led);
-
-	if (led_port)
-		led_port = NULL;
-
-	return 0;
-}
-
 static struct platform_driver cobalt_raq_led_driver = {
 	.probe	= cobalt_raq_led_probe,
-	.remove	= cobalt_raq_led_remove,
 	.driver = {
 		.name	= "cobalt-raq-leds",
 	},
@@ -131,5 +119,4 @@ static int __init cobalt_raq_led_init(void)
 {
 	return platform_driver_register(&cobalt_raq_led_driver);
 }
-
-module_init(cobalt_raq_led_init);
+device_initcall(cobalt_raq_led_init);
-- 
2.2.1
