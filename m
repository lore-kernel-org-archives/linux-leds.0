From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 7/8] leds: bcm6328: simplify duplicated unlock in bcm6328_blink_set
Date: Tue, 15 Dec 2015 21:03:51 +0100
Message-ID: <1450209832-2742-8-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:34629 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbLOUEJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:09 -0500
Received: by mail-wm0-f51.google.com with SMTP id l126so10203539wml.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:08 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

Instead of duplicating the unlock we can store the return value and use=
 a
single unlock before returning that value, which simplifies the code.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: no changes

 drivers/leds/leds-bcm6328.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index e13daa2..47f7c9f 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -146,6 +146,7 @@ static int bcm6328_blink_set(struct led_classdev *l=
ed_cdev,
 	struct bcm6328_led *led =3D
 		container_of(led_cdev, struct bcm6328_led, cdev);
 	unsigned long delay, flags;
+	int rc;
=20
 	if (!*delay_on)
 		*delay_on =3D BCM6328_LED_DEF_DELAY;
@@ -183,16 +184,15 @@ static int bcm6328_blink_set(struct led_classdev =
*led_cdev,
 		bcm6328_led_write(led->mem + BCM6328_REG_INIT, val);
=20
 		bcm6328_led_mode(led, BCM6328_LED_MODE_BLINK);
-
-		spin_unlock_irqrestore(led->lock, flags);
+		rc =3D 0;
 	} else {
-		spin_unlock_irqrestore(led->lock, flags);
 		dev_dbg(led_cdev->dev,
 			"fallback to soft blinking (delay already set)\n");
-		return -EINVAL;
+		rc =3D -EINVAL;
 	}
+	spin_unlock_irqrestore(led->lock, flags);
=20
-	return 0;
+	return rc;
 }
=20
 static int bcm6328_hwled(struct device *dev, struct device_node *nc, u=
32 reg,
--=20
1.9.1
