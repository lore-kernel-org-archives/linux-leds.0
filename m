From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 19/20] leds: mark versatile driver with LED_BRIGHTNESS_FAST
 flag
Date: Thu, 21 May 2015 18:23:38 +0300
Message-ID: <555DF87A.8030108@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp37.i.mail.ru ([94.100.177.97]:53617 "EHLO smtp37.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755139AbbEUPZZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:25:25 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <triad@df.lth.se>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Linus Walleij <triad@df.lth.se>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-versatile.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-versatile.c b/drivers/leds/leds-versatile.c
index 8055302..4061257 100644
--- a/drivers/leds/leds-versatile.c
+++ b/drivers/leds/leds-versatile.c
@@ -84,6 +84,7 @@ static int versatile_leds_probe(struct platform_device *dev)
 		led->cdev.name = versatile_leds[i].name;
 		led->cdev.brightness_set = versatile_led_set;
 		led->cdev.brightness_get = versatile_led_get;
+		led->cdev.flags |= LED_BRIGHTNESS_FAST;
 		led->cdev.default_trigger = versatile_leds[i].trigger;
 		led->mask = BIT(i);

-- 
1.7.9.5
