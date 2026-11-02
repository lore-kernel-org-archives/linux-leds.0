Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585586;
	b=IsJnyXStZHGsVwehgR0rcoP3QT+8ATjl15i4Mcp+HE1BhIiUcgBMBjUQOEofSkISrLTj
	 g7bzzx+sxTU5/Q8P1QCS0jQPPcTBa/Cm4yUn1FiaUlDS4i8cbts/Yuvgewwbe2g3DUYSn
	 357oQK9XOY8uTaZdmovmm3iT+SGfjMaEG3gHi90Lb1lNO+vB0h5pYo9oY1iC9Dowjh0Uh
	 t85DOcoy6nVccd401GGVNYwPTcoFn47loNaxarCJoy90n4sGqL7ObF4606CMUHB/6PUfW
	 +N7pszMTl0lQLKt/Sf54Fah/JDnkJAodZTSbgRP5kfgTYLfB5ke4lWbJOrB7X7PvAJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585586;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WETsAhIlVo0w6o+fQzwplCR7bSsh52s8bK+enXMB5go=;
	b=cfxratJpyudFAYLRF4f8pnK2V0IbWwqsy7jm8hYuiVRExm1ZC4U5B4K99aQVoVK3e3Y7
	 XL88a7W2OpF2RYH8c48Q1pdX2JomYEwzrnRFTKjyUuCah9DRbUC1/e6uKQQuSLxoo9Ze6
	 ntyGCOn429ym+dQhfXWx9roaVWtRjtUACm4TEPlVsdviyZkFN+fX90m2KpiDO27igqULN
	 RCwW7pdolTa1FuoON4H64yz2Y/TJ4muSh+S9kuAE1rhzvMw/exsgMNIycrd+eg14j1ukx
	 OsTLqldKTWXIvOItAbWRFbgVYILi39A60SePS4v0uCf6bIFTq6nlW6qruJg9fEK7wbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GSpbWGot;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5A60A382B;
	Mon,  2 Nov 2026 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GSpbWGot
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793585585;
	b=0n07sr/wGryimqJoO0aaqXmhpfHtl/enm3HeZm/btui43QjCi3S9DVYxcbDqO771ABdp
	 MnvuaAL9tdECxL70rVXjubtFwtZbsSAcYx4eVmMT8orE00pX0JJZj86nTcKpTFQVRp0Lb
	 3rnONh2yXzD787irwk/kfeyfbNu0W2R5Fjuo7vRiElw3GwY6vNPqKgZeu2PqF43hi6afw
	 2dRWP+NTZA5Ptv68pI5zPe8aYQTDZkBe7AF4rrVXxB0tvTyivZ0irPClEJ0Ze4b8XFDr5
	 2RvUoObuHAtsKVaDbjz47/C/xyEZGAQlcNi2+HAL85QQKJqc5esOQwi3Wl7NCoRppYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793585585;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WETsAhIlVo0w6o+fQzwplCR7bSsh52s8bK+enXMB5go=;
	b=hhrQ30Ucz5VDIbsXxiuATesZ+9PBS/HLhFZX+viVdNVwXJn+kg+ZvEtPsKEfNvXuFg5n
	 tnv67YxS6r3Yw7nFplUCZ/vP6kbsPOtRN9FcdfzFy4bh5uBclP6a3NfgWJCy89QLNyyOw
	 6Zc3W5vQAEkRcDztdjWi8yIsyjjYZijQqu0Sv0Lh1AJebpQkqferNwIQ6JdMQusXFTAIC
	 Pe7biCAoIrkh0B1oxg2TnyTZaVMF82yLTyQmBt2voH2AMDwudKFL72haPn14ppdh6Jpe5
	 MQ5W7po9jjp8sKZzueNiWH+MBIeTlJqzKF0vsaiedTPBHniVMbc2WEZNewNCQopdLPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DED51F00A26;
	Mon,  2 Nov 2026 02:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585585;
	bh=WETsAhIlVo0w6o+fQzwplCR7bSsh52s8bK+enXMB5go=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GSpbWGotEIZLoXnfKRux6V27A2jcpKk4oWJDhq6rqfl1j/1QmeRtqSgBg731cSn4e
	 il8T1wf/aDD45ZrzvGdWGf1g0oESsDxiWo5tX0r+dj1gOLVIAQGTPWtIZbw3lDI3zu
	 dsC4Q/Xfgj7UxBToqbfIwrVGaMpySWgcHeoYbQfzS4AdbCnor+xnxMd9AfXr89iDLR
	 mWSSKCrFz7OF7bBaRfPXLc7pcF2aBRk/Eyzm4pvffiE8F6f9we8ePwsPxhBrzx3HRJ
	 QL8iDW3YBu74jbHsTLAhFe8/tzWhezSqwbSEUJJZhxIjdWvsZHEcmv+vzAx2R97vFP
	 bAel5dJRnPVHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4D40B46332;
	Mon,  2 Nov 2026 02:13:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 01 Nov 2026 21:12:34 -0500
Subject: [PATCH 10/10] leds: rgb: ktd202x: Don't let a blinking LED retime
 another one
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
Message-Id: <20261101-ktd202x-et6326-v1-10-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
In-Reply-To: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793585580; l=12784;
 i=joseph@telaak.dev; s=20261102; h=from:subject:message-id;
 bh=HivMUDrX79tqovMmLBbCBnjJ/uvbgMOr5RCG/wopo0M=;
 b=BKN72mi5JF0OpC3W4IT7jK2HSktvDBJ2FrbDs9tldmEJx6aETxqXgtLLdos2ruyJy8c1Ic9mN
 LCd7SgcOuoNABWcApHSYY8Nv6yEf+kXgBzCAy9RSWhfI2KPoHI/hC19
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=OmwSusdK4grZpiuZVfCZAvYyqz9FBkNemsV1EnHyVr4=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261102 with
 auth_id=1382
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Every LED blinks with the PWM1 flash timer. So when a second LED blinks,
its period and on time silently replace those of the first one, while
the sysfs of the first one still shows its old delays. The same happens
between a blink and a hardware pattern, and the ramps a pattern sets
leak into a later blink.

The PWM2 timer can't take the second LED: in timer slot 1, which the
driver uses, it repeats PWM1 (Reg3 has no effect, measured on an
ET6326), and in the other slots it only runs after PWM1 within the same
period.

Track which LEDs are on the timer instead of reading the channel state
back. A LED may join the timer while no other LED uses it, or when it
asks for the very same period, on time and ramps. Otherwise it stays on
and gets -EBUSY, which makes the LED core blink it in software. Only
write the timer registers when they change, so that a LED joining the
timer does not restart the blink of the others.

The match is on the programmed values. The timer trigger writes delay_on
and delay_off one at a time, and each write is rounded against the other's
rounded value, so two LEDs set to the same delays can get on times a few
steps apart. The second one then blinks in software, at the timing it
asked for. The documentation says how to make them share.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/leds/leds-ktd202x.rst |  13 ++-
 drivers/leds/rgb/leds-ktd202x.c     | 213 ++++++++++++++++++++++--------------
 2 files changed, 143 insertions(+), 83 deletions(-)

diff --git a/Documentation/leds/leds-ktd202x.rst b/Documentation/leds/leds-ktd202x.rst
index 2ee537f57..32ea9d6f6 100644
--- a/Documentation/leds/leds-ktd202x.rst
+++ b/Documentation/leds/leds-ktd202x.rst
@@ -31,9 +31,16 @@ equal and not 0. ``repeat`` must be -1, its default.
 The sum of the four times is the flash period. The driver rounds it up to the
 next step of 128 ms, between 256 ms (128 ms on the ET6326) and 16384 ms.
 
-The flash period, the on time and the ramp times are shared by all LEDs of a
-chip. When several LEDs blink or breathe at once, they all follow the timing
-that was set last.
+All LEDs of a chip blink and breathe with one flash timer. Several LEDs can
+use it at once only with the same period, on time and ramps. A LED that asks
+for different ones while another LED is on the timer gets -EBUSY: blinking
+then falls back to the software timer, and ``hw_pattern`` returns the error.
+
+The match is on the values programmed into the chip. The timer trigger sets
+``delay_on`` and ``delay_off`` one at a time and the driver rounds each pair,
+so two LEDs given the same delays can end up with slightly different on times,
+and then the second one blinks in software. To share the timer, give the
+second LED the delays that the first one reads back.
 
 For example, to breathe with a period of 4 seconds::
 
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 5f51df993..f4544ba33 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -128,6 +128,8 @@ struct ktd202x_led {
 		struct led_classdev_mc mcdev;
 	};
 	u32 index;
+	/* Blinking or breathing with the flash timer */
+	bool on_timer;
 };
 
 struct ktd202x {
@@ -137,6 +139,10 @@ struct ktd202x {
 	struct regmap *regmap;
 	const struct ktd202x_info *info;
 	bool enabled;
+	/* Settings of the flash timer, valid while a LED is on it */
+	u8 flash_period;
+	u8 flash_on;
+	u8 ramp_times;
 	unsigned long num_leds;
 	struct ktd202x_led leds[] __counted_by(num_leds);
 };
@@ -196,13 +202,20 @@ static bool ktd202x_chip_in_use(struct ktd202x *chip)
 	return false;
 }
 
+/* The channel mode of a lit LED: on, or blinking with the flash timer */
+static unsigned int ktd202x_channel_mode(struct ktd202x_led *led, int channel)
+{
+	if (led->on_timer)
+		return KTD202X_CHANNEL_CTRL_PWM1(channel);
+
+	return KTD202X_CHANNEL_CTRL_ON(channel);
+}
+
 static int ktd202x_brightness_set(struct ktd202x_led *led,
 				  struct mc_subled *subleds,
 				  unsigned int num_channels)
 {
-	bool mode_blink = false;
 	int channel;
-	int state;
 	int ret;
 	int i;
 
@@ -212,24 +225,9 @@ static int ktd202x_brightness_set(struct ktd202x_led *led,
 			return ret;
 	}
 
-	ret = regmap_read(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL, &state);
-	if (ret)
-		return ret;
-
-	/*
-	 * In multicolor case, assume blink mode if PWM is set for at least one
-	 * channel because another channel cannot be in state ON at the same time
-	 */
-	for (i = 0; i < num_channels; i++) {
-		int channel_state;
-
-		channel = subleds[i].channel;
-		channel_state = (state >> 2 * channel) & KTD202X_CHANNEL_CTRL_MASK(0);
-		if (channel_state == KTD202X_CHANNEL_CTRL_OFF)
-			continue;
-		mode_blink = channel_state == KTD202X_CHANNEL_CTRL_PWM1(0);
-		break;
-	}
+	/* A LED that is turned off stops blinking and leaves the timer */
+	if (!led->cdev.brightness)
+		led->on_timer = false;
 
 	for (i = 0; i < num_channels; i++) {
 		enum led_brightness brightness;
@@ -245,10 +243,7 @@ static int ktd202x_brightness_set(struct ktd202x_led *led,
 			if (ret)
 				return ret;
 
-			if (mode_blink)
-				mode = KTD202X_CHANNEL_CTRL_PWM1(channel);
-			else
-				mode = KTD202X_CHANNEL_CTRL_ON(channel);
+			mode = ktd202x_channel_mode(led, channel);
 		} else {
 			mode = KTD202X_CHANNEL_CTRL_OFF;
 		}
@@ -320,6 +315,89 @@ static unsigned long ktd202x_flash_period_ms(const struct ktd202x_info *info,
 	return num_steps * KTD202X_FLASH_PERIOD_STEP_MS + info->flash_period_min_ms;
 }
 
+/*
+ * All LEDs blink with the PWM1 flash timer. PWM2 is no help: in timer slot 1
+ * it repeats PWM1, and in the other slots it only runs after PWM1 within the
+ * same period. So a LED may only join the timer while it is unused, or used
+ * with the very same period, on time and ramps, so that it never retimes
+ * another LED behind its back.
+ */
+static bool ktd202x_timer_busy(struct ktd202x_led *led, u8 flash_period,
+			       u8 flash_on, u8 ramp_times)
+{
+	struct ktd202x *chip = led->chip;
+	int i;
+
+	for (i = 0; i < chip->num_leds; i++) {
+		struct ktd202x_led *other = &chip->leds[i];
+
+		if (other == led || !other->on_timer)
+			continue;
+
+		if (flash_period != chip->flash_period ||
+		    flash_on != chip->flash_on || ramp_times != chip->ramp_times)
+			return true;
+	}
+
+	return false;
+}
+
+/* Called with the chip mutex held */
+static int ktd202x_timer_set(struct ktd202x_led *led, struct mc_subled *subleds,
+			     unsigned int num_channels, u8 flash_period, u8 flash_on,
+			     u8 ramp_times)
+{
+	struct ktd202x *chip = led->chip;
+	u8 ctrl_mask = 0;
+	u8 ctrl_mode = 0;
+	bool busy;
+	int ret;
+	int i;
+
+	busy = ktd202x_timer_busy(led, flash_period, flash_on, ramp_times);
+	led->on_timer = !busy;
+
+	for (i = 0; i < num_channels; i++) {
+		int channel = subleds[i].channel;
+
+		ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
+		ctrl_mode |= ktd202x_channel_mode(led, channel);
+	}
+
+	/* Without the timer, leave the LED steadily on */
+	if (busy) {
+		ret = regmap_update_bits(chip->regmap, KTD202X_REG_CHANNEL_CTRL,
+					 ctrl_mask, ctrl_mode);
+		return ret ? ret : -EBUSY;
+	}
+
+	chip->flash_period = flash_period;
+	chip->flash_on = flash_on;
+	chip->ramp_times = ramp_times;
+
+	/*
+	 * Update the timer registers only when they change, so that the
+	 * blink of another LED on the timer is not restarted.
+	 */
+	ret = regmap_update_bits(chip->regmap, KTD202X_REG_FLASH_PERIOD, 0xff,
+				 flash_period);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(chip->regmap, KTD202X_REG_PWM1_TIMER, 0xff,
+				 flash_on);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(chip->regmap, KTD202X_REG_TRISE_FALL, 0xff,
+				 ramp_times);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(chip->regmap, KTD202X_REG_CHANNEL_CTRL,
+				  ctrl_mask, ctrl_mode);
+}
+
 static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 			     unsigned long *delay_off, struct mc_subled *subleds,
 			     unsigned int num_channels)
@@ -328,22 +406,21 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	unsigned long delay_total_ms;
 	int ret, num_steps, on;
 	u8 ctrl_mask = 0;
-	u8 ctrl_pwm1 = 0;
 	u8 ctrl_on = 0;
 	int i;
 
 	mutex_lock(&led->chip->mutex);
 
-	for (i = 0; i < num_channels; i++) {
-		int channel = subleds[i].channel;
-
-		ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
-		ctrl_on |= KTD202X_CHANNEL_CTRL_ON(channel);
-		ctrl_pwm1 |= KTD202X_CHANNEL_CTRL_PWM1(channel);
-	}
-
 	/* Never off - brightness is already set, disable blinking */
 	if (!*delay_off) {
+		for (i = 0; i < num_channels; i++) {
+			int channel = subleds[i].channel;
+
+			ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
+			ctrl_on |= KTD202X_CHANNEL_CTRL_ON(channel);
+		}
+
+		led->on_timer = false;
 		ret = regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
 					 ctrl_mask, ctrl_on);
 		goto out;
@@ -363,28 +440,19 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	on = mul_u64_u64_div_u64(*delay_on, KTD202X_FLASH_ON_MAX, delay_total_ms);
 	on = clamp(on, 1, KTD202X_FLASH_ON_MAX - 1);
 
+	/*
+	 * Without the ramps a hardware pattern may have set. On -EBUSY the
+	 * LED core falls back to software blinking.
+	 */
+	ret = ktd202x_timer_set(led, subleds, num_channels, num_steps, on,
+				KTD202X_RAMP_TIMES_2_MS);
+	if (ret)
+		goto out;
+
 	/* Actually used delay_{on,off} values */
 	delay_total_ms = ktd202x_flash_period_ms(info, num_steps);
 	*delay_on = (delay_total_ms * on) / KTD202X_FLASH_ON_MAX;
 	*delay_off = delay_total_ms - *delay_on;
-
-	/* Set timings */
-	ret = regmap_write(led->chip->regmap, KTD202X_REG_FLASH_PERIOD, num_steps);
-	if (ret)
-		goto out;
-
-	ret = regmap_write(led->chip->regmap, KTD202X_REG_PWM1_TIMER, on);
-	if (ret)
-		goto out;
-
-	/* Drop the ramps a hardware pattern may have left behind */
-	ret = regmap_write(led->chip->regmap, KTD202X_REG_TRISE_FALL,
-			   KTD202X_RAMP_TIMES_2_MS);
-	if (ret)
-		goto out;
-
-	ret = regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
-				 ctrl_mask, ctrl_pwm1);
 out:
 	mutex_unlock(&led->chip->mutex);
 	return ret;
@@ -484,18 +552,9 @@ static int ktd202x_pattern_program(struct ktd202x_led *led,
 	unsigned int t[KTD202X_PATTERN_LEN];
 	unsigned int rise, fall, num_steps, on;
 	unsigned long period_ms, ton_ms;
-	u8 ctrl_mask = 0;
-	u8 ctrl_pwm1 = 0;
 	int ret;
 	int i;
 
-	for (i = 0; i < num_channels; i++) {
-		int channel = subleds[i].channel;
-
-		ctrl_mask |= KTD202X_CHANNEL_CTRL_MASK(channel);
-		ctrl_pwm1 |= KTD202X_CHANNEL_CTRL_PWM1(channel);
-	}
-
 	for (i = 0; i < KTD202X_PATTERN_LEN; i++)
 		t[i] = min_t(u32, pattern[i].delta_t, KTD202X_PATTERN_MAX_MS);
 
@@ -517,24 +576,10 @@ static int ktd202x_pattern_program(struct ktd202x_led *led,
 		     1, KTD202X_FLASH_ON_MAX - 1);
 
 	mutex_lock(&led->chip->mutex);
-
-	ret = regmap_write(led->chip->regmap, KTD202X_REG_FLASH_PERIOD, num_steps);
-	if (ret)
-		goto out;
-
-	ret = regmap_write(led->chip->regmap, KTD202X_REG_PWM1_TIMER, on);
-	if (ret)
-		goto out;
-
-	ret = regmap_write(led->chip->regmap, KTD202X_REG_TRISE_FALL,
-			   KTD202X_RAMP_TFALL(fall) | KTD202X_RAMP_TRISE(rise));
-	if (ret)
-		goto out;
-
-	ret = regmap_update_bits(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL,
-				 ctrl_mask, ctrl_pwm1);
-out:
+	ret = ktd202x_timer_set(led, subleds, num_channels, num_steps, on,
+				KTD202X_RAMP_TFALL(fall) | KTD202X_RAMP_TRISE(rise));
 	mutex_unlock(&led->chip->mutex);
+
 	return ret;
 }
 
@@ -556,7 +601,11 @@ static int ktd202x_pattern_single_set(struct led_classdev *cdev,
 
 	info.channel = led->index;
 
-	return ktd202x_pattern_program(led, pattern, &info, 1);
+	ret = ktd202x_pattern_program(led, pattern, &info, 1);
+	if (ret)
+		ktd202x_brightness_single_set(cdev, LED_OFF);
+
+	return ret;
 }
 
 static int ktd202x_pattern_single_clear(struct led_classdev *cdev)
@@ -580,8 +629,12 @@ static int ktd202x_pattern_mc_set(struct led_classdev *cdev,
 	if (ret)
 		return ret;
 
-	return ktd202x_pattern_program(led, pattern, mc->subled_info,
-				       mc->num_colors);
+	ret = ktd202x_pattern_program(led, pattern, mc->subled_info,
+				      mc->num_colors);
+	if (ret)
+		ktd202x_brightness_mc_set(cdev, LED_OFF);
+
+	return ret;
 }
 
 static int ktd202x_pattern_mc_clear(struct led_classdev *cdev)

-- 
Git-155)


