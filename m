From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger parameter
Date: Thu, 17 Nov 2016 23:24:36 +0100
Message-ID: <20161117222441.31464-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39328 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752190AbcKQWYr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Nov 2016 17:24:47 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

In some cases it may be desirable for userspace to be notified when
a trigger event happens. This commit adds support for a poll-able
current_brightness trigger specific sysfs attribute which triggers
may register:

What:		/sys/class/leds/<led>/current_brightness
Date:		November 2016
KernelVersion:	4.10
Description:
	Triggers which support it may register a current_brightness
	file. This file supports poll() to detect when the trigger
	modifies the brightness of the LED.
	Reading this file will always return the current brightness
	of the LED.
	Writing this file sets the current brightness of the LED,
	without influencing the trigger.

This commit adds 3 functions triggers which want to support this can use:

void led_trigger_add_current_brightness(struct led_classdev *cdev);
void led_trigger_remove_current_brightness(struct led_classdev *cdev);
void led_trigger_notify_current_brightness_change(struct led_classdev *);

The add / remove functions are to be used as, or called from the triggers
activate / deactivate callbacks and when an event happens the trigger can
call the notify function to wake-up any poll() waiters.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
-This is a new patch in v5 of this patch-set (replacing earlier attempts
 at similar functionality)
---
 Documentation/ABI/testing/sysfs-class-led | 15 +++++-
 drivers/leds/led-triggers.c               | 81 +++++++++++++++++++++++++++++++
 drivers/leds/leds.h                       |  3 ++
 include/linux/leds.h                      |  3 ++
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 491cdee..b8cb74d 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -33,7 +33,8 @@ Description:
 		You can change triggers in a similar manner to the way an IO
 		scheduler is chosen. Trigger specific parameters can appear in
 		/sys/class/leds/<led> once a given trigger is selected. For
-		their documentation see sysfs-class-led-trigger-*.
+		their documentation see sysfs-class-led-trigger-*. Also see
+		the trigger specific current_brightness file described below.
 
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
@@ -44,3 +45,15 @@ Description:
 		gpio and backlight triggers. In case of the backlight trigger,
 		it is useful when driving a LED which is intended to indicate
 		a device in a standby like state.
+
+What:		/sys/class/leds/<led>/current_brightness
+Date:		November 2016
+KernelVersion:	4.10
+Description:
+		Triggers which support it may register a current_brightness
+		file. This file supports poll() to detect when the trigger
+		modifies the brightness of the LED.
+		Reading this file will always return the current brightness
+		of the LED.
+		Writing this file sets the current brightness of the LED,
+		without influencing the trigger.
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 431123b..d2ed9c2 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -102,6 +102,87 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
 }
 EXPORT_SYMBOL_GPL(led_trigger_show);
 
+static ssize_t current_brightness_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	led_update_brightness(led_cdev);
+
+	return sprintf(buf, "%u\n", led_cdev->brightness);
+}
+
+static ssize_t current_brightness_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	unsigned long state;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = kstrtoul(buf, 10, &state);
+	if (ret)
+		goto unlock;
+
+	/* _nosleep version so as to not stop sw blinking */
+	led_set_brightness_nosleep(led_cdev, state);
+
+	/* Let any listeners know the brighness changed */
+	if (led_cdev->current_brightness_kn)
+		sysfs_notify_dirent(led_cdev->current_brightness_kn);
+
+	ret = size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+
+static DEVICE_ATTR_RW(current_brightness);
+
+void led_trigger_add_current_brightness(struct led_classdev *led_cdev)
+{
+	int ret;
+
+	ret = device_create_file(led_cdev->dev, &dev_attr_current_brightness);
+	if (ret) {
+		dev_err(led_cdev->dev, "Error creating current_brightness\n");
+		return;
+	}
+
+	led_cdev->current_brightness_kn =
+		sysfs_get_dirent(led_cdev->dev->kobj.sd, "current_brightness");
+	if (!led_cdev->current_brightness_kn)
+		dev_err(led_cdev->dev, "Error getting current_brightness kn\n");
+}
+EXPORT_SYMBOL_GPL(led_trigger_add_current_brightness);
+
+void led_trigger_remove_current_brightness(struct led_classdev *led_cdev)
+{
+	sysfs_put(led_cdev->current_brightness_kn);
+	led_cdev->current_brightness_kn = NULL;
+	device_remove_file(led_cdev->dev, &dev_attr_current_brightness);
+}
+EXPORT_SYMBOL_GPL(led_trigger_remove_current_brightness);
+
+void led_trigger_notify_current_brightness_change(struct led_trigger *trig)
+{
+	struct led_classdev *led_cdev;
+
+	read_lock(&trig->leddev_list_lock);
+	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
+		if (led_cdev->current_brightness_kn)
+			sysfs_notify_dirent(led_cdev->current_brightness_kn);
+	}
+	read_unlock(&trig->leddev_list_lock);
+}
+EXPORT_SYMBOL_GPL(led_trigger_notify_current_brightness_change);
+
 /* Caller must ensure led_cdev->trigger_lock held */
 void led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 {
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 7d38e6b..3d06ee6 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -27,6 +27,9 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 				enum led_brightness value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 				enum led_brightness value);
+void led_trigger_add_current_brightness(struct led_classdev *cdev);
+void led_trigger_remove_current_brightness(struct led_classdev *cdev);
+void led_trigger_notify_current_brightness_change(struct led_trigger *trig);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb53..d3eb992 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,6 +13,7 @@
 #define __LINUX_LEDS_H_INCLUDED
 
 #include <linux/device.h>
+#include <linux/kernfs.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
@@ -108,6 +109,8 @@ struct led_classdev {
 	void			*trigger_data;
 	/* true if activated - deactivate routine uses it to do cleanup */
 	bool			activated;
+	/* For triggers with current_brightness sysfs attribute */
+	struct kernfs_node	*current_brightness_kn;
 #endif
 
 	/* Ensures consistent access to the LED Flash Class device */
-- 
2.9.3
