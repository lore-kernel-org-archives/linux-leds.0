From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 4/6] ALSA: hda - Support led audio trigger
Date: Mon, 26 Nov 2018 18:11:24 +0100
Message-ID: <20181126171126.20280-5-tiwai@suse.de>
References: <20181126171126.20280-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20181126171126.20280-1-tiwai-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hui Wang <hui.wang-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Now all relevant platform drivers are providing the LED audio trigger,
we can switch the mute LED control with the LED trigger, finally.

For the mic-mute LED trigger, a common fixup function,
snd_hda_gen_fixup_micmute_led(), is provided to be called for the
corresponding quirk entries.  This sets up the capture sync hook with
ledtrig_audio_set() call appropriately.

For the mute LED trigger, which is done currently only for
thinkpad_acpi, the call is replaced with ledtrig_audio_set() as well.

Overall, the beauty of the new implementation is that he whole ugly
binding with request_symbol() are dropped, and also it provides more
flexibility to users.

One potential behavior change by this patch is that the mute LED enum
may be created on machines that actually have no LED device.  In the
former code, we did test-call and abort binding if the test failed.
But with the LED-trigger binding, this test isn't possible, and the
actual check is done in the LED class device side.  So it's the
downside of simpleness.

Also, note that the HD-audio codec driver doesn't select CONFIG_LEDS
and co by itself.  It's supposed to be selected by the platform
drivers instead.

Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
---
 sound/pci/hda/dell_wmi_helper.c | 48 ---------------------------------
 sound/pci/hda/hda_generic.c     | 31 +++++++++++++++++++++
 sound/pci/hda/hda_generic.h     |  2 ++
 sound/pci/hda/patch_realtek.c   | 17 +++++-------
 sound/pci/hda/thinkpad_helper.c | 43 +++++------------------------
 5 files changed, 46 insertions(+), 95 deletions(-)
 delete mode 100644 sound/pci/hda/dell_wmi_helper.c

diff --git a/sound/pci/hda/dell_wmi_helper.c b/sound/pci/hda/dell_wmi_helper.c
deleted file mode 100644
index bbd6c87a4ed6..000000000000
--- a/sound/pci/hda/dell_wmi_helper.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Helper functions for Dell Mic Mute LED control;
- * to be included from codec driver
- */
-
-#if IS_ENABLED(CONFIG_DELL_LAPTOP)
-#include <linux/dell-led.h>
-
-static int (*dell_micmute_led_set_func)(int);
-
-static void dell_micmute_update(struct hda_codec *codec)
-{
-	struct hda_gen_spec *spec = codec->spec;
-
-	dell_micmute_led_set_func(spec->micmute_led.led_value);
-}
-
-static void alc_fixup_dell_wmi(struct hda_codec *codec,
-			       const struct hda_fixup *fix, int action)
-{
-	bool removefunc = false;
-
-	if (action == HDA_FIXUP_ACT_PROBE) {
-		if (!dell_micmute_led_set_func)
-			dell_micmute_led_set_func = symbol_request(dell_micmute_led_set);
-		if (!dell_micmute_led_set_func) {
-			codec_warn(codec, "Failed to find dell wmi symbol dell_micmute_led_set\n");
-			return;
-		}
-
-		removefunc = (dell_micmute_led_set_func(false) < 0) ||
-			(snd_hda_gen_add_micmute_led(codec,
-						     dell_micmute_update) < 0);
-	}
-
-	if (dell_micmute_led_set_func && (action == HDA_FIXUP_ACT_FREE || removefunc)) {
-		symbol_put(dell_micmute_led_set);
-		dell_micmute_led_set_func = NULL;
-	}
-}
-
-#else /* CONFIG_DELL_LAPTOP */
-static void alc_fixup_dell_wmi(struct hda_codec *codec,
-			       const struct hda_fixup *fix, int action)
-{
-}
-
-#endif /* CONFIG_DELL_LAPTOP */
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 276150f29cda..4095cd7c56c6 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -29,6 +29,7 @@
 #include <linux/string.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
+#include <linux/leds.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/tlv.h>
@@ -4035,6 +4036,36 @@ int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led);
 
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+static void call_ledtrig_micmute(struct hda_codec *codec)
+{
+	struct hda_gen_spec *spec = codec->spec;
+
+	ledtrig_audio_set(LED_AUDIO_MICMUTE,
+			  spec->micmute_led.led_value ? LED_ON : LED_OFF);
+}
+#endif
+
+/**
+ * snd_hda_gen_fixup_micmute_led - A fixup for mic-mute LED trigger
+ *
+ * Pass this function to the quirk entry if another driver supports the
+ * audio mic-mute LED trigger.  Then this will bind the mixer capture switch
+ * change with the LED.
+ *
+ * Note that this fixup has to be called after other fixup that sets
+ * cap_sync_hook.  Otherwise the chaining wouldn't work.
+ */
+void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action)
+{
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+	if (action == HDA_FIXUP_ACT_PROBE)
+		snd_hda_gen_add_micmute_led(codec, call_ledtrig_micmute);
+#endif
+}
+EXPORT_SYMBOL_GPL(snd_hda_gen_fixup_micmute_led);
+
 /*
  * parse digital I/Os and set up NIDs in BIOS auto-parse mode
  */
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 10123664fa61..78d77042b05a 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -357,5 +357,7 @@ int snd_hda_gen_fix_pin_power(struct hda_codec *codec, hda_nid_t pin);
 
 int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 				void (*hook)(struct hda_codec *));
+void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
+				   const struct hda_fixup *fix, int action);
 
 #endif /* __SOUND_HDA_GENERIC_H */
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index fa61674a5605..993d34c141c2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5368,9 +5368,6 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 	hda_fixup_thinkpad_acpi(codec, fix, action);
 }
 
-/* for dell wmi mic mute led */
-#include "dell_wmi_helper.c"
-
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -5448,7 +5445,7 @@ enum {
 	ALC292_FIXUP_TPT440_DOCK,
 	ALC292_FIXUP_TPT440,
 	ALC283_FIXUP_HEADSET_MIC,
-	ALC255_FIXUP_DELL_WMI_MIC_MUTE_LED,
+	ALC255_FIXUP_MIC_MUTE_LED,
 	ALC282_FIXUP_ASPIRE_V5_PINS,
 	ALC280_FIXUP_HP_GPIO4,
 	ALC286_FIXUP_HP_GPIO_LED,
@@ -5740,7 +5737,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_mode,
 		.chained = true,
-		.chain_id = ALC255_FIXUP_DELL_WMI_MIC_MUTE_LED
+		.chain_id = ALC255_FIXUP_MIC_MUTE_LED
 	},
 	[ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC] = {
 		.type = HDA_FIXUP_FUNC,
@@ -5966,7 +5963,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_mode_alc255,
 		.chained = true,
-		.chain_id = ALC255_FIXUP_DELL_WMI_MIC_MUTE_LED
+		.chain_id = ALC255_FIXUP_MIC_MUTE_LED
 	},
 	[ALC255_FIXUP_HEADSET_MODE_NO_HP_MIC] = {
 		.type = HDA_FIXUP_FUNC,
@@ -6001,9 +5998,9 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ },
 		},
 	},
-	[ALC255_FIXUP_DELL_WMI_MIC_MUTE_LED] = {
+	[ALC255_FIXUP_MIC_MUTE_LED] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc_fixup_dell_wmi,
+		.v.func = snd_hda_gen_fixup_micmute_led,
 	},
 	[ALC282_FIXUP_ASPIRE_V5_PINS] = {
 		.type = HDA_FIXUP_PINS,
@@ -6062,7 +6059,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_mode_dell_alc288,
 		.chained = true,
-		.chain_id = ALC255_FIXUP_DELL_WMI_MIC_MUTE_LED
+		.chain_id = ALC255_FIXUP_MIC_MUTE_LED
 	},
 	[ALC288_FIXUP_DELL1_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
@@ -6719,7 +6716,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC255_FIXUP_DELL2_MIC_NO_PRESENCE, .name = "alc255-dell2"},
 	{.id = ALC293_FIXUP_DELL1_MIC_NO_PRESENCE, .name = "alc293-dell1"},
 	{.id = ALC283_FIXUP_HEADSET_MIC, .name = "alc283-headset"},
-	{.id = ALC255_FIXUP_DELL_WMI_MIC_MUTE_LED, .name = "alc255-dell-mute"},
+	{.id = ALC255_FIXUP_MIC_MUTE_LED, .name = "alc255-dell-mute"},
 	{.id = ALC282_FIXUP_ASPIRE_V5_PINS, .name = "aspire-v5"},
 	{.id = ALC280_FIXUP_HP_GPIO4, .name = "hp-gpio4"},
 	{.id = ALC286_FIXUP_HP_GPIO_LED, .name = "hp-gpio-led"},
diff --git a/sound/pci/hda/thinkpad_helper.c b/sound/pci/hda/thinkpad_helper.c
index 568575b72f2f..4089feb8c68e 100644
--- a/sound/pci/hda/thinkpad_helper.c
+++ b/sound/pci/hda/thinkpad_helper.c
@@ -3,12 +3,11 @@
  * to be included from codec driver
  */
 
-#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI) && IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
 
 #include <linux/acpi.h>
-#include <linux/thinkpad_acpi.h>
+#include <linux/leds.h>
 
-static int (*led_set_func)(int, bool);
 static void (*old_vmaster_hook)(void *, int);
 
 static bool is_thinkpad(struct hda_codec *codec)
@@ -23,50 +22,20 @@ static void update_tpacpi_mute_led(void *private_data, int enabled)
 	if (old_vmaster_hook)
 		old_vmaster_hook(private_data, enabled);
 
-	if (led_set_func)
-		led_set_func(TPACPI_LED_MUTE, !enabled);
-}
-
-static void update_tpacpi_micmute(struct hda_codec *codec)
-{
-	struct hda_gen_spec *spec = codec->spec;
-
-	led_set_func(TPACPI_LED_MICMUTE, spec->micmute_led.led_value);
+	ledtrig_audio_set(LED_AUDIO_MUTE, enabled ? LED_OFF : LED_ON);
 }
 
 static void hda_fixup_thinkpad_acpi(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	bool removefunc = false;
 
 	if (action == HDA_FIXUP_ACT_PROBE) {
 		if (!is_thinkpad(codec))
 			return;
-		if (!led_set_func)
-			led_set_func = symbol_request(tpacpi_led_set);
-		if (!led_set_func) {
-			codec_warn(codec,
-				   "Failed to find thinkpad-acpi symbol tpacpi_led_set\n");
-			return;
-		}
-
-		removefunc = true;
-		if (led_set_func(TPACPI_LED_MUTE, false) >= 0) {
-			old_vmaster_hook = spec->vmaster_mute.hook;
-			spec->vmaster_mute.hook = update_tpacpi_mute_led;
-			removefunc = false;
-		}
-		if (led_set_func(TPACPI_LED_MICMUTE, false) >= 0 &&
-		    !snd_hda_gen_add_micmute_led(codec,
-						 update_tpacpi_micmute))
-			removefunc = false;
-	}
-
-	if (led_set_func && (action == HDA_FIXUP_ACT_FREE || removefunc)) {
-		symbol_put(tpacpi_led_set);
-		led_set_func = NULL;
-		old_vmaster_hook = NULL;
+		old_vmaster_hook = spec->vmaster_mute.hook;
+		spec->vmaster_mute.hook = update_tpacpi_mute_led;
+		snd_hda_gen_fixup_micmute_led(codec, fix, action);
 	}
 }
 
-- 
2.19.1
