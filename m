From: Jelle Martijn Kok <jmkok@youcom.nl>
Subject: [PATCH] leds-pwm: the startup brightness can be specified
Date: Thu, 9 Feb 2017 15:00:00 +0100
Message-ID: <aed1129a-993a-91d9-7b14-13c3424ee0f4@solutionsradio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from wsrg017.solrad.nl ([85.17.73.78]:42570 "EHLO wsrg017.solrad.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751600AbdBIOSH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Feb 2017 09:18:07 -0500
Received: from blue.youcom.nl (blue.youcom.nl [83.163.255.248])
        by wsrg017.solrad.nl (Postfix) with ESMTPS id BCAA32B81896
        for <linux-leds@vger.kernel.org>; Thu,  9 Feb 2017 15:00:01 +0100 (CET)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

Upto now the leds-pwm are either on or off at startup. This allows the
dts to specify the startup brightness

Signed-off-by: Jelle Martijn Kok <jmkok@youcom.nl>
---
  drivers/leds/leds-pwm.c  | 5 ++++-
  include/linux/leds_pwm.h | 1 +
  2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index a9145aa..4799f36 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -97,7 +97,7 @@ static int led_pwm_add(struct device *dev, struct 
led_pwm_priv *priv,
  	led_data->active_low = led->active_low;
  	led_data->cdev.name = led->name;
  	led_data->cdev.default_trigger = led->default_trigger;
-	led_data->cdev.brightness = LED_OFF;
+	led_data->cdev.brightness = led->default_brightness;
  	led_data->cdev.max_brightness = led->max_brightness;
  	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
  @@ -159,6 +159,9 @@ static int led_pwm_create_of(struct device *dev, 
struct led_pwm_priv *priv)
  		led.active_low = of_property_read_bool(child, "active-low");
  		of_property_read_u32(child, "max-brightness",
  				     &led.max_brightness);
+		led.default_brightness = LED_OFF;
+		of_property_read_u32(child, "brightness",
+				     &led.default_brightness);
   		ret = led_pwm_add(dev, priv, &led, child);
  		if (ret) {
diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
index a65e964..7e70438 100644
--- a/include/linux/leds_pwm.h
+++ b/include/linux/leds_pwm.h
@@ -11,6 +11,7 @@ struct led_pwm {
  	u8 		active_low;
  	unsigned 	max_brightness;
  	unsigned	pwm_period_ns;
+	unsigned 	default_brightness;
  };
   struct led_pwm_platform_data {
-- 
2.1.4
