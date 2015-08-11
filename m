From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 49/57] leds: cobalt-qube: Use brightness_set_nonblocking
 op
Date: Tue, 11 Aug 2015 11:38:02 +0200
Message-ID: <1439285890-27329-50-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Florian Fainelli <florian@openwrt.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Florian Fainelli <florian@openwrt.org>
---
 drivers/leds/leds-cobalt-qube.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index d975220..7cb986e 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -27,10 +27,10 @@ static void qube_front_led_set(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev qube_front_led = {
-	.name			= "qube::front",
-	.brightness		= LED_FULL,
-	.brightness_set		= qube_front_led_set,
-	.default_trigger	= "default-on",
+	.name				= "qube::front",
+	.brightness			= LED_FULL,
+	.brightness_set_nonblocking	= qube_front_led_set,
+	.default_trigger		= "default-on",
 };
 
 static int cobalt_qube_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
