From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 47/51] leds: locomo: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:33 +0200
Message-ID: <1437122857-6765-48-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, John Lenz <lenz@cs.wisc.edu>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: John Lenz <lenz@cs.wisc.edu>
---
 drivers/leds/leds-locomo.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
index 80ba048..a6dc039 100644
--- a/drivers/leds/leds-locomo.c
+++ b/drivers/leds/leds-locomo.c
@@ -47,12 +47,14 @@ static struct led_classdev locomo_led0 = {
 	.name			= "locomo:amber:charge",
 	.default_trigger	= "main-battery-charging",
 	.brightness_set		= locomoled_brightness_set0,
+	.flags			= LED_BRIGHTESS_FAST,
 };
 
 static struct led_classdev locomo_led1 = {
 	.name			= "locomo:green:mail",
 	.default_trigger	= "nand-disk",
 	.brightness_set		= locomoled_brightness_set1,
+	.flags			= LED_BRIGHTESS_FAST,
 };
 
 static int locomoled_probe(struct locomo_dev *ldev)
-- 
1.7.9.5
