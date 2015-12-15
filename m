From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 6/8] leds: bcm6358: add little endian support
Date: Tue, 15 Dec 2015 21:03:50 +0100
Message-ID: <1450209832-2742-7-git-send-email-noltari@gmail.com>
References: <1448814931-1369-1-git-send-email-noltari@gmail.com>
 <1450209832-2742-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36014 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932365AbbLOUEH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 15 Dec 2015 15:04:07 -0500
Received: by mail-wm0-f49.google.com with SMTP id n186so181195027wmn.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Dec 2015 12:04:07 -0800 (PST)
In-Reply-To: <1450209832-2742-1-git-send-email-noltari@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, jogo@openwrt.org, f.fainelli@gmail.com, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This adds little endian support while keeping big endian support.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: add little endian support instead of switch to __raw io

 drivers/leds/leds-bcm6358.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index ab09ea4..ffc978d 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -49,12 +49,20 @@ struct bcm6358_led {
=20
 static void bcm6358_led_write(void __iomem *reg, unsigned long data)
 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
 	iowrite32be(data, reg);
+#else
+	writel(data, reg);
+#endif
 }
=20
 static unsigned long bcm6358_led_read(void __iomem *reg)
 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
 	return ioread32be(reg);
+#else
+	return readl(reg);
+#endif
 }
=20
 static unsigned long bcm6358_led_busy(void __iomem *mem)
--=20
1.9.1
