From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 52/57] leds: locomo: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:05 +0200
Message-ID: <1439285890-27329-53-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, John Lenz <lenz@cs.wisc.edu>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: John Lenz <lenz@cs.wisc.edu>
---
 drivers/leds/leds-locomo.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
index 80ba048..2de7063 100644
--- a/drivers/leds/leds-locomo.c
+++ b/drivers/leds/leds-locomo.c
@@ -44,15 +44,15 @@ static void locomoled_brightness_set1(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev locomo_led0 = {
-	.name			= "locomo:amber:charge",
-	.default_trigger	= "main-battery-charging",
-	.brightness_set		= locomoled_brightness_set0,
+	.name				= "locomo:amber:charge",
+	.default_trigger		= "main-battery-charging",
+	.brightness_set_nonblocking	= locomoled_brightness_set0,
 };
 
 static struct led_classdev locomo_led1 = {
-	.name			= "locomo:green:mail",
-	.default_trigger	= "nand-disk",
-	.brightness_set		= locomoled_brightness_set1,
+	.name				= "locomo:green:mail",
+	.default_trigger		= "nand-disk",
+	.brightness_set_nonblocking	= locomoled_brightness_set1,
 };
 
 static int locomoled_probe(struct locomo_dev *ldev)
-- 
1.7.9.5
