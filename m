From: weiyj_lk@163.com
Subject: [PATCH] leds: leds-gpio: Fix return value check in create_gpio_led()
Date: Sat,  6 Feb 2016 22:37:33 +0800
Message-ID: <1454769453-9533-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from m12-13.163.com ([220.181.12.13]:60905 "EHLO m12-13.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751686AbcBFOiH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sat, 6 Feb 2016 09:38:07 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-leds@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function gpio_to_desc() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/leds/leds-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 7bc5328..5883ded 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -104,8 +104,8 @@ static int create_gpio_led(const struct gpio_led *template,
 			return ret;
 
 		led_dat->gpiod = gpio_to_desc(template->gpio);
-		if (IS_ERR(led_dat->gpiod))
-			return PTR_ERR(led_dat->gpiod);
+		if (!led_dat->gpiod)
+			return -EINVAL;
 	}
 
 	led_dat->cdev.name = template->name;
