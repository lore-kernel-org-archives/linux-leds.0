From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: ledtrig-ide-disk: Move ide_blink_delay to
 ledtrig_ide_activity()
Date: Mon, 18 Apr 2016 16:40:46 +0200
Message-ID: <1460990446-24700-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43988 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751174AbcDROlG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Apr 2016 10:41:06 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, rpurdie@rpsys.net, boris.brezillon@free-electrons.com, ezequiel@vanguardiasur.com.ar, pavel@ucw.cz, Jacek Anaszewski <j.anaszewski@samsung.com>

Parameters delay_on and delay_off of led_trigger_blink_oneshot()
are pointers, to enable blink interval adjustment by LED class drivers
of the controllers that implement hardware blinking.

Move ide_blink_delay variable to ledtrig_ide_activity() in order to
prevent the situation when adjustment committed by one LED class
driver influences blink interval of the software fallback blink feature,
that is applied to the drivers that don't implement blink_set op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/trigger/ledtrig-ide-disk.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-ide-disk.c b/drivers/leds/trigger/ledtrig-ide-disk.c
index c02a3ac..15123d3 100644
--- a/drivers/leds/trigger/ledtrig-ide-disk.c
+++ b/drivers/leds/trigger/ledtrig-ide-disk.c
@@ -18,10 +18,11 @@
 #define BLINK_DELAY 30
 
 DEFINE_LED_TRIGGER(ledtrig_ide);
-static unsigned long ide_blink_delay = BLINK_DELAY;
 
 void ledtrig_ide_activity(void)
 {
+	unsigned long ide_blink_delay = BLINK_DELAY;
+
 	led_trigger_blink_oneshot(ledtrig_ide,
 				  &ide_blink_delay, &ide_blink_delay, 0);
 }
-- 
1.7.9.5
