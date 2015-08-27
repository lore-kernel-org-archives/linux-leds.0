From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: [PATCH] leds: leds-cobalt-qube: Use devm_led_classdev_register
Date: Thu, 27 Aug 2015 10:43:02 +0530
Message-ID: <20150827051302.GA10275@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38240 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952AbbH0FNL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Aug 2015 01:13:11 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Use resource-managed function devm_led_classdev_register instead
of led_classdev_register to make the error-path simpler.

To be compatible with the change, goto is replaced with direct
return and unneeded label is dropped. Also, remove redundant
cobalt_qube_led_remove.

Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
---
 drivers/leds/leds-cobalt-qube.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index d975220..59818df 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -49,31 +49,15 @@ static int cobalt_qube_led_probe(struct platform_device *pdev)
 	led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
 	writeb(led_value, led_port);
 
-	retval = led_classdev_register(&pdev->dev, &qube_front_led);
+	retval = devm_led_classdev_register(&pdev->dev, &qube_front_led);
 	if (retval)
-		goto err_null;
-
-	return 0;
-
-err_null:
-	led_port = NULL;
-
-	return retval;
-}
-
-static int cobalt_qube_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&qube_front_led);
-
-	if (led_port)
-		led_port = NULL;
+		return retval;
 
 	return 0;
 }
 
 static struct platform_driver cobalt_qube_led_driver = {
 	.probe	= cobalt_qube_led_probe,
-	.remove	= cobalt_qube_led_remove,
 	.driver	= {
 		.name	= "cobalt-qube-leds",
 	},
-- 
1.9.1
