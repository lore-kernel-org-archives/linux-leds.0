From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] leds: ktd2692: avoid harmless maybe-uninitialized warning
Date: Wed, 25 Jan 2017 23:22:36 +0100
Message-ID: <20170125222247.1210546-1-arnd@arndb.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:60139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751688AbdAYWXB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jan 2017 17:23:01 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

gcc gets confused about the control flow in ktd2692_parse_dt(), causing
it to warn about what seems like a potential bug:

drivers/leds/leds-ktd2692.c: In function 'ktd2692_probe':
drivers/leds/leds-ktd2692.c:244:15: error: '*((void *)&led_cfg+8)' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/leds/leds-ktd2692.c:225:7: error: 'led_cfg.flash_max_microamp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/leds/leds-ktd2692.c:232:3: error: 'led_cfg.movie_max_microamp' may be used uninitialized in this function [-Werror=maybe-uninitialized]

The code is fine, and slightly reworking it in an equivalent way lets
gcc figure that out too, which gets rid of the warning.

Fixes: 77e7915b15bb ("leds: ktd2692: Add missing of_node_put")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/leds-ktd2692.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index bf23ba191ad0..45296aaca9da 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -270,15 +270,15 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 		return -ENXIO;
 
 	led->ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
-	if (IS_ERR(led->ctrl_gpio)) {
-		ret = PTR_ERR(led->ctrl_gpio);
+	ret = PTR_ERR_OR_ZERO(led->ctrl_gpio);
+	if (ret) {
 		dev_err(dev, "cannot get ctrl-gpios %d\n", ret);
 		return ret;
 	}
 
 	led->aux_gpio = devm_gpiod_get(dev, "aux", GPIOD_ASIS);
-	if (IS_ERR(led->aux_gpio)) {
-		ret = PTR_ERR(led->aux_gpio);
+	ret = PTR_ERR_OR_ZERO(led->aux_gpio);
+	if (ret) {
 		dev_err(dev, "cannot get aux-gpios %d\n", ret);
 		return ret;
 	}
-- 
2.9.0
