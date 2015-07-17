From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 41/51] leds: wrap: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:27 +0200
Message-ID: <1437122857-6765-42-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Kristian Kielhofner <kris@krisk.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Kristian Kielhofner <kris@krisk.org>
---
 drivers/leds/leds-wrap.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 1ba3def..dfc9e73 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -57,19 +57,19 @@ static struct led_classdev wrap_power_led = {
 	.name			= "wrap::power",
 	.brightness_set		= wrap_power_led_set,
 	.default_trigger	= "default-on",
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev wrap_error_led = {
 	.name		= "wrap::error",
 	.brightness_set	= wrap_error_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev wrap_extra_led = {
 	.name           = "wrap::extra",
 	.brightness_set = wrap_extra_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static int wrap_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
