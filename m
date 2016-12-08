From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 5/7] dell-laptop: import dell_micmute_led_set() from drivers/leds/dell-led.c
Date: Thu,  8 Dec 2016 13:36:16 +0100
Message-ID: <20161208123618.28603-6-kernel@kempniu.pl>
References: <20161208123618.28603-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161208123618.28603-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

To ensure all users of dell-smbios are in drivers/platform/x86, move the
dell_micmute_led_set() method from drivers/leds/dell-led.c to
drivers/platform/x86/dell-laptop.c.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/leds/dell-led.c            | 29 -----------------------------
 drivers/platform/x86/dell-laptop.c | 28 ++++++++++++++++++++++++++++
 sound/pci/hda/dell_wmi_helper.c    |  6 +++---
 3 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index f9002d9..c9cc36a 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -16,7 +16,6 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/dmi.h>
-#include <linux/dell-led.h>
 #include "../platform/x86/dell-smbios.h"
 
 MODULE_AUTHOR("Louis Davis/Jim Dailey");
@@ -43,34 +42,6 @@ MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
 #define CMD_LED_OFF	17
 #define CMD_LED_BLINK	18
 
-#define GLOBAL_MIC_MUTE_ENABLE	0x364
-#define GLOBAL_MIC_MUTE_DISABLE	0x365
-
-int dell_micmute_led_set(int state)
-{
-	struct calling_interface_buffer *buffer;
-	struct calling_interface_token *token;
-
-	if (state == 0)
-		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
-	else if (state == 1)
-		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE);
-	else
-		return -EINVAL;
-
-	if (!token)
-		return -ENODEV;
-
-	buffer = dell_smbios_get_buffer();
-	buffer->input[0] = token->location;
-	buffer->input[1] = token->value;
-	dell_smbios_send_request(1, 0);
-	dell_smbios_release_buffer();
-
-	return state;
-}
-EXPORT_SYMBOL_GPL(dell_micmute_led_set);
-
 struct bios_args {
 	unsigned char length;
 	unsigned char result_code;
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2c2f02b..277656c 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -30,6 +30,7 @@
 #include <linux/i8042.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/dell-led.h>
 #include <acpi/video.h>
 #include "dell-rbtn.h"
 #include "dell-smbios.h"
@@ -42,6 +43,8 @@
 #define KBD_LED_AUTO_50_TOKEN 0x02EB
 #define KBD_LED_AUTO_75_TOKEN 0x02EC
 #define KBD_LED_AUTO_100_TOKEN 0x02F6
+#define GLOBAL_MIC_MUTE_ENABLE 0x364
+#define GLOBAL_MIC_MUTE_DISABLE 0x365
 
 struct quirk_entry {
 	u8 touchpad_led;
@@ -1970,6 +1973,31 @@ static void kbd_led_exit(void)
 	led_classdev_unregister(&kbd_led);
 }
 
+int dell_micmute_led_set(int state)
+{
+	struct calling_interface_buffer *buffer;
+	struct calling_interface_token *token;
+
+	if (state == 0)
+		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
+	else if (state == 1)
+		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE);
+	else
+		return -EINVAL;
+
+	if (!token)
+		return -ENODEV;
+
+	buffer = dell_smbios_get_buffer();
+	buffer->input[0] = token->location;
+	buffer->input[1] = token->value;
+	dell_smbios_send_request(1, 0);
+	dell_smbios_release_buffer();
+
+	return state;
+}
+EXPORT_SYMBOL_GPL(dell_micmute_led_set);
+
 static int __init dell_init(void)
 {
 	struct calling_interface_buffer *buffer;
diff --git a/sound/pci/hda/dell_wmi_helper.c b/sound/pci/hda/dell_wmi_helper.c
index e128c80..7983d61 100644
--- a/sound/pci/hda/dell_wmi_helper.c
+++ b/sound/pci/hda/dell_wmi_helper.c
@@ -2,7 +2,7 @@
  * to be included from codec driver
  */
 
-#if IS_ENABLED(CONFIG_LEDS_DELL_NETBOOKS)
+#if IS_ENABLED(CONFIG_DELL_LAPTOP)
 #include <linux/dell-led.h>
 
 static int dell_led_value;
@@ -67,10 +67,10 @@ static void alc_fixup_dell_wmi(struct hda_codec *codec,
 	}
 }
 
-#else /* CONFIG_LEDS_DELL_NETBOOKS */
+#else /* CONFIG_DELL_LAPTOP */
 static void alc_fixup_dell_wmi(struct hda_codec *codec,
 			       const struct hda_fixup *fix, int action)
 {
 }
 
-#endif /* CONFIG_LEDS_DELL_NETBOOKS */
+#endif /* CONFIG_DELL_LAPTOP */
-- 
2.10.2
