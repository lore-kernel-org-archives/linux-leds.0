From: Luis de Bethencourt <luis@debethencourt.com>
Subject: [PATCH 6/6] leds: leds-ns2: Fix module autoload for OF platform
 driver
Date: Tue, 1 Sep 2015 23:36:59 +0200
Message-ID: <20150901213659.GA14405@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:33041 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbbIAVhB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2015 17:37:01 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luis@debethencourt.com>
---
 drivers/leds/leds-ns2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index b33514d..a95a612 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -337,6 +337,7 @@ static const struct of_device_id of_ns2_leds_match[] = {
 	{ .compatible = "lacie,ns2-leds", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
 #endif /* CONFIG_OF_GPIO */
 
 struct ns2_led_priv {
-- 
2.4.6
