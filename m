From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 2/5] leds: Add helper for getting default pattern from Device Tree
Date: Wed, 12 Dec 2018 12:16:43 +0100
Message-ID: <1544613406-27026-3-git-send-email-krzk@kernel.org>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544613406-27026-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Multiple LED triggers might need to access default pattern so add a
helper for that.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

New patch in the series

---
 drivers/leds/led-class.c | 25 +++++++++++++++++++++++++
 include/linux/leds.h     |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3c7e3487b373..44b95e6480f6 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -17,6 +17,7 @@
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -244,6 +245,30 @@ static int led_classdev_next_name(const char *init_name, char *name,
 }
 
 /**
+ * led_classdev_get_default_pattern - return default pattern
+ *
+ * @led_cdev: the led_classdev structure for this device
+ *
+ * Return: Null terminated string with default pattern from DeviceTree or NULL
+ */
+const char *led_classdev_get_default_pattern(struct led_classdev *led_cdev)
+{
+	struct device_node *np = dev_of_node(led_cdev->dev);
+	const char *pattern;
+
+	if (!np)
+		return NULL;
+
+	if (of_property_read_string(np, "led-pattern", &pattern))
+		return NULL;
+
+	if (!strlen(pattern))
+		return NULL;
+
+	return pattern;
+}
+
+/**
  * of_led_classdev_register - register a new object of led_classdev class.
  *
  * @parent: parent of LED device
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 5263f87e1d2c..9da2bfa183ea 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -129,6 +129,9 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
+extern const char *
+led_classdev_get_default_pattern(struct led_classdev *led_cdev);
+
 extern int of_led_classdev_register(struct device *parent,
 				    struct device_node *np,
 				    struct led_classdev *led_cdev);
-- 
2.7.4
