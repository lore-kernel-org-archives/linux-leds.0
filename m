From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 1/3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 14:16:48 -0500
Message-ID: <1474053410-24387-2-git-send-email-david@lechnology.com>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474053410-24387-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

This driver creates a userspace leds driver similar to uinput.

New leds are created by opening /dev/uleds and writing a uleds_user_dev
struct. A new leds class device is registered with the name given in the
struct. Reading will return a single byte that is the current brightness.
The poll() syscall is also supported. It will be triggered whenever the
brightness changes. Closing the file handle to /dev/uleds will remove
the leds class device.

Signed-off-by: David Lechner <david@lechnology.com>
---
 Documentation/leds/uleds.txt |  36 +++++++
 drivers/leds/Kconfig         |   8 ++
 drivers/leds/Makefile        |   3 +
 drivers/leds/uleds.c         | 230 +++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/Kbuild    |   1 +
 include/uapi/linux/uleds.h   |  23 +++++
 6 files changed, 301 insertions(+)
 create mode 100644 Documentation/leds/uleds.txt
 create mode 100644 drivers/leds/uleds.c
 create mode 100644 include/uapi/linux/uleds.h

diff --git a/Documentation/leds/uleds.txt b/Documentation/leds/uleds.txt
new file mode 100644
index 0000000..486d473
--- /dev/null
+++ b/Documentation/leds/uleds.txt
@@ -0,0 +1,36 @@
+Userspace LEDs
+==============
+
+The uleds driver supports userspace LEDs. This can be useful for testing
+triggers and can also be used to implement virtual LEDs.
+
+
+Usage
+=====
+
+When the driver is loaded, a character device is created at /dev/uleds. To
+create a new LED class device, open /dev/uleds and write a uleds_user_dev
+structure to it (found in kernel public header file linux/uleds.h).
+
+    #define LEDS_MAX_NAME_SIZE 64
+
+    struct uleds_user_dev {
+        char name[LEDS_MAX_NAME_SIZE];
+    };
+
+A new LED class device will be created with the name given. The name can be
+any valid sysfs device node name, but consider using the LED class naming
+convention of "devicename:color:function".
+
+The current brightness is found by reading a single byte from the character
+device. Values are unsigned: 0 to 255. Reading will block until the brightness
+changes. The device node can also be polled to notify when the brightness value
+changes.
+
+The LED class device will be removed when the open file handle to /dev/uleds
+is closed.
+
+Multiple LED class devices are created by opening additional file handles to
+/dev/uleds.
+
+See tools/leds/uledmon.c for an example userspace program.
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7a628c6..5fd3f4c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -659,6 +659,14 @@ config LEDS_MLXCPLD
 	  This option enabled support for the LEDs on the Mellanox
 	  boards. Say Y to enabled these.
 
+config LEDS_USER
+	tristate "Userspace LED support"
+	depends on LEDS_CLASS
+	help
+	  This option enables support for userspace LEDs. Say 'y' to enable this
+	  support in kernel. To compile this driver as a module, choose 'm' here:
+	  the module will be called uleds.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 3965070..d5331ff 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -75,5 +75,8 @@ obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 
+# LED Userspace Drivers
+obj-$(CONFIG_LEDS_USER)			+= uleds.o
+
 # LED Triggers
 obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
new file mode 100644
index 0000000..59ea23e
--- /dev/null
+++ b/drivers/leds/uleds.c
@@ -0,0 +1,229 @@
+/*
+ * Userspace driver for leds subsystem
+ *
+ * Copyright (C) 2016 David Lechner <david@lechnology.com>
+ *
+ * Based on uinput.c: Aristeu Sergio Rozanski Filho <aris@cathedrallabs.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+
+#include <uapi/linux/uleds.h>
+
+#define ULEDS_NAME	"uleds"
+
+enum uleds_state {
+	ULEDS_STATE_UNKNOWN,
+	ULEDS_STATE_REGISTERED,
+};
+
+struct uleds_device {
+	struct uleds_user_dev	user_dev;
+	struct led_classdev	led_cdev;
+	struct mutex		mutex;
+	enum uleds_state	state;
+	wait_queue_head_t	waitq;
+	unsigned char		brightness;
+	bool			new_data;
+};
+
+static struct miscdevice uleds_misc;
+
+static void uleds_brightness_set(struct led_classdev *led_cdev,
+				 enum led_brightness brightness)
+{
+	struct uleds_device *udev = container_of(led_cdev, struct uleds_device,
+						 led_cdev);
+
+	if (udev->brightness != brightness) {
+		udev->brightness = brightness;
+		udev->new_data = true;
+		wake_up_interruptible(&udev->waitq);
+	}
+}
+
+static int uleds_open(struct inode *inode, struct file *file)
+{
+	struct uleds_device *udev;
+
+	udev = kzalloc(sizeof(*udev), GFP_KERNEL);
+	if (!udev)
+		return -ENOMEM;
+
+	udev->led_cdev.name = udev->user_dev.name;
+	udev->led_cdev.max_brightness = LED_FULL;
+	udev->led_cdev.brightness_set = uleds_brightness_set;
+
+	mutex_init(&udev->mutex);
+	init_waitqueue_head(&udev->waitq);
+	udev->state = ULEDS_STATE_UNKNOWN;
+
+	file->private_data = udev;
+	nonseekable_open(inode, file);
+
+	return 0;
+}
+
+static ssize_t uleds_write(struct file *file, const char __user *buffer,
+			   size_t count, loff_t *ppos)
+{
+	struct uleds_device *udev = file->private_data;
+	const char *name;
+	int ret;
+
+	if (count == 0)
+		return 0;
+
+	ret = mutex_lock_interruptible(&udev->mutex);
+	if (ret)
+		return ret;
+
+	if (udev->state == ULEDS_STATE_REGISTERED) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (count != sizeof(struct uleds_user_dev)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (copy_from_user(&udev->user_dev, buffer,
+			   sizeof(struct uleds_user_dev))) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	name = udev->user_dev.name;
+	if (!name[0] || !strcmp(name, ".") || !strcmp(name, "..") ||
+	    strchr(name, '/')) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = devm_led_classdev_register(uleds_misc.this_device,
+					 &udev->led_cdev);
+	if (ret < 0)
+		goto out;
+
+	udev->new_data = true;
+	udev->state = ULEDS_STATE_REGISTERED;
+	ret = count;
+
+out:
+	mutex_unlock(&udev->mutex);
+
+	return ret;
+}
+
+static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
+			  loff_t *ppos)
+{
+	struct uleds_device *udev = file->private_data;
+	ssize_t retval;
+
+	if (count == 0)
+		return 0;
+
+	do {
+		retval = mutex_lock_interruptible(&udev->mutex);
+		if (retval)
+			return retval;
+
+		if (udev->state != ULEDS_STATE_REGISTERED) {
+			retval = -ENODEV;
+		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
+			retval = -EAGAIN;
+		} else if (udev->new_data) {
+			retval = copy_to_user(buffer, &udev->brightness, 1);
+			udev->new_data = false;
+			retval = 1;
+		}
+
+		mutex_unlock(&udev->mutex);
+
+		if (retval)
+			break;
+
+		if (!(file->f_flags & O_NONBLOCK))
+			retval = wait_event_interruptible(udev->waitq,
+					udev->new_data ||
+					udev->state != ULEDS_STATE_REGISTERED);
+	} while (retval == 0);
+
+	return retval;
+}
+
+static unsigned int uleds_poll(struct file *file, poll_table *wait)
+{
+	struct uleds_device *udev = file->private_data;
+
+	poll_wait(file, &udev->waitq, wait);
+
+	if (udev->new_data)
+		return POLLIN | POLLRDNORM;
+
+	return 0;
+}
+
+static int uleds_release(struct inode *inode, struct file *file)
+{
+	struct uleds_device *udev = file->private_data;
+
+	if (udev->state == ULEDS_STATE_REGISTERED) {
+		udev->state = ULEDS_STATE_UNKNOWN;
+		devm_led_classdev_unregister(uleds_misc.this_device,
+					     &udev->led_cdev);
+	}
+	kfree(udev);
+
+	return 0;
+}
+
+static const struct file_operations uleds_fops = {
+	.owner		= THIS_MODULE,
+	.open		= uleds_open,
+	.release	= uleds_release,
+	.read		= uleds_read,
+	.write		= uleds_write,
+	.poll		= uleds_poll,
+	.llseek		= no_llseek,
+};
+
+static struct miscdevice uleds_misc = {
+	.fops		= &uleds_fops,
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= ULEDS_NAME,
+};
+
+static int __init uleds_init(void)
+{
+	return misc_register(&uleds_misc);
+}
+module_init(uleds_init);
+
+static void __exit uleds_exit(void)
+{
+	misc_deregister(&uleds_misc);
+}
+module_exit(uleds_exit);
+
+MODULE_AUTHOR("David Lechner <david@lechnology.com>");
+MODULE_DESCRIPTION("Userspace driver for leds subsystem");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
index 185f8ea..416f5e6 100644
--- a/include/uapi/linux/Kbuild
+++ b/include/uapi/linux/Kbuild
@@ -421,6 +421,7 @@ header-y += udp.h
 header-y += uhid.h
 header-y += uinput.h
 header-y += uio.h
+header-y += uleds.h
 header-y += ultrasound.h
 header-y += un.h
 header-y += unistd.h
diff --git a/include/uapi/linux/uleds.h b/include/uapi/linux/uleds.h
new file mode 100644
index 0000000..6f277f3
--- /dev/null
+++ b/include/uapi/linux/uleds.h
@@ -0,0 +1,23 @@
+/*
+ * Userspace driver support for leds subsystem
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef _UAPI__ULEDS_H_
+#define _UAPI__ULEDS_H_
+
+#define LEDS_MAX_NAME_SIZE	64
+
+struct uleds_user_dev {
+	char name[LEDS_MAX_NAME_SIZE];
+};
+
+#endif /* _UAPI__ULEDS_H_ */
-- 
2.7.4
