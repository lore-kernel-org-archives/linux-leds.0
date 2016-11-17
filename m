From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5 4/6] platform: x86: thinkpad: Call led kbd_backlight trigger on kbd brightness change
Date: Thu, 17 Nov 2016 23:24:39 +0100
Message-ID: <20161117222441.31464-4-hdegoede@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45452 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752190AbcKQWYy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Nov 2016 17:24:54 -0500
In-Reply-To: <20161117222441.31464-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Set the default-trigger of the thinklight and keyboard-backlight LEDs
to "kbd-backlight" and call ledtrig_kbd_backlight() when the hotkey
for controlling the thinklight and/or the keyboard-backlight gets pressed.

This will allow userspace to monitor (poll) for brightness changes on
these LEDs caused by the hotkey.

Note this also sets the LED_TRIGGER_READ_ONLY flag since the hotkey
is hardwired to control the brightness.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
-This is a new patch in v3 of this patch-set
Changes in v4:
-No changes
Changes in v5:
-Switch to new led-trigger based API for notifying userspace about
 keyboard backlight brightness changes.
-Also call ledtrig_kbd_backlight() for laptops with a thinklight
-Rename the hotkey defines from THINKLIGHT to KBD_LIGHT since they
 are shared between the thinklight and the keyboard backlight
---
 drivers/platform/x86/thinkpad_acpi.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce75..066ad20 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -162,6 +162,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_HOTKEY_BASE		= 0x1001, /* first hotkey (FN+F1) */
 	TP_HKEY_EV_BRGHT_UP		= 0x1010, /* Brightness up */
 	TP_HKEY_EV_BRGHT_DOWN		= 0x1011, /* Brightness down */
+	TP_HKEY_EV_KBD_LIGHT		= 0x1012, /* Thinklight/kbd backlight */
 	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
 	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
 	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
@@ -1950,7 +1951,7 @@ enum {	/* Positions of some of the keys in hotkey masks */
 	TP_ACPI_HKEY_HIBERNATE_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNF12,
 	TP_ACPI_HKEY_BRGHTUP_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNHOME,
 	TP_ACPI_HKEY_BRGHTDWN_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNEND,
-	TP_ACPI_HKEY_THNKLGHT_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNPAGEUP,
+	TP_ACPI_HKEY_KBD_LIGHT_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNPAGEUP,
 	TP_ACPI_HKEY_ZOOM_MASK		= 1 << TP_ACPI_HOTKEYSCAN_FNSPACE,
 	TP_ACPI_HKEY_VOLUP_MASK		= 1 << TP_ACPI_HOTKEYSCAN_VOLUMEUP,
 	TP_ACPI_HKEY_VOLDWN_MASK	= 1 << TP_ACPI_HOTKEYSCAN_VOLUMEDOWN,
@@ -2320,7 +2321,7 @@ static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
 		n->display_toggle = !!(d & TP_NVRAM_MASK_HKT_DISPLAY);
 		n->hibernate_toggle = !!(d & TP_NVRAM_MASK_HKT_HIBERNATE);
 	}
-	if (m & TP_ACPI_HKEY_THNKLGHT_MASK) {
+	if (m & TP_ACPI_HKEY_KBD_LIGHT_MASK) {
 		d = nvram_read_byte(TP_NVRAM_ADDR_THINKLIGHT);
 		n->thinklight_toggle = !!(d & TP_NVRAM_MASK_THINKLIGHT);
 	}
@@ -5138,8 +5139,10 @@ static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	.led_classdev = {
 		.name		= "tpacpi::kbd_backlight",
 		.max_brightness	= 2,
+		.flags		= LED_TRIGGER_READ_ONLY,
 		.brightness_set	= &kbdlight_sysfs_set,
 		.brightness_get	= &kbdlight_sysfs_get,
+		.default_trigger = "kbd-backlight",
 	}
 };
 
@@ -5167,6 +5170,8 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return rc;
 	}
 
+	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
+				      TP_ACPI_HKEY_KBD_LIGHT_MASK);
 	return 0;
 }
 
@@ -5332,8 +5337,10 @@ static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
 static struct tpacpi_led_classdev tpacpi_led_thinklight = {
 	.led_classdev = {
 		.name		= "tpacpi::thinklight",
+		.flags		= LED_TRIGGER_READ_ONLY,
 		.brightness_set	= &light_sysfs_set,
 		.brightness_get	= &light_sysfs_get,
+		.default_trigger = "kbd-backlight",
 	}
 };
 
@@ -5372,11 +5379,12 @@ static int __init light_init(struct ibm_init_struct *iibm)
 	if (rc < 0) {
 		tp_features.light = 0;
 		tp_features.light_status = 0;
-	} else  {
-		rc = 0;
+		return rc;
 	}
 
-	return rc;
+	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
+				      TP_ACPI_HKEY_KBD_LIGHT_MASK);
+	return 0;
 }
 
 static void light_exit(void)
@@ -9114,6 +9122,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 			volume_alsa_notify_change();
 		}
 	}
+	if (hkey_event == TP_HKEY_EV_KBD_LIGHT) {
+		/* set_brightness = false, already handled by firmware */
+		ledtrig_kbd_backlight(false, 0);
+	}
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.9.3
