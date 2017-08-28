From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v2 2/2] leds: gpio: Allow LED to retain state at shutdown
Date: Mon, 28 Aug 2017 09:47:11 +0930
Message-ID: <20170828001711.19662-3-andrew@aj.id.au>
References: <20170828001711.19662-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170828001711.19662-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-leds@vger.kernel.org

In some systems, such as Baseboard Management Controllers (BMCs), we
want to retain the state of LEDs across a reboot of the BMC (whilst the
host remains up). Implement support for the retain-state-shutdown
devicetree property in leds-gpio.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
---
 drivers/leds/leds-gpio.c | 7 ++++++-
 include/linux/leds.h     | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index e753ba93ba1e..764c31301f90 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -134,6 +134,8 @@ static int create_gpio_led(const struct gpio_led *template,
 		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	if (template->panic_indicator)
 		led_dat->cdev.flags |= LED_PANIC_INDICATOR;
+	if (template->retain_state_shutdown)
+		led_dat->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
 
 	ret = gpiod_direction_output(led_dat->gpiod, state);
 	if (ret < 0)
@@ -205,6 +207,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 
 		if (fwnode_property_present(child, "retain-state-suspended"))
 			led.retain_state_suspended = 1;
+		if (fwnode_property_present(child, "retain-state-shutdown"))
+			led.retain_state_shutdown = 1;
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
@@ -267,7 +271,8 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 	for (i = 0; i < priv->num_leds; i++) {
 		struct gpio_led_data *led = &priv->leds[i];
 
-		gpio_led_set(&led->cdev, LED_OFF);
+		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
+			gpio_led_set(&led->cdev, LED_OFF);
 	}
 }
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 64c56d454f7d..bf6db4fe895b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,6 +49,7 @@ struct led_classdev {
 #define LED_HW_PLUGGABLE	(1 << 19)
 #define LED_PANIC_INDICATOR	(1 << 20)
 #define LED_BRIGHT_HW_CHANGED	(1 << 21)
+#define LED_RETAIN_AT_SHUTDOWN	(1 << 22)
 
 	/* set_brightness_work / blink_timer flags, atomic, private. */
 	unsigned long		work_flags;
@@ -392,6 +393,7 @@ struct gpio_led {
 	unsigned	retain_state_suspended : 1;
 	unsigned	panic_indicator : 1;
 	unsigned	default_state : 2;
+	unsigned	retain_state_shutdown : 1;
 	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
 	struct gpio_desc *gpiod;
 };
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
