From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/4] leds: pwm: Use OF variant of LED registering function
Date: Fri,  7 Dec 2018 13:32:52 +0100
Message-ID: <1544185974-5932-2-git-send-email-krzk@kernel.org>
References: <1544185974-5932-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544185974-5932-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Raphael Teysseyre <rteysseyre@gmail.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The PWM leds can be instantiated from Device Tree so pass the
respective device node to LED core.  This provides the LED system with
proper device node and exposes it through uevent.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/leds-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index fcb3e87a9887..af08bcdc4fd8 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -114,7 +114,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	if (!led_data->period && (led->pwm_period_ns > 0))
 		led_data->period = led->pwm_period_ns;
 
-	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	ret = devm_of_led_classdev_register(dev, child, &led_data->cdev);
 	if (ret == 0) {
 		priv->num_leds++;
 		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
-- 
2.7.4
