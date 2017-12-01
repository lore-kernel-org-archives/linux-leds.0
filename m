From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 1/6] leds: Add new API to derive a LED name
Date: Fri, 1 Dec 2017 10:56:08 -0600
Message-ID: <20171201165613.10358-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Create an API that is called to derive the
LED name from either the DT label in the child
node or if that does not exist from the parent
node name and an alternate label that is passed in.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v6 - New patch to add the api to generate a LED label

 drivers/leds/led-class.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/leds.h     |  6 ++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b0e2d55acbd6..d3e035488737 100644
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
@@ -243,6 +244,39 @@ static int led_classdev_next_name(const char *init_name, char *name,
 	return i;
 }
 
+/**
+ * of_led_compose_name - derive the LED name based on DT or alternate name.
+ *
+ * @parent: parent of LED device
+ * @child: child node of LED device
+ * @alt_name: an alternate name if the label node is not found
+ * @len: length of the alt_name
+ * @led_name: derived name from either DT label or alt_name
+ */
+void of_led_compose_name(struct device_node *parent,
+                     struct device_node *child,
+		     const char *alt_name,
+		     size_t len,
+		     char *led_name)
+{
+	int ret;
+	int length;
+	const char *name;
+
+	if (len == 0 || alt_name == NULL)
+		return;
+
+	ret = of_property_read_string(child, "label", &name);
+	if (!ret) {
+		strlcpy(led_name, name, sizeof(led_name));
+	} else {
+		length = len + strlen(parent->name) + 1;
+		snprintf(led_name, len, "%s:%s", parent->name, alt_name);
+	}
+
+}
+EXPORT_SYMBOL_GPL(of_led_compose_name);
+
 /**
  * of_led_classdev_register - register a new object of led_classdev class.
  *
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 5579c64c8fd6..9e18dbe196e2 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -123,6 +123,12 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
+extern void of_led_compose_name(struct device_node *parent,
+                     struct device_node *child,
+		     const char *alt_name,
+		     size_t len,
+		     char *led_name);
+
 extern int of_led_classdev_register(struct device *parent,
 				    struct device_node *np,
 				    struct led_classdev *led_cdev);
-- 
2.15.0.124.g7668cbc60
