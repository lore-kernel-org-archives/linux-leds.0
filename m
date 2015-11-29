From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 5/7] leds-bcm6328: switch to __raw_readl() and __raw_writel()
Date: Sun, 29 Nov 2015 17:35:29 +0100
Message-ID: <1448814931-1369-5-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:32877 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752012AbbK2QfN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 29 Nov 2015 11:35:13 -0500
Received: by wmec201 with SMTP id c201so124726991wme.0
        for <linux-leds@vger.kernel.org>; Sun, 29 Nov 2015 08:35:12 -0800 (PST)
In-Reply-To: <1448814931-1369-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index cd54264..876f0ce 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -76,12 +76,12 @@ struct bcm6328_led {
=20
 static void bcm6328_led_write(void __iomem *reg, unsigned long data)
 {
-	iowrite32be(data, reg);
+	__raw_writel(data, reg);
 }
=20
 static unsigned long bcm6328_led_read(void __iomem *reg)
 {
-	return ioread32be(reg);
+	return __raw_readl(reg);
 }
=20
 /**
--=20
1.9.1
