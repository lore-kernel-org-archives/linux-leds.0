From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 3/3] leds/pwm: fix driver description and make license match the header
Date: Mon, 25 Nov 2013 21:43:45 +0100
Message-ID: <1385412225-29740-4-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:38912 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752033Ab3KYUoZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Nov 2013 15:44:25 -0500
In-Reply-To: <1385412225-29740-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Matt Sealey <matt@genesi-usa.com>

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-pwm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index cdc3e4d..0796ca3 100644
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
1.8.4.2
