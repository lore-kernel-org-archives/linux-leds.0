From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/7] dell-led: export dell_micmute_led_set()
Date: Thu,  8 Dec 2016 13:36:13 +0100
Message-ID: <20161208123618.28603-3-kernel@kempniu.pl>
References: <20161208123618.28603-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:34487 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753715AbcLHMhJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Dec 2016 07:37:09 -0500
Received: by mail-wj0-f193.google.com with SMTP id xy5so54263698wjc.1
        for <linux-leds@vger.kernel.org>; Thu, 08 Dec 2016 04:37:08 -0800 (PST)
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
dell_micmute_led_set().  For this to be possible, dell_micmute_led_set()
has to be exported first.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/leds/dell-led.c  | 3 ++-
 include/linux/dell-led.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index e8e8f67..b215248 100644
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
@@ -69,6 +69,7 @@ static int dell_micmute_led_set(int state)
 
 	return state;
 }
+EXPORT_SYMBOL_GPL(dell_micmute_led_set);
 
 int dell_app_wmi_led_set(int whichled, int on)
 {
diff --git a/include/linux/dell-led.h b/include/linux/dell-led.h
index 7009b8b..1b03275 100644
--- a/include/linux/dell-led.h
+++ b/include/linux/dell-led.h
@@ -5,6 +5,7 @@ enum {
 	DELL_LED_MICMUTE,
 };
 
+int dell_micmute_led_set(int on);
 int dell_app_wmi_led_set(int whichled, int on);
 
 #endif
-- 
2.10.2
