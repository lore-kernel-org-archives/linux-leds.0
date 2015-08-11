From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 46/57] leds: wrap: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:59 +0200
Message-ID: <1439285890-27329-47-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Kristian Kielhofner <kris@krisk.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Kristian Kielhofner <kris@krisk.org>
---
 drivers/leds/leds-wrap.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 1ba3def..aea72e2 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -54,22 +54,22 @@ static void wrap_extra_led_set(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev wrap_power_led = {
-	.name			= "wrap::power",
-	.brightness_set		= wrap_power_led_set,
-	.default_trigger	= "default-on",
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "wrap::power",
+	.brightness_set_nonblocking	= wrap_power_led_set,
+	.default_trigger		= "default-on",
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev wrap_error_led = {
-	.name		= "wrap::error",
-	.brightness_set	= wrap_error_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "wrap::error",
+	.brightness_set_nonblocking	= wrap_error_led_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev wrap_extra_led = {
-	.name           = "wrap::extra",
-	.brightness_set = wrap_extra_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "wrap::extra",
+	.brightness_set_nonblocking	= wrap_extra_led_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static int wrap_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
