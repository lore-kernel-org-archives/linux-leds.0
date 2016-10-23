From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 3/4] platform: x86: dell-*: Call led_notify_brightness_change on kbd brightness change
Date: Sun, 23 Oct 2016 21:46:51 +0200
Message-ID: <20161023194652.24335-3-hdegoede@redhat.com>
References: <20161023194652.24335-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56216 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750860AbcJWTrE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Oct 2016 15:47:04 -0400
In-Reply-To: <20161023194652.24335-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Make dell-wmi call led_notify_brightness_change on the kbd_led led_classdev
registered by dell-laptop when the kbd backlight brightness changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 28 +++++++++++++++++++++++++++-
 drivers/platform/x86/dell-wmi.c    |  5 +++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2c2f02b..5a96c25 100644
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
+	case dell_smbios_kbd_backlight_brightness_changed:
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
 
+	dell_smbios_register_notifier(&dell_laptop_notifier);
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2064,6 +2089,7 @@ static int __init dell_init(void)
 
 static void __exit dell_exit(void)
 {
+	dell_smbios_unregister_notifier(&dell_laptop_notifier);
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index da2fe18..f86e774 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -319,6 +319,11 @@ static void dell_wmi_process_key(int type, int code)
 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
 		return;
 
+	if (type == 0x0011 && (code == 0x01e1 || code == 0x02ea ||
+			 code == 0x02eb || code == 0x02ec || code == 0x02f6))
+		dell_smbios_call_notifier(
+			dell_smbios_kbd_backlight_brightness_changed, NULL);
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
 
-- 
2.9.3
