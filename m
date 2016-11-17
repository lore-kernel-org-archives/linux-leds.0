From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v5 5/6] platform: x86: dell-laptop: Set keyboard backlight led device default trigger
Date: Thu, 17 Nov 2016 23:24:40 +0100
Message-ID: <20161117222441.31464-5-hdegoede@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60138 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752808AbcKQWY4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Nov 2016 17:24:56 -0500
In-Reply-To: <20161117222441.31464-1-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Set kbd_led.default_trigger to "kbd-backlight", this will allow user
space to be notified of brightness changes through
ledtrig_kbd_backlight().

Note this also sets the LED_TRIGGER_READ_ONLY flag since the brightness
is hardwired to be controlled by the kbd-backlight hotkey.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
-This is a new patch in v5 of this patch-set
---
 drivers/platform/x86/dell-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 14392a0..6c0f047 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1937,9 +1937,11 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 
 static struct led_classdev kbd_led = {
 	.name           = "dell::kbd_backlight",
+	.flags		= LED_TRIGGER_READ_ONLY,
 	.brightness_set_blocking = kbd_led_level_set,
 	.brightness_get = kbd_led_level_get,
 	.groups         = kbd_led_groups,
+	.default_trigger = "kbd-backlight",
 };
 
 static int __init kbd_led_init(struct device *dev)
-- 
2.9.3
