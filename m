From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 3/3] ARM: s3c24xx: Use the panic LED trigger for GTA02
Date: Tue, 29 Mar 2016 17:35:49 -0300
Message-ID: <1459283749-22451-4-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1459283749-22451-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:35458 "EHLO
	mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754280AbcC2UgP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Mar 2016 16:36:15 -0400
Received: by mail-qk0-f178.google.com with SMTP id o6so11438337qkc.2
        for <linux-leds@vger.kernel.org>; Tue, 29 Mar 2016 13:36:14 -0700 (PDT)
In-Reply-To: <1459283749-22451-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Richard Purdie <rpurdie@rpsys.net>, kgene@kernel.org, k.kozlowski@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Let's take advantage of the recently introduced panic LED trigger,
and get rid of the open-coded panic_blink usage.

Built tested only.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 arch/arm/mach-s3c24xx/mach-gta02.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 27ae6877550f..e794d55abc9e 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -71,6 +71,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <linux/platform_data/usb-ohci-s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <linux/platform_data/leds-s3c24xx.h>
 
 #include <mach/fb.h>
 #include <mach/hardware.h>
@@ -89,22 +90,6 @@
 
 static struct pcf50633 *gta02_pcf;
 
-/*
- * This gets called frequently when we paniced.
- */
-
-static long gta02_panic_blink(int state)
-{
-	long delay = 0;
-	char led;
-
-	led = (state) ? 1 : 0;
-	gpio_direction_output(GTA02_GPIO_AUX_LED, led);
-
-	return delay;
-}
-
-
 static struct map_desc gta02_iodesc[] __initdata = {
 	{
 		.virtual	= 0xe0000000,
@@ -500,6 +485,20 @@ static struct platform_device gta02_buttons_device = {
 	},
 };
 
+static struct s3c24xx_led_platdata gta02_panic_led_pdata = {
+	.name = "panic",
+	.gpio = GTA02_GPIO_AUX_LED,
+	.def_trigger = "panic",
+};
+
+static struct platform_device gta02_panic_led_device = {
+	.name = "s3c24xx_led",
+	.id = -1,
+	.dev = {
+		.platform_data = &gta02_panic_led_pdata,
+	},
+};
+
 static void __init gta02_map_io(void)
 {
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
@@ -563,9 +562,7 @@ static void gta02_poweroff(void)
 
 static void __init gta02_machine_init(void)
 {
-	/* Set the panic callback to turn AUX LED on or off. */
-	panic_blink = gta02_panic_blink;
-
+	platform_device_register(&gta02_panic_led_device);
 	s3c_pm_init();
 
 #ifdef CONFIG_CHARGER_PCF50633
-- 
2.7.0
