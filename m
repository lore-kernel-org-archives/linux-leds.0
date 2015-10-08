From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 1/4] leds-bcm6328: print invalid LED
Date: Thu,  8 Oct 2015 12:35:52 +0200
Message-ID: <1444300555-13988-2-git-send-email-noltari@gmail.com>
References: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:38321 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752278AbbJHKfm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2015 06:35:42 -0400
In-Reply-To: <1444300555-13988-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, cernekee@gmail.com, f.fainelli@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

Print invalid LED instead of warning only about maximum LED value.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 986fe1e..5daf7be 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -373,7 +373,7 @@ static int bcm6328_leds_probe(struct platform_devic=
e *pdev)
 			continue;
=20
 		if (reg >=3D BCM6328_LED_MAX_COUNT) {
-			dev_err(dev, "invalid LED (>=3D %d)\n",
+			dev_err(dev, "invalid LED (%u >=3D %d)\n", reg,
 				BCM6328_LED_MAX_COUNT);
 			continue;
 		}
--=20
1.9.1
