From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 38/57] leds: cobalt-raq: Use brightness_set_nonblocking
 op
Date: Tue, 11 Aug 2015 11:37:51 +0200
Message-ID: <1439285890-27329-39-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set ops.
Use a new brightness_set_nonblocking op for setting brightness instead
of brightness_set then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-cobalt-raq.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index b316df4..ef81bb3 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -50,8 +50,8 @@ static void raq_web_led_set(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev raq_web_led = {
-	.name		= "raq::web",
-	.brightness_set	= raq_web_led_set,
+	.name				= "raq::web",
+	.brightness_set_nonblocking	= raq_web_led_set,
 };
 
 static void raq_power_off_led_set(struct led_classdev *led_cdev,
@@ -71,9 +71,9 @@ static void raq_power_off_led_set(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev raq_power_off_led = {
-	.name			= "raq::power-off",
-	.brightness_set		= raq_power_off_led_set,
-	.default_trigger	= "power-off",
+	.name				= "raq::power-off",
+	.brightness_set_nonblocking	= raq_power_off_led_set,
+	.default_trigger		= "power-off",
 };
 
 static int cobalt_raq_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
