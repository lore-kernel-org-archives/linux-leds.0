From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 35/51] leds: bcm6358: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:21 +0200
Message-ID: <1437122857-6765-36-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6358.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 21f9693..2827c9f 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -145,6 +145,7 @@ static int bcm6358_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 	spin_unlock_irqrestore(lock, flags);
=20
 	led->cdev.brightness_set =3D bcm6358_led_set;
+	led->cdev.flags |=3D LED_BRIGHTNESS_FAST;
=20
 	rc =3D led_classdev_register(dev, &led->cdev);
 	if (rc < 0)
--=20
1.7.9.5
