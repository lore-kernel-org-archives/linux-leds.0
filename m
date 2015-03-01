From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] leds: lp8860: make use of devm_gpiod_get_optional
Date: Sun,  1 Mar 2015 22:25:47 +0100
Message-ID: <1425245147-3521-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:40052 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751313AbbCAVZ5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 1 Mar 2015 16:25:57 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: kernel@pengutronix.de, linux-leds@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The probe function open coded a bad variant of devm_gpiod_get_optional
using devm_gpiod_get and just ignoring all errors.
In contrast to that devm_gpiod_get_optional returns NULL if there was n=
o
corresponding gpio specified in the device tree (or ACPI table) and
fails if there is an error (or GPIOLIB is not enabled).

Moreover since 39b2bbe3d715 (gpio: add flags argument to gpiod_get*()
functions) which appeared in v3.17-rc1, the gpiod_get* functions take a=
n
additional parameter that allows to specify direction and initial value
for output which allows some simplification.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-lp8860.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 840e93f3ab3e..f2a29c256d32 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -391,11 +391,13 @@ static int lp8860_probe(struct i2c_client *client=
,
 		}
 	}
=20
-	led->enable_gpio =3D devm_gpiod_get(&client->dev, "enable");
-	if (IS_ERR(led->enable_gpio))
-		led->enable_gpio =3D NULL;
-	else
-		gpiod_direction_output(led->enable_gpio, 0);
+	led->enable_gpio =3D devm_gpiod_get_optional(&client->dev,
+						   "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(led->enable_gpio)) {
+		ret =3D PTR_ERR(led->enable_gpio);
+		dev_err(&client->dev, "Failed to get enable gpio: %d\n", ret);
+		return ret;
+	}
=20
 	led->regulator =3D devm_regulator_get(&client->dev, "vled");
 	if (IS_ERR(led->regulator))
--=20
2.1.4
