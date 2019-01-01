From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 2/5] leds: Add helper for getting default pattern from Device Tree
Date: Tue,  1 Jan 2019 15:07:14 +0100
Message-ID: <20190101140717.13564-3-krzk@kernel.org>
References: <20190101140717.13564-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190101140717.13564-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raphael Teysseyre <rteysseyre@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Multiple LED triggers might need to access default pattern so add a
helper for that.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/led-core.c | 43 +++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h    |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ede4fa0ac2cc..e4b6da73bc12 100644
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
@@ -310,6 +312,47 @@ int led_update_brightness(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_update_brightness);
 
+/**
+ * led_classdev_get_default_pattern - return default pattern
+ *
+ * @led_cdev: the led_classdev structure for this device
+ * @size:     pointer for storing the number of elements in returned array,
+ *            modified only if return != NULL
+ *
+ * Return:    Allocated array of integers with default pattern from DeviceTree
+ *            or NULL.  Caller is responsible for kfree().
+ */
+u32 *led_classdev_get_default_pattern(struct led_classdev *led_cdev,
+				      unsigned int *size)
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
+EXPORT_SYMBOL_GPL(led_classdev_get_default_pattern);
+
 /* Caller must ensure led_cdev->led_access held */
 void led_sysfs_disable(struct led_classdev *led_cdev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 5263f87e1d2c..70edf574ba81 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -129,6 +129,9 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
+extern u32 *led_classdev_get_default_pattern(struct led_classdev *led_cdev,
+					     unsigned int *size);
+
 extern int of_led_classdev_register(struct device *parent,
 				    struct device_node *np,
 				    struct led_classdev *led_cdev);
-- 
2.17.1
