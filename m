From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/7] ALSA: hda - use dell_micmute_led_set() instead of dell_app_wmi_led_set()
Date: Thu,  8 Dec 2016 13:36:14 +0100
Message-ID: <20161208123618.28603-4-kernel@kempniu.pl>
References: <20161208123618.28603-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33113 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753728AbcLHMhK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Dec 2016 07:37:10 -0500
Received: by mail-wm0-f68.google.com with SMTP id u144so3324776wmu.0
        for <linux-leds@vger.kernel.org>; Thu, 08 Dec 2016 04:37:10 -0800 (PST)
In-Reply-To: <20161208123618.28603-1-kernel@kempniu.pl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

When the dell_app_wmi_led_set() method was introduced in db6d8cc
("dell-led: add mic mute led interface"), it was implemented as an
easily extensible entry point for other modules to set the state of
various LEDs.  However, almost three years later it is still only used
to control the mic mute LED, so it will be replaced with direct calls to
dell_micmute_led_set().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 sound/pci/hda/dell_wmi_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/dell_wmi_helper.c b/sound/pci/hda/dell_wmi_helper.c
index 19d41da..e128c80 100644
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
2.10.2
