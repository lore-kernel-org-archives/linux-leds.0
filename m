From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5 6/6] platform: x86: dell-wmi: Call led kbd_backlight trigger on kbd brightness change
Date: Thu, 17 Nov 2016 23:24:41 +0100
Message-ID: <20161117222441.31464-6-hdegoede@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161117222441.31464-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

Make dell-wmi call ledtrig_kbd_backlight() when the keyboard-backlight
brightness changes.

This will allow userspace to monitor (poll) for brightness changes on
these LEDs caused by the hotkey.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Use the new dell_smbios*notify functionality
Changes in v3:
-Simplify the if condition for calling led_notify_brightness_change
Changes in v4:
-Adjust for dell_smbios_*_notifier to dell_laptop_*_notifier rename
Changes in v5:
-Switch to new led-trigger based API for notifying userspace about
 keyboard backlight brightness changes.
-This also drops the need for the custom dell_laptop_*_notifier code
---
 drivers/platform/x86/dell-wmi.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index da2fe18..64b5035 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -36,6 +36,7 @@
 #include <linux/acpi.h>
 #include <linux/string.h>
 #include <linux/dmi.h>
+#include <linux/leds.h>
 #include <acpi/video.h>
 #include "dell-smbios.h"
 
@@ -287,11 +288,11 @@ static const struct key_entry dell_wmi_keymap_type_0011[] __initconst = {
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
@@ -319,6 +320,11 @@ static void dell_wmi_process_key(int type, int code)
 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
 		return;
 
+	if (key->keycode == KEY_KBDILLUMTOGGLE) {
+		/* set_brightness = false, already handled by firmware */
+		ledtrig_kbd_backlight(false, 0);
+	}
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
 
-- 
2.9.3
