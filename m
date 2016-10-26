From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 2/5] platform: x86: thinkpad: Call led_notify_brightness_change on kbd brightness change
Date: Wed, 26 Oct 2016 19:41:15 +0200
Message-ID: <20161026174118.3431-2-hdegoede@redhat.com>
References: <20161026174118.3431-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:3541 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752427AbcJZRl2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Oct 2016 13:41:28 -0400
In-Reply-To: <20161026174118.3431-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Make thinkpad_acpi call led_notify_brightness_change on the kbd_led
led_classdev registered by thinkpad_acpi when the kbd backlight
brightness changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
-This is a new patch in v3 of this patch-set
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce75..5dcd7d8b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -162,6 +162,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_HOTKEY_BASE		= 0x1001, /* first hotkey (FN+F1) */
 	TP_HKEY_EV_BRGHT_UP		= 0x1010, /* Brightness up */
 	TP_HKEY_EV_BRGHT_DOWN		= 0x1011, /* Brightness down */
+	TP_HKEY_EV_THINKLIGHT		= 0x1012, /* Thinklight/kbd backlight */
 	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
 	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
 	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
@@ -5167,6 +5168,8 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return rc;
 	}
 
+	tpacpi_hotkey_driver_mask_set(hotkey_driver_mask |
+				      TP_ACPI_HKEY_THNKLGHT_MASK);
 	return 0;
 }
 
@@ -9114,6 +9117,8 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 			volume_alsa_notify_change();
 		}
 	}
+	if (tp_features.kbdlight && hkey_event == TP_HKEY_EV_THINKLIGHT)
+		led_notify_brightness_change(&tpacpi_led_kbdlight.led_classdev);
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.9.3
