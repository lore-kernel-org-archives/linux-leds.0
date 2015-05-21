From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 09/20] leds: mark gpio driver with LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 18:16:53 +0300
Message-ID: <555DF6E5.6060809@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp42.i.mail.ru ([94.100.177.102]:37104 "EHLO smtp42.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755819AbbEUPRE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:17:04 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Raphael Assenat <raph@8d.com>


This driver doesn't use sleeping operations in .brightness_set
method if can_sleep variable is not set. In that case it can be
marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Raphael Assenat <raph@8d.com>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-gpio.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 3af4f2b..0e1346c 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -138,6 +138,8 @@ static int create_gpio_led(const struct gpio_led *template,
 	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
 	if (!template->retain_state_suspended)
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	if (!led_dat->can_sleep)
+		led_dat->cdev.flags |= LED_BRIGHTNESS_FAST;

 	ret = gpiod_direction_output(led_dat->gpiod, state);
 	if (ret < 0)
-- 
1.7.9.5
