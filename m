From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 6/6] platform/x86: thinkpad_acpi: Drop
 superfluous exported function
Date: Mon, 26 Nov 2018 18:11:26 +0100
Message-ID: <20181126171126.20280-7-tiwai@suse.de>
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

Since we've switched to the LED trigger for binding with HD-audio,
we can drop the exported function as well as the whole
linux/thinkpad_acpi.h.

The own TPACPI_LED_MUTE and TPACPI_LED_MICMUTE definitions are
replaced with the identical ones for LEDS, i.e. LED_AUDIO_MUTE and
LED_AUDIO_MICMUTE, respectively.  They are no longer needed as
referred only locally.

Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 30 ++++++++++------------------
 include/linux/thinkpad_acpi.h        | 16 ---------------
 2 files changed, 11 insertions(+), 35 deletions(-)
 delete mode 100644 include/linux/thinkpad_acpi.h

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3c09afae1248..0113873dfd13 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -81,7 +81,6 @@
 #include <linux/acpi.h>
 #include <linux/pci_ids.h>
 #include <linux/power_supply.h>
-#include <linux/thinkpad_acpi.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/initval.h>
@@ -9150,6 +9149,7 @@ static struct ibm_struct fan_driver_data = {
  * Mute LED subdriver
  */
 
+#define TPACPI_LED_MAX		2
 
 struct tp_led_table {
 	acpi_string name;
@@ -9158,13 +9158,13 @@ struct tp_led_table {
 	int state;
 };
 
-static struct tp_led_table led_tables[] = {
-	[TPACPI_LED_MUTE] = {
+static struct tp_led_table led_tables[TPACPI_LED_MAX] = {
+	[LED_AUDIO_MUTE] = {
 		.name = "SSMS",
 		.on_value = 1,
 		.off_value = 0,
 	},
-	[TPACPI_LED_MICMUTE] = {
+	[LED_AUDIO_MICMUTE] = {
 		.name = "MMTS",
 		.on_value = 2,
 		.off_value = 0,
@@ -9189,40 +9189,36 @@ static int mute_led_on_off(struct tp_led_table *t, bool state)
 	return state;
 }
 
-int tpacpi_led_set(int whichled, bool on)
+static int tpacpi_led_set(int whichled, bool on)
 {
 	struct tp_led_table *t;
 
-	if (whichled < 0 || whichled >= TPACPI_LED_MAX)
-		return -EINVAL;
-
 	t = &led_tables[whichled];
 	if (t->state < 0 || t->state == on)
 		return t->state;
 	return mute_led_on_off(t, on);
 }
-EXPORT_SYMBOL_GPL(tpacpi_led_set);
 
 static int tpacpi_led_mute_set(struct led_classdev *led_cdev,
 			       enum led_brightness brightness)
 {
-	return tpacpi_led_set(TPACPI_LED_MUTE, brightness != LED_OFF);
+	return tpacpi_led_set(LED_AUDIO_MUTE, brightness != LED_OFF);
 }
 
 static int tpacpi_led_micmute_set(struct led_classdev *led_cdev,
 				  enum led_brightness brightness)
 {
-	return tpacpi_led_set(TPACPI_LED_MICMUTE, brightness != LED_OFF);
+	return tpacpi_led_set(LED_AUDIO_MICMUTE, brightness != LED_OFF);
 }
 
-static struct led_classdev mute_led_cdev[] = {
-	[TPACPI_LED_MUTE] = {
+static struct led_classdev mute_led_cdev[TPACPI_LED_MAX] = {
+	[LED_AUDIO_MUTE] = {
 		.name		= "tpacpi::mute",
 		.max_brightness = 1,
 		.brightness_set_blocking = tpacpi_led_mute_set,
 		.default_trigger = "audio-mute",
 	},
-	[TPACPI_LED_MICMUTE] = {
+	[LED_AUDIO_MICMUTE] = {
 		.name		= "tpacpi::micmute",
 		.max_brightness = 1,
 		.brightness_set_blocking = tpacpi_led_micmute_set,
@@ -9232,10 +9228,6 @@ static struct led_classdev mute_led_cdev[] = {
 
 static int mute_led_init(struct ibm_init_struct *iibm)
 {
-	static enum led_audio types[] = {
-		[TPACPI_LED_MUTE] = LED_AUDIO_MUTE,
-		[TPACPI_LED_MICMUTE] = LED_AUDIO_MICMUTE,
-	};
 	acpi_handle temp;
 	int i, err;
 
@@ -9246,7 +9238,7 @@ static int mute_led_init(struct ibm_init_struct *iibm)
 			continue;
 		}
 
-		mute_led_cdev[i].brightness = ledtrig_audio_get(types[i]);
+		mute_led_cdev[i].brightness = ledtrig_audio_get(i);
 		err = led_classdev_register(&tpacpi_pdev->dev, &mute_led_cdev[i]);
 		if (err < 0) {
 			while (--i >= 0)
diff --git a/include/linux/thinkpad_acpi.h b/include/linux/thinkpad_acpi.h
deleted file mode 100644
index 9fb317970c01..000000000000
--- a/include/linux/thinkpad_acpi.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __THINKPAD_ACPI_H__
-#define __THINKPAD_ACPI_H__
-
-/* These two functions return 0 if success, or negative error code
-   (e g -ENODEV if no led present) */
-
-enum {
-	TPACPI_LED_MUTE,
-	TPACPI_LED_MICMUTE,
-	TPACPI_LED_MAX,
-};
-
-int tpacpi_led_set(int whichled, bool on);
-
-#endif
-- 
2.19.1
