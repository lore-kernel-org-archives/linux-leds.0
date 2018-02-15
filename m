From: Timothy Redaelli <tredaelli@redhat.com>
Subject: [PATCH] leds: Add more product/board names for PC Engines APU2
Date: Thu, 15 Feb 2018 11:21:36 +0100
Message-ID: <416353feea21248a8e3de5a91c5349a4e9047519.1518690096.git.tredaelli@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41304 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755223AbeBOKVt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 15 Feb 2018 05:21:49 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

PC Engines "legacy" coreboot 4.0.8 changed the product/board name from "APU2"
to "apu2".
PC Engines "mainline" coreboot uses, instead, "PC Engines apu2" as
product/board name.

This commit adds the 2 variants ("apu2" and "PC Engines apu2") of product/board
name to be compatible with all the APU2 BIOSes.

Fixes: 3faee9423ce0 ("leds: Add driver for PC Engines APU/APU2 LEDs")
Signed-off-by: Timothy Redaelli <tredaelli@redhat.com>
---
 drivers/leds/leds-apu.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 74820aab9497..311e98b1823f 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -110,6 +110,7 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
 		}
 	},
+	/* PC Engines APU2 with "Legacy" bios < 4.0.8 */
 	{
 		.ident = "apu2",
 		.matches = {
@@ -117,6 +118,22 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "APU2")
 		}
 	},
+	/* PC Engines APU2 with "Legacy" bios >= 4.0.8 */
+	{
+		.ident = "apu2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "apu2")
+		}
+	},
+	/* PC Engines APU2 with "Mainline" bios */
+	{
+		.ident = "apu2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu2")
+		}
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
@@ -211,7 +228,9 @@ static int __init apu_led_probe(struct platform_device *pdev)
 		apu_led->platform = APU1_LED_PLATFORM;
 		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
 		apu_led->iosize = APU1_IOSIZE;
-	} else if (dmi_match(DMI_BOARD_NAME, "APU2")) {
+	} else if (dmi_match(DMI_BOARD_NAME, "APU2") ||
+		   dmi_match(DMI_BOARD_NAME, "apu2") ||
+		   dmi_match(DMI_BOARD_NAME, "PC Engines apu2")) {
 		apu_led->profile = apu2_led_profile;
 		apu_led->platform = APU2_LED_PLATFORM;
 		apu_led->num_led_instances = ARRAY_SIZE(apu2_led_profile);
@@ -237,7 +256,10 @@ static int __init apu_led_init(void)
 		pr_err("No PC Engines board detected\n");
 		return -ENODEV;
 	}
-	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "APU2"))) {
+	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") ||
+	      dmi_match(DMI_PRODUCT_NAME, "APU2") ||
+	      dmi_match(DMI_PRODUCT_NAME, "apu2") ||
+	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2"))) {
 		pr_err("Unknown PC Engines board: %s\n",
 				dmi_get_system_info(DMI_PRODUCT_NAME));
 		return -ENODEV;
-- 
2.14.3
