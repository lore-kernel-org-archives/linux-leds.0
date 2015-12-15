From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 1/8] leds: bcm6328: code cleaning
Date: Tue, 15 Dec 2015 21:03:45 +0100
Message-ID: <1450209832-2742-2-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:33312 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbLOUEA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:00 -0500
Received: by mail-wm0-f52.google.com with SMTP id n186so111592978wmn.0
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:03:59 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

- Remove double whitespace
- Add missing brackets
- Add spinlock info

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: no changes

 drivers/leds/leds-bcm6328.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 0329dee..1ef69c2 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -42,7 +42,7 @@
 #define BCM6328_LED_SHIFT_TEST		BIT(30)
 #define BCM6328_LED_TEST		BIT(31)
 #define BCM6328_INIT_MASK		(BCM6328_SERIAL_LED_EN | \
-					 BCM6328_SERIAL_LED_MUX  | \
+					 BCM6328_SERIAL_LED_MUX | \
 					 BCM6328_SERIAL_LED_CLK_NPOL | \
 					 BCM6328_SERIAL_LED_DATA_PPOL | \
 					 BCM6328_SERIAL_LED_SHIFT_DIR)
@@ -151,9 +151,9 @@ static int bcm6328_blink_set(struct led_classdev *l=
ed_cdev,
 	}
=20
 	delay =3D *delay_on / BCM6328_LED_INTERVAL_MS;
-	if (delay =3D=3D 0)
+	if (delay =3D=3D 0) {
 		delay =3D 1;
-	else if (delay > BCM6328_LED_INTV_MASK) {
+	} else if (delay > BCM6328_LED_INTV_MASK) {
 		dev_dbg(led_cdev->dev,
 			"fallback to soft blinking (delay > %ums)\n",
 			BCM6328_LED_INTV_MASK * BCM6328_LED_INTERVAL_MS);
@@ -337,7 +337,7 @@ static int bcm6328_leds_probe(struct platform_devic=
e *pdev)
 	struct device_node *child;
 	struct resource *mem_r;
 	void __iomem *mem;
-	spinlock_t *lock;
+	spinlock_t *lock; /* memory lock */
 	unsigned long val, *blink_leds, *blink_delay;
=20
 	mem_r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
--=20
1.9.1
