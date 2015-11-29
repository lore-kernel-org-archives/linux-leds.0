From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 7/7] leds-bcm6328: simplify duplicated unlock in bcm6328_blink_set
Date: Sun, 29 Nov 2015 17:35:31 +0100
Message-ID: <1448814931-1369-7-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:32897 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752000AbbK2QfQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 29 Nov 2015 11:35:16 -0500
Received: by wmec201 with SMTP id c201so124727750wme.0
        for <linux-leds@vger.kernel.org>; Sun, 29 Nov 2015 08:35:15 -0800 (PST)
In-Reply-To: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 876f0ce..a361829 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -138,6 +138,7 @@ static int bcm6328_blink_set(struct led_classdev *l=
ed_cdev,
 	struct bcm6328_led *led =3D
 		container_of(led_cdev, struct bcm6328_led, cdev);
 	unsigned long delay, flags;
+	int rc;
=20
 	if (!*delay_on)
 		*delay_on =3D BCM6328_LED_DEF_DELAY;
@@ -175,16 +176,15 @@ static int bcm6328_blink_set(struct led_classdev =
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
