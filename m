From: Luis de Bethencourt <luis@debethencourt.com>
Subject: [PATCH 4/6] leds: ktd2692: Fix module autoload for OF platform driver
Date: Tue, 1 Sep 2015 23:36:15 +0200
Message-ID: <20150901213615.GA14345@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:33609 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753160AbbIAVgS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2015 17:36:18 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

This platform driver has a OF device ID table but the OF module
alias information is not created so module autoloading won't work.

Signed-off-by: Luis de Bethencourt <luis@debethencourt.com>
---
 drivers/leds/leds-ktd2692.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 2ae8c4d..feca07b 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -426,6 +426,7 @@ static const struct of_device_id ktd2692_match[] = {
 	{ .compatible = "kinetic,ktd2692", },
 	{ /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, ktd2692_match);
 
 static struct platform_driver ktd2692_driver = {
 	.driver = {
-- 
2.4.6
