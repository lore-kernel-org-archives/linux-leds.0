From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 42/57] leds: ot200: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:55 +0200
Message-ID: <1439285890-27329-43-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, "Sebastian A. Siewior" <bigeasy@linutronix.de>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Sebastian A. Siewior <bigeasy@linutronix.de>
---
 drivers/leds/leds-ot200.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
index 39870de..47de99e 100644
--- a/drivers/leds/leds-ot200.c
+++ b/drivers/leds/leds-ot200.c
@@ -122,7 +122,8 @@ static int ot200_led_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(leds); i++) {
 
 		leds[i].cdev.name = leds[i].name;
-		leds[i].cdev.brightness_set = ot200_led_brightness_set;
+		leds[i].cdev.brightness_set_nonblocking =
+						ot200_led_brightness_set;
 
 		ret = led_classdev_register(&pdev->dev, &leds[i].cdev);
 		if (ret < 0)
-- 
1.7.9.5
