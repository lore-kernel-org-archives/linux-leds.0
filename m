From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v4 05/21] leds: avoid using deprecated DEVICE_ATTR macro
Date: Fri, 11 Jul 2014 16:04:08 +0200
Message-ID: <1405087464-13762-6-git-send-email-j.anaszewski@samsung.com>
References: <1405087464-13762-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1405087464-13762-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kyungmin.park@samsung.com, b.zolnierkie@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org

Make the sysfs attributes definition consistent in the whole file.
The modification entails change of the function name:
led_max_brightness_show -> max_brightness_show

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/led-class.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 0127783..a96a1a7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -60,14 +60,14 @@ unlock:
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
