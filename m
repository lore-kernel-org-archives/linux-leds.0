From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 5/7] dell-led: remove code related to mic mute LED
Date: Fri, 17 Feb 2017 08:57:51 +0100
Message-ID: <20170217075753.12702-6-kernel@kempniu.pl>
References: <20170217075753.12702-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170217075753.12702-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Alex Hung <alex.hung@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

With dell_micmute_led_set() moved to drivers/platform/x86/dell-laptop.c,
all remnants of the mic mute LED handling code can be removed from
drivers/leds/dell-led.c, restoring it back to the state it was in before
commit db6d8cc00773 ("dell-led: add mic mute led interface").

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
Tested-by: Alex Hung <alex.hung@canonical.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/leds/Kconfig    |  1 -
 drivers/leds/dell-led.c | 25 +++++++------------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 275f467956ee..8d1b4c9b3bda 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -467,7 +467,6 @@ config LEDS_DELL_NETBOOKS
 	tristate "External LED on Dell Business Netbooks"
 	depends on LEDS_CLASS
 	depends on X86 && ACPI_WMI
-	depends on DELL_SMBIOS
 	help
 	  This adds support for the Latitude 2100 and similar
 	  notebooks that have an external LED.
diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index c9cc36a7c890..e5c57389efd6 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -15,15 +15,12 @@
 #include <linux/leds.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/dmi.h>
-#include "../platform/x86/dell-smbios.h"
 
 MODULE_AUTHOR("Louis Davis/Jim Dailey");
 MODULE_DESCRIPTION("Dell LED Control Driver");
 MODULE_LICENSE("GPL");
 
 #define DELL_LED_BIOS_GUID "F6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396"
-#define DELL_APP_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
 MODULE_ALIAS("wmi:" DELL_LED_BIOS_GUID);
 
 /* Error Result Codes: */
@@ -184,29 +181,21 @@ static int __init dell_led_init(void)
 {
 	int error = 0;
 
-	if (!wmi_has_guid(DELL_LED_BIOS_GUID) && !wmi_has_guid(DELL_APP_GUID))
+	if (!wmi_has_guid(DELL_LED_BIOS_GUID))
 		return -ENODEV;
 
-	if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
-		error = led_off();
-		if (error != 0)
-			return -ENODEV;
-
-		error = led_classdev_register(NULL, &dell_led);
-	}
+	error = led_off();
+	if (error != 0)
+		return -ENODEV;
 
-	return error;
+	return led_classdev_register(NULL, &dell_led);
 }
 
 static void __exit dell_led_exit(void)
 {
-	int error = 0;
+	led_classdev_unregister(&dell_led);
 
-	if (wmi_has_guid(DELL_LED_BIOS_GUID)) {
-		error = led_off();
-		if (error == 0)
-			led_classdev_unregister(&dell_led);
-	}
+	led_off();
 }
 
 module_init(dell_led_init);
-- 
2.11.1
