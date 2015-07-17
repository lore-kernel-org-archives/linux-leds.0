From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 36/51] leds: syscon: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:22 +0200
Message-ID: <1437122857-6765-37-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-syscon.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d1660b0..354fc16 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -128,6 +128,7 @@ static int syscon_led_probe(struct platform_device *pdev)
 		}
 	}
 	sled->cdev.brightness_set = syscon_led_set;
+	sled->cdev.flags |= LED_BRIGHTNESS_FAST;
 
 	ret = led_classdev_register(dev, &sled->cdev);
 	if (ret < 0)
-- 
1.7.9.5
