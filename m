From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] leds: lp55xx: enable setting default trigger
Date: Sun, 15 Sep 2013 12:50:17 +0200
Message-ID: <1379242217-32398-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Kim Milo <Milo.Kim-l0cyMroinI0@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This enables setting a default trigger on an LP55xx channel,
either from platform data or device tree. This mechanism is
identical to the mechanism for GPIO LEDs and references the
common LEDs device tree bindings.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 10 +++++++---
 drivers/leds/leds-lp55xx-common.c                      |  3 +++
 include/linux/platform_data/leds-lp55xx.h              |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
index a61727f..d221e75 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
@@ -17,12 +17,15 @@ Optional properties:
          2: D1~6 with VOUT, D7~9 with VDD
          3: D1~9 are connected to VOUT
 
-Alternatively, each child can have specific channel name
-- chan-name: Name of each channel name
+Alternatively, each child can have a specific channel name and trigger:
+- chan-name (optional): name of channel
+- linux,default-trigger (optional): see
+  Documentation/devicetree/bindings/leds/common.txt
 
 example 1) LP5521
 3 LED channels, external clock used. Channel names are 'lp5521_pri:channel0',
-'lp5521_pri:channel1' and 'lp5521_pri:channel2'
+'lp5521_pri:channel1' and 'lp5521_pri:channel2', with a heartbeat trigger
+on channel 0.
 
 lp5521@32 {
 	compatible = "national,lp5521";
@@ -33,6 +36,7 @@ lp5521@32 {
 	chan0 {
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
+		linux,default-trigger = "heartbeat";
 	};
 
 	chan1 {
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 351825b..075acf5 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -165,6 +165,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	led->led_current = pdata->led_config[chan].led_current;
 	led->max_current = pdata->led_config[chan].max_current;
 	led->chan_nr = pdata->led_config[chan].chan_nr;
+	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
 
 	if (led->chan_nr >= max_channel) {
 		dev_err(dev, "Use channel numbers between 0 and %d\n",
@@ -586,6 +587,8 @@ int lp55xx_of_populate_pdata(struct device *dev, struct device_node *np)
 		of_property_read_string(child, "chan-name", &cfg[i].name);
 		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
 		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
+		cfg[i].default_trigger =
+			of_get_property(child, "linux,default-trigger", NULL);
 
 		i++;
 	}
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 51a2ff5..c32de4d 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -22,6 +22,7 @@
 
 struct lp55xx_led_config {
 	const char *name;
+	const char *default_trigger;
 	u8 chan_nr;
 	u8 led_current; /* mA x10, 0 if led is not connected */
 	u8 max_current;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
