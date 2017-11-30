From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/trivial] ledtrig-activity: Grammar s/a immediate/an immediate/
Date: Thu, 30 Nov 2017 14:36:41 +0100
Message-ID: <1512049001-19669-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:34948 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752347AbdK3Ngo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 08:36:44 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Willy Tarreau <w@1wt.eu>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Fixes: 7df4f9a9f0667ee6 ("leds: ledtrig-activity: Add a system activity LED trigger")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/leds/trigger/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index bb090216b4dc338d..6dac48c457d17ca5 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -81,7 +81,7 @@ config LEDS_TRIGGER_ACTIVITY
 	tristate "LED activity Trigger"
 	depends on LEDS_TRIGGERS
 	help
-	  This allows LEDs to be controlled by a immediate CPU usage.
+	  This allows LEDs to be controlled by an immediate CPU usage.
 	  The flash frequency and duty cycle varies from faint flashes to
 	  intense brightness depending on the instant CPU load.
 	  If unsure, say N.
-- 
2.7.4
