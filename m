From: Nick Crews <ncrews@chromium.org>
Subject: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard backlight name
Date: Thu,  4 Apr 2019 11:10:10 -0600
Message-ID: <20190404171007.160878-3-ncrews@chromium.org>
References: <20190404171007.160878-1-ncrews@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404171007.160878-1-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, alexandre.belloni@bootlin.com, a.zummo@towertech.it, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com, Nick Crews <ncrews@chromium.org>
List-Id: linux-leds@vger.kernel.org

We want all backlights for the system keyboard to
use a common name, so the name "platform::kbd_backlight"
would be better than the current "chromeos::kbd_backlight"
name. Normally this wouldn't be worth changing, but the new
Wilco keyboard backlight driver uses the "platform" name.
We want to make it so all Chrome OS devices are consistent,
so we'll change the name here too.

The Power Manager daemon only looks for LEDs that match the
pattern "*:kbd_backlight", so this change won't affect that.

Signed-off-by: Nick Crews <ncrews@chromium.org>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index aa409f0201fb..c56c8405f39c 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -77,7 +77,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	if (!cdev)
 		return -ENOMEM;
 
-	cdev->name = "chromeos::kbd_backlight";
+	cdev->name = "platform::kbd_backlight";
 	cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
 	cdev->flags |= LED_CORE_SUSPENDRESUME;
 	cdev->brightness_set = keyboard_led_set_brightness;
-- 
2.20.1
