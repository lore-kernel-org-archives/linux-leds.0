From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 07/20] leds: mark cobalt-raq driver with LED_BRIGHTNESS_FAST
 flag
Date: Thu, 21 May 2015 18:15:45 +0300
Message-ID: <555DF6A1.2070906@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Yoichi Yuasa <yuasa@linux-mips.org>
List-Id: linux-leds@vger.kernel.org


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Yoichi Yuasa <yuasa@linux-mips.org>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-cobalt-raq.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
index 06dbe18..d0579ef 100644
--- a/drivers/leds/leds-cobalt-raq.c
+++ b/drivers/leds/leds-cobalt-raq.c
@@ -52,6 +52,7 @@ static void raq_web_led_set(struct led_classdev *led_cdev,
 static struct led_classdev raq_web_led = {
 	.name		= "raq::web",
 	.brightness_set	= raq_web_led_set,
+	.flags		= LED_BRIGHTNESS_FAST,
 };

 static void raq_power_off_led_set(struct led_classdev *led_cdev,
@@ -74,6 +75,7 @@ static struct led_classdev raq_power_off_led = {
 	.name			= "raq::power-off",
 	.brightness_set		= raq_power_off_led_set,
 	.default_trigger	= "power-off",
+	.flags			= LED_BRIGHTNESS_FAST,
 };

 static int cobalt_raq_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
