From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 5/8] leds: bcm6328: add little endian support
Date: Tue, 15 Dec 2015 21:03:49 +0100
Message-ID: <1450209832-2742-6-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38506 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933554AbbLOUEF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:05 -0500
Received: by mail-wm0-f48.google.com with SMTP id l126so9680854wml.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:05 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This adds little endian support while keeping big endian support.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: add little endian support instead of switch to __raw io

 drivers/leds/leds-bcm6328.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index cd54264..e13daa2 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -76,12 +76,20 @@ struct bcm6328_led {
=20
 static void bcm6328_led_write(void __iomem *reg, unsigned long data)
 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
 	iowrite32be(data, reg);
+#else
+	writel(data, reg);
+#endif
 }
=20
 static unsigned long bcm6328_led_read(void __iomem *reg)
 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
 	return ioread32be(reg);
+#else
+	return readl(reg);
+#endif
 }
=20
 /**
--=20
1.9.1
