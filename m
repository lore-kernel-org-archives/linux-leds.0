From: Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH] leds: add APU3 dmi information to leds-apu
Date: Mon, 30 Jul 2018 11:11:08 +0200
Message-ID: <20180730091108.30098-1-fe@dev.tdt.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Eckert.Florian@googlemail.com
List-Id: linux-leds@vger.kernel.org

This driver should also get loaded if this is a APU3 from PC Engines.
It has the same pin layout for leds.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/leds/leds-apu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 8c93d68964c7..1ed1c5a5dc77 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -134,6 +134,14 @@ static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu2")
 		}
 	},
+	/* PC Engines APU3 with "Legancy" bios >= 4.0.7 */
+	{
+		.ident = "apu3",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "APU3")
+		}
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
@@ -229,6 +237,7 @@ static int __init apu_led_probe(struct platform_device *pdev)
 		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
 		apu_led->iosize = APU1_IOSIZE;
 	} else if (dmi_match(DMI_BOARD_NAME, "APU2") ||
+		   dmi_match(DMI_BOARD_NAME, "APU3") ||
 		   dmi_match(DMI_BOARD_NAME, "apu2") ||
 		   dmi_match(DMI_BOARD_NAME, "PC Engines apu2")) {
 		apu_led->profile = apu2_led_profile;
@@ -258,6 +267,7 @@ static int __init apu_led_init(void)
 	}
 	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") ||
 	      dmi_match(DMI_PRODUCT_NAME, "APU2") ||
+	      dmi_match(DMI_PRODUCT_NAME, "APU3") ||
 	      dmi_match(DMI_PRODUCT_NAME, "apu2") ||
 	      dmi_match(DMI_PRODUCT_NAME, "PC Engines apu2"))) {
 		pr_err("Unknown PC Engines board: %s\n",
-- 
2.11.0
