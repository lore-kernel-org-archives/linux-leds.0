From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 04/20] leds: mark bcm6328 driver with LED_BRIGHTNESS_FAST
 flag
Date: Thu, 21 May 2015 18:13:39 +0300
Message-ID: <555DF623.6090402@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp45.i.mail.ru ([94.100.177.105]:43761 "EHLO smtp45.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964868AbbEUPNt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:13:49 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
CC: Jonas Gorski <jogo@openwrt.org>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-bcm6328.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 986fe1e..5c5f5b4 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -313,6 +313,7 @@ static int bcm6328_led(struct device *dev, struct d=
evice_node *nc, u32 reg,

 	led->cdev.brightness_set =3D bcm6328_led_set;
 	led->cdev.blink_set =3D bcm6328_blink_set;
+	led->cdev.flags =3D LED_BRIGHTNESS_FAST;

 	rc =3D led_classdev_register(dev, &led->cdev);
 	if (rc < 0)
--=20
1.7.9.5
