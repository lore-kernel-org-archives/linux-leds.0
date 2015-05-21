From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 06/20] leds: mark cobalt-qube driver with LED_BRIGHTNESS_FAST
 flag
Date: Thu, 21 May 2015 18:15:06 +0300
Message-ID: <555DF67A.6030805@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp41.i.mail.ru ([94.100.177.101]:48095 "EHLO smtp41.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753309AbbEUPPM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:15:12 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Florian Fainelli <florian@openwrt.org>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Florian Fainelli <florian@openwrt.org>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-cobalt-qube.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index d975220..f16da2a 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -31,6 +31,7 @@ static struct led_classdev qube_front_led = {
 	.brightness		= LED_FULL,
 	.brightness_set		= qube_front_led_set,
 	.default_trigger	= "default-on",
+	.flags			= LED_BRIGHTNESS_FAST,
 };

 static int cobalt_qube_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
