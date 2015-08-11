From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 53/57] leds: dell: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:06 +0200
Message-ID: <1439285890-27329-54-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Louis Davis <louis_davis@dell.com>, Jim Dailey <jim_dailey@dell.com>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Louis Davis <louis_davis@dell.com>
Cc: Jim Dailey <jim_dailey@dell.com>
---
 drivers/leds/dell-led.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/dell-led.c b/drivers/leds/dell-led.c
index c36acaf..8a69849 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/leds/dell-led.c
@@ -315,12 +315,12 @@ static int dell_led_blink(struct led_classdev *led_cdev,
 }
 
 static struct led_classdev dell_led = {
-	.name		= "dell::lid",
-	.brightness	= LED_OFF,
-	.max_brightness = 1,
-	.brightness_set = dell_led_set,
-	.blink_set	= dell_led_blink,
-	.flags		= LED_CORE_SUSPENDRESUME,
+	.name				= "dell::lid",
+	.brightness			= LED_OFF,
+	.max_brightness			= 1,
+	.brightness_set_nonblocking	= dell_led_set,
+	.blink_set			= dell_led_blink,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static int __init dell_led_init(void)
-- 
1.7.9.5
