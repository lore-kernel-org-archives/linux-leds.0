From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 4/8] leds: bcm6358: remove unneded lock when checking initial LED status
Date: Tue, 15 Dec 2015 21:03:48 +0100
Message-ID: <1450209832-2742-5-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:34550 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbLOUEE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:04 -0500
Received: by mail-wm0-f44.google.com with SMTP id l126so10200722wml.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:03 -0800 (PST)
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

 drivers/leds/leds-bcm6358.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index a98cc71..ab09ea4 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -99,7 +99,6 @@ static int bcm6358_led(struct device *dev, struct dev=
ice_node *nc, u32 reg,
 		       void __iomem *mem, spinlock_t *lock)
 {
 	struct bcm6358_led *led;
-	unsigned long flags;
 	const char *state;
 	int rc;
=20
@@ -119,7 +118,6 @@ static int bcm6358_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 						    "linux,default-trigger",
 						    NULL);
=20
-	spin_lock_irqsave(lock, flags);
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness =3D LED_FULL;
@@ -141,7 +139,6 @@ static int bcm6358_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 	} else {
 		led->cdev.brightness =3D LED_OFF;
 	}
-	spin_unlock_irqrestore(lock, flags);
=20
 	bcm6358_led_set(&led->cdev, led->cdev.brightness);
=20
--=20
1.9.1
