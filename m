From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between values of brightness-levels
Date: Thu, 16 Nov 2017 15:11:50 +0100
Message-ID: <20171116141151.21171-2-enric.balletbo@collabora.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56860 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935278AbdKPOMG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 09:12:06 -0500
In-Reply-To: <20171116141151.21171-1-enric.balletbo@collabora.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Setting use-linear-interpolation in the dts will allow you to have linear
interpolation between values of brightness-levels.

There are now 256 between each of the values of brightness-levels. If
something is requested halfway between 2 values, we'll use linear
interpolation.

This way a high resolution pwm duty cycle can be used without having to
list out every possible value in the dts. This system also allows for
gamma corrected values (eg: "brightness-levels = <0 2 4 8 16 32>;").

Patch based on the Alexandru M Stan work done for ChromeOS kernels.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 .../bindings/leds/backlight/pwm-backlight.txt      |  2 +
 drivers/video/backlight/pwm_bl.c                   | 55 +++++++++++++++++-----
 include/linux/pwm_backlight.h                      |  2 +
 3 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
index 764db86..7c48f20 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
@@ -17,6 +17,8 @@ Optional properties:
                "pwms" property (see PWM binding[0])
   - enable-gpios: contains a single GPIO specifier for the GPIO which enables
                   and disables the backlight (see GPIO binding[1])
+  - use-linear-interpolation: set this propriety to enable linear interpolation
+                              between each of the values of brightness-levels.
 
 [0]: Documentation/devicetree/bindings/pwm/pwm.txt
 [1]: Documentation/devicetree/bindings/gpio/gpio.txt
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 9bd1768..59b1bfb 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -24,6 +24,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
+#define NSTEPS	256
+
 struct pwm_bl_data {
 	struct pwm_device	*pwm;
 	struct device		*dev;
@@ -35,6 +37,7 @@ struct pwm_bl_data {
 	struct gpio_desc	*enable_gpio;
 	unsigned int		scale;
 	bool			legacy;
+	bool			piecewise;
 	int			(*notify)(struct device *,
 					  int brightness);
 	void			(*notify_after)(struct device *,
@@ -76,17 +79,36 @@ static void pwm_backlight_power_off(struct pwm_bl_data *pb)
 	pb->enabled = false;
 }
 
-static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
+static int scale(struct pwm_bl_data *pb, int x)
 {
 	unsigned int lth = pb->lth_brightness;
+
+	return (x * (pb->period - lth) / pb->scale) + lth;
+}
+
+static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
+{
+	int coarse = brightness / NSTEPS;
+	int fine = brightness % NSTEPS;
 	int duty_cycle;
 
-	if (pb->levels)
-		duty_cycle = pb->levels[brightness];
-	else
-		duty_cycle = brightness;
+	if (pb->levels) {
+		if (pb->piecewise) {
+			duty_cycle = scale(pb, pb->levels[coarse]);
+			if (fine > 0)
+				duty_cycle += (scale(pb, pb->levels[coarse + 1])
+					       - scale(pb, pb->levels[coarse]))
+					       * fine / NSTEPS;
+			dev_dbg(pb->dev, "brightness=%d coarse=%d fine=%d\n",
+				brightness, coarse, fine);
+		} else {
+			duty_cycle = scale(pb, pb->levels[brightness]);
+		}
+	} else {
+		duty_cycle = scale(pb, brightness);
+	}
 
-	return (duty_cycle * (pb->period - lth) / pb->scale) + lth;
+	return duty_cycle;
 }
 
 static int pwm_backlight_update_status(struct backlight_device *bl)
@@ -149,11 +171,11 @@ static int pwm_backlight_parse_dt(struct device *dev,
 	if (!prop)
 		return -EINVAL;
 
-	data->max_brightness = length / sizeof(u32);
+	data->levels_count = length / sizeof(u32);
 
 	/* read brightness levels from DT property */
-	if (data->max_brightness > 0) {
-		size_t size = sizeof(*data->levels) * data->max_brightness;
+	if (data->levels_count > 0) {
+		size_t size = sizeof(*data->levels) * data->levels_count;
 
 		data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
 		if (!data->levels)
@@ -161,7 +183,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 
 		ret = of_property_read_u32_array(node, "brightness-levels",
 						 data->levels,
-						 data->max_brightness);
+						 data->levels_count);
 		if (ret < 0)
 			return ret;
 
@@ -170,10 +192,18 @@ static int pwm_backlight_parse_dt(struct device *dev,
 		if (ret < 0)
 			return ret;
 
+		data->piecewise = of_property_read_bool(node,
+						    "use-linear-interpolation");
+
 		data->dft_brightness = value;
-		data->max_brightness--;
+		data->levels_count--;
 	}
 
+	if (data->piecewise)
+		data->max_brightness = data->levels_count * NSTEPS;
+	else
+		data->max_brightness = data->levels_count;
+
 	data->enable_gpio = -EINVAL;
 	return 0;
 }
@@ -258,7 +288,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	if (data->levels) {
 		unsigned int i;
 
-		for (i = 0; i <= data->max_brightness; i++)
+		for (i = 0; i <= data->levels_count; i++)
 			if (data->levels[i] > pb->scale)
 				pb->scale = data->levels[i];
 
@@ -272,6 +302,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	pb->exit = data->exit;
 	pb->dev = &pdev->dev;
 	pb->enabled = false;
+	pb->piecewise = data->piecewise;
 
 	pb->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
 						  GPIOD_ASIS);
diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
index e8afbd7..444a91b 100644
--- a/include/linux/pwm_backlight.h
+++ b/include/linux/pwm_backlight.h
@@ -14,6 +14,8 @@ struct platform_pwm_backlight_data {
 	unsigned int lth_brightness;
 	unsigned int pwm_period_ns;
 	unsigned int *levels;
+	unsigned int levels_count;
+	bool piecewise;
 	/* TODO remove once all users are switched to gpiod_* API */
 	int enable_gpio;
 	int (*init)(struct device *dev);
-- 
2.9.3
