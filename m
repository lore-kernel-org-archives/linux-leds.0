From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 2/5] leds: Add helper for getting default pattern from Device Tree
Date: Fri,  4 Jan 2019 11:08:41 +0100
Message-ID: <1546596524-19863-3-git-send-email-krzk@kernel.org>
References: <1546596524-19863-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546596524-19863-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Multiple LED triggers might need to access default pattern so add a
helper for that.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/led-core.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/leds.h    | 13 +++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ede4fa0ac2cc..c81d7d27c2af 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -16,7 +16,9 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/rwsem.h>
+#include <linux/slab.h>
 #include "leds.h"
 
 DECLARE_RWSEM(leds_list_lock);
@@ -310,6 +312,36 @@ int led_update_brightness(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_update_brightness);
 
+u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size)
+{
+	struct device_node *np = dev_of_node(led_cdev->dev);
+	u32 *pattern;
+	int count;
+
+	if (!np)
+		return NULL;
+
+	count = of_property_count_u32_elems(np, "led-pattern");
+	if (count < 0)
+		return NULL;
+
+	pattern = kcalloc(count, sizeof(*pattern), GFP_KERNEL);
+	if (!pattern)
+		return NULL;
+
+	if (of_property_read_u32_array(np, "led-pattern", pattern, count))
+		goto err;
+
+	*size = count;
+
+	return pattern;
+
+err:
+	kfree(pattern);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(led_get_default_pattern);
+
 /* Caller must ensure led_cdev->led_access held */
 void led_sysfs_disable(struct led_classdev *led_cdev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 5263f87e1d2c..ac6d34377e7e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -219,6 +219,19 @@ extern int led_set_brightness_sync(struct led_classdev *led_cdev,
 extern int led_update_brightness(struct led_classdev *led_cdev);
 
 /**
+ * led_get_default_pattern - return default pattern
+ *
+ * @led_cdev: the LED to get default pattern for
+ * @size:     pointer for storing the number of elements in returned array,
+ *            modified only if return != NULL
+ *
+ * Return:    Allocated array of integers with default pattern from DeviceTree
+ *            or NULL.  Caller is responsible for kfree().
+ */
+extern u32 *led_get_default_pattern(struct led_classdev *led_cdev,
+				    unsigned int *size);
+
+/**
  * led_sysfs_disable - disable LED sysfs interface
  * @led_cdev: the LED to set
  *
-- 
2.7.4
