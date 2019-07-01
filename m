From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 1/4] leds: of: create a child device if the LED node contains a "compatible" string
Date: Mon, 1 Jul 2019 17:14:20 +0200
Message-ID: <20190701151423.30768-2-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: linux-leds@vger.kernel.org

This allows the LED core to probe a consumer device when the LED is
registered. In that way the LED can be seen like a minimalist bus that
can handle at most one device.
This is useful to manage simple devices, the purpose of which is
mostly to drive a LED.

One example would be a LED-controlled backlight. The device-tree would look
like the following:

tlc59116@40 {
	compatible = "ti,tlc59108";
	reg = <0x40>;

	bl@2 {
		label = "backlight";
		reg = <0x2>;

		compatible = "led-backlight";
		brightness-levels = <0 243 245 247 248 249 251 252 255>;
		default-brightness-level = <8>;
	};
};

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 16 ++++++++++++++++
 include/linux/leds.h     | 11 +++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4793e77808e2..abf0e63285b9 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -14,6 +14,7 @@
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -306,6 +307,17 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 
 	mutex_unlock(&led_cdev->led_access);
 
+	/* Parse the LED's node in the device-tree and create the consumer
+	 * device if needed.
+	 */
+	if (np) {
+		struct platform_device *pd;
+
+		pd = of_platform_device_create(np, NULL, led_cdev->dev);
+		if (pd)
+			led_cdev->consumer = &pd->dev;
+	}
+
 	dev_dbg(parent, "Registered led device: %s\n",
 			led_cdev->name);
 
@@ -321,6 +333,10 @@ EXPORT_SYMBOL_GPL(of_led_classdev_register);
  */
 void led_classdev_unregister(struct led_classdev *led_cdev)
 {
+	/* destroy the consummer device before removing anything else */
+	if (led_cdev->consumer)
+		of_platform_device_destroy(led_cdev->consumer, NULL);
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf574a17a..63feb8495f3e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -91,6 +91,12 @@ struct led_classdev {
 	int (*pattern_clear)(struct led_classdev *led_cdev);
 
 	struct device		*dev;
+	/*
+	 * The consumer device is a child device created by the LED core if the
+	 * appropriate information (ie "compatible" string) is available in the
+	 * device tree. Its life cycle follows the life cycle of the LED device.
+	 */
+	struct device		*consumer;
 	const struct attribute_group	**groups;
 
 	struct list_head	 node;			/* LED Device list */
@@ -141,6 +147,11 @@ extern void devm_led_classdev_unregister(struct device *parent,
 extern void led_classdev_suspend(struct led_classdev *led_cdev);
 extern void led_classdev_resume(struct led_classdev *led_cdev);
 
+static inline struct led_classdev *to_led_classdev(struct device *dev)
+{
+	return (struct led_classdev *) dev_get_drvdata(dev);
+}
+
 /**
  * led_blink_set - set blinking with software fallback
  * @led_cdev: the LED to start blinking
-- 
2.17.1
