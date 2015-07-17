From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 44/51] leds: cobalt-qube: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:30 +0200
Message-ID: <1437122857-6765-45-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Florian Fainelli <florian@openwrt.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Florian Fainelli <florian@openwrt.org>
---
 drivers/leds/leds-cobalt-qube.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index d975220..f16da2a 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -31,6 +31,7 @@ static struct led_classdev qube_front_led = {
 	.brightness		= LED_FULL,
 	.brightness_set		= qube_front_led_set,
 	.default_trigger	= "default-on",
+	.flags			= LED_BRIGHTNESS_FAST,
 };
 
 static int cobalt_qube_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
