From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 51/57] leds: hp6xx: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:04 +0200
Message-ID: <1439285890-27329-52-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
---
 drivers/leds/leds-hp6xx.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
index 0b84c01..5848e2b 100644
--- a/drivers/leds/leds-hp6xx.c
+++ b/drivers/leds/leds-hp6xx.c
@@ -42,17 +42,17 @@ static void hp6xxled_red_set(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev hp6xx_red_led = {
-	.name			= "hp6xx:red",
-	.default_trigger	= "hp6xx-charge",
-	.brightness_set		= hp6xxled_red_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "hp6xx:red",
+	.default_trigger		= "hp6xx-charge",
+	.brightness_set_nonblocking	= hp6xxled_red_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev hp6xx_green_led = {
-	.name			= "hp6xx:green",
-	.default_trigger	= "ide-disk",
-	.brightness_set		= hp6xxled_green_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "hp6xx:green",
+	.default_trigger		= "ide-disk",
+	.brightness_set_nonblocking	= hp6xxled_green_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static int hp6xxled_probe(struct platform_device *pdev)
-- 
1.7.9.5
