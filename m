From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Sat, 14 Mar 2015 00:05:39 +0100
Message-ID: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

The current code expected that every LED had an unique name. This is a
legit expectation when the device tree can no be modified or extended.
But with device tree overlays this requirement can be easily broken.

This patch finds out if the name is already in use and adds the suffix
_1, _2... if not.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v3: Suggested by Bryan Wu <cooloney@gmail.com>

-Do not allocate dynamically the name
 drivers/leds/led-class.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 768d33a..4ca37b8 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -212,6 +212,26 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
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
+	int i = 0;
+
+	strncpy(name, init_name, len);
+
+	while (class_find_device(leds_class, NULL, name, match_name))
+		snprintf(name, len, "%s_%d", init_name, ++i);
+
+	return i;
+}
+
 /**
  * led_classdev_register - register a new object of led_classdev class.
  * @parent: The device to register.
@@ -219,12 +239,19 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
  */
 int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 {
+	char name[64];
+	int ret;
+
+	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
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
