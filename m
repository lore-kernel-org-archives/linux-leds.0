From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] leds: mlxcpld: fix return value check in mlxcpld_led_init()
Date: Tue, 13 Sep 2016 14:58:35 +0000
Message-ID: <1473778715-11283-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:35889 "EHLO
        mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752710AbcIMO6r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 10:58:47 -0400
Received: by mail-pa0-f68.google.com with SMTP id p2so3087569pap.3
        for <linux-leds@vger.kernel.org>; Tue, 13 Sep 2016 07:58:47 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-leds@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function platform_device_register_simple() returns
ERR_PTR() and never returns NULL. The NULL test in the return value
check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/leds/leds-mlxcpld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
index 125ddfa..2ba76c1 100644
--- a/drivers/leds/leds-mlxcpld.c
+++ b/drivers/leds/leds-mlxcpld.c
@@ -401,9 +401,9 @@ static int __init mlxcpld_led_init(void)
 	int err;
 
 	pdev = platform_device_register_simple(KBUILD_MODNAME, -1, NULL, 0);
-	if (!pdev) {
+	if (IS_ERR(pdev)) {
 		pr_err("Device allocation failed\n");
-		return -ENOMEM;
+		return PTR_ERR(pdev);
 	}
 
 	err = platform_driver_probe(&mlxcpld_led_driver, mlxcpld_led_probe);
