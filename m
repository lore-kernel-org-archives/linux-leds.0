From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 03/20] leds: mark asic3 driver with LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 18:12:42 +0300
Message-ID: <555DF5EA.5070704@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp3.mail.ru ([94.100.179.58]:56909 "EHLO smtp3.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964829AbbEUPMx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:12:53 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Paul Parsons <lost.distance@yahoo.com>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Paul Parsons <lost.distance@yahoo.com>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-asic3.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-asic3.c b/drivers/leds/leds-asic3.c
index 1b71eac..427befa 100644
--- a/drivers/leds/leds-asic3.c
+++ b/drivers/leds/leds-asic3.c
@@ -108,7 +108,7 @@ static int asic3_led_probe(struct platform_device *pdev)
 	}

 	led->cdev->name = led->name;
-	led->cdev->flags = LED_CORE_SUSPENDRESUME;
+	led->cdev->flags = LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST;
 	led->cdev->brightness_set = brightness_set;
 	led->cdev->blink_set = blink_set;
 	led->cdev->default_trigger = led->default_trigger;
-- 
1.7.9.5
