From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Fri, 15 Jul 2016 23:10:45 +0200
Message-ID: <1468617060-29830-1-git-send-email-zajec5@gmail.com>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>
Cc: Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

This commit adds a new trigger that can turn on LED when USB device get=
s
connected to the USB port. This can be useful for various home routers
that have USB port and a proper LED telling user a device is connected.

Right now this trigger is usable with a proper DT only, there isn't a
way to specify USB ports from user space. This may change in a future.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
V2: The first version got support for specifying list of USB ports from
    user space only. There was a (big try &) discussion on adding DT
    support. It led to a pretty simple solution of comparing of_node of
    usb_device to of_node specified in usb-ports property.
    Since it appeared DT support may be simpler and non-DT a bit more
    complex, this version drops previous support for "ports" and
    "new_port" and focuses on DT only. The plan is to see if this
    solution with DT is OK, get it accepted and then work on non-DT.

=46elipe: if there won't be any objections I'd like to ask for your Ack=
=2E
---
 Documentation/devicetree/bindings/leds/common.txt |  11 ++
 Documentation/leds/ledtrig-usbport.txt            |  19 ++
 drivers/leds/trigger/Kconfig                      |   8 +
 drivers/leds/trigger/Makefile                     |   1 +
 drivers/leds/trigger/ledtrig-usbport.c            | 206 ++++++++++++++=
++++++++
 5 files changed, 245 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-usbport.txt
 create mode 100644 drivers/leds/trigger/ledtrig-usbport.c

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Docume=
ntation/devicetree/bindings/leds/common.txt
index af10678..75536f7 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -50,6 +50,12 @@ property can be omitted.
 For controllers that have no configurable timeout the flash-max-timeou=
t-us
 property can be omitted.
=20
+Trigger specific properties for child nodes:
+
+usbport trigger:
+- usb-ports : List of USB ports that usbport should observed for turni=
ng on a
+	      given LED.
+
 Examples:
=20
 system-status {
@@ -58,6 +64,11 @@ system-status {
 	...
 };
=20
+usb {
+	label =3D "USB";
+	usb-ports =3D <&ohci_port1>, <&ehci_port1>;
+};
+
 camera-flash {
 	label =3D "Flash";
 	led-sources =3D <0>, <1>;
diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/led=
s/ledtrig-usbport.txt
new file mode 100644
index 0000000..642c4cd
--- /dev/null
+++ b/Documentation/leds/ledtrig-usbport.txt
@@ -0,0 +1,19 @@
+USB port LED trigger
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This LED trigger can be used for signaling user a presence of USB devi=
ce in a
+given port. It simply turns on LED when device appears and turns it of=
f when it
+disappears.
+
+It requires specifying a list of USB ports that should be observed. Th=
is can be
+done in DT by setting a proper property with list of a phandles. If mo=
re than
+one port is specified, LED will be turned on as along as there is at l=
east one
+device connected to any of ports.
+
+This trigger can be activated from user space on led class devices as =
shown
+below:
+
+  echo usbport > trigger
+
+Nevertheless, current there isn't a way to specify list of USB ports f=
rom user
+space.
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfi=
g
index 9893d91..5b8e7c7 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -126,4 +126,12 @@ config LEDS_TRIGGER_PANIC
 	  a different trigger.
 	  If unsure, say Y.
=20
+config LEDS_TRIGGER_USBPORT
+	tristate "USB port LED trigger"
+	depends on LEDS_TRIGGERS && USB && OF
+	help
+	  This allows LEDs to be controlled by USB events. This trigger will
+	  enable LED if some USB device gets connected to any of ports specif=
ied
+	  in DT.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makef=
ile
index 8cc64a4..80e2494 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+=3D ledtrig-de=
fault-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+=3D ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+=3D ledtrig-camera.o
 obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+=3D ledtrig-panic.o
+obj-$(CONFIG_LEDS_TRIGGER_USBPORT)	+=3D ledtrig-usbport.o
diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/trig=
ger/ledtrig-usbport.c
new file mode 100644
index 0000000..97b064c
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-usbport.c
@@ -0,0 +1,206 @@
+/*
+ * USB port LED trigger
+ *
+ * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.com=
>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or (=
at
+ * your option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include "../leds.h"
+
+struct usbport_trig_port {
+	struct device_node *np;
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
+static int usbport_trig_check_usb_dev(struct usb_device *usb_dev, void=
 *data)
+{
+	struct usbport_trig_data *usbport_data =3D data;
+	struct device_node *np =3D usb_dev->dev.of_node;
+	struct usbport_trig_port *port;
+
+	list_for_each_entry(port, &usbport_data->ports, list) {
+		if (port->np =3D=3D np) {
+			usbport_data->count++;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int usbport_trig_get_ports(struct usbport_trig_data *usbport_da=
ta)
+{
+	struct led_classdev *led_cdev =3D usbport_data->led_cdev;
+	struct device *dev =3D led_cdev->dev;
+	struct device_node *np =3D dev->of_node;
+	struct of_phandle_args args;
+	struct usbport_trig_port *port;
+	int count, i;
+
+	if (!np)
+		return -ENOENT;
+
+	count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
+	if (count < 0) {
+		dev_warn(dev, "Failed to get USB ports for %s\n",
+			 np->full_name);
+		return count;
+	}
+
+	if (!count) {
+		dev_warn(dev, "There aren't USB ports assigned to the %s\n",
+			 np->full_name);
+		return -ENOENT;
+	}
+
+	for (i =3D 0; i < count; i++) {
+		int err;
+
+		err =3D of_parse_phandle_with_args(np, "usb-ports", NULL, i,
+						 &args);
+		if (err) {
+			dev_err(dev, "Failed to get USB port phandle at index %d: %d\n",
+				i, err);
+			continue;
+		}
+
+		port =3D kzalloc(sizeof(*port), GFP_KERNEL);
+		if (port) {
+			port->np =3D args.np;
+			list_add_tail(&port->list, &usbport_data->ports);
+		}
+
+		of_node_put(args.np);
+	}
+
+	usb_for_each_dev(usbport_data, usbport_trig_check_usb_dev);
+	if (usbport_data->count)
+		led_set_brightness_nosleep(led_cdev, LED_FULL);
+
+	list_for_each_entry(port, &usbport_data->ports, list) {
+		dev_dbg(dev, "Added USB port %s\n", port->np->full_name);
+	}
+
+	return 0;
+}
+
+static bool usbport_trig_match(struct usbport_trig_data *usbport_data,
+			       struct usb_device *usb_dev)
+{
+	struct device_node *np =3D usb_dev->dev.of_node;
+	struct usbport_trig_port *port;
+
+	if (!np)
+		return false;
+
+	list_for_each_entry(port, &usbport_data->ports, list) {
+		if (port->np =3D=3D np)
+			return true;
+	}
+
+	return false;
+}
+
+static int usbport_trig_notify(struct notifier_block *nb, unsigned lon=
g action,
+			       void *data)
+{
+	struct usbport_trig_data *usbport_data =3D container_of(nb, struct us=
bport_trig_data, nb);
+	struct led_classdev *led_cdev =3D usbport_data->led_cdev;
+
+	switch (action) {
+	case USB_DEVICE_ADD:
+		if (usbport_trig_match(usbport_data, data)) {
+			if (usbport_data->count++ =3D=3D 0)
+				led_set_brightness_nosleep(led_cdev, LED_FULL);
+		}
+		break;
+	case USB_DEVICE_REMOVE:
+		if (usbport_trig_match(usbport_data, data)) {
+			if (--usbport_data->count =3D=3D 0)
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
+
+	usbport_data =3D kzalloc(sizeof(*usbport_data), GFP_KERNEL);
+	if (!usbport_data)
+		return;
+	led_cdev->trigger_data =3D usbport_data;
+
+	usbport_data->led_cdev =3D led_cdev;
+
+	INIT_LIST_HEAD(&usbport_data->ports);
+	usbport_trig_get_ports(usbport_data);
+
+	usbport_data->nb.notifier_call =3D usbport_trig_notify,
+	usb_register_notify(&usbport_data->nb);
+
+	led_cdev->activated =3D true;
+}
+
+static void usbport_trig_deactivate(struct led_classdev *led_cdev)
+{
+	struct usbport_trig_data *usbport_data =3D led_cdev->trigger_data;
+	struct usbport_trig_port *port, *tmp;
+
+	if (!led_cdev->activated)
+		return;
+
+	usb_unregister_notify(&usbport_data->nb);
+
+	list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
+		list_del(&port->list);
+		kfree(port);
+	}
+
+	kfree(usbport_data);
+
+	led_cdev->activated =3D false;
+}
+
+static struct led_trigger usbport_led_trigger =3D {
+	.name     =3D "usbport",
+	.activate =3D usbport_trig_activate,
+	.deactivate =3D usbport_trig_deactivate,
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
+MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.com>");
+MODULE_DESCRIPTION("USB port trigger");
+MODULE_LICENSE("GPL");
--=20
1.8.4.5
