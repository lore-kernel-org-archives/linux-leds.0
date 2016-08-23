From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 00:03:29 +0200
Message-ID: <20160823220404.9887-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>
Cc: Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This commit adds a new trigger responsible for turning on LED when USB
device gets connected to the specified USB port. This can can useful for
various home routers that have USB port(s) and a proper LED telling user
a device is connected.

The trigger gets its documentation file but basically it just requires
specifying USB port in a Linux format (e.g. echo 1-1 > new_port).

During work on this trigger there was a plan to add DT bindings for it,
but there wasn't an agreement on the format yet. This can be worked on
later, a sysfs interface is needed anyway for platforms not using DT.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Trying to add DT support, idea postponed as it will take more time
    to discuss the bindings.
V3: Fix typos in commit and Documentation (thanks Jacek!)
    Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
    Check if there is USB device connected after adding new USB port
    Fix memory leak or two

Felipe: I'd like to ask for your Ack before having this patch pushed.
---
 Documentation/leds/ledtrig-usbport.txt |  49 +++++++
 drivers/leds/trigger/Kconfig           |   8 ++
 drivers/leds/trigger/Makefile          |   1 +
 drivers/leds/trigger/ledtrig-usbport.c | 253 +++++++++++++++++++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-usbport.txt
 create mode 100644 drivers/leds/trigger/ledtrig-usbport.c

diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/leds/ledtrig-usbport.txt
new file mode 100644
index 0000000..fa42227
--- /dev/null
+++ b/Documentation/leds/ledtrig-usbport.txt
@@ -0,0 +1,49 @@
+USB port LED trigger
+====================
+
+This LED trigger can be used for signalling to the user a presence of USB device
+in a given port. It simply turns on LED when device appears and turns it off
+when it disappears.
+
+It requires specifying a list of USB ports that should be observed. Used format
+matches Linux kernel format and consists of a root hub number and a hub port
+separated by a dash (e.g. 3-1).
+
+It is also possible to handle devices with internal hubs (that are always
+connected to the root hub). User can simply specify internal hub ports then
+(e.g. 1-1.1, 1-1.2, etc.).
+
+Please note that this trigger allows assigning multiple USB ports to a single
+LED. This can be useful in two cases:
+
+1) Device with single USB LED and few physical ports
+
+In such a case LED will be turned on as long as there is at least one connected
+USB device.
+
+2) Device with a physical port handled by few controllers
+
+Some devices have e.g. one controller per PHY standard. E.g. USB 3.0 physical
+port may be handled by ohci-platform, ehci-platform and xhci-hcd. If there is
+only one LED user will most likely want to assign ports from all 3 hubs.
+
+
+This trigger can be activated from user space on led class devices as shown
+below:
+
+  echo usbport > trigger
+
+This adds the following sysfs attributes to the LED:
+
+  ports - Reading it lists all USB ports assigned to the trigger. Writing USB
+	  port number to it will make this driver start observing it. It's also
+	  possible to remove USB port from observable list by writing it with a
+	  "-" prefix.
+
+Example use-case:
+
+  echo usbport > trigger
+  echo 4-1 > ports
+  echo 2-1 > ports
+  echo -4-1 > ports
+  cat ports
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 3f9ddb9..bdd6fd2 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -126,4 +126,12 @@ config LEDS_TRIGGER_PANIC
 	  a different trigger.
 	  If unsure, say Y.
 
+config LEDS_TRIGGER_USBPORT
+	tristate "USB port LED trigger"
+	depends on LEDS_TRIGGERS && USB
+	help
+	  This allows LEDs to be controlled by USB events. Enabling this option
+	  allows specifying list of USB ports that should turn on LED when some
+	  USB device gets connected.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index a72c43c..56e1741 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
 obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
+obj-$(CONFIG_LEDS_TRIGGER_USBPORT)	+= ledtrig-usbport.o
diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/trigger/ledtrig-usbport.c
new file mode 100644
index 0000000..7f5237c
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-usbport.c
@@ -0,0 +1,253 @@
+/*
+ * USB port LED trigger
+ *
+ * Copyright (C) 2016 Rafał Miłecki <rafal@milecki@pl>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at
+ * your option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include "../leds.h"
+
+struct usbport_trig_port {
+	char *name;
+	struct list_head list;
+};
+
+struct usbport_trig_data {
+	struct led_classdev *led_cdev;
+	struct list_head ports;
+	struct notifier_block nb;
+	int count; /* Amount of connected matching devices */
+};
+
+/* Helpers */
+
+/**
+ * usbport_trig_usb_dev_observed - Check if dev is connected to observerd port
+ */
+static bool usbport_trig_usb_dev_observed(struct usbport_trig_data *usbport_data,
+					  struct usb_device *usb_dev)
+{
+	struct usbport_trig_port *port;
+	const char *name = dev_name(&usb_dev->dev);
+
+	list_for_each_entry(port, &usbport_data->ports, list) {
+		if (!strcmp(port->name, name))
+			return true;
+	}
+
+	return false;
+}
+
+static int usbport_trig_usb_dev_check(struct usb_device *usb_dev, void *data)
+{
+	struct usbport_trig_data *usbport_data = data;
+
+	if (usbport_trig_usb_dev_observed(usbport_data, usb_dev))
+		usbport_data->count++;
+
+	return 0;
+}
+
+/**
+ * usbport_trig_update_count - Recalculate amount of connected matching devices
+ */
+static void usbport_trig_update_count(struct usbport_trig_data *usbport_data)
+{
+	struct led_classdev *led_cdev = usbport_data->led_cdev;
+
+	usbport_data->count = 0;
+	usb_for_each_dev(usbport_data, usbport_trig_usb_dev_check);
+	led_set_brightness_nosleep(led_cdev,
+				   usbport_data->count ? LED_FULL : LED_OFF);
+}
+
+/* Device attr */
+
+static ssize_t ports_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
+	struct usbport_trig_port *port;
+	ssize_t ret = 0;
+	int len;
+
+	list_for_each_entry(port, &usbport_data->ports, list) {
+		len = sprintf(buf + ret, "%s\n", port->name);
+		if (len >= 0)
+			ret += len;
+	}
+
+	return ret;
+}
+
+static ssize_t ports_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
+	struct usbport_trig_port *port;
+	bool add = true;
+	size_t len;
+
+	len = strlen(buf);
+	/* See if this is add or remove request */
+	if (len && buf[0] == '-') {
+		add = false;
+		buf++;
+		len--;
+	}
+	/* For user convenience trim line break */
+	if (len && buf[len - 1] == '\n')
+		len--;
+	if (!len)
+		return -EINVAL;
+
+	if (add) {
+		port = kzalloc(sizeof(*port), GFP_KERNEL);
+		if (!port)
+			return -ENOMEM;
+		port->name = kzalloc(strlen(buf), GFP_KERNEL);
+		if (!port->name) {
+			kfree(port);
+			return -ENOMEM;
+		}
+		strncpy(port->name, buf, len);
+
+		list_add_tail(&port->list, &usbport_data->ports);
+
+		usbport_trig_update_count(usbport_data);
+	} else {
+		struct usbport_trig_port *tmp;
+		bool found = false;
+
+		list_for_each_entry_safe(port, tmp, &usbport_data->ports,
+					 list) {
+			if (strlen(port->name) == len &&
+			    !strncmp(port->name, buf, len)) {
+				list_del(&port->list);
+				kfree(port->name);
+				kfree(port);
+
+				found = true;
+				break;
+			}
+		}
+
+		if (!found)
+			return -ENOENT;
+	}
+
+	usbport_trig_update_count(usbport_data);
+
+	return size;
+}
+
+static DEVICE_ATTR(ports, S_IRUSR | S_IWUSR, ports_show, ports_store);
+
+/* Init, exit, etc. */
+
+static int usbport_trig_notify(struct notifier_block *nb, unsigned long action,
+			       void *data)
+{
+	struct usbport_trig_data *usbport_data =
+		container_of(nb, struct usbport_trig_data, nb);
+	struct led_classdev *led_cdev = usbport_data->led_cdev;
+
+	switch (action) {
+	case USB_DEVICE_ADD:
+		if (usbport_trig_usb_dev_observed(usbport_data, data)) {
+			if (usbport_data->count++ == 0)
+				led_set_brightness_nosleep(led_cdev, LED_FULL);
+		}
+		break;
+	case USB_DEVICE_REMOVE:
+		if (usbport_trig_usb_dev_observed(usbport_data, data)) {
+			if (--usbport_data->count == 0)
+				led_set_brightness_nosleep(led_cdev, LED_OFF);
+		}
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void usbport_trig_activate(struct led_classdev *led_cdev)
+{
+	struct usbport_trig_data *usbport_data;
+	int err;
+
+	usbport_data = kzalloc(sizeof(*usbport_data), GFP_KERNEL);
+	if (!usbport_data)
+		return;
+	usbport_data->led_cdev = led_cdev;
+	INIT_LIST_HEAD(&usbport_data->ports);
+	usbport_data->nb.notifier_call = usbport_trig_notify,
+	led_cdev->trigger_data = usbport_data;
+
+	err = device_create_file(led_cdev->dev, &dev_attr_ports);
+	if (err)
+		goto err_free;
+
+	usb_register_notify(&usbport_data->nb);
+
+	led_cdev->activated = true;
+	return;
+
+err_free:
+	kfree(usbport_data);
+}
+
+static void usbport_trig_deactivate(struct led_classdev *led_cdev)
+{
+	struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
+	struct usbport_trig_port *port, *tmp;
+
+	if (!led_cdev->activated)
+		return;
+
+	usb_unregister_notify(&usbport_data->nb);
+
+	list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
+		list_del(&port->list);
+		kfree(port->name);
+		kfree(port);
+	}
+
+	device_remove_file(led_cdev->dev, &dev_attr_ports);
+	kfree(usbport_data);
+
+	led_cdev->activated = false;
+}
+
+static struct led_trigger usbport_led_trigger = {
+	.name     = "usbport",
+	.activate = usbport_trig_activate,
+	.deactivate = usbport_trig_deactivate,
+};
+
+static int __init usbport_trig_init(void)
+{
+	return led_trigger_register(&usbport_led_trigger);
+}
+
+static void __exit usbport_trig_exit(void)
+{
+	led_trigger_unregister(&usbport_led_trigger);
+}
+
+module_init(usbport_trig_init);
+module_exit(usbport_trig_exit);
+
+MODULE_AUTHOR("Rafał Miłecki <rafal@milecki@pl>");
+MODULE_DESCRIPTION("USB port trigger");
+MODULE_LICENSE("GPL");
-- 
2.9.3
