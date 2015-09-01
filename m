From: Luis de Bethencourt <luis@debethencourt.com>
Subject: [PATCH 3/6] leds: bcm6358: Fix module autoload for OF platform driver
Date: Tue, 1 Sep 2015 23:35:55 +0200
Message-ID: <20150901213555.GA14336@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36689 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753052AbbIAVf5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2015 17:35:57 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luis@debethencourt.com>
---
 drivers/leds/leds-bcm6358.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 21f9693..7ea3526 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -226,6 +226,7 @@ static const struct of_device_id bcm6358_leds_of_match[] = {
 	{ .compatible = "brcm,bcm6358-leds", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, bcm6358_leds_of_match);
 
 static struct platform_driver bcm6358_leds_driver = {
 	.probe = bcm6358_leds_probe,
-- 
2.4.6
