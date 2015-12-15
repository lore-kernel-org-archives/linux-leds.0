From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 3/8] leds: bcm6358: Use bcm6358_led_set() in order to get rid of the lock
Date: Tue, 15 Dec 2015 21:03:47 +0100
Message-ID: <1450209832-2742-4-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:33360 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933519AbbLOUED (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:03 -0500
Received: by mail-wm0-f46.google.com with SMTP id n186so111594513wmn.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:02 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

Replaces bcm6358_led_mode with bcm6358_led_set so we don't need to hand=
le
the lock.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: no changes

 drivers/leds/leds-bcm6358.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 82b4ee1..a98cc71 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -141,9 +141,10 @@ static int bcm6358_led(struct device *dev, struct =
device_node *nc, u32 reg,
 	} else {
 		led->cdev.brightness =3D LED_OFF;
 	}
-	bcm6358_led_mode(led, led->cdev.brightness);
 	spin_unlock_irqrestore(lock, flags);
=20
+	bcm6358_led_set(&led->cdev, led->cdev.brightness);
+
 	led->cdev.brightness_set =3D bcm6358_led_set;
=20
 	rc =3D led_classdev_register(dev, &led->cdev);
--=20
1.9.1
