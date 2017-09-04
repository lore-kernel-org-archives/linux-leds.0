From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [RFC 2/2] backlight: pwm_bl: compute brightness of LED linearly to human eye.
Date: Mon,  4 Sep 2017 17:35:04 +0200
Message-ID: <20170904153504.27963-3-enric.balletbo@collabora.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170904153504.27963-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

When you want to change the brightness using a PWM signal, one thing you
need to consider is how human perceive the brightness. Human perceive the
brightness change non-linearly, we have better sensitivity at low
luminance than high luminance, so to achieve perceived linear dimming, the
brightness must be matches to the way our eyes behave. The CIE 1931
lightness formula is what actually describes how we perceive light.

This patch adds support to compute the brightness levels dinamically based
on this algorithm. For example, the definition of the following property
in your device tree,

 brightness-levels-scale = <16 255>

is equivalent to,

 brightness-levels = <0 2 4 7 11 17 25 35 47 62 79 99 123 150 181 216 255>;

It does not make much sense use the new property for few levels of
granularity, as you can really use the brightness-levels property with the
table hardcoded, but, if we have more than 256-levels of granularity you
might prefer use the new property instead of put a huge table in your
device tree.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/video/backlight/pwm_bl.c | 111 +++++++++++++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 1261400..7d87c0d 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -130,6 +130,72 @@ static const struct backlight_ops pwm_backlight_ops = {
 };
 
 #ifdef CONFIG_OF
+
+#define PWM_LUMINANCE_SCALE	10000 /* luminance scale */
+
+static u64 int_pow(u64 base, int exp)
+{
+	u64 result = 1;
+
+	while (exp) {
+		if (exp & 1)
+			result *= base;
+		exp >>= 1;
+		base *= base;
+	}
+
+	return result;
+}
+
+/*
+ * CIE lightness to PWM conversion.
+ *
+ * The CIE 1931 lightness formula is what actually describes how we perceive
+ * light:
+ *          Y = (L* / 902.3)           if L* ≤ 0.08856
+ *          Y = ((L* + 16) / 116)^3    if L* > 0.08856
+ *
+ * Where Y is the luminance (output) between 0.0 and 1.0, and L* is the
+ * lightness (input) between 0 and 100.
+ */
+static u64 cie1931(unsigned int lightness, unsigned int scale)
+{
+	u64 retval;
+
+	lightness *= 100;
+	if (lightness <= (8 * scale)) {
+		retval = DIV_ROUND_CLOSEST_ULL(lightness * 10, 9023);
+	} else {
+		retval = int_pow((lightness + (16 * scale)) / 116, 3);
+		retval = DIV_ROUND_CLOSEST_ULL(retval, (scale * scale));
+	}
+
+	return retval;
+}
+
+/*
+ * Create a correction table for PWM values to create linear brightness for a
+ * LED based on the CIE1931 algorithm.
+ */
+static int pwm_backlight_brightness(unsigned int *levels,
+				    unsigned int input_size,
+				    unsigned int output_size,
+				    unsigned int scale)
+{
+	u64 retval;
+	int i;
+
+	for (i = 0; i < input_size + 1; i++) {
+		retval = cie1931((i * scale) / input_size, scale) * output_size;
+		retval = DIV_ROUND_CLOSEST_ULL(retval, scale);
+		if (retval > UINT_MAX)
+			return -EINVAL;
+		levels[i] = (unsigned int)retval;
+	}
+
+	return 0;
+}
+
 static int pwm_backlight_parse_dt(struct device *dev,
 				  struct platform_pwm_backlight_data *data)
 {
@@ -146,10 +212,19 @@ static int pwm_backlight_parse_dt(struct device *dev,
 
 	/* determine the number of brightness levels */
 	prop = of_find_property(node, "brightness-levels", &length);
-	if (!prop)
-		return -EINVAL;
-
-	data->max_brightness = length / sizeof(u32);
+	if (!prop) {
+		/* total number of brightness levels */
+		ret = of_property_read_u32_index(node,
+						 "brightness-levels-scale",
+						 0, &value);
+		if (ret < 0)
+			return ret;
+		if (value > INT_MAX)
+			return -EINVAL;
+		data->max_brightness = value;
+	} else {
+		data->max_brightness = length / sizeof(u32);
+	}
 
 	/* read brightness levels from DT property */
 	if (data->max_brightness > 0) {
@@ -159,11 +234,29 @@ static int pwm_backlight_parse_dt(struct device *dev,
 		if (!data->levels)
 			return -ENOMEM;
 
-		ret = of_property_read_u32_array(node, "brightness-levels",
-						 data->levels,
-						 data->max_brightness);
-		if (ret < 0)
-			return ret;
+		if (prop) {
+			ret = of_property_read_u32_array(node,
+							 "brightness-levels",
+							 data->levels,
+							 data->max_brightness);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = of_property_read_u32_index(node,
+						"brightness-levels-scale",
+						1, &value);
+			if (ret < 0)
+				return ret;
+			if (value > INT_MAX)
+				return -EINVAL;
+
+			ret = pwm_backlight_brightness(data->levels,
+						       data->max_brightness,
+						       value,
+						       PWM_LUMINANCE_SCALE);
+			if (ret)
+				return ret;
+		}
 
 		ret = of_property_read_u32(node, "default-brightness-level",
 					   &value);
-- 
2.9.3
