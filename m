From: Robin Gong <b38343@freescale.com>
Subject: [PATCH v1 1/2] leds: leds-gpio: add retain-state-suspended property
Date: Mon, 20 Jan 2014 19:41:26 +0800
Message-ID: <1390218087-14597-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]:9536
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750797AbaATLgI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Mon, 20 Jan 2014 06:36:08 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, cooloney@gmail.com, rpurdie@rpsys.net, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Some gpio-leds need retain the state even in suspend, such as charger led.
But this property missed in devicetree, add it.

Signed-off-by: Robin Gong <b38343@freescale.com>
---
 drivers/leds/leds-gpio.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 78b0e27..1bb3f1a 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -204,6 +204,9 @@ static struct gpio_leds_priv *gpio_leds_create_of(struct platform_device *pdev)
 				led.default_state = LEDS_GPIO_DEFSTATE_OFF;
 		}
 
+		if (of_get_property(child, "retain-state-suspended", NULL))
+			led.retain_state_suspended = 1;
+
 		ret = create_gpio_led(&led, &priv->leds[priv->num_leds++],
 				      &pdev->dev, NULL);
 		if (ret < 0) {
-- 
1.7.5.4
