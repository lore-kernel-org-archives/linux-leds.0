Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223134;
	b=icx1U7ayq5Q6RSE7/l1P2XM5H/DymE31MYMbrJzZmZ1F2x6aUs5Y6ZUuoBfYqrFk3PsG
	 i2I56QrY/vkIh9bJT/+PrjLnMGOTlSK9QR76hLWwtYsMmH0tLS4Gq7czuitQqQGLdcrr/
	 Sc1MWHkUB+Zso/K0ACW+bGTF/tffZ3/BO1Z9qkvGnUhTEtAwtwLao+iiOEU+pkxe4Nn+s
	 NHSxZTDQ3iWOvme+ou/cGJhnYKRwwKS2JGY33hvkGBZRsGeB6Gd2/qy0q0l8MNEyIH3S5
	 yd0JM2dq3R7feIVBrE7r1BYGvikBynhIp7gyPE9Wrf2pEf/2dbToAoV78p53AA9nfbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223134;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=ZjJ7bo2bYbaGsM9AuVaQry78Zr+tMnEnT/BbAjQIBhk=;
	b=y8iN948YbSi5npQe3BH6/aN1bH9i4moj1egso1qHjCQ/cI9HPIUyDF3PiRjhxvrjEPLt
	 RC01M433zlnswPosOiu1AI4kUZhsmcNAQ21Woq6x8g0zf2/HesywmOq9ns4gFIbzITTdJ
	 goxbhbf02Ljxm5mkl3fbAcdJx7oRuT1BH5dLHAPLjsxt6+fyLfk5aShmER92TwH8hgba5
	 kRMi1Lya23C2maL0zML4/Y5tuyUDMAk1H694CTPeA5sRwwx8NoJ1AcXWaneTzjzCyz6qy
	 U4vWGoGoTkF9GLtMFPJDRBjtoCFeXTFIM7ymgWEC9jKTVn7MSFK5rI2oa8VxQt9eS3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=ug6W10ZX;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CAF606A322;
	Wed, 28 Oct 2026 21:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CAF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=ug6W10ZX
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jFLD975gmz8vJ5;
	Wed, 28 Oct 2026 22:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1793223130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjJ7bo2bYbaGsM9AuVaQry78Zr+tMnEnT/BbAjQIBhk=;
	b=ug6W10ZX0wBiGGlWSA0naYtkLQ5wHLjBCJa1fEQWlhCkcqZgYTD8p7Z59plXjW0v+zdL5J
	zZJhm+T9BgdGKs2ROjS3nzThXLUZ/dNy2e36O1rrJukPGk7vjWue6KEs4GmTw5pbK/7Q8R
	SWObj+PmNTyRA0dlx/DjxZzY5nrDl7NhSQONrW0KmU5RaTw7fupaCJI+nKsYs6TylE1fR2
	BXKTtqlb4vUJsH3kAceoX/OLW+CMaDWqBW4r+k2qS4yhpr9C/BR7dLaihYCvVvY630PWMn
	V6wk8mSg8VMJoZXUCffGN8PUAFTba0gLU97sQZp8HAhfGba3fLtixC3YXkjH2Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Wed, 28 Oct 2026 18:31:02 -0300
Subject: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
In-Reply-To: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Flavio Amieiro <flavio@amieiro.net>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4217; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=ggF/uBK1szjdzvd7JCaF71GxNXOUJv6pNasXUmRFO58=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFmPMo8lLFrycMqHK1KGf5qFzya8MrfmCVG0ZTEysb92I
 JCrbVZcRykLgxgXg6yYIgtLGUuZd/vB5t3TVkvCzGFlAhnCwMUpABPR1mP4Z+TVqzb5/fSaes5n
 363WL+MMeyH/xKPvSc2lNeGHFn61tmFkeOpxOib+QX+W4KTCRw8Vt226c3PyHJGuh/wfjnqn/Fx
 0kRUA
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jFLD975gmz8vJ5

This chip has a different layout for the LED Control Register when
compared to the other variants. This register contains the enable bit
(in the highest nibble) but also the current control (in the lowest
nibble).

According to the datasheet, a value of 010000 (0x10) in the register
enables an LED with the output current set to maximum.

This commit adds support for this IC allowing the chipdef to define an
offset for the enable bits inside the LED Control Register.

The limitation that already existed for other variants is still in
this one: all LEDs are enabled and set with maximum current, letting
brightness be controlled by the PWM registers.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
 drivers/leds/leds-is31fl32xx.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..586713ff7d98 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -77,6 +77,7 @@ struct is31fl32xx_priv {
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
  * @enable_bits_per_led_control_register: number of LEDs enable bits in each
+ * @enable_bits_offset_in_led_control_reg: offset of the enable bit in the LED Control Register
  * @brightness_steps    : number of brightness steps supported by the chip
  * @reset_func          : pointer to reset function
  * @sw_shutdown_func    : pointer to software shutdown function
@@ -88,6 +89,12 @@ struct is31fl32xx_priv {
  * necessary registers to a known initialization state. This is needed
  * for chips that do not have a @reset_reg.
  *
+ * @enable_bit_offset_in_led_control_reg determines the offset of the
+ * enable bits from the least significant bit of the LED control
+ * register. This is needed for chips that have a LED Control Register
+ * that control more than simply the enable/disable state of the
+ * channel such as the IS31FL3206.
+ *
  * @enable_bits_per_led_control_register must be >=1 if
  * @led_control_register_base != %IS31FL32XX_REG_NONE.
  */
@@ -103,6 +110,7 @@ struct is31fl32xx_chipdef {
 	bool	pwm_registers_reversed;
 	u8	led_control_register_base;
 	u8	enable_bits_per_led_control_register;
+	u8	enable_bits_offset_in_led_control_reg;
 	u16	brightness_steps;
 	int (*reset_func)(struct is31fl32xx_priv *priv);
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
@@ -351,6 +359,7 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
 		u8 value =
 		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
+		value = value << cdef->enable_bits_offset_in_led_control_reg;
 		u8 num_regs = cdef->channels /
 				cdef->enable_bits_per_led_control_register;
 		int i;
@@ -552,7 +561,22 @@ static const struct is31fl32xx_chipdef is31fl3293_cdef = {
 	.sw_shutdown_func			= is31fl3293_software_shutdown,
 };
 
+static const struct is31fl32xx_chipdef is31fl3206_cdef = {
+	.channels				= 12,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg			= 0x13,
+	.global_control_reg			= 0x26,
+	.reset_reg				= 0x2f,
+	.output_frequency_setting_reg		= 0x27,
+	.pwm_register_base			= 0x04,
+	.led_control_register_base		= 0x17,
+	.enable_bits_per_led_control_register	= 1,
+	.enable_bits_offset_in_led_control_reg	= 4,
+	.brightness_steps			= 256,
+};
+
 static const struct of_device_id of_is31fl32xx_match[] = {
+	{ .compatible = "issi,is31fl3206",  .data = &is31fl3206_cdef, },
 	{ .compatible = "issi,is31fl3293",  .data = &is31fl3293_cdef, },
 	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
 	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
@@ -616,6 +640,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
+	{ .name = "is31fl3206" },
 	{ .name = "is31fl3293" },
 	{ .name = "is31fl3236" },
 	{ .name = "is31fl3236a" },

-- 
2.53.0

