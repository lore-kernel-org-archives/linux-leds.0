From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] leds: mlxcpld: remove unused including <linux/version.h>
Date: Tue, 13 Sep 2016 14:58:55 +0000
Message-ID: <1473778735-11398-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34960 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752710AbcIMO7B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 10:59:01 -0400
Received: by mail-pf0-f195.google.com with SMTP id z84so1363544pfi.2
        for <linux-leds@vger.kernel.org>; Tue, 13 Sep 2016 07:59:01 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-leds@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Remove including <linux/version.h> that don't need it.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/leds/leds-mlxcpld.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
index 125ddfa..f4a0bbd 100644
--- a/drivers/leds/leds-mlxcpld.c
+++ b/drivers/leds/leds-mlxcpld.c
@@ -42,7 +42,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/version.h>
 
 #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR     0x2500 /* LPC bus access */
