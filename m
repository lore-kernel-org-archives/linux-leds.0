From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/7] dell-led: remove dell_app_wmi_led_set()
Date: Thu,  8 Dec 2016 13:36:15 +0100
Message-ID: <20161208123618.28603-5-kernel@kempniu.pl>
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

All calls to dell_app_wmi_led_set() have been replaced with direct calls
to dell_micmute_led_set(), so the former can be safely removed along
with its related enum.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/leds/dell-led.c  | 17 -----------------
 include/linux/dell-led.h |  5 -----
 2 files changed, 22 deletions(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index b215248..f9002d9 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -71,23 +71,6 @@ int dell_micmute_led_set(int state)
 }
 EXPORT_SYMBOL_GPL(dell_micmute_led_set);
 
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
-
 struct bios_args {
 	unsigned char length;
 	unsigned char result_code;
diff --git a/include/linux/dell-led.h b/include/linux/dell-led.h
index 1b03275..3f033c4 100644
--- a/include/linux/dell-led.h
+++ b/include/linux/dell-led.h
@@ -1,11 +1,6 @@
 #ifndef __DELL_LED_H__
 #define __DELL_LED_H__
 
-enum {
-	DELL_LED_MICMUTE,
-};
-
 int dell_micmute_led_set(int on);
-int dell_app_wmi_led_set(int whichled, int on);
 
 #endif
-- 
2.10.2
