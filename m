From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 54/57] leds: rb532: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:07 +0200
Message-ID: <1439285890-27329-55-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Phil Sutter <n0-1@freewrt.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Phil Sutter <n0-1@freewrt.org>
---
 drivers/leds/leds-rb532.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index fcd1215b..67e220f 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -31,10 +31,10 @@ static enum led_brightness rb532_led_get(struct led_classdev *cdev)
 }
 
 static struct led_classdev rb532_uled = {
-	.name = "uled",
-	.brightness_set = rb532_led_set,
-	.brightness_get = rb532_led_get,
-	.default_trigger = "nand-disk",
+	.name				= "uled",
+	.brightness_set_nonblocking	= rb532_led_set,
+	.brightness_get			= rb532_led_get,
+	.default_trigger		= "nand-disk",
 };
 
 static int rb532_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
