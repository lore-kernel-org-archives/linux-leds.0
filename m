From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v3 05/25] leds: core: Add support for composing LED class device names
Date: Sun, 31 Mar 2019 19:54:41 +0200
Message-ID: <20190331175501.23471-6-jacek.anaszewski@gmail.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Add generic support for composing LED class device name basing on
fwnode_handle data. The function composes device name according to
either a new <color:function> pattern or the legacy
<devicename:color:function> pattern. The decision on using the
particular pattern is made basing on whether fwnode contains new
"function" and "color" properties, or the legacy "label" proeprty.

Backward compatibility with in-driver hard-coded LED class device
names is assured thanks to the default_label and led_hw_name properties
of newly introduced struct led_init_data.

In case none of the aforementioned properties was found, then, for OF
nodes, the node name is adopted for LED class device name.

At the occassion of amending the Documentation/leds/leds-class.txt
unify spelling: colour -> color.

Alongside these changes added is a new tool - tools/leds/get_led_device_info.sh.
The tool allows retrieving details of a LED class device's parent device,
which proves that getting rid of a devicename section from LED name pattern
is justified since this information is already available in sysfs.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
---
 Documentation/leds/leds-class.txt | 27 +++++++++--
 drivers/leds/led-class.c          | 29 ++++++++++--
 drivers/leds/led-core.c           | 96 +++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h              | 43 ++++++++++++++++++
 tools/leds/get_led_device_info.sh | 81 +++++++++++++++++++++++++++++++++
 5 files changed, 270 insertions(+), 6 deletions(-)
 create mode 100755 tools/leds/get_led_device_info.sh

diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
index 8b39cc6b03ee..11e19c3c2e4d 100644
--- a/Documentation/leds/leds-class.txt
+++ b/Documentation/leds/leds-class.txt
@@ -43,14 +43,35 @@ LED Device Naming
 
 Is currently of the form:
 
-"devicename:colour:function"
-
-There have been calls for LED properties such as colour to be exported as
+"color:function"
+
+There might be still LED class drivers around using "devicename:color:function"
+naming pattern, but the "devicename" section is now deprecated since it used
+to convey information that was already available in the sysfs, like product
+name. There is a tool (tools/leds/get_led_device_info.sh) available for
+retrieving that information per a LED class device.
+
+Associations with other devices, like network ones, should be defined
+via LED trigger mechanism. This approach is applied by some of wireless
+network drivers that create triggers dynamically and incorporate phy
+name into the trigger name. On the other hand input subsystem offers LED - input
+bridge (drivers/input/input-leds.c) for exposing keyboard LEDs as LED class
+devices. The get_led_device_info.sh script has support for retrieving related
+input device node name. Should it support discovery of associations between
+LEDs and other subsystems, please don't hesitate to submit a relevant patch.
+
+There have been calls for LED properties such as color to be exported as
 individual led class attributes. As a solution which doesn't incur as much
 overhead, I suggest these become part of the device name. The naming scheme
 above leaves scope for further attributes should they be needed. If sections
 of the name don't apply, just leave that section blank.
 
+Please also keep in mind that LED subsystem has a protection against LED name
+conflict. It adds numerical suffix (e.g. "_1", "_2", "_3" etc.) to the requested
+LED class device name in case it is already in use. In order to prevent LED core
+from assigning these suffixes in an arbitrary order the led-enumerator fwnode
+property can be used for differentiation of LEDs that share common function
+and/or color. In this case enumerators will be prepended with "-" character.
 
 Brightness setting API
 ======================
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2f09156b0c63..bfd46a9bba63 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -26,6 +26,18 @@
 
 static struct class *leds_class;
 
+const char *led_colors[LED_COLOR_ID_COUNT] = {
+	[LED_COLOR_ID_WHITE] = "white",
+	[LED_COLOR_ID_RED] = "red",
+	[LED_COLOR_ID_GREEN] = "green",
+	[LED_COLOR_ID_BLUE] = "blue",
+	[LED_COLOR_ID_AMBER] = "amber",
+	[LED_COLOR_ID_VIOLET] = "violet",
+	[LED_COLOR_ID_YELLOW] = "yellow",
+	[LED_COLOR_ID_IR] = "ir",
+};
+EXPORT_SYMBOL_GPL(led_colors);
+
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -256,17 +268,28 @@ int led_classdev_register_ext(struct device *parent,
 			      struct led_classdev *led_cdev,
 			      struct led_init_data *init_data)
 {
-	char name[LED_MAX_NAME_SIZE];
+	char composed_name[LED_MAX_NAME_SIZE];
+	char final_name[LED_MAX_NAME_SIZE];
 	int ret;
 
-	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
+	if (init_data) {
+		ret = led_compose_name(parent, init_data->fwnode,
+				init_data->led_hw_name, init_data->default_label,
+				composed_name);
+		if (ret < 0)
+			return ret;
+		led_cdev->name = composed_name;
+
+	}
+
+	ret = led_classdev_next_name(led_cdev->name, final_name, sizeof(final_name));
 	if (ret < 0)
 		return ret;
 
 	mutex_init(&led_cdev->led_access);
 	mutex_lock(&led_cdev->led_access);
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-				led_cdev, led_cdev->groups, "%s", name);
+				led_cdev, led_cdev->groups, "%s", final_name);
 	if (IS_ERR(led_cdev->dev)) {
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e3da7c03da1b..ef51dda50f53 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include "leds.h"
@@ -357,3 +358,98 @@ void led_sysfs_enable(struct led_classdev *led_cdev)
 	led_cdev->flags &= ~LED_SYSFS_DISABLE;
 }
 EXPORT_SYMBOL_GPL(led_sysfs_enable);
+
+static void led_parse_properties(struct device *dev,
+				 struct fwnode_handle *fwnode,
+				 struct led_properties *props)
+{
+	int ret;
+
+	if (!fwnode)
+		return;
+
+	if (fwnode_property_present(fwnode, "label")) {
+		ret = fwnode_property_read_string(fwnode, "label", &props->label);
+		if (ret)
+			dev_err(dev, "Error parsing \'label\' property (%d)\n", ret);
+		return;
+	}
+
+	if (fwnode_property_present(fwnode, "function")) {
+		ret = fwnode_property_read_string(fwnode, "function", &props->function);
+		if (ret)
+			dev_err(dev, "Error parsing \'function\' property (%d)\n", ret);
+	}
+
+	if (fwnode_property_present(fwnode, "color")) {
+		ret = fwnode_property_read_u32(fwnode, "color", &props->color);
+		if (ret)
+			dev_err(dev, "Error parsing \'color\' property (%d)\n", ret);
+		else
+			props->color_present = true;
+	}
+
+	if (fwnode_property_present(fwnode, "led-enumerator")) {
+		ret = fwnode_property_read_u32(fwnode, "led-enumerator", &props->led_enum);
+		if (ret)
+			dev_err(dev, "Error parsing \'led-enumerator\' property (%d)\n", ret);
+		else
+			props->led_enum_present = true;
+	}
+}
+
+int led_compose_name(struct device *parent, struct fwnode_handle *fwnode,
+		     const char *led_hw_name, const char *default_label,
+		     char *led_classdev_name)
+{
+	struct led_properties props = {};
+
+	if (!led_classdev_name)
+		return -EINVAL;
+
+	led_parse_properties(parent, fwnode, &props);
+
+	if (props.label) {
+		/*
+		 * Presence of 'label' DT property implies legacy LED name,
+		 * formatted as <devicename:color:function>, with possible
+		 * section omission if it doesn't apply to given device.
+		 *
+		 * If no led_hw_name has been passed, then it indicates that
+		 * DT label should be used as-is for LED class device name.
+		 * Otherwise the label is prepended with led_hw_name to compose
+		 * the final LED class device name.
+		 */
+		if (!led_hw_name) {
+			strncpy(led_classdev_name, props.label,
+				LED_MAX_NAME_SIZE);
+		} else {
+			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+				 led_hw_name, props.label);
+		}
+	} else if (props.function || props.color_present) {
+		if (props.led_enum_present) {
+			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s-%d",
+				 props.color_present ? led_colors[props.color] : "",
+				 props.function ?: "", props.led_enum);
+		} else {
+			snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+				 props.color_present ? led_colors[props.color] : "",
+				 props.function ?: "");
+		}
+	} else if (default_label) {
+		if (!led_hw_name) {
+			pr_err("Legacy LED naming requires devicename segment");
+			return -EINVAL;
+		}
+		snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
+			 led_hw_name, default_label);
+	} else if (is_of_node(fwnode)) {
+		strncpy(led_classdev_name, to_of_node(fwnode)->name,
+			LED_MAX_NAME_SIZE);
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_compose_name);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index c87a091c04d9..f1f7f4f2785a 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -12,6 +12,7 @@
 #ifndef __LINUX_LEDS_H_INCLUDED
 #define __LINUX_LEDS_H_INCLUDED
 
+#include <dt-bindings/leds/common.h>
 #include <linux/device.h>
 #include <linux/kernfs.h>
 #include <linux/list.h>
@@ -38,6 +39,10 @@ enum led_brightness {
 struct led_init_data {
 	/* Device fwnode handle */
 	struct fwnode_handle *fwnode;
+	/* LED product name */
+	const char *led_hw_name;
+	/* Default LED label */
+	const char *default_label;
 };
 
 struct led_classdev {
@@ -263,6 +268,33 @@ extern void led_sysfs_disable(struct led_classdev *led_cdev);
 extern void led_sysfs_enable(struct led_classdev *led_cdev);
 
 /**
+ * led_compose_name - compose LED class device name
+ * @dev: LED controller device object
+ * @child: child fwnode_handle describing a LED,
+ *	   or a group of synchronized LEDs.
+ * @led_hw_name: name of the LED controller, used when falling back to legacy
+ *		 LED naming; it should be set to NULL in new LED class drivers
+ * @default_label: default <color:function> tuple, for backwards compatibility
+ *		  with in-driver hard-coded LED names used as a fallback when
+ *		  "label" DT property is absent; it should be set to NULL
+ *		  in new LED class drivers
+ * @led_classdev_name: composed LED class device name
+ *
+ * Create LED class device name basing on the configuration provided by the
+ * board firmware. The name can have a legacy form <devicename:color:function>,
+ * or a new form <color:function>. The latter is chosen if "label" property is
+ * absent and at least one of "color" or "function" is present in the fwnode,
+ * leaving the section blank if the related property is absent. In case none
+ * of the aforementioned properties is found, then, for OF nodes, the node name
+ * is adopted for LED class device name.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+extern int led_compose_name(struct device *dev, struct fwnode_handle *child,
+			    const char *led_hw_name, const char *default_label,
+			    char *led_classdev_name);
+
+/**
  * led_sysfs_is_disabled - check if LED sysfs interface is disabled
  * @led_cdev: the LED to query
  *
@@ -273,6 +305,8 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
 	return led_cdev->flags & LED_SYSFS_DISABLE;
 }
 
+extern const char *led_colors[LED_COLOR_ID_COUNT];
+
 /*
  * LED Triggers
  */
@@ -439,6 +473,15 @@ struct led_platform_data {
 	struct led_info	*leds;
 };
 
+struct led_properties {
+	u32		color;
+	u32		led_enum;
+	bool		color_present;
+	bool		led_enum_present;
+	const char	*function;
+	const char	*label;
+};
+
 struct gpio_desc;
 typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
 				unsigned long *delay_on,
diff --git a/tools/leds/get_led_device_info.sh b/tools/leds/get_led_device_info.sh
new file mode 100755
index 000000000000..fcff38451a2e
--- /dev/null
+++ b/tools/leds/get_led_device_info.sh
@@ -0,0 +1,81 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+if [ $# -ne 1 ]; then
+	echo "Usage: get_led_device_info.sh LED_CDEV_PATH"
+	exit 1
+fi
+
+led_cdev_path=`echo $1 | sed s'/\/$//'`
+
+ls "$led_cdev_path/brightness" > /dev/null 2>&1
+if [ $? -ne 0 ]; then
+	echo "Device \"$led_cdev_path\" does not exist."
+	exit 1
+fi
+
+bus=`readlink $led_cdev_path/device/subsystem | sed s'/.*\///'`
+usb_subdev=`readlink $led_cdev_path | grep usb | sed s'/\(.*usb[0-9]*\/[0-9]*-[0-9]*\)\/.*/\1/'`
+ls "$led_cdev_path/device/of_node/compatible" > /dev/null 2>&1
+of_node_missing=$?
+
+if [ "$bus" = "input" ]; then
+	input_node=`readlink $led_cdev_path/device | sed s'/.*\///'`
+	if [ ! -z $usb_subdev ]; then
+		bus="usb"
+	fi
+fi
+
+if [ "$bus" = "usb" ]; then
+	usb_interface=`readlink $led_cdev_path | sed s'/.*\(usb[0-9]*\)/\1/' | cut -d \/ -f 3`
+	driver=`readlink $usb_interface/driver | sed s'/.*\///'`
+	cd $led_cdev_path/../$usb_subdev
+	idVendor=`cat idVendor`
+	idProduct=`cat idProduct`
+	manufacturer=`cat manufacturer`
+	product=`cat product`
+elif [ "$bus" = "input" ]; then
+	cd $led_cdev_path
+	product=`cat device/name`
+	driver=`cat device/device/driver/description`
+elif [ $of_node_missing -eq 0 ]; then
+	cd $led_cdev_path
+	compatible=`cat device/of_node/compatible`
+	if [ "$compatible" = "gpio-leds" ]; then
+		driver="leds-gpio"
+	elif [ "$compatible" = "pwm-leds" ]; then
+		driver="leds-pwm"
+	else
+		manufacturer=`echo $compatible | cut -d, -f1`
+		product=`echo $compatible | cut -d, -f2`
+	fi
+else
+	echo "Unknown device type."
+	exit 1
+fi
+
+printf "bus:\t\t\t$bus\n"
+
+if [ ! -z "$idVendor" ]; then
+	printf "idVendor:\t\t$idVendor\n"
+fi
+
+if [ ! -z "$idProduct" ]; then
+	printf "idProduct:\t\t$idProduct\n"
+fi
+
+if [ ! -z "$manufacturer" ]; then
+	printf "manufacturer:\t\t$manufacturer\n"
+fi
+
+if [ ! -z "$product" ]; then
+	printf "product:\t\t$product\n"
+fi
+
+if [ ! -z "$driver" ]; then
+	printf "driver:\t\t\t$driver\n"
+fi
+
+if [ ! -z "$input_node" ]; then
+	printf "associated input node:\t$input_node\n"
+fi
-- 
2.11.0
