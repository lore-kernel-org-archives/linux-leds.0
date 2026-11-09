Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794251078;
	b=e25aeZHLT9BTisHckOlg2cS0Te7j/EXHkgy3Mqf5SxGR2soa1hc5y3S1khIiPqkaOiRn
	 XUEWOBqVt0uO8dZLFBlBW9+ZVQQ/AzvX+KFYuwrEsW+Aqk2AmrwPrrSemgzAgWSwHhlvY
	 MhcI8vErZ+ZV+lw4Nq/4iH3IZZ1ExhgBbtoGovo8F/ROMq6jZcLHQ/Pv2cen6skoD7wdK
	 I7xggkE7y5/UCQ+Tzd/WkItr394dLZ+MZGiy5B1JrdiRFlFIWQTaLuARPc7LbPuSEQNIu
	 V2H+pX52mlSCiGIAa0gM6n9bowv2wmTFk4zB3Mjph85H6wRNvZOQrQeLbHCvrmquT5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251078;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CW5kJhCKpiEwwwuPeTwjgFcWVZ18wlPCSVAwORZMpDU=;
	b=BXJ10P0VMrlu90cCKz9Hwncp8qMWeggsqUViiFyYZlQFvYmXL+oQp9offaauwNLEeFRQ
	 u6ZcmoFZf2fE4fCmyTtKhSeBKekTksH4guqRrH57N5yxaWHmuAV+zdabQnEeKBF67stFi
	 AB+26UYcK5zz+nShRBpYjTSoqo9viUDabuS0p4ipjLqRG3uYB7D0CVFUayIGkXTWOQXJe
	 b5O7aM8/WJhbHLqi5vVhH4uNQJZCJ2YkawMz3pfaV+wGEll6NBXnFnpyjR8IOoyVpiCWD
	 MBDYPZ0ejmiEDkSQ+QEQlnAD+2lOSqNhjNTYxVRhuu31B9DkkAV7QXPXs+X99H0HLkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oy3A4XSF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B651606A33A;
	Mon,  9 Nov 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oy3A4XSF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794251067;
	b=c3usotKZ7ZHupxpxdiMiO6jIp+gVnIFvNYSJLvLrfOD7Abujf8u03D0VGxgWQGWBntVV
	 w7M/8W1vv4hXg2ik+4yLQIRS11fSRZzDuXydpr3v7pTxzrCHHUOYMqR9b/DPjf9I/HWTR
	 WLNMTagwHfQKpZU5NRg0Y9zVXx+m2iG1DNCVv4HNgB18Oe2yADsJdKlVS4vakTI6/Ntg2
	 0/2UK6+134a6CiAUs4JRlYqb8/soS369OsVQtqCiwLcxlnkFC13hOX7Ni9tY4pWvV4J5r
	 HCca0r/cYSNdUOdcwffA+oQM0+mvudG5/gak7gmk5WjESDUN0RcoAPCnxO4F7JQuEMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794251067;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CW5kJhCKpiEwwwuPeTwjgFcWVZ18wlPCSVAwORZMpDU=;
	b=Ta2+ivMlCceB76lm1JOLf6vcu2Wi+ZErKDLkKWXIkPmm8NyLdA1v9L84N8djYqnj0cTt
	 Eqom8mTWKglbvrKiSUFP8Mrp4Pnpwl6J+PFzLDQm69XaGkgWdoojILdBXf9mIL1plRXF+
	 4xNQ/uNqlE2zZAlC0wr0+0sKFJwtFPOEjIGyl48RCEl6S1W16yatkX1HJDYFDnyaIJjTG
	 0EvKjCQohmPGCwNKw4m2OPUSO/cTs/AD6EAT5/UL3HlqtLJFaPjIhnb/xPy5k9Qu/AWiX
	 /jbAx3J0GriqXY753u6/voCY3WXuxtIy/VUvQadFwZ6xTHglsCKufUfdiTxoyV8rBoA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E3391F008A1;
	Mon,  9 Nov 2026 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251067;
	bh=CW5kJhCKpiEwwwuPeTwjgFcWVZ18wlPCSVAwORZMpDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oy3A4XSFMVsNa4NsQQFfbgBGl5LHe6fTMQjOSkNXmpZJvkmt/v8tRVZVXqfK2a0c2
	 dCuNas2QkuaGW/oOL1moVdouxMPt0d8ljACsGBqBHpthjgBDlf1JNRLbcL/XNzesmB
	 PmjFLfwtX0maG/ad+loBEtUwcRKpoon5T+PgRLmjcDJOrxHnzQF5Xj6yeJu7sqk9aq
	 a+bJx1Wz/JIzvzRoh5UyAMU5U96ikkR0Qh4Bqa9cSwZqmGQJzu2534sn2zjlKiyJ93
	 Zx5Zu6JRr5F27QOM3KzK6ncSyyEHT/VQDV4AOuqoFGRBe4nwuaFD2nnuChL5TKRxul
	 MZ6/QTlb2CNdA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 93B77485FA;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 14:03:43 -0500
Subject: [PATCH v2 07/11] leds: rgb: ktd202x: Add Etek ET6326 support
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
Message-Id: <20261109-ktd202x-et6326-v2-7-56e97c226658@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794251062; l=7868;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=EliP/VZXaAy3VAfG0tJ1JsGl5wEtMq1jMLg2aUC+sFU=;
 b=c7MyRG2BL3PJBb/mJ5XVzHKkwj/eUUdrIXrm4/J5phc4ywkDAQXvis0V+hlysAnHSre5RyDGk
 zXCDQdMI4PhDQ6P4/eTM8MsJVajMJZAfjde1/2Ypb9BIxf9tX77w0HX
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 8bit

From: Joseph Telaak <joseph@telaak.dev>

The Etek ET6326 is a KTD2026 with a different flash period encoding:
Reg1 = n selects (n + 1) * 128 ms, from 128 ms to 16.38 s, where the
KTD202x selects 256 ms + n * 128 ms and uses Reg1 = 127 for one shot
mode.

Move the number of LEDs and the flash period limits into per chip data
and add the ET6326, so the timer trigger gets the delays it asked for.

Report the on time rounded to the nearest millisecond rather than down.
The shortest ET6326 period is 128 ms, and 1/256 of it rounded down is
0 ms, which the timer trigger passes back with the next delay_off
write, where an on time of 0 turns the LED off. Rounded, the delays
read back also give the same on time when they are written again.

Link: https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_datasheet.pdf
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/Kconfig        |  3 +-
 drivers/leds/rgb/leds-ktd202x.c | 72 ++++++++++++++++++++++++++++++++---------
 2 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 6e9ab5f60714..3a57e5819eeb 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -20,7 +20,8 @@ config LEDS_KTD202X
 	select REGMAP_I2C
 	help
 	  This option enables support for the Kinetic KTD2026/KTD2027
-	  RGB/White LED driver found in different BQ mobile phones.
+	  RGB/White LED driver found in different BQ mobile phones, and
+	  for the compatible Etek ET6326.
 	  It is a 3 or 4 channel LED driver programmed via an I2C interface.
 
 	  To compile this driver as a module, choose M here: the module
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 042de16c28bc..2650573b6c5a 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -5,6 +5,7 @@
  * Copyright 2023 André Apitzsch <git@apitzsch.eu>
  *
  * Datasheet: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
+ * Datasheet: https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_datasheet.pdf
  */
 
 #include <linux/i2c.h>
@@ -65,9 +66,7 @@
 /* Register 6-9 */
 #define KTD202X_LED_CURRENT_10_mA		0x4f
 
-#define KTD202X_FLASH_PERIOD_MIN_MS 256
 #define KTD202X_FLASH_PERIOD_STEP_MS 128
-#define KTD202X_FLASH_PERIOD_MAX_STEPS 126
 #define KTD202X_FLASH_ON_MAX 256
 
 #define KTD202X_MAX_BRIGHTNESS 192
@@ -86,6 +85,33 @@ static const struct reg_default ktd202x_reg_defaults[] = {
 	{ KTD202X_REG_LED_IOUT(3), KTD202X_LED_CURRENT_10_mA },
 };
 
+struct ktd202x_info {
+	unsigned long num_leds;
+	/* Flash period encoded by a Reg1 value of 0 */
+	unsigned int flash_period_min_ms;
+	unsigned int flash_period_max_steps;
+};
+
+/* Reg1 = 127 selects one shot mode on the KTD202x */
+static const struct ktd202x_info ktd2026_info = {
+	.num_leds = KTD2026_NUM_LEDS,
+	.flash_period_min_ms = 256,
+	.flash_period_max_steps = 126,
+};
+
+static const struct ktd202x_info ktd2027_info = {
+	.num_leds = KTD2027_NUM_LEDS,
+	.flash_period_min_ms = 256,
+	.flash_period_max_steps = 126,
+};
+
+/* The ET6326 flash period is (Reg1 + 1) * 128 ms, up to 16.38 s */
+static const struct ktd202x_info et6326_info = {
+	.num_leds = KTD2026_NUM_LEDS,
+	.flash_period_min_ms = 128,
+	.flash_period_max_steps = 127,
+};
+
 struct ktd202x_led {
 	struct ktd202x *chip;
 	union {
@@ -100,6 +126,7 @@ struct ktd202x {
 	struct regulator_bulk_data regulators[2];
 	struct device *dev;
 	struct regmap *regmap;
+	const struct ktd202x_info *info;
 	bool enabled;
 	unsigned long num_leds;
 	struct ktd202x_led leds[] __counted_by(num_leds);
@@ -271,6 +298,7 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 			     unsigned long *delay_off, struct mc_subled *subleds,
 			     unsigned int num_channels)
 {
+	const struct ktd202x_info *info = led->chip->info;
 	unsigned long delay_total_ms;
 	int ret, num_steps, on;
 	u8 ctrl_mask = 0;
@@ -304,11 +332,11 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	/* Integer representation of time of flash period */
 	if (check_add_overflow(*delay_on, *delay_off, &delay_total_ms))
 		delay_total_ms = ULONG_MAX;
-	if (delay_total_ms < KTD202X_FLASH_PERIOD_MIN_MS)
+	if (delay_total_ms < info->flash_period_min_ms)
 		num_steps = 0;
 	else
-		num_steps = min_t(unsigned long, KTD202X_FLASH_PERIOD_MAX_STEPS,
-				  (delay_total_ms - KTD202X_FLASH_PERIOD_MIN_MS) /
+		num_steps = min_t(unsigned long, info->flash_period_max_steps,
+				  (delay_total_ms - info->flash_period_min_ms) /
 				  KTD202X_FLASH_PERIOD_STEP_MS);
 
 	/*
@@ -319,8 +347,14 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 	on = clamp(on, 1, KTD202X_FLASH_ON_MAX - 1);
 
 	/* Actually used delay_{on,off} values */
-	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + KTD202X_FLASH_PERIOD_MIN_MS;
-	*delay_on = (delay_total_ms * on) / KTD202X_FLASH_ON_MAX;
+	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + info->flash_period_min_ms;
+	/*
+	 * Rounded to the nearest ms, so that the delays give the same on time
+	 * when written back. Rounded down, 1/256 of the 128 ms ET6326 period
+	 * would be 0 ms, which means never on.
+	 */
+	*delay_on = clamp(DIV_ROUND_CLOSEST(delay_total_ms * on, KTD202X_FLASH_ON_MAX),
+			  1UL, delay_total_ms - 1);
 	*delay_off = delay_total_ms - *delay_on;
 
 	/* Set timings */
@@ -548,8 +582,8 @@ static const struct regmap_config ktd202x_regmap_config = {
 static int ktd202x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	const struct ktd202x_info *info;
 	struct ktd202x *chip;
-	unsigned long num_leds;
 	int count;
 	int ret;
 
@@ -557,13 +591,17 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (!count || count > KTD202X_MAX_LEDS)
 		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", count);
 
+	info = i2c_get_match_data(client);
+	if (!info)
+		return -ENODEV;
+
 	/* Loops over the LEDs go up to the number of channels, not of child nodes */
-	num_leds = (unsigned long)i2c_get_match_data(client);
-	chip = devm_kzalloc(dev, struct_size(chip, leds, num_leds), GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, leds, info->num_leds), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	chip->num_leds = num_leds;
+	chip->info = info;
+	chip->num_leds = info->num_leds;
 	chip->dev = dev;
 	i2c_set_clientdata(client, chip);
 
@@ -623,15 +661,17 @@ static void ktd202x_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ktd202x_id[] = {
-	{ .name = "ktd2026", .driver_data = KTD2026_NUM_LEDS },
-	{ .name = "ktd2027", .driver_data = KTD2027_NUM_LEDS },
+	{ .name = "et6326", .driver_data = (kernel_ulong_t)&et6326_info },
+	{ .name = "ktd2026", .driver_data = (kernel_ulong_t)&ktd2026_info },
+	{ .name = "ktd2027", .driver_data = (kernel_ulong_t)&ktd2027_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ktd202x_id);
 
 static const struct of_device_id ktd202x_match_table[] = {
-	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
-	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
+	{ .compatible = "etekmicro,et6326", .data = &et6326_info },
+	{ .compatible = "kinetic,ktd2026", .data = &ktd2026_info },
+	{ .compatible = "kinetic,ktd2027", .data = &ktd2027_info },
 	{}
 };
 MODULE_DEVICE_TABLE(of, ktd202x_match_table);
@@ -649,5 +689,5 @@ static struct i2c_driver ktd202x_driver = {
 module_i2c_driver(ktd202x_driver);
 
 MODULE_AUTHOR("André Apitzsch <git@apitzsch.eu>");
-MODULE_DESCRIPTION("Kinetic KTD2026/7 LED driver");
+MODULE_DESCRIPTION("Kinetic KTD2026/7 and Etek ET6326 LED driver");
 MODULE_LICENSE("GPL");

-- 
Git-155)


