From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 42/51] leds: net48xx: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:28 +0200
Message-ID: <1437122857-6765-43-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Chris Boot <bootc@bootc.net>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Chris Boot <bootc@bootc.net>
---
 drivers/leds/leds-net48xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index ec3a2e8..8644341 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -34,7 +34,7 @@ static void net48xx_error_led_set(struct led_classdev *led_cdev,
 static struct led_classdev net48xx_error_led = {
 	.name		= "net48xx::error",
 	.brightness_set	= net48xx_error_led_set,
-	.flags		= LED_CORE_SUSPENDRESUME,
+	.flags		= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static int net48xx_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
