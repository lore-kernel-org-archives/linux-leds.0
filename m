From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/2] leds: Use log level warn instead of info when telling about a name clash
Date: Fri, 27 Mar 2015 01:42:05 +0200
Message-ID: <1427413326-11811-2-git-send-email-sakari.ailus@iki.fi>
References: <1427413326-11811-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:38475 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932085AbbCZXnL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Mar 2015 19:43:11 -0400
In-Reply-To: <1427413326-11811-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: ricardo.ribalda@gmail.com
Cc: linux-leds@vger.kernel.org, cooloney@gmail.com

The LED names are expected to be unique in the system. Use KERN_WARNING log
level to notify the user about the matter.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/led-class.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4ca37b8..bbe0294 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -249,7 +249,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 		return PTR_ERR(led_cdev->dev);
 
 	if (ret)
-		dev_info(parent, "Led %s renamed to %s due to name collision",
+		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
 #ifdef CONFIG_LEDS_TRIGGERS
-- 
1.7.10.4
