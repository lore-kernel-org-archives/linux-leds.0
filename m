From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: Add mutex protection in brightness_show()
Date: Fri, 04 Nov 2016 08:52:42 +0100
Message-ID: <1478245962-15706-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49362 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753956AbcKDHwz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Nov 2016 03:52:55 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>

Initially the claim about no need for lock in brightness_show()
was valid as the function was just returning unchanged
LED brightness. After the addition of led_update_brightness() this
is no longer true, as the function can change the brightness if
a LED class driver implements brightness_get op. It can lead to
races between led_update_brightness() and led_set_brightness(),
resulting in overwriting new brightness with the old one before
the former is written to the device.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/led-class.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 731e4eb..0c2307b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *dev,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 
-	/* no lock needed for this */
+	mutex_lock(&led_cdev->led_access);
 	led_update_brightness(led_cdev);
+	mutex_unlock(&led_cdev->led_access);
 
 	return sprintf(buf, "%u\n", led_cdev->brightness);
 }
-- 
1.9.1
