From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 57/57] leds: clevo-mail: Set LED_BRIGHTNESS_BLOCKING flag
Date: Tue, 11 Aug 2015 11:38:10 +0200
Message-ID: <1439285890-27329-58-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?q?M=C3=A1rton=20N=C3=A9meth?= <nm127@freemail.hu>
List-Id: linux-leds@vger.kernel.org

Since implemented brightness_set op uses delays mark the
LED blocking.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: M=C3=A1rton N=C3=A9meth <nm127@freemail.hu>
---
 drivers/leds/leds-clevo-mail.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-m=
ail.c
index 0f9ed1e..961da85 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -150,7 +150,8 @@ static struct led_classdev clevo_mail_led =3D {
 	.name			=3D "clevo::mail",
 	.brightness_set		=3D clevo_mail_led_set,
 	.blink_set		=3D clevo_mail_led_blink,
-	.flags			=3D LED_CORE_SUSPENDRESUME,
+	.flags			=3D LED_CORE_SUSPENDRESUME |
+				  LED_BRIGHTNESS_BLOCKING,
 };
=20
 static int __init clevo_mail_led_probe(struct platform_device *pdev)
--=20
1.7.9.5
