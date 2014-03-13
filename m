From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] leds: clevo-mail: Make probe function __init
Date: Thu, 13 Mar 2014 18:56:24 +0100
Message-ID: <20140313185624.4eb87d4f@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45145 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754653AbaCMR41 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 13 Mar 2014 13:56:27 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

One of the benefits of platform_driver_probe() is that you can make
the probe function __init.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
Build tested only, no hardware.

 drivers/leds/leds-clevo-mail.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-3.14-rc6.orig/drivers/leds/leds-clevo-mail.c	2014-01-20 03:40:07.000000000 +0100
+++ linux-3.14-rc6/drivers/leds/leds-clevo-mail.c	2014-03-13 18:29:24.597849128 +0100
@@ -153,7 +153,7 @@ static struct led_classdev clevo_mail_le
 	.flags			= LED_CORE_SUSPENDRESUME,
 };
 
-static int clevo_mail_led_probe(struct platform_device *pdev)
+static int __init clevo_mail_led_probe(struct platform_device *pdev)
 {
 	return led_classdev_register(&pdev->dev, &clevo_mail_led);
 }
@@ -165,7 +165,6 @@ static int clevo_mail_led_remove(struct
 }
 
 static struct platform_driver clevo_mail_led_driver = {
-	.probe		= clevo_mail_led_probe,
 	.remove		= clevo_mail_led_remove,
 	.driver		= {
 		.name		= KBUILD_MODNAME,


-- 
Jean Delvare
SUSE L3 Support
