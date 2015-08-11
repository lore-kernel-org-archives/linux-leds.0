From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 40/57] leds: bcm6358: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:37:53 +0200
Message-ID: <1439285890-27329-41-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6358.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 21f9693..a213160 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -144,7 +144,7 @@ static int bcm6358_led(struct device *dev, struct d=
evice_node *nc, u32 reg,
 	bcm6358_led_mode(led, led->cdev.brightness);
 	spin_unlock_irqrestore(lock, flags);
=20
-	led->cdev.brightness_set =3D bcm6358_led_set;
+	led->cdev.brightness_set_nonblocking =3D bcm6358_led_set;
=20
 	rc =3D led_classdev_register(dev, &led->cdev);
 	if (rc < 0)
--=20
1.7.9.5
