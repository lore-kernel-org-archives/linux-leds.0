From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 3/3] leds: avoid using DEVICE_ATTR macro for max_brightness
 attribute
Date: Thu, 07 Aug 2014 14:10:24 +0200
Message-ID: <1407413424-30087-4-git-send-email-j.anaszewski@samsung.com>
References: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42720 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519AbaHGMKi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 08:10:38 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9X00HUFR5P2X80@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 07 Aug 2014 21:10:37 +0900 (KST)
In-reply-to: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

Make definition of the brightness related sysfs attributes
consistent. The modification entails change of the function
name: led_max_brightness_show -> max_brightness_show

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com> 
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/led-class.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3df5632..f4e5bb4 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -59,14 +59,14 @@ static ssize_t brightness_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(brightness);
 
-static ssize_t led_max_brightness_show(struct device *dev,
+static ssize_t max_brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%u\n", led_cdev->max_brightness);
 }
-static DEVICE_ATTR(max_brightness, 0444, led_max_brightness_show, NULL);
+static DEVICE_ATTR_RO(max_brightness);
 
 #ifdef CONFIG_LEDS_TRIGGERS
 static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
-- 
1.7.9.5
