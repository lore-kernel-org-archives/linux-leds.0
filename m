From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 48/51] leds: dell: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:34 +0200
Message-ID: <1437122857-6765-49-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Louis Davis <louis_davis@dell.com>, Jim Dailey <jim_dailey@dell.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Louis Davis <louis_davis@dell.com>
Cc: Jim Dailey <jim_dailey@dell.com>
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
