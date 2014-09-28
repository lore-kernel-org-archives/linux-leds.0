From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 2/3] led: gpio: Fix possible ZERO_SIZE_PTR pointer dereferencing error.
Date: Sun, 28 Sep 2014 16:57:15 +0800
Message-ID: <1411894636-12360-3-git-send-email-Li.Xiubo@freescale.com>
References: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bn1bon0116.outbound.protection.outlook.com ([157.56.111.116]:54592
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751070AbaI1JaX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 28 Sep 2014 05:30:23 -0400
In-Reply-To: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>

Since we cannot make sure the 'pdata->num_leds' will always be none
zero here, and then if it equals to zero, the kmemdup() will return
ZERO_SIZE_PTR, which equals to ((void *)16).

So this patch fix this with just doing the zero check before calling
kmemdup().

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-gpio-register.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-register.c
index fbd8934..75717ba 100644
--- a/drivers/leds/leds-gpio-register.c
+++ b/drivers/leds/leds-gpio-register.c
@@ -28,6 +28,9 @@ struct platform_device *__init gpio_led_register_device(
 	struct platform_device *ret;
 	struct gpio_led_platform_data _pdata = *pdata;
 
+	if (!pdata->num_leds)
+		return ERR_PTR(-EINVAL);
+
 	_pdata.leds = kmemdup(pdata->leds,
 			pdata->num_leds * sizeof(*pdata->leds), GFP_KERNEL);
 	if (!_pdata.leds)
-- 
2.1.0.27.g96db324
