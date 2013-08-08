From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 10/10] leds: lp5562: use LP55xx common macros for device attributes
Date: Thu,  8 Aug 2013 16:59:54 +0900
Message-ID: <1375948794-6286-11-git-send-email-milo.kim@ti.com>
References: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:47280 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934059Ab3HHIAx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2013 04:00:53 -0400
In-Reply-To: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>


Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5562.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index a2c7398..2585cfd 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -477,8 +477,8 @@ static ssize_t lp5562_store_engine_mux(struct device *dev,
 	return len;
 }
 
-static DEVICE_ATTR(led_pattern, S_IWUSR, NULL, lp5562_store_pattern);
-static DEVICE_ATTR(engine_mux, S_IWUSR, NULL, lp5562_store_engine_mux);
+static LP55XX_DEV_ATTR_WO(led_pattern, lp5562_store_pattern);
+static LP55XX_DEV_ATTR_WO(engine_mux, lp5562_store_engine_mux);
 
 static struct attribute *lp5562_attributes[] = {
 	&dev_attr_led_pattern.attr,
-- 
1.7.9.5

