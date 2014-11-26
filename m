From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] leds/pwm: fix driver description and make license match the header
Date: Wed, 26 Nov 2014 17:19:49 +0100
Message-ID: <1417018789-9235-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:47253 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbaKZQTz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Nov 2014 11:19:55 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was already sent a year ago with Message-Id:
<1385412225-29740-4-git-send-email-u.kleine-koenig@pengutronix.de>
without any feedback. Still applies to next-20141126.

Best regards
Uwe

 drivers/leds/leds-pwm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index f668500a2157..9cfb7b348593 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -239,6 +239,6 @@ static struct platform_driver led_pwm_driver =3D {
 module_platform_driver(led_pwm_driver);
=20
 MODULE_AUTHOR("Luotao Fu <l.fu@pengutronix.de>");
-MODULE_DESCRIPTION("PWM LED driver for PXA");
-MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("generic PWM LED driver");
+MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:leds-pwm");
--=20
2.1.3
