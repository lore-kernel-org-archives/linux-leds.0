From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 14/20] leds: mark ns2 driver with LED_BRIGHTNESS_FAST flag
Date: Wed, 20 May 2015 18:32:36 +0300
Message-ID: <555CA914.1060105@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org


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
 drivers/leds/leds-ns2.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 1fd6adb..9d872f5 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -224,7 +224,7 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->cdev.blink_set = NULL;
 	led_dat->cdev.brightness_set = ns2_led_set;
-	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST;
 	led_dat->cdev.groups = ns2_led_groups;
 	led_dat->cmd = template->cmd;
 	led_dat->slow = template->slow;
-- 
1.7.9.5
