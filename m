From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] leds: aat1290: pass flags parameter to devm_gpiod_get
Date: Fri, 12 Jun 2015 09:35:43 +0200
Message-ID: <1434094543-18665-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:53149 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435AbbFLHfr (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Jun 2015 03:35:47 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sakari Ailus <sakari.ailus@linux.intel.com>

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

this patch applies to next and is only necessary on top of 49c34b8e0f43
(leds: Add driver for AAT1290 flash LED controller) which currently sit=
s
in next.

Note I plan to make the flags parameter mandatory for 4.3. So unless
this change gets into 4.2, would it be ok to let it go in via the gpio
tree?

Best regards
Uwe

 drivers/leds/leds-aat1290.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 6ea1d5465309..8635404d7883 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -237,14 +237,14 @@ static int aat1290_led_parse_dt(struct aat1290_le=
d *led,
 	struct device_node *child_node;
 	int ret =3D 0;
=20
-	led->gpio_fl_en =3D devm_gpiod_get(dev, "flen");
+	led->gpio_fl_en =3D devm_gpiod_get(dev, "flen", GPIOD_ASIS);
 	if (IS_ERR(led->gpio_fl_en)) {
 		ret =3D PTR_ERR(led->gpio_fl_en);
 		dev_err(dev, "Unable to claim gpio \"flen\".\n");
 		return ret;
 	}
=20
-	led->gpio_en_set =3D devm_gpiod_get(dev, "enset");
+	led->gpio_en_set =3D devm_gpiod_get(dev, "enset", GPIOD_ASIS);
 	if (IS_ERR(led->gpio_en_set)) {
 		ret =3D PTR_ERR(led->gpio_en_set);
 		dev_err(dev, "Unable to claim gpio \"enset\".\n");
--=20
2.1.4
