Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794251068;
	b=dSB5aMrnxXKEKanSfvwZmwqPhuO5YynXS1ShQiMkAQtPDwud78MLrMOyy3whBCgTtw5B
	 5CXvwxZvnFSIOkzCOrclYxjNluog502TSVuetu841GKnYjnlTeFpn0+H+LGLsZuH8kJpA
	 vYFbekoURAYTa9sVnAKED9H245CQZCYuFvSChIN6nPQnsl+ynITgAoBMlV5lD8A7kCQXu
	 6upBmgb+hpXqWexIy7HAH7yoIgQRmJRCSU0fwE8fjSdJHDTUp2fWJOfyUU8kEeV0nOJqS
	 Q7Fc8NytjtfdNI0To4hnyXeTOx6AWKJvhQIoKFrQJeDGonY5zMRRAazSixdG1XzIKZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251068;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZqMLuI9MCAY4hi11Nz/6XGCzIvNHjbo9Axe1OI1kzF8=;
	b=GHbV2XffN+dXwj/8Q5ILHZJz7KXCx8NXJ+Hx+JpyAOYCenT32KrosFaCJZCae6uVxzYA
	 E9eBWEPHtoSVeI7Phq6mzbKDYoCHerV9KAMsV0XHP+A4NEjG6aAzV2ERrAAD0Pi+rULJD
	 uGPf2ZeGkniX9SMlZvjiIhZsssDQOuBIP1vr2XQAw7kAJUnpGQ3WUlA+qzIZl0Xjgn9p7
	 owa4qnnhvhPkOhgXzpT4dQ5KtfXDYE7TZ66kGOHt+m2cg6qVvv4wiF8C2tLiCGMBWi1yn
	 1NX73wI6PFsR3ONrFhePDpz/BtMLvKbUPUjpFOQ35dNJTIj4oMRvrvxglKTNpaw31ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIuB+vSN;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF4606A33D;
	Mon,  9 Nov 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HIuB+vSN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794251067;
	b=wzqYz8kNoqUL2RRxSXKifSS9OhW5h+cabefa960J9UiN82H1AGARJmYGhLgT9tEg6NLc
	 8xZ/MEwarWoSIy0FTLcCwnkygCKisD8PyJi9orlCI6TnQZQPVgfd5+52Hk/4i1B8tn8Cn
	 xjmLlobu+Qx1kiZ2MussaqCVheXOKYOrr/iiEIVuZJMOr5+VK42L1AJKJ4gfkQ/lyGONw
	 9D4SJ3Uat7fSdnufWvPxwEN1IPst3/LkShaX1ig6DlCe+4H/mH5dKNxzEuMK0G6R8d9T8
	 F/Ju1gHO9/+qs9oghOLDrQhsZjv9SjpvAeVwpe4M1xWbctaHQ6yz4gOpGce/vB34FXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794251067;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZqMLuI9MCAY4hi11Nz/6XGCzIvNHjbo9Axe1OI1kzF8=;
	b=d666zcIJZU1OrToA+8UbiMZxhVvfAGTu/8bEo80BF1x/P3y2InRAwp5gXOnJuupHDz7O
	 nWdoyzUUQBGlEzoFWEi0q8v5SA/FoY6N1io9tauNmNHro+Sp9smJ1satuCwOeoEDBnM6c
	 PzTqpgx6cmH+/3/L7y79bWVZo1I8Gn5zXlrpvRWK3+XO0uLIQ2yzGQy9TZl59Yq5wh5hI
	 8rXYb5tr/JUszVvwtlaGYfs2q9q7MAVyd/P3NDHx1IuD+gb7svqsHBKJmwyhMBHz/LQ+z
	 5Z0pAuasiW9D8h1iEIj+D4eiAmIzLafMIih/xHPdhQQl/uZrA0MuDNEoEAf2JBX8Vdw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C9921F008A5;
	Mon,  9 Nov 2026 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251067;
	bh=ZqMLuI9MCAY4hi11Nz/6XGCzIvNHjbo9Axe1OI1kzF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HIuB+vSNwbn3tCdvVo9CVsokovHFzJXwWsdMw2Ib3n+I3tR6E9F7C+nksu2/nGIt0
	 EY1Fyxz35pmv1h+oRtFDTwD4XJNX+jpn/TNdUaPflb29QRrm5GoJZlBSqBMVCLKB4s
	 CCkg22kcNiLc2aTsr6TjiqZf7xsBZrL278XKia372nuGzvuBjUf6eYaVDb/5kYLlTk
	 JyQyTfXjWakSD3R1HokjZHbvanRZvIf+MN6mB9Lidd6lLKC5TSwVWy0QGSAlvGP+hV
	 nOMJ4j+WXNkceWO0Xrhq1FI88k+YS0snQwi7UX3jwVouRqBF1M3jz4A+FdIRSmbn8H
	 ICgZWHnuzxVQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A69A3485FE;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 14:03:44 -0500
Subject: [PATCH v2 08/11] leds: rgb: ktd202x: Add hardware pattern support
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-ktd202x-et6326-v2-8-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
In-Reply-To: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794251062; l=11640;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=VCc1UbAA68VW67UbLbUqqvij8U3cSOw+UZUYQqNWdYc=;
 b=3TCcHcF5jL4o91RPUmP/0LIPt3e1NY6Kj0OYyCzG/qfuk7K5eZA9Tq/jlfKfkF05mdSQe7SB2
 Ip8Jn+Y48X4CEVaLHrR1UlTDK1aXAT0JIkTX1LTG7Zg9RSCU4D5VUI+
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The KTD202x and the ET6326 can ramp the LED current up and down on
their own: the flash timer that already does blink_set also has rise
and fall times of up to 1.92 s. Without them, a breathing light needs
the software pattern trigger, which is an I2C write every 50 ms.

Implement pattern_set and pattern_clear for the pattern trigger's
hw_pattern. A pattern is the one breathing cycle the hardware has,
"0 rise brightness high brightness fall 0 low", which the software
pattern trigger plays as the same breath, repeated forever.

blink_set now clears the ramp times, so a blink after a pattern stays
sharp.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/leds/index.rst        |   1 +
 Documentation/leds/leds-ktd202x.rst |  41 ++++++++
 drivers/leds/rgb/leds-ktd202x.c     | 191 ++++++++++++++++++++++++++++++++++--
 3 files changed, 226 insertions(+), 7 deletions(-)

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 23fa9ff7aaf4..54d1c73684ad 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -19,6 +19,7 @@ LEDs
    leds-blinkm
    leds-cht-wcove
    leds-el15203000
+   leds-ktd202x
    leds-lm3556
    leds-lp3944
    leds-lp5521
diff --git a/Documentation/leds/leds-ktd202x.rst b/Documentation/leds/leds-ktd202x.rst
new file mode 100644
index 000000000000..cb9bc9326241
--- /dev/null
+++ b/Documentation/leds/leds-ktd202x.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=============================================
+Kinetic KTD2026/7 and Etek ET6326 LED driver
+=============================================
+
+The chips have a hardware timer that blinks or breathes the LEDs without the
+CPU. The timer trigger uses it for blinking, and the pattern trigger uses it
+for breathing through the ``hw_pattern`` file.
+
+The hardware pattern is one breathing cycle of four steps, which repeats
+forever::
+
+    "0 rise brightness high brightness fall 0 low"
+
+rise
+    Ramp-up time in ms, from 0 to 1920 in steps of 128 ms.
+
+high
+    Time spent at the brightness in ms.
+
+fall
+    Ramp-down time in ms, from 0 to 1920 in steps of 128 ms.
+
+low
+    Time spent off in ms.
+
+The first and the last brightness must be 0, and the two in the middle must be
+equal and not 0. ``repeat`` must be -1, its default.
+
+The sum of the four times is the flash period. The driver rounds it up to the
+next step of 128 ms, between 256 ms (128 ms on the ET6326) and 16384 ms.
+
+The flash period, the on time and the ramp times are shared by all LEDs of a
+chip. When several LEDs blink or breathe at once, they all follow the timing
+that was set last.
+
+For example, to breathe with a period of 4 seconds::
+
+    echo pattern > /sys/class/leds/blue:status/trigger
+    echo "0 1000 192 1000 192 1000 0 1000" > /sys/class/leds/blue:status/hw_pattern
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 2650573b6c5a..daa04f8ecefd 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -62,12 +62,20 @@
 
 /* Register 5 */
 #define KTD202X_RAMP_TIMES_2_MS			0x00
+#define KTD202X_RAMP_TRISE(x)			(x)
+#define KTD202X_RAMP_TFALL(x)			((x) << 4)
 
 /* Register 6-9 */
 #define KTD202X_LED_CURRENT_10_mA		0x4f
 
 #define KTD202X_FLASH_PERIOD_STEP_MS 128
 #define KTD202X_FLASH_ON_MAX 256
+#define KTD202X_RAMP_STEP_MS 128
+#define KTD202X_RAMP_MAX_STEPS 15
+
+/* rise, high, fall and low */
+#define KTD202X_PATTERN_LEN 4
+#define KTD202X_PATTERN_MAX_MS 16384
 
 #define KTD202X_MAX_BRIGHTNESS 192
 
@@ -294,6 +302,23 @@ static int ktd202x_brightness_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
+static unsigned int ktd202x_flash_period_steps(const struct ktd202x_info *info,
+					       unsigned long period_ms)
+{
+	if (period_ms < info->flash_period_min_ms)
+		return 0;
+
+	return min_t(unsigned long, info->flash_period_max_steps,
+		     (period_ms - info->flash_period_min_ms) /
+		     KTD202X_FLASH_PERIOD_STEP_MS);
+}
+
+static unsigned long ktd202x_flash_period_ms(const struct ktd202x_info *info,
+					     unsigned int num_steps)
+{
+	return num_steps * KTD202X_FLASH_PERIOD_STEP_MS + info->flash_period_min_ms;
+}
+
 static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 			     unsigned long *delay_off, struct mc_subled *subleds,
 			     unsigned int num_channels)
@@ -332,12 +357,7 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	/* Integer representation of time of flash period */
 	if (check_add_overflow(*delay_on, *delay_off, &delay_total_ms))
 		delay_total_ms = ULONG_MAX;
-	if (delay_total_ms < info->flash_period_min_ms)
-		num_steps = 0;
-	else
-		num_steps = min_t(unsigned long, info->flash_period_max_steps,
-				  (delay_total_ms - info->flash_period_min_ms) /
-				  KTD202X_FLASH_PERIOD_STEP_MS);
+	num_steps = ktd202x_flash_period_steps(info, delay_total_ms);
 
 	/*
 	 * Integer representation of percentage of LED ON time. A value of 0
@@ -347,7 +367,7 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	on = clamp(on, 1, KTD202X_FLASH_ON_MAX - 1);
 
 	/* Actually used delay_{on,off} values */
-	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + info->flash_period_min_ms;
+	delay_total_ms = ktd202x_flash_period_ms(info, num_steps);
 	/*
 	 * Rounded to the nearest ms, so that the delays give the same on time
 	 * when written back. Rounded down, 1/256 of the 128 ms ET6326 period
@@ -366,6 +386,12 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	if (ret)
 		goto out;
 
+	/* Drop the ramps a hardware pattern may have left behind */
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_TRISE_FALL,
+			   KTD202X_RAMP_TIMES_2_MS);
+	if (ret)
+		goto out;
+
 	ret = regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
 				 ctrl_mask, ctrl_pwm1);
 out:
@@ -431,6 +457,153 @@ static int ktd202x_blink_mc_set(struct led_classdev *cdev,
 				 mc->num_colors);
 }
 
+/*
+ * The hardware pattern is a single breathing cycle that repeats forever:
+ *
+ *   "0 rise brightness high brightness fall 0 low"
+ *
+ * The LED ramps up for the rise time, stays at the brightness for the high
+ * time, ramps down for the fall time and stays off for the low time.
+ */
+static int ktd202x_pattern_check(struct led_classdev *cdev,
+				 struct led_pattern *pattern, u32 len,
+				 int repeat)
+{
+	/*
+	 * Only forever: the pattern trigger passes -1, or 0 when repeat
+	 * has not been written since the trigger was set.
+	 */
+	if (len != KTD202X_PATTERN_LEN || repeat > 0)
+		return -EINVAL;
+
+	if (pattern[0].brightness || pattern[3].brightness ||
+	    pattern[1].brightness != pattern[2].brightness ||
+	    pattern[1].brightness <= 0 ||
+	    pattern[1].brightness > cdev->max_brightness)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ktd202x_pattern_program(struct ktd202x_led *led,
+				   struct led_pattern *pattern,
+				   struct mc_subled *subleds,
+				   unsigned int num_channels)
+{
+	const struct ktd202x_info *info = led->chip->info;
+	unsigned int t[KTD202X_PATTERN_LEN];
+	unsigned int rise, fall, num_steps, on;
+	unsigned long period_ms, ton_ms;
+	u8 ctrl_mask = 0;
+	u8 ctrl_pwm1 = 0;
+	int ret;
+	int i;
+
+	for (i = 0; i < KTD202X_PATTERN_LEN; i++)
+		t[i] = min_t(u32, pattern[i].delta_t, KTD202X_PATTERN_MAX_MS);
+
+	rise = min_t(unsigned int, KTD202X_RAMP_MAX_STEPS,
+		     DIV_ROUND_CLOSEST(t[0], KTD202X_RAMP_STEP_MS));
+	fall = min_t(unsigned int, KTD202X_RAMP_MAX_STEPS,
+		     DIV_ROUND_CLOSEST(t[2], KTD202X_RAMP_STEP_MS));
+
+	/* Round the period up so that the fall ramp is not cut short */
+	period_ms = t[0] + t[1] + t[2] + t[3];
+	num_steps = ktd202x_flash_period_steps(info, period_ms +
+					       KTD202X_FLASH_PERIOD_STEP_MS - 1);
+	period_ms = ktd202x_flash_period_ms(info, num_steps);
+
+	/* The on time includes the rise time */
+	ton_ms = t[0] + t[1];
+	on = clamp_t(unsigned long,
+		     DIV_ROUND_CLOSEST(ton_ms * KTD202X_FLASH_ON_MAX, period_ms),
+		     1, KTD202X_FLASH_ON_MAX - 1);
+
+	mutex_lock(&led->chip->mutex);
+
+	for (i = 0; i < num_channels; i++) {
+		int channel = subleds[i].channel;
+
+		ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
+		/* A color with no brightness stays off */
+		if (!subleds[i].brightness)
+			continue;
+
+		ctrl_pwm1 |= KTD202X_CHANNEL_CTRL_PWM1(channel);
+	}
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_FLASH_PERIOD, num_steps);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_PWM1_TIMER, on);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_TRISE_FALL,
+			   KTD202X_RAMP_TFALL(fall) | KTD202X_RAMP_TRISE(rise));
+	if (ret)
+		goto out;
+
+	ret = regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
+				 ctrl_mask, ctrl_pwm1);
+out:
+	mutex_unlock(&led->chip->mutex);
+	return ret;
+}
+
+static int ktd202x_pattern_single_set(struct led_classdev *cdev,
+				      struct led_pattern *pattern, u32 len,
+				      int repeat)
+{
+	struct ktd202x_led *led = container_of(cdev, struct ktd202x_led, cdev);
+	struct mc_subled info;
+	int ret;
+
+	ret = ktd202x_pattern_check(cdev, pattern, len, repeat);
+	if (ret)
+		return ret;
+
+	ret = ktd202x_brightness_single_set(cdev, pattern[1].brightness);
+	if (ret)
+		return ret;
+
+	info.brightness = cdev->brightness;
+	info.channel = led->index;
+
+	return ktd202x_pattern_program(led, pattern, &info, 1);
+}
+
+static int ktd202x_pattern_single_clear(struct led_classdev *cdev)
+{
+	return ktd202x_brightness_single_set(cdev, LED_OFF);
+}
+
+static int ktd202x_pattern_mc_set(struct led_classdev *cdev,
+				  struct led_pattern *pattern, u32 len,
+				  int repeat)
+{
+	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
+	struct ktd202x_led *led = container_of(mc, struct ktd202x_led, mcdev);
+	int ret;
+
+	ret = ktd202x_pattern_check(cdev, pattern, len, repeat);
+	if (ret)
+		return ret;
+
+	ret = ktd202x_brightness_mc_set(cdev, pattern[1].brightness);
+	if (ret)
+		return ret;
+
+	return ktd202x_pattern_program(led, pattern, mc->subled_info,
+				       mc->num_colors);
+}
+
+static int ktd202x_pattern_mc_clear(struct led_classdev *cdev)
+{
+	return ktd202x_brightness_mc_set(cdev, LED_OFF);
+}
+
 static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwnode,
 				 struct ktd202x_led *led, struct led_init_data *init_data)
 {
@@ -482,6 +655,8 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
 	cdev = &led->mcdev.led_cdev;
 	cdev->brightness_set_blocking = ktd202x_brightness_mc_set;
 	cdev->blink_set = ktd202x_blink_mc_set;
+	cdev->pattern_set = ktd202x_pattern_mc_set;
+	cdev->pattern_clear = ktd202x_pattern_mc_clear;
 
 	return devm_led_classdev_multicolor_register_ext(chip->dev, &led->mcdev, init_data);
 }
@@ -503,6 +678,8 @@ static int ktd202x_setup_led_single(struct ktd202x *chip, struct fwnode_handle *
 	cdev = &led->cdev;
 	cdev->brightness_set_blocking = ktd202x_brightness_single_set;
 	cdev->blink_set = ktd202x_blink_single_set;
+	cdev->pattern_set = ktd202x_pattern_single_set;
+	cdev->pattern_clear = ktd202x_pattern_single_clear;
 
 	return devm_led_classdev_register_ext(chip->dev, &led->cdev, init_data);
 }

-- 
Git-155)


