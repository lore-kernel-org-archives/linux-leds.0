From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Implementing a platform driver w/ LEDs
Date: Wed, 05 Feb 2014 12:43:12 -0600
Message-ID: <52F28640.8080907@dell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070701030707080002060104"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:60289 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753300AbaBESw4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 5 Feb 2014 13:52:56 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------070701030707080002060104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I recently submitted a patch to add a platform driver for Alienware that one of the functions will be to control some lighting zones on the machine.  I originally started implementing it using the LED class but started to find it didn't really fit the LED class well so decided to do a custom sysfs interface.

After submitting it, the platform driver maintainer (mjg59) recommended that I instead reach out to you to extend the LED class to better fit how the system is architected.

The system has 3 lighting zones (HEAD, Left, Right).  Each of those lighting zones can independently customize the shades of red, green, blue, as well as the brightness intensity for the zone.

So each zone has:
0x00 - 0xFF red shade
0x00 - 0xFF blue shade
0x00 - 0xFF green shade
0x00 - 0xFF brightness intensity

Additionally the zone can be configured for different lighting combinations for three different states: Running, Booting, Suspended.  Running immediately modifies the colors in the zone. Booting modifies the colors when turned on but before the next modification of "running".  Suspended modifies the colors while the system is in S3.

When I first started to implement this using the LED class I create it with 36 different LED nodes:

alienware-wmi::running::head_red
alienware-wmi::running::head_blue
alienware-wmi::running::head_green
alienware-wmi::running::head_brightness
alienware-wmi::running::left_red
alienware-wmi::running::left_blue
alienware-wmi::running::left_green
alienware-wmi::running::left_brightness
alienware-wmi::running::right_red
alienware-wmi::running::right_blue
alienware-wmi::running::right_green
alienware-wmi::running::right_brightness

alienware-wmi::booting::head_red
alienware-wmi::booting::head_blue
alienware-wmi::booting::head_green
alienware-wmi::booting::head_brightness
alienware-wmi::booting::left_red
alienware-wmi::booting::left_blue
alienware-wmi::booting::left_green
alienware-wmi::booting::left_brightness
alienware-wmi::booting::right_red
alienware-wmi::booting::right_blue
alienware-wmi::booting::right_green
alienware-wmi::booting::right_brightness

alienware-wmi::suspend::head_red
alienware-wmi::suspend::head_blue
alienware-wmi::suspend::head_green
alienware-wmi::suspend::head_brightness
alienware-wmi::suspend::left_red
alienware-wmi::suspend::left_blue
alienware-wmi::suspend::left_green
alienware-wmi::suspend::left_brightness
alienware-wmi::suspend::right_red
alienware-wmi::suspend::right_blue
alienware-wmi::suspend::right_green
alienware-wmi::suspend::right_brightness

I thought this was rather confusing though because each individual node only has a single "brightness" member which doesn't really identify what is being changed.  The brightness node changes the overall brightness of the whole zone.  The color shades selected for each node are mixed to come up with the overall color for the zone.

The three different modes (running/booting/suspend) all modify the same LEDs too, so it didn't seem to make sense to me that they had their own nodes.

So given all of that, can you advise how you think this should be implemented?  Would it make sense to extend the LED class to better adapt to this?  Or do you think this is better suited for a custom sysfs interface as I've already done?  I'll attach the patch for the driver so you can see how I put it together with the custom sysfs interface.

Thanks,

--------------070701030707080002060104
Content-Type: text/x-diff;
 name="0001-Add-WMI-driver-for-controling-AlienFX-on-Alienware.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Add-WMI-driver-for-controling-AlienFX-on-Alienware.patc";
 filename*1="h"

>From e8e4cadc5e467835f3aabfa603eb44e757bdf9a8 Mon Sep 17 00:00:00 2001
From: Mario Limonciello <mario_limonciello@dell.com>
Date: Wed, 5 Feb 2014 10:08:13 -0600
Subject: [PATCH 1/1] Add WMI driver for controlling AlienFX on Alienware

Specifically for platforms that don't contain an AlienFX USB based MCU
such as the Alienware X51-R2.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/Kconfig         |   13 ++
 drivers/platform/x86/Makefile        |    1 +
 drivers/platform/x86/alienware-wmi.c |  345 ++++++++++++++++++++++++++++++++++
 3 files changed, 359 insertions(+)
 create mode 100644 drivers/platform/x86/alienware-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5ae65c1..d030525 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -55,6 +55,19 @@ config ACERHDF
 	  If you have an Acer Aspire One netbook, say Y or M
 	  here.
 
+config ALIENWARE_WMI
+	tristate "Alienware Special feature control"
+	depends on ACPI
+	depends on ACPI_WMI
+	---help---
+	  This is a driver for controlling ALienware BIOS driven
+	  features.  It exposes an interface for controlling the AlienFX
+	  zones on Alienware machines that don't contain a dedicated AlienFX
+	  USB MCU such as the X51-R2.
+
+	  If you have an ACPI-WMI compatible Alienware desktop, say Y or M
+	  here.
+
 config ASUS_LAPTOP
 	tristate "Asus Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 9b87cfc..0e9b157 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
 
 obj-$(CONFIG_PVPANIC)           += pvpanic.o
 obj-$(CONFIG_INTEL_BAYTRAIL_MBI)	+= intel_baytrail.o
+obj-$(CONFIG_ALIENWARE_WMI) 	+= alienware-wmi.o
diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
new file mode 100644
index 0000000..76087c9
--- /dev/null
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -0,0 +1,345 @@
+/*
+ * Alienware AlienFX control
+ *
+ * Copyright (C) 2014 Dell Inc <mario_limonciello@dell.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/dmi.h>
+#include <linux/acpi.h>
+
+MODULE_AUTHOR("Mario Limonciello <mario_limonciello@dell.com>");
+MODULE_DESCRIPTION("Alienware special feature control");
+MODULE_LICENSE("GPL");
+
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = "alienware-wmi",
+		.owner = THIS_MODULE,
+	}
+};
+
+static struct platform_device *platform_device;
+
+static const struct dmi_system_id alienware_device_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TBD"),
+		},
+	},
+	{}
+};
+
+MODULE_DEVICE_TABLE(dmi, alienware_device_table);
+
+#define RUNNING_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
+#define POWERSTATE_CONTROL_GUID		"A80593CE-A997-11DA-B012-B622A1EF5492"
+#define HDMI_TOGGLE_GUID		"TBD"
+#define HDMI_MUX_GUID			"TBD"
+
+MODULE_ALIAS("wmi:" RUNNING_CONTROL_GUID);
+
+/*
+  Lighting Zone control groups
+*/
+
+#define ALIENWARE_HEAD_ZONE	1
+#define ALIENWARE_LEFT_ZONE	2
+#define ALIENWARE_RIGHT_ZONE	3
+
+enum LIGHTING_CONTROL_STATE {
+	RUNNING = 1,
+	BOOTING = 0,
+	SUSPEND = 3,
+};
+
+struct color_platform {
+	u8 blue;
+	u8 green;
+	u8 red;
+	u8 brightness;
+} __packed;
+
+struct platform_zone {
+	struct color_platform colors;
+	u8 location;
+};
+
+static struct platform_zone head = {
+	.location = ALIENWARE_HEAD_ZONE,
+};
+
+static struct platform_zone left = {
+	.location = ALIENWARE_LEFT_ZONE,
+};
+
+static struct platform_zone right = {
+	.location = ALIENWARE_RIGHT_ZONE,
+};
+
+static u8 lighting_control_state = RUNNING;
+
+static int update_leds(struct platform_zone zone, unsigned long count)
+{
+	acpi_status status;
+	char *guid;
+	struct platform_zone args = {
+		.colors = zone.colors,
+		.location = lighting_control_state
+	};
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	if (lighting_control_state == BOOTING ||
+		lighting_control_state == SUSPEND)
+		guid = POWERSTATE_CONTROL_GUID;
+	else
+		guid = RUNNING_CONTROL_GUID;
+	pr_debug("alienware-wmi: evaluate [ guid %s | zone %d ]\n",
+		guid, zone.location);
+
+	status = wmi_evaluate_method(guid, 1, zone.location, &input, NULL);
+	if (ACPI_FAILURE(status))
+		pr_err("alienware-wmi: zone set failure: %u\n", status);
+
+	return count;
+}
+
+/*
+	All color values need to be in range from 0 - 255.
+*/
+static long sanitize_input(const char *buf, unsigned long count, int *val)
+{
+	if (!count)
+		return 0;
+	if (sscanf(buf, "%i", val) != 1)
+		return -EINVAL;
+	if (*val < 0)
+		*val = 0;
+	if (*val > 255)
+		*val = 255;
+	return count;
+}
+
+#define ALIENWARE_WMI_CREATE_DEVICE_ATTR(_zone, _color, _mode)		\
+	static ssize_t show_##_zone##_color(struct device *dev,		\
+		struct device_attribute *attr, char *buf)		\
+	{								\
+		return sprintf(buf, "%d\n", _zone.colors._color);	\
+	}								\
+	static ssize_t store_##_zone##_color(struct device *dev,	\
+		struct device_attribute *attr, const char *buf,		\
+		size_t count)						\
+	{								\
+		int val, rc;						\
+		rc = sanitize_input(buf, count, &val);			\
+		_zone.colors._color = val;				\
+		return update_leds(_zone, rc);				\
+	}								\
+	static struct device_attribute dev_attr_##_zone##_##_color = {	\
+		.attr = {						\
+			.name = __stringify(_zone##_##_color),		\
+			.mode = _mode },				\
+		.show = show_##_zone##_color,				\
+		.store = store_##_zone##_color,				\
+	}
+
+static ssize_t show_control_state(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", lighting_control_state);
+}
+
+static ssize_t set_control_state(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, ssize_t count)
+{
+	int val, rc;
+	rc = sanitize_input(buf, count, &val);
+	if (val != BOOTING && val != SUSPEND)
+		val = RUNNING;
+	lighting_control_state = val;
+	pr_debug("alienware-wmi: updated control state to %d\n", val);
+	return rc;
+}
+
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(head, blue, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(head, green, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(head, red, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(head, brightness, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(left, blue, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(left, green, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(left, red, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(left, brightness, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(right, blue, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(right, green, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(right, red, 0644);
+ALIENWARE_WMI_CREATE_DEVICE_ATTR(right, brightness, 0644);
+
+static DEVICE_ATTR(lighting_control_state, S_IRUGO | S_IWUSR,
+		   show_control_state, set_control_state);
+
+static struct attribute *zone_attributes[] = {
+	&dev_attr_head_blue.attr,
+	&dev_attr_head_red.attr,
+	&dev_attr_head_green.attr,
+	&dev_attr_head_brightness.attr,
+	&dev_attr_left_blue.attr,
+	&dev_attr_left_red.attr,
+	&dev_attr_left_green.attr,
+	&dev_attr_left_brightness.attr,
+	&dev_attr_right_blue.attr,
+	&dev_attr_right_red.attr,
+	&dev_attr_right_green.attr,
+	&dev_attr_right_brightness.attr,
+	&dev_attr_lighting_control_state.attr,
+	NULL
+};
+
+static struct attribute_group zone_attribute_group = {
+	.attrs = zone_attributes
+};
+
+static void remove_zones(struct platform_device *dev)
+{
+	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
+}
+
+static int prepare_zones(struct platform_device *dev)
+{
+	return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
+}
+
+/*
+  HDMI toggle control (interface and platform still TBD)
+*/
+
+static ssize_t show_hdmi(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	acpi_status status;
+	status = wmi_evaluate_method(HDMI_MUX_GUID, 1, 3, NULL, NULL);
+	if (status == 1) {
+		sprintf(buf, "hdmi-i\n");
+		return 0;
+	} else if (status == 2) {
+		sprintf(buf, "gpu\n");
+		return 0;
+	}
+	sprintf(buf, "error reading mux\n");
+	pr_err("alienware-wmi: HDMI mux read failed: results: %u\n", status);
+	return status;
+}
+
+static ssize_t toggle_hdmi(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	acpi_status status;
+	status = wmi_evaluate_method(HDMI_TOGGLE_GUID, 1, 3, NULL, NULL);
+	if (ACPI_FAILURE(status))
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
+			   status);
+	return count;
+}
+
+static DEVICE_ATTR(hdmi, S_IRUGO | S_IWUSR, show_hdmi, toggle_hdmi);
+
+static void remove_hdmi(struct platform_device *device)
+{
+	device_remove_file(&device->dev, &dev_attr_hdmi);
+}
+
+static int create_hdmi(void)
+{
+	int ret = -ENOMEM;
+
+	ret = device_create_file(&platform_device->dev, &dev_attr_hdmi);
+	if (ret)
+		goto error_create_hdmi;
+	return 0;
+
+error_create_hdmi:
+	remove_hdmi(platform_device);
+	return ret;
+}
+
+static int __init alienware_wmi_init(void)
+{
+	int ret;
+
+	if (!wmi_has_guid(RUNNING_CONTROL_GUID)) {
+		pr_warn("No known WMI GUID found\n");
+		return -ENODEV;
+	}
+
+	ret = platform_driver_register(&platform_driver);
+	if (ret)
+		goto fail_platform_driver;
+	platform_device = platform_device_alloc("alienware-wmi", -1);
+	if (!platform_device) {
+		ret = -ENOMEM;
+		goto fail_platform_device1;
+	}
+	ret = platform_device_add(platform_device);
+	if (ret)
+		goto fail_platform_device2;
+
+	/*
+		No systems with HDMI-i yet, for later.
+		might make this a WMI check at that time.
+	*/
+	if (dmi_check_system(alienware_device_table)) {
+		ret = create_hdmi();
+		if (ret)
+			goto fail_prep_hdmi;
+	}
+	/*
+		Only present on AW platforms w/o MCU.
+	*/
+	if (wmi_has_guid(RUNNING_CONTROL_GUID)) {
+		ret = prepare_zones(platform_device);
+		if (ret)
+			goto fail_prep_zones;
+	}
+
+	return 0;
+
+fail_prep_zones:
+	remove_zones(platform_device);
+fail_prep_hdmi:
+	platform_device_del(platform_device);
+fail_platform_device2:
+	platform_device_put(platform_device);
+fail_platform_device1:
+	platform_driver_unregister(&platform_driver);
+fail_platform_driver:
+	return ret;
+}
+
+module_init(alienware_wmi_init);
+
+static void __exit alienware_wmi_exit(void)
+{
+	remove_zones(platform_device);
+	remove_hdmi(platform_device);
+	if (platform_device) {
+		platform_device_unregister(platform_device);
+		platform_driver_unregister(&platform_driver);
+	}
+}
+
+module_exit(alienware_wmi_exit);
-- 
1.7.9.5


--------------070701030707080002060104--
