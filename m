From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] leds: pwm: silently error out on EPROBE_DEFER
Date: Thu,  6 Sep 2018 15:59:04 +0200
Message-ID: <20180906135904.13803-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

When probing, if we fail to get the pwm due to probe deferal, we shouldn't
print an error message. Just be silent in this case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/leds/leds-pwm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index df80c89ebe7f..5d3faae51d59 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -100,8 +100,9 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		led_data->pwm = devm_pwm_get(dev, led->name);
 	if (IS_ERR(led_data->pwm)) {
 		ret = PTR_ERR(led_data->pwm);
-		dev_err(dev, "unable to request PWM for %s: %d\n",
-			led->name, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "unable to request PWM for %s: %d\n",
+				led->name, ret);
 		return ret;
 	}
 
-- 
2.17.1
