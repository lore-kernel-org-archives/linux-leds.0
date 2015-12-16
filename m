From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 2/2] leds: bcm6358: remove unneeded busy status check
Date: Wed, 16 Dec 2015 21:13:49 +0100
Message-ID: <1450296829-31817-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35054 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbbLPUOG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 16 Dec 2015 15:14:06 -0500
Received: by mail-wm0-f51.google.com with SMTP id l126so55622089wml.0
        for <linux-leds@vger.kernel.org>; Wed, 16 Dec 2015 12:14:05 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, simon@fire.lp0.eu, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

The busy status checking isn't needed while reading initial LED status.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6358.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 7413e3e..b2cc066 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -123,9 +123,6 @@ static int bcm6358_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 			led->cdev.brightness =3D LED_FULL;
 		} else if (!strcmp(state, "keep")) {
 			unsigned long val;
-
-			bcm6358_led_busy(led->mem);
-
 			val =3D bcm6358_led_read(led->mem + BCM6358_REG_MODE);
 			val &=3D BIT(led->pin);
 			if ((led->active_low && !val) ||
--=20
1.9.1
