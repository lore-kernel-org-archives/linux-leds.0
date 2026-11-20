Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795133261;
	b=QQ/a7wwJ8F47qQ2WuQSOoCFAX/bjePxuZ5IMNRxOm2XJzJc+9G+AyLhYaSXF/H4C6x68
	 CT8kefP2NB3enDh0pN1Hk/bofLMNQ7VZh73OR9vyPVyjdgT+Y6yupiF67K9ZXhkI2bjdQ
	 V/vUN6j5pMj87zKVqxNJuSauqDQrZS+boXKeOJv9bEWJrURICCEAINa/pXJytTpBO8iad
	 XOYxBW6pbuGgEPhUASIVX60zkh5qu+FB5hNYCc9MvoPEqh+0YnjGP+cATjWaUC4qQtZXH
	 bx5jyEEwFvFBnojZkGJESyTaMcFiihqFw2zYGbGY4Dnn8xePquH83JWD9REqOev2eTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133261;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ogEDiWO6Z32AUEn0RtEnV5E3r3M3OlMurnkKW6a9LDs=;
	b=MQtBxLBZMI4S1Pv+8iSg+XIMNi9ngQI3eokjKL+mZAXzRR4IVYts6LTIrERzWKwel8pV
	 QqqfUGz+ebQKPNl/Mn5KAvGNjTsCyU9kuDK7gpo5mTXVoUAEwWCjibsFAUoNIRH220WH2
	 vDBDszIO7/DJx+vkZuRc6GXlhVkktR7/uRVnIwJaOmI64yM3eYly7j7dp/HV+cLwHtUL5
	 8XMDi8qSw3MAyKpIOyqz9GN4qpD36bVAKB/bzNoowvEXqHA6wLxs3sQnKcfG9jZRvKTZQ
	 7H25qBjDnCNJe/EFDTCDgPz8BrS25ln9x9WjIw2SvJnaFy53pdZOUlZW9mjI6ss0rnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOYvcgrD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C5F60A5BEB;
	Fri, 20 Nov 2026 00:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nOYvcgrD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795133261;
	b=SxxmjB2tTsxuGWN2msZ8HzE9Tpa9NeCcXw7tn7xDLcov7TaH5u7TkmDGq6We42G3Ok+I
	 NQYQvlpI+jkrv8eOE19kXaT/OdHl1bhlrUmwJCV7jODnQp3S8K/IxiQvAxFpNmc+8BlXl
	 rMqf6ZYrNYqLIs34zOgXMG92wQQ9vy7n5fVVjSyL4AeSdMI0rrCzudKK14UHeB2oFuvNQ
	 AWDE7KseSIBIwgmPXh4TqXgrP7ADN9p2rx15mlE8IRzP3rEtr4yiKAzKEG74r1b2SlUi7
	 WxGYuELV9kCXP2rSxvIkVltJ/NLM4IYj9dZsPTaryY8jQR5L/9u/pRROTk0A/2FiAEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795133261;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ogEDiWO6Z32AUEn0RtEnV5E3r3M3OlMurnkKW6a9LDs=;
	b=JBZKwQuuqZwtBMRPNWvR5bAoIy4yqRtYmBSPE1XkN4VxZd8ry5sY14dz9wuB+h/4DaYj
	 d9nMwAZ1GHGTOltzD402PEQvON+3jn5kDtuMsy+pMKM+9IL85i05MFVJCkf40Av+4LXRg
	 F4pCx5WWsGHmMJCIu8PrEmKW8P7CH+BTw8tBi0r0PODQqmIGMm5SG8dsk5rS4mLaT1uJN
	 fa0RjsrcxHYdmqHvGKTmPuMidrWKVXG/DrgORK3JD24SBfeS6+EYU1f7yEG+e3vhjOtWr
	 sMe70VW8ZM+2bBg2MoE5xAnlC+sQ+ik8aWmroAsw97kTqqTwEVl/3esbd772T4IAPAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACC121F000E0;
	Fri, 20 Nov 2026 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133261;
	bh=ogEDiWO6Z32AUEn0RtEnV5E3r3M3OlMurnkKW6a9LDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nOYvcgrDvfY8Y6obsm903h80L0jD5DVxOzCQ2dKuuUf0azCRCX0xsyqmNUBwnKBrB
	 0ukDURfPJGfZNLgvVyF7P+sE3kGIu7eXl0ZJaVDxzlaRN2Iz9mjqHIMsrvOLiFI1jR
	 Q/1ZK+Eh8m82dIYlJA0/AjimG8cJ9RDovkbGyXn3Hnmfp62iJOtn8XcoLOnKkp+lWO
	 mC8HnlQYlsAPrT+bDBRkv2h9k8I/K3s/saCiAqm1otPakNN8hzJo3x2B/txzw3HgXQ
	 P1+cW91hBpskgJgkgFjgpzapq+tOo8c2PFo+QS1Hx8tM1q/McDQaUjsExH+WbZpJqz
	 Relf/bKNQJ8Mg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 33764424FD;
	Fri, 20 Nov 2026 00:07:36 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 19 Nov 2026 19:07:30 -0500
Subject: [PATCH v3 08/11] leds: rgb: ktd202x: Add hardware pattern support
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
Message-Id: <20261119-ktd202x-et6326-v3-8-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
In-Reply-To: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795133254; l=11954;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=94RXYS32b1eEirxgmprxl4J4ld/9fa3K8kAbBeseOmQ=;
 b=ewgakhpKNkc6dZUx10Nu5TI4jKJKfEZEXA9CqhHaNPtj51pIKeRCcn9lD/yhRDBy6dqVba+AS
 AWrgAHmi3fdCCPsccOGbS+F+iobgjC7vFNs2Yi5pk+sC5UZ4jWnRKob
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
 drivers/leds/rgb/leds-ktd202x.c     | 189 ++++++++++++++++++++++++++++++++++--
 3 files changed, 224 insertions(+), 7 deletions(-)

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
index 614384bdc57f..ba370c429b04 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -61,6 +61,9 @@
 
 /* Register 5 */
 #define KTD202X_RAMP_TIMES_2_MS			0x00
+#define KTD202X_RAMP_TRISE(x)			(x)
+#define KTD202X_RAMP_TFALL_SHIFT		4
+#define KTD202X_RAMP_TFALL(x)			((x) << KTD202X_RAMP_TFALL_SHIFT)
 
 /* Register 6-9 */
 #define KTD202X_LED_CURRENT_10_mA		0x4f
@@ -72,6 +75,12 @@
 #define ET6326_FLASH_PERIOD_MAX_STEPS 127
 #define KTD202X_FLASH_ON_MIN 1
 #define KTD202X_FLASH_ON_MAX 256
+#define KTD202X_RAMP_STEP_MS 128
+#define KTD202X_RAMP_MAX_STEPS 15
+
+/* Rise, high, fall and low */
+#define KTD202X_PATTERN_LEN 4
+#define KTD202X_PATTERN_MAX_MS 16384
 
 #define KTD202X_MAX_BRIGHTNESS 192
 
@@ -295,6 +304,23 @@ static int ktd202x_brightness_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
+static unsigned int ktd202x_flash_period_steps(const struct ktd202x_caps *caps,
+					       unsigned long period_ms)
+{
+	if (period_ms < caps->flash_period_min_ms)
+		return 0;
+
+	return min_t(unsigned long, caps->flash_period_max_steps,
+		     (period_ms - caps->flash_period_min_ms) /
+		     KTD202X_FLASH_PERIOD_STEP_MS);
+}
+
+static unsigned long ktd202x_flash_period_ms(const struct ktd202x_caps *caps,
+					     unsigned int num_steps)
+{
+	return num_steps * KTD202X_FLASH_PERIOD_STEP_MS + caps->flash_period_min_ms;
+}
+
 static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 			     unsigned long *delay_off, struct mc_subled *subleds,
 			     unsigned int num_channels)
@@ -334,12 +360,7 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	/* Integer representation of time of flash period */
 	if (check_add_overflow(*delay_on, *delay_off, &delay_total_ms))
 		delay_total_ms = ULONG_MAX;
-	if (delay_total_ms < caps->flash_period_min_ms)
-		num_steps = 0;
-	else
-		num_steps = min_t(unsigned long, caps->flash_period_max_steps,
-				  (delay_total_ms - caps->flash_period_min_ms) /
-				  KTD202X_FLASH_PERIOD_STEP_MS);
+	num_steps = ktd202x_flash_period_steps(caps, delay_total_ms);
 
 	/*
 	 * Integer representation of percentage of LED ON time. A value of 0
@@ -349,7 +370,7 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	on = clamp(on, KTD202X_FLASH_ON_MIN, KTD202X_FLASH_ON_MAX - 1);
 
 	/* Actually used delay_{on,off} values */
-	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + caps->flash_period_min_ms;
+	delay_total_ms = ktd202x_flash_period_ms(caps, num_steps);
 	/*
 	 * Rounded to the nearest ms, so that the delays give the same on time
 	 * when written back. Rounded down, 1/256 of the 128 ms ET6326 period
@@ -368,6 +389,12 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
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
@@ -433,6 +460,150 @@ static int ktd202x_blink_mc_set(struct led_classdev *cdev,
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
+	const struct ktd202x_caps *caps = led->chip->caps;
+	unsigned int rise_ms, high_ms, fall_ms, low_ms;
+	unsigned int rise_steps, fall_steps, num_steps, on;
+	unsigned long period_ms, ton_ms;
+	u8 ctrl_mask = 0;
+	u8 ctrl_pwm1 = 0;
+	int ret;
+
+	rise_ms = min_t(u32, pattern[0].delta_t, KTD202X_PATTERN_MAX_MS);
+	high_ms = min_t(u32, pattern[1].delta_t, KTD202X_PATTERN_MAX_MS);
+	fall_ms = min_t(u32, pattern[2].delta_t, KTD202X_PATTERN_MAX_MS);
+	low_ms = min_t(u32, pattern[3].delta_t, KTD202X_PATTERN_MAX_MS);
+
+	rise_steps = min_t(unsigned int, KTD202X_RAMP_MAX_STEPS,
+			   DIV_ROUND_CLOSEST(rise_ms, KTD202X_RAMP_STEP_MS));
+	fall_steps = min_t(unsigned int, KTD202X_RAMP_MAX_STEPS,
+			   DIV_ROUND_CLOSEST(fall_ms, KTD202X_RAMP_STEP_MS));
+
+	/* Round the period up so that the fall ramp is not cut short */
+	period_ms = rise_ms + high_ms + fall_ms + low_ms;
+	num_steps = ktd202x_flash_period_steps(caps, period_ms + KTD202X_FLASH_PERIOD_STEP_MS - 1);
+	period_ms = ktd202x_flash_period_ms(caps, num_steps);
+
+	/* The on time includes the rise time */
+	ton_ms = rise_ms + high_ms;
+	on = clamp_t(unsigned long, DIV_ROUND_CLOSEST(ton_ms * KTD202X_FLASH_ON_MAX, period_ms),
+		     KTD202X_FLASH_ON_MIN, KTD202X_FLASH_ON_MAX - 1);
+
+	guard(mutex)(&led->chip->mutex);
+
+	for (unsigned int i = 0; i < num_channels; i++) {
+		int channel = subleds[i].channel;
+
+		ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
+
+		/* A color with no brightness stays off */
+		if (!subleds[i].brightness)
+			continue;
+
+		ctrl_pwm1 |= KTD202X_CHANNEL_CTRL_PWM1(channel);
+	}
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_FLASH_PERIOD, num_steps);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_PWM1_TIMER, on);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(led->chip->regmap, KTD202X_REG_TRISE_FALL,
+			   KTD202X_RAMP_TFALL(fall_steps) | KTD202X_RAMP_TRISE(rise_steps));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
+				  ctrl_mask, ctrl_pwm1);
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
@@ -484,6 +655,8 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
 	cdev = &led->mcdev.led_cdev;
 	cdev->brightness_set_blocking = ktd202x_brightness_mc_set;
 	cdev->blink_set = ktd202x_blink_mc_set;
+	cdev->pattern_set = ktd202x_pattern_mc_set;
+	cdev->pattern_clear = ktd202x_pattern_mc_clear;
 
 	return devm_led_classdev_multicolor_register_ext(chip->dev, &led->mcdev, init_data);
 }
@@ -505,6 +678,8 @@ static int ktd202x_setup_led_single(struct ktd202x *chip, struct fwnode_handle *
 	cdev = &led->cdev;
 	cdev->brightness_set_blocking = ktd202x_brightness_single_set;
 	cdev->blink_set = ktd202x_blink_single_set;
+	cdev->pattern_set = ktd202x_pattern_single_set;
+	cdev->pattern_clear = ktd202x_pattern_single_clear;
 
 	return devm_led_classdev_register_ext(chip->dev, &led->cdev, init_data);
 }

-- 
Git-155)


