From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 33/51] leds: cobalt-raq: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:19 +0200
Message-ID: <1437122857-6765-34-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
ops. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-cobalt-raq.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index b316df4..c46b856 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -52,6 +52,7 @@ static void raq_web_led_set(struct led_classdev *led_cdev,
 static struct led_classdev raq_web_led = {
 	.name		= "raq::web",
 	.brightness_set	= raq_web_led_set,
+	.flags		= LED_BRIGHTNESS_FAST,
 };
 
 static void raq_power_off_led_set(struct led_classdev *led_cdev,
@@ -74,6 +75,7 @@ static struct led_classdev raq_power_off_led = {
 	.name			= "raq::power-off",
 	.brightness_set		= raq_power_off_led_set,
 	.default_trigger	= "power-off",
+	.flags			= LED_BRIGHTNESS_FAST,
 };
 
 static int cobalt_raq_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
