From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 2/2] leds: Don't treat the LED name as a format string
Date: Fri, 27 Mar 2015 01:42:06 +0200
Message-ID: <1427413326-11811-3-git-send-email-sakari.ailus@iki.fi>
References: <1427413326-11811-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:38463 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753475AbbCZXmm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Mar 2015 19:42:42 -0400
In-Reply-To: <1427413326-11811-1-git-send-email-sakari.ailus@iki.fi>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: ricardo.ribalda@gmail.com
Cc: linux-leds@vger.kernel.org, cooloney@gmail.com

The LED name was wrongly interpreted as format string. Stop doing that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/led-class.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index bbe0294..ebf6dad4f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -244,7 +244,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 
 	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-					led_cdev, led_cdev->groups, name);
+				led_cdev, led_cdev->groups, "%s", name);
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
 
-- 
1.7.10.4
