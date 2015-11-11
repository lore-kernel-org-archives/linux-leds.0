From: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
Subject: [PATCH 1/1] leds: call led_pwm_set() in leds-pwm to enforce default LED_OFF
Date: Wed, 11 Nov 2015 12:40:29 +0100
Message-ID: <1447242029-29335-1-git-send-email-markus.hofstaetter@ait.ac.at>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.ait.ac.at ([62.218.164.132]:48102 "EHLO MX2.ait.ac.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751859AbbKKLzO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 11 Nov 2015 06:55:14 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Markus Hofstaetter <markus.hofstaetter@ait.ac.at>

Some PWMs are disabled by default or the default pin setting
does not match the LED_OFF state (e.g., active-low leds).
Hence, the driver may end up reporting 0 brightness, but
the leds are actually on using full brightness, because
it never enforces its default configuration.
So enforce it by calling led_pwm_set() after successfully
registering the device.

Tested on a Phytec phyFLEX i.MX6Q board based on kernel
v3.19.5.

Signed-off-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
Tested-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
---
 drivers/leds/leds-pwm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 1d07e3e..3149dbe 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -132,6 +132,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	ret = led_classdev_register(dev, &led_data->cdev);
 	if (ret == 0) {
 		priv->num_leds++;
+		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
 	} else {
 		dev_err(dev, "failed to register PWM led for %s: %d\n",
 			led->name, ret);
-- 
1.9.1
