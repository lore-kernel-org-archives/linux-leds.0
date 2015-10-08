From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 2/4] leds-bcm6328: simplify and improve default-state handling
Date: Thu,  8 Oct 2015 12:35:53 +0200
Message-ID: <1444300555-13988-3-git-send-email-noltari@gmail.com>
References: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:36581 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752064AbbJHKfn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2015 06:35:43 -0400
In-Reply-To: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, cernekee@gmail.com, f.fainelli@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This patch simplifies and improves the code related to
default-state handling.
It also changes the code to power off the LEDs by default.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 5daf7be..4de8a85 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -281,11 +281,10 @@ static int bcm6328_led(struct device *dev, struct=
 device_node *nc, u32 reg,
 						    "linux,default-trigger",
 						    NULL);
=20
+	spin_lock_irqsave(lock, flags);
 	if (!of_property_read_string(nc, "default-state", &state)) {
-		spin_lock_irqsave(lock, flags);
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness =3D LED_FULL;
-			bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
 		} else if (!strcmp(state, "keep")) {
 			void __iomem *mode;
 			unsigned long val, shift;
@@ -296,21 +295,28 @@ static int bcm6328_led(struct device *dev, struct=
 device_node *nc, u32 reg,
 			else
 				mode =3D mem + BCM6328_REG_MODE_LO;
=20
-			val =3D bcm6328_led_read(mode) >> (shift % 16);
+			val =3D bcm6328_led_read(mode) >>
+			      BCM6328_LED_SHIFT(shift % 16);
 			val &=3D BCM6328_LED_MODE_MASK;
-			if (val =3D=3D BCM6328_LED_MODE_ON)
+			if ((led->active_low && val =3D=3D BCM6328_LED_MODE_ON) ||
+			    (!led->active_low && val =3D=3D BCM6328_LED_MODE_OFF))
 				led->cdev.brightness =3D LED_FULL;
-			else {
+			else
 				led->cdev.brightness =3D LED_OFF;
-				bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
-			}
 		} else {
 			led->cdev.brightness =3D LED_OFF;
-			bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
 		}
-		spin_unlock_irqrestore(lock, flags);
+	} else {
+		led->cdev.brightness =3D LED_OFF;
 	}
=20
+	if ((led->active_low && led->cdev.brightness =3D=3D LED_FULL) ||
+	    (!led->active_low && led->cdev.brightness =3D=3D LED_OFF))
+		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
+	else
+		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
+	spin_unlock_irqrestore(lock, flags);
+
 	led->cdev.brightness_set =3D bcm6328_led_set;
 	led->cdev.blink_set =3D bcm6328_blink_set;
=20
--=20
1.9.1
