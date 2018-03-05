From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: [PATCH] leds: fix wrong dmi_match on PC Engines APU LEDs
Date: Mon,  5 Mar 2018 18:09:10 +0100
Message-ID: <20180305170910.8905-1-ulli.kroll@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Mizrahi <alan@mizrahi.com.ve>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>
List-Id: linux-leds@vger.kernel.org

APU has compared to APU2 no DMI_BOARD_NAME.
Use DMI_PRODUCT_NAME instead.

Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
---
 drivers/leds/leds-apu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 74820aab9497..5bbf5c31413e 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -206,7 +206,7 @@ static int __init apu_led_probe(struct platform_device *pdev)
 
 	apu_led->pdev = pdev;
 
-	if (dmi_match(DMI_BOARD_NAME, "APU")) {
+	if (dmi_match(DMI_PRODUCT_NAME, "APU")) {
 		apu_led->profile = apu1_led_profile;
 		apu_led->platform = APU1_LED_PLATFORM;
 		apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
-- 
2.16.2
