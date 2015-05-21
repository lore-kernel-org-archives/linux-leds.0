From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 08/20] leds: mark fsg driver with LED_BRIGHTNESS_FAST flag
Date: Thu, 21 May 2015 18:16:16 +0300
Message-ID: <555DF6C0.8010504@list.ru>
References: <555CA58A.10700@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp45.i.mail.ru ([94.100.177.105]:55833 "EHLO smtp45.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753867AbbEUPQX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 May 2015 11:16:23 -0400
In-Reply-To: <555CA58A.10700@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rod Whitby <rod@whitby.id.au>


This driver doesn't use sleeping operations in .brightness_set
method, and can be marked with LED_BRIGHTNESS_FAST flag.
That flag allows changing brightness at high rates (over 100Hz).

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Rod Whitby <rod@whitby.id.au>

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
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
