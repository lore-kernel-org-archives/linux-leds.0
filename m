From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 4/4] platform: x86: dell-*: Call led_notify_brightness_change on kbd brightness change
Date: Tue,  1 Nov 2016 14:37:48 +0100
Message-ID: <20161101133748.7168-4-hdegoede@redhat.com>
References: <20161101133748.7168-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161101133748.7168-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

Make dell-wmi call led_notify_brightness_change on the kbd_led led_classdev
registered by dell-laptop when the kbd backlight brightness changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Use the new dell_smbios*notify functionality
Changes in v3:
-Simplify the if condition for calling led_notify_brightness_change
Changes in v4:
-Adjust for dell_smbios_*_notifier to dell_laptop_*_notifier rename
---
 drivers/platform/x86/dell-laptop.c | 28 +++++++++++++++++++++++++++-
 drivers/platform/x86/dell-wmi.c    | 14 +++++++++-----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2c2f02b..c9cd1d5 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1942,6 +1942,8 @@ static struct led_classdev kbd_led = {
 
 static int __init kbd_led_init(struct device *dev)
 {
+	int ret;
+
 	kbd_init();
 	if (!kbd_led_present)
 		return -ENODEV;
@@ -1953,7 +1955,11 @@ static int __init kbd_led_init(struct device *dev)
 		if (kbd_led.max_brightness)
 			kbd_led.max_brightness--;
 	}
-	return led_classdev_register(dev, &kbd_led);
+	ret = led_classdev_register(dev, &kbd_led);
+	if (ret)
+		kbd_led_present = false;
+
+	return ret;
 }
 
 static void brightness_set_exit(struct led_classdev *led_cdev,
@@ -1970,6 +1976,23 @@ static void kbd_led_exit(void)
 	led_classdev_unregister(&kbd_led);
 }
 
+static int dell_laptop_notifier_call(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	switch (action) {
+	case dell_laptop_kbd_backlight_brightness_changed:
+		if (kbd_led_present)
+			led_notify_brightness_change(&kbd_led);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block dell_laptop_notifier = {
+	.notifier_call = dell_laptop_notifier_call,
+};
+
 static int __init dell_init(void)
 {
 	struct calling_interface_buffer *buffer;
@@ -2013,6 +2036,8 @@ static int __init dell_init(void)
 		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
 				    &dell_debugfs_fops);
 
+	dell_laptop_register_notifier(&dell_laptop_notifier);
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2064,6 +2089,7 @@ static int __init dell_init(void)
 
 static void __exit dell_exit(void)
 {
+	dell_laptop_unregister_notifier(&dell_laptop_notifier);
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index da2fe18..8e67061 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -287,11 +287,11 @@ static const struct key_entry dell_wmi_keymap_type_0011[] __initconst = {
 	{ KE_IGNORE, 0xfff1, { KEY_RESERVED } },
 
 	/* Keyboard backlight level changed */
-	{ KE_IGNORE, 0x01e1, { KEY_RESERVED } },
-	{ KE_IGNORE, 0x02ea, { KEY_RESERVED } },
-	{ KE_IGNORE, 0x02eb, { KEY_RESERVED } },
-	{ KE_IGNORE, 0x02ec, { KEY_RESERVED } },
-	{ KE_IGNORE, 0x02f6, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x01e1, { KEY_KBDILLUMTOGGLE } },
+	{ KE_IGNORE, 0x02ea, { KEY_KBDILLUMTOGGLE } },
+	{ KE_IGNORE, 0x02eb, { KEY_KBDILLUMTOGGLE } },
+	{ KE_IGNORE, 0x02ec, { KEY_KBDILLUMTOGGLE } },
+	{ KE_IGNORE, 0x02f6, { KEY_KBDILLUMTOGGLE } },
 };
 
 static struct input_dev *dell_wmi_input_dev;
@@ -319,6 +319,10 @@ static void dell_wmi_process_key(int type, int code)
 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
 		return;
 
+	if (key->keycode == KEY_KBDILLUMTOGGLE)
+		dell_laptop_call_notifier(
+			dell_laptop_kbd_backlight_brightness_changed, NULL);
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
 
-- 
2.9.3
