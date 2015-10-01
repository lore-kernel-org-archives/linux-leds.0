From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 2/3] leds: add debugfs to device trigger
Date: Thu,  1 Oct 2015 16:04:32 +0200
Message-ID: <d0c8a44bbb5530e4c708cac8867eb8a8b0af76c3.1443705827.git.maciek.borzecki@gmail.com>
References: <cover.1443705827.git.maciek.borzecki@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1443705827.git.maciek.borzecki@gmail.com>
In-Reply-To: <cover.1443705827.git.maciek.borzecki@gmail.com>
References: <cover.1443705827.git.maciek.borzecki@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
List-Id: linux-leds@vger.kernel.org

Add debugfs entries for device activity trigger. Three entries are
created under /sys/kernel/debug/ledtrig-dev when the driver gets
loaded. These are:

  devices - cat'ing will produce a list of currently registered devices
            in <major>:<minor> format, a line for each device.

  register - echo'ing <major>:<minor> will create a trigger for this
             device

  unregister - echo'ing <major>:<minor> will delete a trigger for this
               device

  trigger - echo'ing <major>:<minor> will fire a trigger for this device

Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 drivers/leds/trigger/ledtrig-device.c | 145 +++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-device.c b/drivers/leds/trigger/ledtrig-device.c
index dbb8d7d2b4a0258149c581a040c416d412d9ceeb..68f61fb6ebb05ceaee36c58f1a0244a66bf34847 100644
--- a/drivers/leds/trigger/ledtrig-device.c
+++ b/drivers/leds/trigger/ledtrig-device.c
@@ -16,15 +16,19 @@
 #include <linux/list.h>
 #include <linux/rwsem.h>
 #include <linux/kdev_t.h>
+#include <linux/fs.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <asm/uaccess.h>
 
 #define BLINK_DELAY 30
 static unsigned long blink_delay = BLINK_DELAY;
 
 static DECLARE_RWSEM(devs_list_lock);
 static LIST_HEAD(devs_list);
+static struct dentry *debug_root;
 
 #define MAX_NAME_LEN 20
-
 struct ledtrig_dev_data {
 	char name[MAX_NAME_LEN];
 	dev_t dev;
@@ -114,8 +118,11 @@ void ledtrig_dev_add(dev_t dev)
 		/* register with led triggers */
 		led_trigger_register_simple(new_dev_trig->name,
 					    &new_dev_trig->trig);
-	else
+	else {
+		pr_warn("device %u:%u already registered\n",
+			MAJOR(dev), MINOR(dev));
 		kfree(new_dev_trig);
+	}
 }
 EXPORT_SYMBOL(ledtrig_dev_add);
 
@@ -167,13 +174,147 @@ static void ledtrig_dev_remove_all(void)
 	up_write(&devs_list_lock);
 }
 
+static int ledtrig_dev_devices_show(struct seq_file *s, void *unused)
+{
+	struct ledtrig_dev_data *dev_trig;
+
+	down_read(&devs_list_lock);
+	list_for_each_entry(dev_trig, &devs_list, node) {
+		seq_printf(s, "%u:%u\n", MAJOR(dev_trig->dev),
+			MINOR(dev_trig->dev));
+	}
+	up_read(&devs_list_lock);
+	return 0;
+}
+
+static int ledtrig_dev_devices_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, ledtrig_dev_devices_show,
+			   &inode->i_private);
+}
+
+static const struct file_operations debug_devices_ops = {
+	.owner = THIS_MODULE,
+	.open = ledtrig_dev_devices_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release
+};
+
+static int get_dev_from_user(const char __user *buf, size_t size,
+			dev_t *dev)
+{
+	char temp[MAX_NAME_LEN];
+	unsigned int major;
+	unsigned int minor;
+	int ret;
+
+	WARN_ON(dev == NULL);
+	if (dev == NULL)
+		return -EINVAL;
+
+	if (size > sizeof(temp) || size == 0)
+		return -EINVAL;
+
+	if (copy_from_user(temp, buf, size) != 0)
+		return -EINVAL;
+
+	ret = sscanf(temp, "%u:%u", &major, &minor);
+	if (ret < 2)
+		return -EINVAL;
+
+	*dev = MKDEV(major, minor);
+	return 0;
+}
+
+static ssize_t ledtrig_dev_register_write(struct file *filp,
+					const char __user *buf,
+					size_t size, loff_t *off)
+{
+	dev_t dev;
+	int ret;
+
+	ret = get_dev_from_user(buf, size, &dev);
+	if (ret < 0)
+		return ret;
+
+	pr_debug("register device %u:%u\n", MAJOR(dev), MINOR(dev));
+	ledtrig_dev_add(dev);
+
+	return size;
+}
+
+static const struct file_operations debug_register_ops = {
+	.owner = THIS_MODULE,
+	.write = ledtrig_dev_register_write,
+};
+
+static ssize_t ledtrig_dev_unregister_write(struct file *filp,
+					    const char __user *buf,
+					    size_t size, loff_t *off)
+{
+	dev_t dev;
+	int ret;
+
+	ret = get_dev_from_user(buf, size, &dev);
+	if (ret < 0)
+		return ret;
+
+	pr_debug("unregister device %u:%u\n", MAJOR(dev), MINOR(dev));
+	ledtrig_dev_del(dev);
+
+	return size;
+}
+
+static const struct file_operations debug_unregister_ops = {
+	.owner = THIS_MODULE,
+	.write = ledtrig_dev_unregister_write,
+};
+
+static ssize_t ledtrig_dev_trigger_write(struct file *filp,
+					const char __user *buf,
+					size_t size, loff_t *off)
+{
+	dev_t dev;
+	int ret;
+
+	ret = get_dev_from_user(buf, size, &dev);
+	if (ret < 0)
+		return ret;
+
+	pr_debug("trigger device %u:%u\n", MAJOR(dev), MINOR(dev));
+	ledtrig_dev_activity(dev);
+
+	return size;
+}
+
+static const struct file_operations debug_trigger_ops = {
+	.owner = THIS_MODULE,
+	.write = ledtrig_dev_trigger_write,
+};
+
 static int __init ledtrig_dev_init(void)
 {
+	debug_root = debugfs_create_dir("ledtrig-dev", NULL);
+
+	if (debug_root) {
+		debugfs_create_file("devices", 0444, debug_root, NULL,
+				&debug_devices_ops);
+		debugfs_create_file("register", 0200, debug_root, NULL,
+				&debug_register_ops);
+		debugfs_create_file("unregister", 0200, debug_root, NULL,
+				&debug_unregister_ops);
+		debugfs_create_file("trigger", 0200, debug_root, NULL,
+				&debug_trigger_ops);
+	}
+
 	return 0;
 }
 
 static void __exit ledtrig_dev_exit(void)
 {
+	debugfs_remove_recursive(debug_root);
+
 	ledtrig_dev_remove_all();
 }
 
-- 
2.6.0

