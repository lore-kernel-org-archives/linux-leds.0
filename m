From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 46/51] leds: hp6xx: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:32 +0200
Message-ID: <1437122857-6765-47-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 drivers/leds/leds-hp6xx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
index 0b84c01..8f369fb 100644
--- a/drivers/leds/leds-hp6xx.c
+++ b/drivers/leds/leds-hp6xx.c
@@ -45,14 +45,14 @@ static struct led_classdev hp6xx_red_led = {
 	.name			= "hp6xx:red",
 	.default_trigger	= "hp6xx-charge",
 	.brightness_set		= hp6xxled_red_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev hp6xx_green_led = {
 	.name			= "hp6xx:green",
 	.default_trigger	= "ide-disk",
 	.brightness_set		= hp6xxled_green_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static int hp6xxled_probe(struct platform_device *pdev)
-- 
1.7.9.5
