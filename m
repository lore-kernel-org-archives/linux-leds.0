From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 31/38] leds: tca6507: remove invalid check
Date: Mon, 21 Sep 2015 15:34:03 +0200
Message-ID: <1442842450-29769-32-git-send-email-a.hajda@samsung.com>
References: <1442842450-29769-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442842450-29769-1-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

unsigned value cannot be lesser than zero.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2038576

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/leds/leds-tca6507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index edbecc4..93564f6 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -713,7 +713,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 		if (of_property_match_string(child, "compatible", "gpio") >= 0)
 			led.flags |= TCA6507_MAKE_GPIO;
 		ret = of_property_read_u32(child, "reg", &reg);
-		if (ret != 0 || reg < 0 || reg >= NUM_LEDS)
+		if (ret != 0 || reg >= NUM_LEDS)
 			continue;
 
 		tca_leds[reg] = led;
-- 
1.9.1
