From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 02/20] leds: mark dell-led driver with LED_BRIGHTNESS_FAST
 flag
Date: Wed, 20 May 2015 18:20:44 +0300
Message-ID: <555CA64C.50507@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp12.mail.ru ([94.100.181.93]:43788 "EHLO smtp12.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752922AbbETPUs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 20 May 2015 11:20:48 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/dell-led.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index c36acaf..159231b 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -320,7 +320,7 @@ static struct led_classdev dell_led = {
 	.max_brightness = 1,
 	.brightness_set = dell_led_set,
 	.blink_set	= dell_led_blink,
-	.flags		= LED_CORE_SUSPENDRESUME,
+	.flags		= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static int __init dell_led_init(void)
-- 
1.7.9.5
