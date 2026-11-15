Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701595;
	b=IRGnCzAF4tXM6IW3c88tDVmFY05Vg/rnT2jwmMUaoLrAHVUhd/dsYiFV4yChn/WQUxVy
	 dq3ULSRd0lSdSvbaP63iGqKybZkYWGwlxaln13CTZWohfTzfPtWDZYcsyjmulzFQXHdQR
	 k0hn1CoMdNdG54D2eThzygseeTB5IS4Ee0sAYgKgnovSgkPch3E0PW9StWOWsBFgvRVxk
	 Ks0tviG0Mq1gB20vI0A9lCp7qt9cfzm9f4rta/Bakkjf4kCaN13yiV3vo1UqYSfMqxKTx
	 vFdehhvzxyXSMlMpdlvOY4ndjByPpaCCFLITau2EOXZ2TPE3qiyXvY+vHawrgZ/30Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701595;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=xx/+D73MzoUd0gc4j483JX2jJpfuN8qnZdRjXrQBlbI=;
	b=EvPFBwTb4TyAZf3kj3/iIGJ1qsHi/sFlXafn7xsnpGQCv6KEkeMoQGva6I2j0cTnYJU9
	 zSpw3+ugsh9I+hQWM5+PfA8Pt6CYPnBSd/lOR7yVckylA4BypO9ZVcC1yLHjCK3JrkM/r
	 AL/CWjUVP+kNL7hK1jvPm0qOaGREIiy/QLCVuo1itUDHu5I2xnX/la0qNCiuJLjjv2JIv
	 uFIb7bZuudhDYwAW6/gdmgJLKSm266OdkFkVt+REI353Uj85ri+LQ6zhoGEeyUsixYbI0
	 kRZZVJ3eSclQu6dFC1h15Jf9XMkDjzOzu0tLrr/J2gS2Z691HwFwy3raMA9JxEIghYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=VtXAA6Fq;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D3606A323;
	Sun, 15 Nov 2026 00:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=VtXAA6Fq
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jRs0132hgz8v9N;
	Sun, 15 Nov 2026 01:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1794701585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx/+D73MzoUd0gc4j483JX2jJpfuN8qnZdRjXrQBlbI=;
	b=VtXAA6FqRzVJvf4+H7qAiW8Q8hZUVULHkWr9s+cloGe4sxXQChmuIQold6AkJZfNEPBa2X
	TWHzxTJDCpncEkhrwZFzR3F3hRVAIWEt4xLhCa6+0eglgwMIcDJxF30jz8+mbLFj6h3GgR
	H7IrCLkbF1nm1VJZeakxMmmiTlwYNaIDA//1gFZQAr7IkNn0LXLDNUebT2OiVYSff1n3Lv
	iyixAhVOog3kVuoHtzbtwoeje8x/LP0WB4Hr0yBPf9Ii9etAuuQtrlGhIt5sO32yWlRpTO
	v26UQiwrmO89jEQUOwVFC77JgADR+OS/y74UipYkkGvnTZFRyG1MN7ThhIQEGQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Sat, 14 Nov 2026 21:12:21 -0300
Subject: [PATCH v5 2/2] leds: is31f132xx: Add support for is31fl3206
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
Message-Id: <20261114-add-is31fl3206-support-v5-2-332db80233df@amieiro.net>
References: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
In-Reply-To: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Flavio Amieiro <flavio@amieiro.net>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4561; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=avPgSkrjLXJtAXV2mo5ul3YMUwSTcUbzMX3/VZd+1nU=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFk/fvx7+4c79uGFHaWBDzZf2bllW2rezrMcRy3Uu5IWe
 PKXLZKO7ShlYRDjYpAVU2RhKWMp824/2Lx72mpJmDmsTCBDGLg4BWAiO8UY/nA9ak2fvU2k4Xtm
 pmev75Lff5ZdufX6wP3VM04d3TxF9pQ9I8MhwdWdV+OP2bidqy498ifDzreGrfGGysNW5aN5Vfo
 bP/EDAA==
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jRs0132hgz8v9N

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

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
 drivers/leds/leds-is31fl32xx.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 581c05bab969..1c76b0fb1f15 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -77,6 +77,7 @@ struct is31fl32xx_priv {
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
  * @enable_bits_per_led_control_register: number of LEDs enable bits in each
+ * @enable_bits_offset_in_led_control_reg: offset of the enable bits in the LED Control Register
  * @brightness_steps    : number of brightness steps supported by the chip
  * @reset_func          : pointer to reset function
  * @sw_shutdown_func    : pointer to software shutdown function
@@ -88,6 +89,12 @@ struct is31fl32xx_priv {
  * necessary registers to a known initialization state. This is needed
  * for chips that do not have a @reset_reg.
  *
+ * @enable_bits_offset_in_led_control_reg determines the offset of the
+ * enable bits from the least significant bit of the LED control
+ * register. This is needed for chips that have a LED Control Register
+ * that controls more than simply the enable/disable state of the
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
@@ -350,8 +358,10 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 	 * We will control state with PWM registers alone.
 	 */
 	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
-		u8 value =
-		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
+		u8 value = GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
+
+		value <<= cdef->enable_bits_offset_in_led_control_reg;
+
 		u8 num_regs = cdef->channels /
 				cdef->enable_bits_per_led_control_register;
 		int i;
@@ -553,7 +563,22 @@ static const struct is31fl32xx_chipdef is31fl3293_cdef = {
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
@@ -613,6 +638,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id is31fl32xx_id[] = {
+	{ .name = "is31fl3206", .driver_data = (kernel_ulong_t)&is31fl3206_cdef },
 	{ .name = "is31fl3293", .driver_data = (kernel_ulong_t)&is31fl3293_cdef },
 	{ .name = "is31fl3236", .driver_data = (kernel_ulong_t)&is31fl3236_cdef },
 	{ .name = "is31fl3236a", .driver_data = (kernel_ulong_t)&is31fl3236a_cdef },

-- 
2.53.0

