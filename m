From: Felix Brack <fb@ltec.ch>
Subject: [PATCH] led: pca9532: Use default trigger value from platform data
Date: Wed, 26 Oct 2016 16:08:02 +0200
Message-ID: <2ba1ca4c-23c5-fb0e-10ce-4e25edcd197f@ltec.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.ltec.ch ([95.143.48.181]:49960 "EHLO mail.ltec.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753455AbcJZOaA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Oct 2016 10:30:00 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: riku.voipio@iki.fi, linux-leds@vger.kernel.org
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, j.anaszewski@samsung.com, linux-kernel@vger.kernel.org, Brack Felix <fb@ltec.ch>

The value for a led's default_trigger should come from platform data
instead of data (which is always 0).

Signed-off-by: Felix Brack <fb@ltec.ch>
---

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 09a7cffb..06e6310 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -369,7 +369,7 @@ static int pca9532_configure(struct i2c_client *client,
 			led->state = pled->state;
 			led->name = pled->name;
 			led->ldev.name = led->name;
-			led->ldev.default_trigger = led->default_trigger;
+			led->ldev.default_trigger = pled->default_trigger;
 			led->ldev.brightness = LED_OFF;
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
