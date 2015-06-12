From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] leds: ktd2692: pass flags parameter to devm_gpiod_get
Date: Fri, 12 Jun 2015 09:32:23 +0200
Message-ID: <1434094343-10349-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:53064 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196AbbFLHc3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jun 2015 03:32:29 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Ingi Kim <ingi2.kim@samsung.com>, Varka Bhadram <varkabhadram@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

Since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*() functions)
which appeared in v3.17-rc1, the gpiod_get* functions take an additiona=
l
parameter that allows to specify direction and initial value for output=
=2E

In this case the driver cannot easily be simplified but as the flags
parameter will become mandatory soon this change is necessary
beforehand.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch applies to next and is only necessary on top of b7da8c5c725c
(leds: Add ktd2692 flash LED driver) which currently sits in next.

Note I plan to make the flags parameter mandatory for 4.3. So unless
this change gets into 4.2, would it be ok to let it go in via the gpio
tree?

Best regards
Uwe

 drivers/leds/leds-ktd2692.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index fe05cd113b9d..2ae8c4d17ff8 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -295,14 +295,14 @@ static int ktd2692_parse_dt(struct ktd2692_contex=
t *led, struct device *dev,
 	if (!dev->of_node)
 		return -ENXIO;
=20
-	led->ctrl_gpio =3D devm_gpiod_get(dev, "ctrl");
+	led->ctrl_gpio =3D devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
 	if (IS_ERR(led->ctrl_gpio)) {
 		ret =3D PTR_ERR(led->ctrl_gpio);
 		dev_err(dev, "cannot get ctrl-gpios %d\n", ret);
 		return ret;
 	}
=20
-	led->aux_gpio =3D devm_gpiod_get(dev, "aux");
+	led->aux_gpio =3D devm_gpiod_get(dev, "aux", GPIOD_ASIS);
 	if (IS_ERR(led->aux_gpio)) {
 		ret =3D PTR_ERR(led->aux_gpio);
 		dev_err(dev, "cannot get aux-gpios %d\n", ret);
--=20
2.1.4
