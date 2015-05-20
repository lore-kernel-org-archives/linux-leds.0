From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 12/20] leds: mark net48xx driver with LED_BRIGHTNESS_FAST
 flag
Date: Wed, 20 May 2015 18:30:37 +0300
Message-ID: <555CA89D.6020205@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Chris Boot <bootc@bootc.net>
List-Id: linux-leds@vger.kernel.org


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chris Boot <bootc@bootc.net>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds-net48xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index ec3a2e8..8644341 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -34,7 +34,7 @@ static void net48xx_error_led_set(struct led_classdev *led_cdev,
 static struct led_classdev net48xx_error_led = {
 	.name		= "net48xx::error",
 	.brightness_set	= net48xx_error_led_set,
-	.flags		= LED_CORE_SUSPENDRESUME,
+	.flags		= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };

 static int net48xx_led_probe(struct platform_device *pdev)
-- 
1.7.9.5
