From: weiyj_lk@163.com
Subject: [PATCH -next] leds: ipaq-micro: fix sparse non static symbol warning
Date: Mon, 28 Jul 2014 21:15:24 +0800
Message-ID: <1406553324-29593-1-git-send-email-weiyj_lk@163.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from m12-15.163.com ([220.181.12.15]:55497 "EHLO m12-15.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753050AbaG1NPh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 28 Jul 2014 09:15:37 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-leds@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fixes the following sparse warnings:

drivers/leds/leds-ipaq-micro.c:130:24: warning:
 symbol 'micro_leds_device_driver' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/leds/leds-ipaq-micro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 3210a47..3776f51 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -127,7 +127,7 @@ static int micro_leds_remove(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver micro_leds_device_driver = {
+static struct platform_driver micro_leds_device_driver = {
 	.driver = {
 		.name    = "ipaq-micro-leds",
 	},
