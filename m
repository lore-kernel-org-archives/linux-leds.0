From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 8/8] leds: bcm6358: merge bcm6358_led_mode and bcm6358_led_set
Date: Tue, 15 Dec 2015 21:03:52 +0100
Message-ID: <1450209832-2742-9-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:37037 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933566AbbLOUEK (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:10 -0500
Received: by mail-wm0-f49.google.com with SMTP id n186so42219463wmn.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:10 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

bcm6358_led_mode is now only called by bcm6358_led_set, so merge both i=
n one
single function.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: introduce new patch to merge bcm6358_led_mode into bcm6358_led_set

 drivers/leds/leds-bcm6358.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index ffc978d..7413e3e 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -76,12 +76,15 @@ static unsigned long bcm6358_led_busy(void __iomem =
*mem)
 	return val;
 }
=20
-static void bcm6358_led_mode(struct bcm6358_led *led, unsigned long va=
lue)
+static void bcm6358_led_set(struct led_classdev *led_cdev,
+			    enum led_brightness value)
 {
-	unsigned long val;
+	struct bcm6358_led *led =3D
+		container_of(led_cdev, struct bcm6358_led, cdev);
+	unsigned long flags, val;
=20
+	spin_lock_irqsave(led->lock, flags);
 	bcm6358_led_busy(led->mem);
-
 	val =3D bcm6358_led_read(led->mem + BCM6358_REG_MODE);
 	if ((led->active_low && value =3D=3D LED_OFF) ||
 	    (!led->active_low && value !=3D LED_OFF))
@@ -89,17 +92,6 @@ static void bcm6358_led_mode(struct bcm6358_led *led=
, unsigned long value)
 	else
 		val &=3D ~(BIT(led->pin));
 	bcm6358_led_write(led->mem + BCM6358_REG_MODE, val);
-}
-
-static void bcm6358_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
-{
-	struct bcm6358_led *led =3D
-		container_of(led_cdev, struct bcm6358_led, cdev);
-	unsigned long flags;
-
-	spin_lock_irqsave(led->lock, flags);
-	bcm6358_led_mode(led, value);
 	spin_unlock_irqrestore(led->lock, flags);
 }
=20
--=20
1.9.1
