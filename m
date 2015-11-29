From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 4/7] leds-bcm6358: remove unneded lock when checking initial LED status
Date: Sun, 29 Nov 2015 17:35:28 +0100
Message-ID: <1448814931-1369-4-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:32871 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbbK2QfN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 29 Nov 2015 11:35:13 -0500
Received: by wmec201 with SMTP id c201so124726660wme.0
        for <linux-leds@vger.kernel.org>; Sun, 29 Nov 2015 08:35:11 -0800 (PST)
In-Reply-To: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This lock isn't really needed, since we're only reading the register an=
d
changes made to other LEDs aren't relevant.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
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
