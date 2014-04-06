From: Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Sun, 06 Apr 2014 23:20:18 +0100
Message-ID: <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:51982 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754121AbaDFWUU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Apr 2014 18:20:20 -0400
In-Reply-To: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org

Some PWM outputs are wired such that the LED they're controlling is
connected to supply rather than ground.  These PWMs may not support
output inversion, or when they do, disabling the PWM may set the
PWM output low, causing a "brightness" value of zero to turn the LED
fully on.

The platform data for this driver already indicates that this was
thought about, and we have the "active_low" property there already.
However, the implementation for this is missing.

Add the trivial implementation for this feature.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/leds/leds-pwm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e1b4c23a409a..1d47742c551f 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -70,6 +70,10 @@ static void led_pwm_set(struct led_classdev *led_cdev,
 
 	duty *= brightness;
 	do_div(duty, max);
+
+	if (led_dat->active_low)
+		duty = led_dat->period - duty;
+
 	led_dat->duty = duty;
 
 	if (led_dat->can_sleep)
-- 
1.8.3.1
