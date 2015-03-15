From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] leds: pca963x: Add missing initialiation of struct led_info.flags
Date: Sun, 15 Mar 2015 11:41:52 +0100
Message-ID: <1426416112-27477-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:32829 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751554AbbCOKl4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 15 Mar 2015 06:41:56 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

drivers/leds/leds-pca963x.c: In function =E2=80=98pca963x_dt_init=E2=80=
=99:
drivers/leds/leds-pca963x.c:303: warning: =E2=80=98led.flags=E2=80=99 i=
s used uninitialized in this function

Only the name and default_trigger fields are initialized.
Other fields (currently flags only) contain random stack data.
Pre-initialize the led structure completely to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/leds/leds-pca963x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index f110b4c456baa77f..bee3e1ab27fd92fd 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -289,7 +289,7 @@ pca963x_dt_init(struct i2c_client *client, struct p=
ca963x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
=20
 	for_each_child_of_node(np, child) {
-		struct led_info led;
+		struct led_info led =3D {};
 		u32 reg;
 		int res;
=20
--=20
1.9.1
