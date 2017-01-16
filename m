From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 2/6] ALSA: hda - use dell_micmute_led_set() instead of dell_app_wmi_led_set()
Date: Mon, 16 Jan 2017 14:22:00 +0100
Message-ID: <20170116132204.6421-3-kernel@kempniu.pl>
References: <20170116132204.6421-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170116132204.6421-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Anthony Wong <anthony.wong@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The dell_app_wmi_led_set() method introduced in commit db6d8cc00773
("dell-led: add mic mute led interface") was implemented as an easily
extensible entry point for other modules to set the state of various
LEDs.  However, almost three years later it is still only used to
control the mic mute LED, so it will be replaced with direct calls to
dell_micmute_led_set().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/leds/dell-led.c         | 20 ++------------------
 include/linux/dell-led.h        |  6 +-----
 sound/pci/hda/dell_wmi_helper.c | 12 ++++++------
 3 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index e8e8f67224c1..f9002d9bb757 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -46,7 +46,7 @@ MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
 #define GLOBAL_MIC_MUTE_ENABLE	0x364
 #define GLOBAL_MIC_MUTE_DISABLE	0x365
 
-static int dell_micmute_led_set(int state)
+int dell_micmute_led_set(int state)
 {
 	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
@@ -69,23 +69,7 @@ static int dell_micmute_led_set(int state)
 
 	return state;
 }
-
-int dell_app_wmi_led_set(int whichled, int on)
-{
-	int state = 0;
-
-	switch (whichled) {
-	case DELL_LED_MICMUTE:
-		state = dell_micmute_led_set(on);
-		break;
-	default:
-		pr_warn("led type %x is not supported\n", whichled);
-		break;
-	}
-
-	return state;
-}
-EXPORT_SYMBOL_GPL(dell_app_wmi_led_set);
+EXPORT_SYMBOL_GPL(dell_micmute_led_set);
 
 struct bios_args {
 	unsigned char length;
diff --git a/include/linux/dell-led.h b/include/linux/dell-led.h
index 7009b8bec77b..3f033c48071e 100644
--- a/include/linux/dell-led.h
+++ b/include/linux/dell-led.h
@@ -1,10 +1,6 @@
 #ifndef __DELL_LED_H__
 #define __DELL_LED_H__
 
-enum {
-	DELL_LED_MICMUTE,
-};
-
-int dell_app_wmi_led_set(int whichled, int on);
+int dell_micmute_led_set(int on);
 
 #endif
diff --git a/sound/pci/hda/dell_wmi_helper.c b/sound/pci/hda/dell_wmi_helper.c
index 19d41da79f93..e128c8096772 100644
--- a/sound/pci/hda/dell_wmi_helper.c
+++ b/sound/pci/hda/dell_wmi_helper.c
@@ -6,7 +6,7 @@
 #include <linux/dell-led.h>
 
 static int dell_led_value;
-static int (*dell_led_set_func)(int, int);
+static int (*dell_led_set_func)(int);
 static void (*dell_old_cap_hook)(struct hda_codec *,
 			         struct snd_kcontrol *,
 				 struct snd_ctl_elem_value *);
@@ -27,7 +27,7 @@ static void update_dell_wmi_micmute_led(struct hda_codec *codec,
 			return;
 		dell_led_value = val;
 		if (dell_led_set_func)
-			dell_led_set_func(DELL_LED_MICMUTE, dell_led_value);
+			dell_led_set_func(dell_led_value);
 	}
 }
 
@@ -40,14 +40,14 @@ static void alc_fixup_dell_wmi(struct hda_codec *codec,
 
 	if (action == HDA_FIXUP_ACT_PROBE) {
 		if (!dell_led_set_func)
-			dell_led_set_func = symbol_request(dell_app_wmi_led_set);
+			dell_led_set_func = symbol_request(dell_micmute_led_set);
 		if (!dell_led_set_func) {
-			codec_warn(codec, "Failed to find dell wmi symbol dell_app_wmi_led_set\n");
+			codec_warn(codec, "Failed to find dell wmi symbol dell_micmute_led_set\n");
 			return;
 		}
 
 		removefunc = true;
-		if (dell_led_set_func(DELL_LED_MICMUTE, false) >= 0) {
+		if (dell_led_set_func(false) >= 0) {
 			dell_led_value = 0;
 			if (spec->gen.num_adc_nids > 1 && !spec->gen.dyn_adc_switch)
 				codec_dbg(codec, "Skipping micmute LED control due to several ADCs");
@@ -61,7 +61,7 @@ static void alc_fixup_dell_wmi(struct hda_codec *codec,
 	}
 
 	if (dell_led_set_func && (action == HDA_FIXUP_ACT_FREE || removefunc)) {
-		symbol_put(dell_app_wmi_led_set);
+		symbol_put(dell_micmute_led_set);
 		dell_led_set_func = NULL;
 		dell_old_cap_hook = NULL;
 	}
-- 
2.11.0
