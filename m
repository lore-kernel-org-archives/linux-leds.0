From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 43/51] leds: asic3: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:29 +0200
Message-ID: <1437122857-6765-44-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Paul Parsons <lost.distance@yahoo.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Paul Parsons <lost.distance@yahoo.com>
---
 drivers/leds/leds-asic3.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-asic3.c b/drivers/leds/leds-asic3.c
index 1b71eac..1cf542c 100644
--- a/drivers/leds/leds-asic3.c
+++ b/drivers/leds/leds-asic3.c
@@ -112,6 +112,7 @@ static int asic3_led_probe(struct platform_device *pdev)
 	led->cdev->brightness_set = brightness_set;
 	led->cdev->blink_set = blink_set;
 	led->cdev->default_trigger = led->default_trigger;
+	led->cdev->flags |= LED_BRIGHTNESS_FAST;
 
 	ret = led_classdev_register(&pdev->dev, led->cdev);
 	if (ret < 0)
-- 
1.7.9.5
