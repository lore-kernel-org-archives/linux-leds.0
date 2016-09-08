From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V5] leds: trigger: Introduce a USB port trigger
Date: Thu,  8 Sep 2016 18:08:24 +0200
Message-ID: <20160908160904.31719-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Pavel Machek <pavel@ucw.cz>, Stephan Linz <linz@li-pro.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This commit adds a new trigger responsible for turning on LED when USB
device gets connected to the selected USB port. This can can useful for
various home routers that have USB port(s) and a proper LED telling user
a device is connected.

The trigger gets its documentation file but basically it just requires
enabling it and selecting USB ports (e.g. echo 1 > ports/usb1-1).

There was a long discussion on design of this driver. Its current state
is a result of picking them most adjustable solution as others couldn't
handle all cases.

1) It wasn't possible for the driver to register separated trigger for
   each USB port. Some physical USB ports are handled by more than one
   controller and so by more than one USB port. E.g. USB 2.0 physical
   port may be handled by OHCI's port and EHCI's port.
   It's also not possible to assign more than 1 trigger to a single LED
   and implementing such feature would be tricky due to syncing triggers
   and sysfs conflicts with old triggers.

2) Another idea was to register trigger per USB hub. This wouldn't allow
   handling devices with multiple USB LEDs and controllers (hubs)
   controlling more than 1 physical port. It's common for hubs to have
   few ports and each may have its own LED.

This final trigger is highly flexible. It allows selecting any USB ports
for any LED. It was also modified (compared to the initial version) to
allow choosing ports rather than having user /guess/ proper names. It
was successfully tested on SmartRG SR400ac which has 3 USB LEDs,
2 physical ports and 3 controllers.

Another planned feature is support for LED reacting to the USB activity.
This can be implemented with another sysfs file for setting mode. The
default mode wouldn't change so there won't be ABI breakage and such
feature can be safely implemented later.

There was also an idea of supporting other devices (PCI, SDIO, etc.) but
as this driver already contains some USB specific code (and will get
more) these should be probably separated drivers (triggers).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Trying to add DT support, idea postponed as it will take more time
    to discuss the bindings.
V3: Fix typos in commit and Documentation (thanks Jacek!)
    Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
    Check if there is USB device connected after adding new USB port
    Fix memory leak or two
V3.5: Fix e-mail address (thanks Matthias)
      Simplify conditions in usbport_trig_notify (thx Matthias)
      Make "ports" a subdirectory with file per port, to match one value
      per file sysfs rule (thanks Greg)
      As "ports" couldn't be used for adding and removing ports anymore,
      there are now "new_port" and "remove_port". Having them makes this
      API also common with e.g. pci and usb buses.
V4: Add Documentation/ABI/testing/sysfs-class-led-trigger-usbport and
    reference it in Documentation/leds/ledtrig-usbport.txt to avoid doc
    duplication.
V5: Update commit message to explain driver design & Documentation
    Avoid specifying ports manually and dummy files (chmod 0000)
    Don't use kobject_create_and_add but a struct attribute_group
    Fix typo, improve comments, update Date
---
 .../ABI/testing/sysfs-class-led-trigger-usbport    |  11 +
 Documentation/leds/ledtrig-usbport.txt             |  41 +++
 drivers/leds/trigger/Kconfig                       |   8 +
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-usbport.c             | 316 +++++++++++++++++++++
 5 files changed, 377 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-usbport
 create mode 100644 Documentation/leds/ledtrig-usbport.txt
 create mode 100644 drivers/leds/trigger/ledtrig-usbport.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-usbport b/Documentation/ABI/testing/sysfs-class-led-trigger-usbport
new file mode 100644
index 0000000..a9b7e92
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-usbport
@@ -0,0 +1,11 @@
+What:		/sys/class/leds/<led>/ports/<port>
+Date:		September 2016
+KernelVersion:	4.9
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Every dir entry represents a single USB port that can be
+		selected for the USB port trigger. Selecting ports makes trigger
+		observing them for any connected devices and lighting on LED if
+		there are any.
+		Echoing "1" value selects USB port. Echoing "0" unselects it.
+		Current state can be also read.
diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/leds/ledtrig-usbport.txt
new file mode 100644
index 0000000..69f54bf
--- /dev/null
+++ b/Documentation/leds/ledtrig-usbport.txt
@@ -0,0 +1,41 @@
+USB port LED trigger
+====================
+
+This LED trigger can be used for signalling to the user a presence of USB device
+in a given port. It simply turns on LED when device appears and turns it off
+when it disappears.
+
+It requires selecting USB ports that should be observed. All available ones are
+listed as separated entries in a "ports" subdirectory. Selecting is handled by
+echoing "1" to a chosen port.
+
+Please note that this trigger allows selecting multiple USB ports for a single
+LED. This can be useful in two cases:
+
+1) Device with single USB LED and few physical ports
+
+In such a case LED will be turned on as long as there is at least one connected
+USB device.
+
+2) Device with a physical port handled by few controllers
+
+Some devices may have one controller per PHY standard. E.g. USB 3.0 physical
+port may be handled by ohci-platform, ehci-platform and xhci-hcd. If there is
+only one LED user will most likely want to assign ports from all 3 hubs.
+
+
+This trigger can be activated from user space on led class devices as shown
+below:
+
+  echo usbport > trigger
+
+This adds sysfs attributes to the LED that are documented in:
+Documentation/ABI/testing/sysfs-class-led-trigger-usbport
+
+Example use-case:
+
+  echo usbport > trigger
+  echo 1 > ports/usb1-port1
+  echo 1 > ports/usb2-port1
+  cat ports/usb1-port1
+  echo 0 > ports/usb1-port1
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
index 0000000..f6194db
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-usbport.c
@@ -0,0 +1,316 @@
+/*
+ * USB port LED trigger
+ *
+ * Copyright (C) 2016 Rafał Miłecki <rafal@milecki.pl>
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
+struct usbport_trig_data {
+	struct led_classdev *led_cdev;
+	struct list_head ports;
+	struct notifier_block nb;
+	int count; /* Amount of connected matching devices */
+};
+
+struct usbport_trig_port {
+	struct usbport_trig_data *data;
+	struct usb_device *hub;
+	int portnum;
+	char *port_name;
+	bool observed;
+	struct device_attribute attr;
+	struct list_head list;
+};
+
+/***************************************
+ * Helpers
+ ***************************************/
+
+/**
+ * usbport_trig_usb_dev_observed - Check if dev is connected to observed port
+ */
+static bool usbport_trig_usb_dev_observed(struct usbport_trig_data *usbport_data,
+					  struct usb_device *usb_dev)
+{
+	struct usbport_trig_port *port;
+
+	if (!usb_dev->parent)
+		return false;
+
+	list_for_each_entry(port, &usbport_data->ports, list) {
+		if (usb_dev->parent == port->hub &&
+		    usb_dev->portnum == port->portnum)
+			return port->observed;
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
+/***************************************
+ * Device attr
+ ***************************************/
+
+static ssize_t usbport_trig_port_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct usbport_trig_port *port = container_of(attr,
+						      struct usbport_trig_port,
+						      attr);
+
+	return sprintf(buf, "%d\n", port->observed) + 1;
+}
+
+static ssize_t usbport_trig_port_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t size)
+{
+	struct usbport_trig_port *port = container_of(attr,
+						      struct usbport_trig_port,
+						      attr);
+
+	if (!strcmp(buf, "0") || !strcmp(buf, "0\n"))
+		port->observed = 0;
+	else if (!strcmp(buf, "1") || !strcmp(buf, "1\n"))
+		port->observed = 1;
+	else
+		return -EINVAL;
+
+	usbport_trig_update_count(port->data);
+
+	return size;
+}
+
+static struct attribute *ports_attrs[] = {
+	NULL,
+};
+static const struct attribute_group ports_group = {
+	.name = "ports",
+	.attrs = ports_attrs,
+};
+
+/***************************************
+ * Adding & removing ports
+ ***************************************/
+
+static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
+				 struct usb_device *usb_dev,
+				 const char *hub_name, int portnum)
+{
+	struct led_classdev *led_cdev = usbport_data->led_cdev;
+	struct usbport_trig_port *port;
+	size_t len;
+	int err;
+
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
+	port->data = usbport_data;
+	port->hub = usb_dev;
+	port->portnum = portnum;
+
+	len = strlen(hub_name) + 8;
+	port->port_name = kzalloc(len, GFP_KERNEL);
+	if (!port->port_name) {
+		err = -ENOMEM;
+		goto err_free_port;
+	}
+	snprintf(port->port_name, len, "%s-port%d", hub_name, portnum);
+
+	port->attr.attr.name = port->port_name;
+	port->attr.attr.mode = S_IRUSR | S_IWUSR;
+	port->attr.show = usbport_trig_port_show;
+	port->attr.store = usbport_trig_port_store;
+
+	err = sysfs_add_file_to_group(&led_cdev->dev->kobj, &port->attr.attr,
+				      ports_group.name);
+	if (err)
+		goto err_free_port_name;
+
+	list_add_tail(&port->list, &usbport_data->ports);
+
+	return 0;
+
+err_free_port_name:
+	kfree(port->port_name);
+err_free_port:
+	kfree(port);
+err_out:
+	return err;
+}
+
+static int usbport_trig_add_usb_dev_ports(struct usb_device *usb_dev,
+					  void *data)
+{
+	struct usbport_trig_data *usbport_data = data;
+	int i;
+
+	for (i = 1; i <= usb_dev->maxchild; i++)
+		usbport_trig_add_port(usbport_data, usb_dev,
+				      dev_name(&usb_dev->dev), i);
+
+	return 0;
+}
+
+static void usbport_trig_remove_port(struct usbport_trig_data *usbport_data,
+				     struct usbport_trig_port *port)
+{
+	struct led_classdev *led_cdev = usbport_data->led_cdev;
+
+	list_del(&port->list);
+	sysfs_remove_file_from_group(&led_cdev->dev->kobj, &port->attr.attr,
+				     ports_group.name);
+	kfree(port->port_name);
+	kfree(port);
+}
+
+static void usbport_trig_remove_usb_dev_ports(struct usbport_trig_data *usbport_data,
+					      struct usb_device *usb_dev)
+{
+	struct usbport_trig_port *port, *tmp;
+
+	list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
+		if (port->hub == usb_dev)
+			usbport_trig_remove_port(usbport_data, port);
+	}
+}
+
+/***************************************
+ * Init, exit, etc.
+ ***************************************/
+
+static int usbport_trig_notify(struct notifier_block *nb, unsigned long action,
+			       void *data)
+{
+	struct usbport_trig_data *usbport_data =
+		container_of(nb, struct usbport_trig_data, nb);
+	struct led_classdev *led_cdev = usbport_data->led_cdev;
+	struct usb_device *usb_dev = data;
+	bool observed;
+
+	observed = usbport_trig_usb_dev_observed(usbport_data, usb_dev);
+
+	switch (action) {
+	case USB_DEVICE_ADD:
+		usbport_trig_add_usb_dev_ports(usb_dev, usbport_data);
+		if (observed && usbport_data->count++ == 0)
+			led_set_brightness_nosleep(led_cdev, LED_FULL);
+		return NOTIFY_OK;
+	case USB_DEVICE_REMOVE:
+		usbport_trig_remove_usb_dev_ports(usbport_data, usb_dev);
+		if (observed && --usbport_data->count == 0)
+			led_set_brightness_nosleep(led_cdev, LED_OFF);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
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
+
+	/* List of ports */
+	INIT_LIST_HEAD(&usbport_data->ports);
+	err = sysfs_create_group(&led_cdev->dev->kobj, &ports_group);
+	if (err)
+		goto err_free;
+	usb_for_each_dev(usbport_data, usbport_trig_add_usb_dev_ports);
+
+	/* Notifications */
+	usbport_data->nb.notifier_call = usbport_trig_notify,
+	led_cdev->trigger_data = usbport_data;
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
+	list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
+		usbport_trig_remove_port(usbport_data, port);
+	}
+
+	usb_unregister_notify(&usbport_data->nb);
+
+	sysfs_remove_group(&led_cdev->dev->kobj, &ports_group);
+
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
+MODULE_AUTHOR("Rafał Miłecki <rafal@milecki.pl>");
+MODULE_DESCRIPTION("USB port trigger");
+MODULE_LICENSE("GPL");
-- 
2.9.3
