From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/3] leds/led-class: Handle LEDs with the same name
Date: Mon, 30 Mar 2015 19:45:59 +0200
Message-ID: <1427737561-2424-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, sakari.ailus@linux.intel.com, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

The current code expected that every LED had an unique name. This is a
legit expectation when the device tree can no be modified or extended.
But with device tree overlays this requirement can be easily broken.

This patch finds out if the name is already in use and adds the suffix
_1, _2... if not.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/leds/led-class.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 768d33a..fc57d9c 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -212,6 +212,31 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
 	.resume         = led_resume,
 };
 
+static int match_name(struct device *dev, const void *data)
+{
+	if (!dev_name(dev))
+		return 0;
+	return !strcmp(dev_name(dev), (char *)data);
+}
+
+static int led_classdev_next_name(const char *init_name, char *name,
+				  size_t len)
+{
+	unsigned int i = 0;
+	int ret = 0;
+
+	strlcpy(name, init_name, len);
+
+	while (class_find_device(leds_class, NULL, name, match_name) &&
+	       (ret < len))
+		ret = snprintf(name, len, "%s_%u", init_name, ++i);
+
+	if (ret >= len)
+		return -ENOMEM;
+
+	return i;
+}
+
 /**
  * led_classdev_register - register a new object of led_classdev class.
  * @parent: The device to register.
@@ -219,12 +244,22 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
  */
 int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 {
+	char name[64];
+	int ret;
+
+	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
+	if (ret < 0)
+		return ret;
+
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-					led_cdev, led_cdev->groups,
-					"%s", led_cdev->name);
+					led_cdev, led_cdev->groups, name);
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
 
+	if (ret)
+		dev_info(parent, "Led %s renamed to %s due to name collision",
+				led_cdev->name, dev_name(led_cdev->dev));
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
-- 
2.1.4
