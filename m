From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 27/57] leds: da903x: Remove work queue
Date: Tue, 11 Aug 2015 11:37:40 +0200
Message-ID: <1439285890-27329-28-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-da903x.c |   33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 952ba96e..bbb7935 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/workqueue.h>
 #include <linux/mfd/da903x.h>
 #include <linux/slab.h>
 
@@ -33,9 +32,7 @@
 
 struct da903x_led {
 	struct led_classdev	cdev;
-	struct work_struct	work;
 	struct device		*master;
-	enum led_brightness	new_brightness;
 	int			id;
 	int			flags;
 };
@@ -43,9 +40,11 @@ struct da903x_led {
 #define DA9030_LED_OFFSET(id)	((id) - DA9030_ID_LED_1)
 #define DA9034_LED_OFFSET(id)	((id) - DA9034_ID_LED_1)
 
-static void da903x_led_work(struct work_struct *work)
+static void da903x_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness value)
 {
-	struct da903x_led *led = container_of(work, struct da903x_led, work);
+	struct da903x_led *led =
+			container_of(led_cdev, struct da903x_led, cdev);
 	uint8_t val;
 	int offset;
 
@@ -57,39 +56,29 @@ static void da903x_led_work(struct work_struct *work)
 	case DA9030_ID_LED_PC:
 		offset = DA9030_LED_OFFSET(led->id);
 		val = led->flags & ~0x87;
-		val |= (led->new_brightness) ? 0x80 : 0; /* EN bit */
-		val |= (0x7 - (led->new_brightness >> 5)) & 0x7; /* PWM<2:0> */
+		val |= value ? 0x80 : 0; /* EN bit */
+		val |= (0x7 - (value >> 5)) & 0x7; /* PWM<2:0> */
 		da903x_write(led->master, DA9030_LED1_CONTROL + offset, val);
 		break;
 	case DA9030_ID_VIBRA:
 		val = led->flags & ~0x80;
-		val |= (led->new_brightness) ? 0x80 : 0; /* EN bit */
+		val |= value ? 0x80 : 0; /* EN bit */
 		da903x_write(led->master, DA9030_MISC_CONTROL_A, val);
 		break;
 	case DA9034_ID_LED_1:
 	case DA9034_ID_LED_2:
 		offset = DA9034_LED_OFFSET(led->id);
-		val = (led->new_brightness * 0x5f / LED_FULL) & 0x7f;
+		val = (value * 0x5f / LED_FULL) & 0x7f;
 		val |= (led->flags & DA9034_LED_RAMP) ? 0x80 : 0;
 		da903x_write(led->master, DA9034_LED1_CONTROL + offset, val);
 		break;
 	case DA9034_ID_VIBRA:
-		val = led->new_brightness & 0xfe;
+		val = value & 0xfe;
 		da903x_write(led->master, DA9034_VIBRA, val);
 		break;
 	}
 }
 
-static void da903x_led_set(struct led_classdev *led_cdev,
-			   enum led_brightness value)
-{
-	struct da903x_led *led;
-
-	led = container_of(led_cdev, struct da903x_led, cdev);
-	led->new_brightness = value;
-	schedule_work(&led->work);
-}
-
 static int da903x_led_probe(struct platform_device *pdev)
 {
 	struct led_info *pdata = dev_get_platdata(&pdev->dev);
@@ -115,13 +104,11 @@ static int da903x_led_probe(struct platform_device *pdev)
 	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set = da903x_led_set;
 	led->cdev.brightness = LED_OFF;
+	led->cdev.flags |= LED_BRIGHTNESS_BLOCKING;
 
 	led->id = id;
 	led->flags = pdata->flags;
 	led->master = pdev->dev.parent;
-	led->new_brightness = LED_OFF;
-
-	INIT_WORK(&led->work, da903x_led_work);
 
 	ret = led_classdev_register(led->master, &led->cdev);
 	if (ret) {
-- 
1.7.9.5
