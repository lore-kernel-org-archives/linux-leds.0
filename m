From: Olof Johansson <olof@lixom.net>
Subject: [PATCH] leds: pwm: Remove a warning on non-DT platforms
Date: Wed, 11 Dec 2013 16:11:42 -0800
Message-ID: <1386807102-15397-1-git-send-email-olof@lixom.net>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:50428 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab3LLAKp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 Dec 2013 19:10:45 -0500
Received: by mail-pd0-f179.google.com with SMTP id r10so10542650pdi.10
        for <linux-leds@vger.kernel.org>; Wed, 11 Dec 2013 16:10:45 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>

This removes a warning on non-DT-enabled platforms:

drivers/leds/leds-pwm.c: In function 'led_pwm_create_of':
drivers/leds/leds-pwm.c:88:22: warning: unused variable 'node'

Really caused by the local variable that is assigned to and then never
used. Just do away with the local var, it's not needed.

Technically this code path can never be entered without DT enabled,
since there's an earlier check about number of children in the calling
function, but the compiler can't see that.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 drivers/leds/leds-pwm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index b31d8e99..bf49547 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -85,11 +85,10 @@ static inline size_t sizeof_pwm_leds_priv(int num_leds)
 static int led_pwm_create_of(struct platform_device *pdev,
 			     struct led_pwm_priv *priv)
 {
-	struct device_node *node = pdev->dev.of_node;
 	struct device_node *child;
 	int ret;
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node(pdev->dev.of_node, child) {
 		struct led_pwm_data *led_dat = &priv->leds[priv->num_leds];
 
 		led_dat->cdev.name = of_get_property(child, "label",
-- 
1.7.10.4
