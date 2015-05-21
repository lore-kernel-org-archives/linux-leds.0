From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 05/20] leds: mark clevo-mail driver with LED_BRIGHTNESS_FAST
 flag
Date: Thu, 21 May 2015 18:14:21 +0300
Message-ID: <555DF64D.8040106@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp53.i.mail.ru ([94.100.177.113]:48212 "EHLO smtp53.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753309AbbEUPO1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:14:27 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?TcOhcnRvbiBOw6ltZXRo?= <nm127@freemail.hu>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: M=C3=A1rton N=C3=A9meth <nm127@freemail.hu>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-clevo-mail.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-m=
ail.c
index 0f9ed1e..958e52c 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -150,7 +150,7 @@ static struct led_classdev clevo_mail_led =3D {
 	.name			=3D "clevo::mail",
 	.brightness_set		=3D clevo_mail_led_set,
 	.blink_set		=3D clevo_mail_led_blink,
-	.flags			=3D LED_CORE_SUSPENDRESUME,
+	.flags			=3D LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static int __init clevo_mail_led_probe(struct platform_device *pdev)
--=20
1.7.9.5
