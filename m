From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 1/2] leds: bcm6328: improve blink support
Date: Wed, 16 Dec 2015 21:13:48 +0100
Message-ID: <1450296829-31817-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:34178 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbbLPUOE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 16 Dec 2015 15:14:04 -0500
Received: by mail-wm0-f52.google.com with SMTP id l126so56482186wml.1
        for <linux-leds@vger.kernel.org>; Wed, 16 Dec 2015 12:14:03 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, simon@fire.lp0.eu, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

BCM6328 controller has a margin of 20ms per blink step, which means tha=
t we
can only set it to 20, 40, 60 ... 1260 ms (0x3f * 20ms).
However, when checking if delay_on =3D=3D delay_off, we were not consid=
ering the
case when the user had set delay_on=3D20 and delay_off=3D21, since this=
 will
cause the driver to fallback to software blinking.
This update fixes this issue and improves blink steps by rounding them
in a more sensible way. Now 30-49ms is rounded to 40 ms, and previous b=
ehaviour
implied 40-59ms being rounded to 40 ms.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 47f7c9f..0d4d274 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -140,6 +140,16 @@ static void bcm6328_led_set(struct led_classdev *l=
ed_cdev,
 	spin_unlock_irqrestore(led->lock, flags);
 }
=20
+static unsigned long bcm6328_blink_delay(unsigned long delay)
+{
+	unsigned long bcm6328_delay;
+	bcm6328_delay =3D delay + BCM6328_LED_INTERVAL_MS / 2;
+	bcm6328_delay =3D bcm6328_delay / BCM6328_LED_INTERVAL_MS;
+	if (bcm6328_delay =3D=3D 0)
+		bcm6328_delay =3D 1;
+	return bcm6328_delay;
+}
+
 static int bcm6328_blink_set(struct led_classdev *led_cdev,
 			     unsigned long *delay_on, unsigned long *delay_off)
 {
@@ -153,16 +163,14 @@ static int bcm6328_blink_set(struct led_classdev =
*led_cdev,
 	if (!*delay_off)
 		*delay_off =3D BCM6328_LED_DEF_DELAY;
=20
-	if (*delay_on !=3D *delay_off) {
+	delay =3D bcm6328_blink_delay(*delay_on);
+	if (delay !=3D bcm6328_blink_delay(*delay_off)) {
 		dev_dbg(led_cdev->dev,
 			"fallback to soft blinking (delay_on !=3D delay_off)\n");
 		return -EINVAL;
 	}
=20
-	delay =3D *delay_on / BCM6328_LED_INTERVAL_MS;
-	if (delay =3D=3D 0) {
-		delay =3D 1;
-	} else if (delay > BCM6328_LED_INTV_MASK) {
+	if (delay > BCM6328_LED_INTV_MASK) {
 		dev_dbg(led_cdev->dev,
 			"fallback to soft blinking (delay > %ums)\n",
 			BCM6328_LED_INTV_MASK * BCM6328_LED_INTERVAL_MS);
--=20
1.9.1
