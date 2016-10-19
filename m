From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform: x86: dell-*: Call led_notify_brightness_change on kbd brightness change
Date: Wed, 19 Oct 2016 15:33:55 +0200
Message-ID: <20161019133355.6192-3-hdegoede@redhat.com>
References: <20161019133355.6192-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161019133355.6192-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

Make dell-wmi call led_notify_brightness_change on the kbd_led led_classdev
registered by dell-laptop when the kbd backlight brightness changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig       |  1 +
 drivers/platform/x86/dell-laptop.c | 13 ++++++++++++-
 drivers/platform/x86/dell-smbios.c |  4 ++++
 drivers/platform/x86/dell-smbios.h |  2 ++
 drivers/platform/x86/dell-wmi.c    |  6 ++++++
 5 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 81b8dcc..9b6101c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -124,6 +124,7 @@ config DELL_WMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on DELL_SMBIOS
+	select NEW_LEDS
 	select INPUT_SPARSEKMAP
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2c2f02b..6cb55d7 100644
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
@@ -1953,7 +1955,15 @@ static int __init kbd_led_init(struct device *dev)
 		if (kbd_led.max_brightness)
 			kbd_led.max_brightness--;
 	}
-	return led_classdev_register(dev, &kbd_led);
+	ret = led_classdev_register(dev, &kbd_led);
+	if (ret) {
+		kbd_led_present = false;
+		return ret;
+	}
+
+	dell_kbd_backlight_led = &kbd_led;
+
+	return 0;
 }
 
 static void brightness_set_exit(struct led_classdev *led_cdev,
@@ -1966,6 +1976,7 @@ static void kbd_led_exit(void)
 {
 	if (!kbd_led_present)
 		return;
+	dell_kbd_backlight_led = NULL;
 	kbd_led.brightness_set = brightness_set_exit;
 	led_classdev_unregister(&kbd_led);
 }
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index d2412ab..7934953 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -21,6 +21,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/leds.h>
 #include "../../firmware/dcdbas.h"
 #include "dell-smbios.h"
 
@@ -40,6 +41,9 @@ static int da_command_code;
 static int da_num_tokens;
 static struct calling_interface_token *da_tokens;
 
+struct led_classdev *dell_kbd_backlight_led;
+EXPORT_SYMBOL_GPL(dell_kbd_backlight_led);
+
 int dell_smbios_error(int value)
 {
 	switch (value) {
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index ec7d40a..ba7b90c 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -35,6 +35,8 @@ struct calling_interface_token {
 	};
 };
 
+extern struct led_classdev *dell_kbd_backlight_led;
+
 int dell_smbios_error(int value);
 
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index da2fe18..de5ac59 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -36,6 +36,7 @@
 #include <linux/acpi.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
+#include <linux/leds.h>
 #include <acpi/video.h>
 #include "dell-smbios.h"
 
@@ -319,6 +320,11 @@ static void dell_wmi_process_key(int type, int code)
 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
 		return;
 
+	if (type == 0x0011 && dell_kbd_backlight_led &&
+			(code == 0x01e1 || code == 0x02ea ||
+			 code == 0x02eb || code == 0x02ec || code == 0x02f6))
+		led_notify_brightness_change(dell_kbd_backlight_led);
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
 
-- 
2.9.3
