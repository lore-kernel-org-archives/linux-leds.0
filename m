From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 10/20] leds: mark hp6xx driver with LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 18:17:39 +0300
Message-ID: <555DF713.2090006@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp1.mail.ru ([94.100.179.111]:43737 "EHLO smtp1.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755139AbbEUPRr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:17:47 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kristoffer Ericson <kristoffer.ericson@gmail.com>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-hp6xx.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
index 0b84c01..8f369fb 100644
--- a/drivers/leds/leds-hp6xx.c
+++ b/drivers/leds/leds-hp6xx.c
@@ -45,14 +45,14 @@ static struct led_classdev hp6xx_red_led = {
 	.name			= "hp6xx:red",
 	.default_trigger	= "hp6xx-charge",
 	.brightness_set		= hp6xxled_red_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static struct led_classdev hp6xx_green_led = {
 	.name			= "hp6xx:green",
 	.default_trigger	= "ide-disk",
 	.brightness_set		= hp6xxled_green_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static int hp6xxled_probe(struct platform_device *pdev)
-- 
1.7.9.5
