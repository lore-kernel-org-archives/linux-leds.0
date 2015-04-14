From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH] leds: gpio: Fix device teardown on probe deferral
Date: Tue, 14 Apr 2015 23:23:30 +0200
Message-ID: <1429046610-3001-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

In gpio_leds_create(), when devm_get_gpiod_from_child() fails with
-EPROBE_DEFER on the second gpio led to be created, the first already
registered led is not torn down properly. This causes create_gpio_led()
to fail for the first led on re-probe().

Fix this misbehaviour by incrementing num_leds only if all
potentially failing calls completed successfully.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/leds/leds-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d26af0a79a90..f2eb13805b92 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -217,18 +217,19 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		if (fwnode_property_present(child, "retain-state-suspended"))
 			led.retain_state_suspended = 1;
 
-		ret = create_gpio_led(&led, &priv->leds[priv->num_leds++],
+		ret = create_gpio_led(&led, &priv->leds[priv->num_leds],
 				      dev, NULL);
 		if (ret < 0) {
 			fwnode_handle_put(child);
 			goto err;
 		}
+		priv->num_leds++;
 	}
 
 	return priv;
 
 err:
-	for (count = priv->num_leds - 2; count >= 0; count--)
+	for (count = priv->num_leds - 1; count >= 0; count--)
 		delete_gpio_led(&priv->leds[count]);
 	return ERR_PTR(ret);
 }
-- 
2.1.0
