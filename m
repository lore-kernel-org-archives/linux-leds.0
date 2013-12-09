From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [PATCH] drivers: leds: leds-tca6507: check CONFIG_GPIOLIB whether
 defined for 'gpio_base'
Date: Mon, 09 Dec 2013 12:41:37 +0800
Message-ID: <52A54A01.60107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:45257 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760409Ab3LIEjW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 8 Dec 2013 23:39:22 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so4487366pde.27
        for <linux-leds@vger.kernel.org>; Sun, 08 Dec 2013 20:39:22 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, James Hogan <james.hogan@imgtec.com>

Need check CONFIG_GPIOLIB whether defined, just like another area has
done within this file. Or can not pass compiling when CONFIG_GPIOLIB
disabled.

The related error (with allmodconfig for metag):

    CC [M]  drivers/leds/leds-tca6507.o
  drivers/leds/leds-tca6507.c: In function 'tca6507_led_dt_init':
  drivers/leds/leds-tca6507.c:731: error: 'struct tca6507_platform_data' has no member named 'gpio_base'


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 drivers/leds/leds-tca6507.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 503df83..3d9e267 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -728,8 +728,9 @@ tca6507_led_dt_init(struct i2c_client *client)
 
 	pdata->leds.leds = tca_leds;
 	pdata->leds.num_leds = NUM_LEDS;
+#ifdef CONFIG_GPIOLIB
 	pdata->gpio_base = -1;
-
+#endif
 	return pdata;
 }
 
-- 
1.7.7.6
