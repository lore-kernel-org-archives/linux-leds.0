From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 45/51] leds: fsg: Mark the LED fast
Date: Fri, 17 Jul 2015 10:47:31 +0200
Message-ID: <1437122857-6765-46-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Rod Whitby <rod@whitby.id.au>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set
op. Mark it fast then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rod Whitby <rod@whitby.id.au>
---
 drivers/leds/leds-fsg.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
index 2b4dc73..8b33269 100644
--- a/drivers/leds/leds-fsg.c
+++ b/drivers/leds/leds-fsg.c
@@ -109,37 +109,37 @@ static void fsg_led_ring_set(struct led_classdev *led_cdev,
 static struct led_classdev fsg_wlan_led = {
 	.name			= "fsg:blue:wlan",
 	.brightness_set		= fsg_led_wlan_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev fsg_wan_led = {
 	.name			= "fsg:blue:wan",
 	.brightness_set		= fsg_led_wan_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev fsg_sata_led = {
 	.name			= "fsg:blue:sata",
 	.brightness_set		= fsg_led_sata_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev fsg_usb_led = {
 	.name			= "fsg:blue:usb",
 	.brightness_set		= fsg_led_usb_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev fsg_sync_led = {
 	.name			= "fsg:blue:sync",
 	.brightness_set		= fsg_led_sync_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 static struct led_classdev fsg_ring_led = {
 	.name			= "fsg:blue:ring",
 	.brightness_set		= fsg_led_ring_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.flags			= LED_CORE_SUSPENDRESUME | LED_BRIGHTNESS_FAST,
 };
 
 
-- 
1.7.9.5
