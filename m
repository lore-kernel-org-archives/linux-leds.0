From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v6 4/4] platform/x86/dell-*: Call led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Wed, 25 Jan 2017 17:11:30 +0100
Message-ID: <20170125161130.5424-5-hdegoede@redhat.com>
References: <20170125161130.5424-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170125161130.5424-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

Make dell-wmi notify on hotkey kbd brightness changes, listen for this
in dell-laptop and call led_classdev_notify_brightness_hw_changed.

This will allow userspace to monitor (poll) for brightness changes on
these LEDs caused by the hotkey.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Changes in v2:
-Use the new dell_smbios*notify functionality
Changes in v3:
-Simplify the if condition for calling led_notify_brightness_change
Changes in v4:
-Adjust for dell_smbios_*_notifier to dell_laptop_*_notifier rename
Changes in v5:
-Switch to new led-trigger based API for notifying userspace about
 keyboard backlight brightness changes.
Changes in v6:
-Switch to new brightness_hw_changed LED class API
---
 drivers/platform/x86/dell-laptop.c | 30 +++++++++++++++++++++++++++++-
 drivers/platform/x86/dell-wmi.c    | 14 +++++++++-----
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 14392a0..7af485e 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1937,6 +1937,7 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 
 static struct led_classdev kbd_led = {
 	.name           = "dell::kbd_backlight",
+	.flags		= LED_BRIGHT_HW_CHANGED,
 	.brightness_set_blocking = kbd_led_level_set,
 	.brightness_get = kbd_led_level_get,
 	.groups         = kbd_led_groups,
@@ -1944,6 +1945,8 @@ static struct led_classdev kbd_led = {
 
 static int __init kbd_led_init(struct device *dev)
 {
+	int ret;
+
 	kbd_init();
 	if (!kbd_led_present)
 		return -ENODEV;
@@ -1955,7 +1958,11 @@ static int __init kbd_led_init(struct device *dev)
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
@@ -1972,6 +1979,24 @@ static void kbd_led_exit(void)
 	led_classdev_unregister(&kbd_led);
 }
 
+static int dell_laptop_notifier_call(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	switch (action) {
+	case DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED:
+		if (kbd_led_present)
+			led_classdev_notify_brightness_hw_changed(
+				&kbd_led, kbd_led_level_get(&kbd_led));
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
@@ -2015,6 +2040,8 @@ static int __init dell_init(void)
 		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
 				    &dell_debugfs_fops);
 
+	dell_laptop_register_notifier(&dell_laptop_notifier);
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2066,6 +2093,7 @@ static int __init dell_init(void)
 
 static void __exit dell_exit(void)
 {
+	dell_laptop_unregister_notifier(&dell_laptop_notifier);
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 75e6370..15740b5 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -297,11 +297,11 @@ static const struct key_entry dell_wmi_keymap_type_0011[] __initconst = {
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
@@ -329,6 +329,10 @@ static void dell_wmi_process_key(int type, int code)
 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
 		return;
 
+	if (key->keycode == KEY_KBDILLUMTOGGLE)
+		dell_laptop_call_notifier(
+			DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED, NULL);
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
 
-- 
2.9.3
