From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] leds: triggers: support timer trigger DT bindings
Date: Tue, 28 Feb 2017 13:04:52 +0100
Message-ID: <20170228120452.10043-4-zajec5@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170228120452.10043-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Timer trigger has 2 parameters: delay on and delay off times. This patch
allows specifying "timer" trigger in DT including both time values.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 drivers/leds/led-triggers.c          |  2 +-
 drivers/leds/trigger/ledtrig-timer.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 83897e0d6b76..c53c20d676cd 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -181,7 +181,7 @@ static void led_trigger_of_read_trigger(struct led_classdev *led_cdev)
 	}
 
 	/* Check if trigger specified in DT is supported */
-	if (1) /* TODO */
+	if (strcmp(trigger_type, "timer"))
 		goto err_node_put;
 
 	led_cdev->default_trigger = trigger_type;
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 8d09327b5719..98b58469d705 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/of.h>
 
 static ssize_t led_delay_on_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -71,10 +72,25 @@ static ssize_t led_delay_off_store(struct device *dev,
 static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store);
 static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_store);
 
+static void ledtrig_timer_of_read(struct led_classdev *led_cdev)
+{
+	struct device_node *np = led_cdev->trigger_node;
+
+	if (!np)
+		return;
+
+	of_property_read_u32(np, "delay-on",
+			     (u32 *)&led_cdev->blink_delay_on);
+	of_property_read_u32(np, "delay-off",
+			     (u32 *)&led_cdev->blink_delay_off);
+}
+
 static void timer_trig_activate(struct led_classdev *led_cdev)
 {
 	int rc;
 
+	ledtrig_timer_of_read(led_cdev);
+
 	led_cdev->trigger_data = NULL;
 
 	rc = device_create_file(led_cdev->dev, &dev_attr_delay_on);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
