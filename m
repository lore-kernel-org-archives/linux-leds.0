From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 2/8] leds: bcm6328: remove unneded lock when checking initial LED
Date: Tue, 15 Dec 2015 21:03:46 +0100
Message-ID: <1450209832-2742-3-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35141 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbLOUEB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:01 -0500
Received: by mail-wm0-f44.google.com with SMTP id l126so9887848wml.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:01 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This lock isn't really needed, since we're only reading the register an=
d
changes made to other LEDs aren't relevant.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: no changes

 drivers/leds/leds-bcm6328.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 1ef69c2..cd54264 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -264,7 +264,6 @@ static int bcm6328_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 		       unsigned long *blink_leds, unsigned long *blink_delay)
 {
 	struct bcm6328_led *led;
-	unsigned long flags;
 	const char *state;
 	int rc;
=20
@@ -286,7 +285,6 @@ static int bcm6328_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 						    "linux,default-trigger",
 						    NULL);
=20
-	spin_lock_irqsave(lock, flags);
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness =3D LED_FULL;
@@ -314,7 +312,6 @@ static int bcm6328_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 	} else {
 		led->cdev.brightness =3D LED_OFF;
 	}
-	spin_unlock_irqrestore(lock, flags);
=20
 	bcm6328_led_set(&led->cdev, led->cdev.brightness);
=20
--=20
1.9.1
