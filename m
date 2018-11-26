From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5/6] platform/x86: dell-laptop: Drop
	superfluous exported function
Date: Mon, 26 Nov 2018 18:11:25 +0100
Message-ID: <20181126171126.20280-6-tiwai@suse.de>
References: <20181126171126.20280-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181126171126.20280-1-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Since we've switched to the LED trigger for binding with HD-audio,
we can drop the exported function as well as the whole
linux/dell-led.h.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/dell-laptop.c | 22 +++++-----------------
 include/linux/dell-led.h           |  7 -------
 2 files changed, 5 insertions(+), 24 deletions(-)
 delete mode 100644 include/linux/dell-led.h

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 6a647e2d09ee..40236895b263 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -29,7 +29,6 @@
 #include <linux/mm.h>
 #include <linux/i8042.h>
 #include <linux/debugfs.h>
-#include <linux/dell-led.h>
 #include <linux/seq_file.h>
 #include <acpi/video.h>
 #include "dell-rbtn.h"
@@ -2109,17 +2108,17 @@ static struct notifier_block dell_laptop_notifier = {
 	.notifier_call = dell_laptop_notifier_call,
 };
 
-int dell_micmute_led_set(int state)
+static int micmute_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
 {
 	struct calling_interface_buffer buffer;
 	struct calling_interface_token *token;
+	int state = brightness != LED_OFF;
 
 	if (state == 0)
 		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE);
-	else if (state == 1)
-		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE);
 	else
-		return -EINVAL;
+		token = dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE);
 
 	if (!token)
 		return -ENODEV;
@@ -2127,18 +2126,7 @@ int dell_micmute_led_set(int state)
 	dell_fill_request(&buffer, token->location, token->value, 0, 0);
 	dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
 
-	return state;
-}
-EXPORT_SYMBOL_GPL(dell_micmute_led_set);
-
-static int micmute_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness brightness)
-{
-	int state = brightness != LED_OFF;
-	int err;
-
-	err = dell_micmute_led_set(state);
-	return err < 0 ? err : 0;
+	return 0;
 }
 
 static struct led_classdev micmute_led_cdev = {
diff --git a/include/linux/dell-led.h b/include/linux/dell-led.h
deleted file mode 100644
index 92521471517f..000000000000
--- a/include/linux/dell-led.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DELL_LED_H__
-#define __DELL_LED_H__
-
-int dell_micmute_led_set(int on);
-
-#endif
-- 
2.19.1
