From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0304/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:58:25 +0800
Message-ID: <20160802105825.1728-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, hal.rosenstock@gmail.com, dledford@redhat.com, sean.hefty@intel.com, bp@alien8.de
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: linux-leds@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/leds/trigger/ledtrig-gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 51288a4..6fc7ec0 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -90,7 +90,7 @@ static ssize_t gpio_trig_brightness_store(struct device *dev,
 
 	return n;
 }
-static DEVICE_ATTR(desired_brightness, 0644, gpio_trig_brightness_show,
+static DEVICE_ATTR(desired_brightness, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, gpio_trig_brightness_show,
 		gpio_trig_brightness_store);
 
 static ssize_t gpio_trig_inverted_show(struct device *dev,
@@ -124,7 +124,7 @@ static ssize_t gpio_trig_inverted_store(struct device *dev,
 
 	return n;
 }
-static DEVICE_ATTR(inverted, 0644, gpio_trig_inverted_show,
+static DEVICE_ATTR(inverted, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, gpio_trig_inverted_show,
 		gpio_trig_inverted_store);
 
 static ssize_t gpio_trig_gpio_show(struct device *dev,
@@ -174,7 +174,7 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
 
 	return ret ? ret : n;
 }
-static DEVICE_ATTR(gpio, 0644, gpio_trig_gpio_show, gpio_trig_gpio_store);
+static DEVICE_ATTR(gpio, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, gpio_trig_gpio_show, gpio_trig_gpio_store);
 
 static void gpio_trig_activate(struct led_classdev *led)
 {
-- 
2.9.2
