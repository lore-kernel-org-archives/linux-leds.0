From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 50/57] leds: fsg: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 11:38:03 +0200
Message-ID: <1439285890-27329-51-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Rod Whitby <rod@whitby.id.au>
List-Id: linux-leds@vger.kernel.org

The driver neither sleeps nor uses delays in its brightness_set op.
Use a new brightness_set_nonblocking op instead of brightness_set for
setting brightness then.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rod Whitby <rod@whitby.id.au>
---
 drivers/leds/leds-fsg.c |   36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
index 2b4dc73..605ef9f 100644
--- a/drivers/leds/leds-fsg.c
+++ b/drivers/leds/leds-fsg.c
@@ -107,39 +107,39 @@ static void fsg_led_ring_set(struct led_classdev *led_cdev,
 
 
 static struct led_classdev fsg_wlan_led = {
-	.name			= "fsg:blue:wlan",
-	.brightness_set		= fsg_led_wlan_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "fsg:blue:wlan",
+	.brightness_set_nonblocking	= fsg_led_wlan_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev fsg_wan_led = {
-	.name			= "fsg:blue:wan",
-	.brightness_set		= fsg_led_wan_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "fsg:blue:wan",
+	.brightness_set_nonblocking	= fsg_led_wan_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev fsg_sata_led = {
-	.name			= "fsg:blue:sata",
-	.brightness_set		= fsg_led_sata_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "fsg:blue:sata",
+	.brightness_set_nonblocking	= fsg_led_sata_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev fsg_usb_led = {
-	.name			= "fsg:blue:usb",
-	.brightness_set		= fsg_led_usb_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "fsg:blue:usb",
+	.brightness_set_nonblocking	= fsg_led_usb_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev fsg_sync_led = {
-	.name			= "fsg:blue:sync",
-	.brightness_set		= fsg_led_sync_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "fsg:blue:sync",
+	.brightness_set_nonblocking	= fsg_led_sync_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 static struct led_classdev fsg_ring_led = {
-	.name			= "fsg:blue:ring",
-	.brightness_set		= fsg_led_ring_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+	.name				= "fsg:blue:ring",
+	.brightness_set_nonblocking	= fsg_led_ring_set,
+	.flags				= LED_CORE_SUSPENDRESUME,
 };
 
 
-- 
1.7.9.5
