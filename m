From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 17/26] leds: cr0014114: Use generic support for composing LED names
Date: Sun,  9 Jun 2019 21:07:54 +0200
Message-ID: <20190609190803.14815-18-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com, Oleh Kravchenko <oleg@kaa.org.ua>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

At this occassion remove initialization of struct led_classdev's
dev->of_node property in the driver, since now it will be taken from
fwnode assigned to struct led_init_data and passed to the new
devm_led_classdev_register_ext() API.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-cr0014114.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 1c82152764d2..2da448ae718e 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -8,7 +8,6 @@
 #include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <linux/workqueue.h>
-#include <uapi/linux/uleds.h>
 
 /*
  *  CR0014114 SPI protocol descrtiption:
@@ -40,8 +39,9 @@
 #define CR_FW_DELAY_MSEC	10
 #define CR_RECOUNT_DELAY	(HZ * 3600)
 
+#define CR_DEV_NAME		"cr0014114"
+
 struct cr0014114_led {
-	char			name[LED_MAX_NAME_SIZE];
 	struct cr0014114	*priv;
 	struct led_classdev	ldev;
 	u8			brightness;
@@ -167,8 +167,7 @@ static int cr0014114_set_sync(struct led_classdev *ldev,
 						    struct cr0014114_led,
 						    ldev);
 
-	dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
-		led->name, brightness);
+	dev_dbg(led->priv->dev, "Set brightness to %d\n", brightness);
 
 	mutex_lock(&led->priv->lock);
 	led->brightness = (u8)brightness;
@@ -183,41 +182,32 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 	size_t			i = 0;
 	struct cr0014114_led	*led;
 	struct fwnode_handle	*child;
-	struct device_node	*np;
+	struct led_init_data	init_data = {};
 	int			ret;
-	const char		*str;
 
 	device_for_each_child_node(priv->dev, child) {
-		np = to_of_node(child);
 		led = &priv->leds[i];
 
-		ret = fwnode_property_read_string(child, "label", &str);
-		if (ret)
-			snprintf(led->name, sizeof(led->name),
-				 "cr0014114::");
-		else
-			snprintf(led->name, sizeof(led->name),
-				 "cr0014114:%s", str);
-
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->ldev.default_trigger);
 
 		led->priv			  = priv;
-		led->ldev.name			  = led->name;
 		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
 		led->ldev.brightness_set_blocking = cr0014114_set_sync;
 
-		ret = devm_led_classdev_register(priv->dev, &led->ldev);
+		init_data.fwnode = child;
+		init_data.devicename = CR_DEV_NAME;
+		init_data.default_label = ":";
+
+		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev,
+						     &init_data);
 		if (ret) {
 			dev_err(priv->dev,
-				"failed to register LED device %s, err %d",
-				led->name, ret);
+				"failed to register LED device, err %d", ret);
 			fwnode_handle_put(child);
 			return ret;
 		}
 
-		led->ldev.dev->of_node = np;
-
 		i++;
 	}
 
-- 
2.11.0
