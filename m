From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 1/5] leds: leds-pwm: properly clean up after probe failure
Date: Sun, 06 Apr 2014 23:20:03 +0100
Message-ID: <E1WWvQ3-00049O-GV@rmk-PC.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:51970 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753726AbaDFWUF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Apr 2014 18:20:05 -0400
In-Reply-To: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org

When probing with DT, we add each LED one at a time.  If we find a LED
without a PWM device (because it is not available yet) we fail the
initialisation, unregister previous LEDs, and then by way of managed
resources, we free the structure.

The problem with this is we may have a scheduled and active work_struct
in this structure, and this results in a nasty kernel oops.

We need to cancel this work_struct properly upon cleanup - and the
cleanup we require is the same cleanup as we do when the LED platform
device is removed.  Rather than writing this same code three times,
move it into a separate function and use it in all three places.

Fixes: c971ff185f64 ("leds: leds-pwm: Defer led_pwm_set() if PWM can sleep")
Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/leds/leds-pwm.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 605047428b5a..a7b369fc3554 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -84,6 +84,15 @@ static inline size_t sizeof_pwm_leds_priv(int num_leds)
 		      (sizeof(struct led_pwm_data) * num_leds);
 }
 
+static void led_pwm_cleanup(struct led_pwm_priv *priv)
+{
+	while (priv->num_leds--) {
+		led_classdev_unregister(&priv->leds[priv->num_leds].cdev);
+		if (priv->leds[priv->num_leds].can_sleep)
+			cancel_work_sync(&priv->leds[priv->num_leds].work);
+	}
+}
+
 static int led_pwm_create_of(struct platform_device *pdev,
 			     struct led_pwm_priv *priv)
 {
@@ -131,8 +140,7 @@ static int led_pwm_create_of(struct platform_device *pdev,
 
 	return 0;
 err:
-	while (priv->num_leds--)
-		led_classdev_unregister(&priv->leds[priv->num_leds].cdev);
+	led_pwm_cleanup(priv);
 
 	return ret;
 }
@@ -200,8 +208,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 	return 0;
 
 err:
-	while (i--)
-		led_classdev_unregister(&priv->leds[i].cdev);
+	priv->num_leds = i;
+	led_pwm_cleanup(priv);
 
 	return ret;
 }
@@ -209,13 +217,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 static int led_pwm_remove(struct platform_device *pdev)
 {
 	struct led_pwm_priv *priv = platform_get_drvdata(pdev);
-	int i;
 
-	for (i = 0; i < priv->num_leds; i++) {
-		led_classdev_unregister(&priv->leds[i].cdev);
-		if (priv->leds[i].can_sleep)
-			cancel_work_sync(&priv->leds[i].work);
-	}
+	led_pwm_cleanup(priv);
 
 	return 0;
 }
-- 
1.8.3.1
