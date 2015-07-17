From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 37/51] leds: ot200: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:23 +0200
Message-ID: <1437122857-6765-38-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, "Sebastian A. Siewior" <bigeasy@linutronix.de>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Sebastian A. Siewior <bigeasy@linutronix.de>
---
 drivers/leds/leds-ot200.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
index 39870de..d357c14 100644
--- a/drivers/leds/leds-ot200.c
+++ b/drivers/leds/leds-ot200.c
@@ -123,6 +123,7 @@ static int ot200_led_probe(struct platform_device *pdev)
 
 		leds[i].cdev.name = leds[i].name;
 		leds[i].cdev.brightness_set = ot200_led_brightness_set;
+		leds[i].cdev.flags |= LED_BRIGHTNESS_FAST;
 
 		ret = led_classdev_register(&pdev->dev, &leds[i].cdev);
 		if (ret < 0)
-- 
1.7.9.5
