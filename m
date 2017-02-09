From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8 3/7] platform/x86/thinkpad: Call led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Thu,  9 Feb 2017 16:44:13 +0100
Message-ID: <20170209154417.19040-4-hdegoede@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Make thinkpad_acpi call led_classdev_notify_brightness_hw_changed on the
kbd_led led_classdev registered by thinkpad_acpi when the kbd backlight
brightness is changed through the hotkey.

This will allow userspace to monitor (poll) for brightness changes on
these LEDs caused by the hotkey.

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
Changes in v6:
-Switch to new brightness_hw_changed LED class API
Changes in v8:
-Cache last set brightness value and only call
 led_classdev_notify_brightness_hw_changed if the brightness has changed,
 this is necessary because the TP_HKEY_EV_KBD_LIGHT events get triggered
 when we set the brightness ourselves too
---
 drivers/platform/x86/thinkpad_acpi.c | 42 ++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f51833f..1d18b32 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -163,6 +163,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_HOTKEY_BASE		= 0x1001, /* first hotkey (FN+F1) */
 	TP_HKEY_EV_BRGHT_UP		= 0x1010, /* Brightness up */
 	TP_HKEY_EV_BRGHT_DOWN		= 0x1011, /* Brightness down */
+	TP_HKEY_EV_KBD_LIGHT		= 0x1012, /* Thinklight/kbd backlight */
 	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
 	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
 	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
@@ -1957,7 +1958,7 @@ enum {	/* Positions of some of the keys in hotkey masks */
 	TP_ACPI_HKEY_HIBERNATE_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNF12,
 	TP_ACPI_HKEY_BRGHTUP_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNHOME,
 	TP_ACPI_HKEY_BRGHTDWN_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNEND,
-	TP_ACPI_HKEY_THNKLGHT_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNPAGEUP,
+	TP_ACPI_HKEY_KBD_LIGHT_MASK	= 1 << TP_ACPI_HOTKEYSCAN_FNPAGEUP,
 	TP_ACPI_HKEY_ZOOM_MASK		= 1 << TP_ACPI_HOTKEYSCAN_FNSPACE,
 	TP_ACPI_HKEY_VOLUP_MASK		= 1 << TP_ACPI_HOTKEYSCAN_VOLUMEUP,
 	TP_ACPI_HKEY_VOLDWN_MASK	= 1 << TP_ACPI_HOTKEYSCAN_VOLUMEDOWN,
@@ -2342,7 +2343,7 @@ static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
 		n->display_toggle = !!(d & TP_NVRAM_MASK_HKT_DISPLAY);
 		n->hibernate_toggle = !!(d & TP_NVRAM_MASK_HKT_HIBERNATE);
 	}
-	if (m & TP_ACPI_HKEY_THNKLGHT_MASK) {
+	if (m & TP_ACPI_HKEY_KBD_LIGHT_MASK) {
 		d = nvram_read_byte(TP_NVRAM_ADDR_THINKLIGHT);
 		n->thinklight_toggle = !!(d & TP_NVRAM_MASK_THINKLIGHT);
 	}
@@ -5082,15 +5083,26 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+static enum led_brightness kbdlight_brightness;
+static DEFINE_MUTEX(kbdlight_mutex);
+
 static int kbdlight_set_level(int level)
 {
+	int ret = 0;
+
 	if (!hkey_handle)
 		return -ENXIO;
 
+	mutex_lock(&kbdlight_mutex);
+
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
-		return -EIO;
+		ret = -EIO;
+	else
+		kbdlight_brightness = level;
 
-	return 0;
+	mutex_unlock(&kbdlight_mutex);
+
+	return ret;
 }
 
 static int kbdlight_get_level(void)
@@ -5175,6 +5187,7 @@ static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	.led_classdev = {
 		.name		= "tpacpi::kbd_backlight",
 		.max_brightness	= 2,
+		.flags		= LED_BRIGHT_HW_CHANGED,
 		.brightness_set_blocking = &kbdlight_sysfs_set,
 		.brightness_get	= &kbdlight_sysfs_get,
 	}
@@ -5194,6 +5207,7 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return 1;
 	}
 
+	kbdlight_brightness = kbdlight_sysfs_get(NULL);
 	tp_features.kbdlight = 1;
 
 	rc = led_classdev_register(&tpacpi_pdev->dev,
@@ -5203,6 +5217,8 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return rc;
 	}
 
+	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
+				      TP_ACPI_HKEY_KBD_LIGHT_MASK);
 	return 0;
 }
 
@@ -9119,6 +9135,24 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 			volume_alsa_notify_change();
 		}
 	}
+	if (tp_features.kbdlight && hkey_event == TP_HKEY_EV_KBD_LIGHT) {
+		enum led_brightness brightness;
+
+		mutex_lock(&kbdlight_mutex);
+
+		/*
+		 * Check the brightness actually changed, setting the brightness
+		 * through kbdlight_set_level() also triggers this event.
+		 */
+		brightness = kbdlight_sysfs_get(NULL);
+		if (kbdlight_brightness != brightness) {
+			kbdlight_brightness = brightness;
+			led_classdev_notify_brightness_hw_changed(
+				&tpacpi_led_kbdlight.led_classdev, brightness);
+		}
+
+		mutex_unlock(&kbdlight_mutex);
+	}
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.9.3
