From: =?UTF-8?q?Stefan=20S=C3=B8rensen?=
	<stefan.sorensen@spectralink.com>
Subject: [PATCH] leds: Turn off led if blinking is disabled
Date: Tue,  4 Feb 2014 09:11:42 +0100
Message-ID: <1391501502-12870-1-git-send-email-stefan.sorensen@spectralink.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 213083164162.static.sonofon.dk ([213.83.164.162]:30288 "EHLO
	HORWDSPRD01.spectralink.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751453AbaBDIa5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 4 Feb 2014 03:30:57 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>

When using the timer trigger and setting delay_on to 0, the led
will stay in whatever state is was in, while intuitively one
would expect it to turn off. This patch changes the behaviour to
turn it off.

Signed-off-by: Stefan S=C3=B8rensen <stefan.sorensen@spectralink.com>
---
 drivers/leds/led-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ce8921a..71b40d3 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -39,9 +39,11 @@ static void led_set_software_blink(struct led_classd=
ev *led_cdev,
 	led_cdev->blink_delay_on =3D delay_on;
 	led_cdev->blink_delay_off =3D delay_off;
=20
-	/* never on - don't blink */
-	if (!delay_on)
+	/* never on - just set to off */
+	if (!delay_on) {
+		__led_set_brightness(led_cdev, LED_OFF);
 		return;
+	}
=20
 	/* never off - just set to brightness */
 	if (!delay_off) {
--=20
1.8.5.3
