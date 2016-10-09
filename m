From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH] leds: leds-mc13783: Fix MC13892 keypad led access
Date: Sun,  9 Oct 2016 15:37:47 +0200
Message-ID: <1476020267-17178-1-git-send-email-akurz@blala.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vs81.iboxed.net ([185.82.85.146]:44717 "EHLO vs81.iboxed.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751130AbcJINuT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 9 Oct 2016 09:50:19 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, Alexander Kurz <akurz@blala.de>

Fix the register access shift argument calculation introduced with
commit a59ce6584d56 ("leds: leds-mc13783: Add MC34708 LED support")
and re-enable access to the "keypad" led for MC13892 MFC devices.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/leds/leds-mc13783.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index a2e4c17..2421cf10 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -84,8 +84,9 @@ static int mc13xxx_led_set(struct led_classdev *led_cdev,
 	case MC13892_LED_MD:
 	case MC13892_LED_AD:
 	case MC13892_LED_KP:
-		reg = (led->id - MC13892_LED_MD) / 2;
-		shift = 3 + (led->id - MC13892_LED_MD) * 12;
+		off = led->id - MC13892_LED_MD;
+		reg = off / 2;
+		shift = 3 + (off - reg * 2) * 12;
 		break;
 	case MC13892_LED_R:
 	case MC13892_LED_G:
-- 
2.1.4
