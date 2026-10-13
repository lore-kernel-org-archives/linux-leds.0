Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357F4E2F0F;
	Tue, 13 Oct 2026 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885651; cv=none; b=WzdzE/T+vnRFdbVJ1U1CYbYeyrp9c1IlVEtt/dnDHeX1baqKbL68ly2Z7ltwo72mk7z5CmSDh0sp2USSc3ONvXslouhK4Hf+v/xH2rYJJpCKML4cReTnyFUZU4F4/1P0dzR+6btm1f9s7hlFEl+sDinDg/l8gTRcAP574slGrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885651; c=relaxed/simple;
	bh=wecnArJD8j6gwk39Hs3k2OrJJqICmNTLwLxzf4XIJDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tv6U2Pu3zevpUmpTYJASO1xQRRBs0r5FxPV6MfaXTccGwn1LoeBTbmYSIRN3SDcUq/QB1BOi/+87LKnwlHNTQIB5LYO0SHW1y5G9qfI0CahWNVgYGEZ3DPrKfXVZmTXU2XBfZA5iz/zT332ftPq7uonMEWdpn8E3g7XgJPS70zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=zxcAQ1nO; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="zxcAQ1nO"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j3qbL3vf5zKns4;
	Tue, 13 Oct 2026 12:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791885646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqnN8DHuzjLWZmu5E3fr14FJ2emMBi6H0waaqQ4+MI8=;
	b=zxcAQ1nOa0KmXdBA5Cv2HYP5CvHAz4kj7mPyPbHn8QPdoL9DkKN1INm7zABPwywpz25z7Y
	Fm6KpNxH1CnGcY2IbOC3PNGCOl0fmp2i0wzhqpXNo0f/KkZPTjy30O6w1uUFuSA8kAyY7L
	8bbNqN1oxs3Xxwj7eCJ3OYNqB0mptANNnKlP7lFMVyxOu86WyQdBzxrA6AmCMI4FESni3q
	ncn6CsbHP10f/RieIO5+m4TNz4TVztOnrMgaU2pcr9d0/KxWLfNtG3Z0AoTXdeEAXHohjw
	QrJ2vDBmzbsumCBnpUI3C+woSfQOd3Raa5HxRRaSQ3HlFCRlBJ80Vv7AY5e1yw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Tue, 13 Oct 2026 07:00:10 -0300
Subject: [PATCH v3 2/2] leds: is31f132xx: Add support for is31fl3206
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
In-Reply-To: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=wecnArJD8j6gwk39Hs3k2OrJJqICmNTLwLxzf4XIJDg=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFnnGPX0TnVfCptSXrJx/dyp/saTtsofWxea4bWdg8W5I
 zTtXVl0RykLgxgXg6yYIgtLGUuZd/vB5t3TVkvCzGFlAhnCwMUpABNx+svI0BxvMaOqyiW7Nlfe
 r8BdRiD16BqlGVwuEh1BWv/0F6cYMfzTOm3zzfVUeULXr50XyxZt/T5jV2rqD9mpeTsS+Twa/N4
 wAQA=
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3qbL3vf5zKns4

This chip has a different layout for the LED Control Register when
compared to the other variants. This register contains the enable bit
(in the highest nibble) but also the current control.

According to the datasheet, a value of 010000 (0x10) in the register
enables an LED with the output current set to maximum.

This commit adds support for this IC following the previous limitation
of the other variants: all LEDs are enabled and set with maximum
current, letting brightness be controlled by the PWM registers.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
 drivers/leds/leds-is31fl32xx.c | 95 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 79 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 285085d27453..a22d814be4b0 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -49,6 +49,9 @@
 #define IS31FL3293_RESET_MAGIC 0xc5
 #define IS31FL3293_MAX_MICROAMP 20000
 
+/* Custom LED Control enable value for IS31FL3206 */
+#define IS31FL3206_CONTROL_ENABLE_WITH_IMAX BIT(4)
+
 struct is31fl32xx_priv;
 struct is31fl32xx_led_data {
 	struct led_classdev cdev;
@@ -79,6 +82,7 @@ struct is31fl32xx_priv {
  * @enable_bits_per_led_control_register: number of LEDs enable bits in each
  * @brightness_steps    : number of brightness steps supported by the chip
  * @reset_func          : pointer to reset function
+ * @enable_all_channels_func  : pointer to enable all channels function
  * @sw_shutdown_func    : pointer to software shutdown function
  *
  * For all optional register addresses, the sentinel value %IS31FL32XX_REG_NONE
@@ -88,6 +92,11 @@ struct is31fl32xx_priv {
  * necessary registers to a known initialization state. This is needed
  * for chips that do not have a @reset_reg.
  *
+ * If non-NULL, @enable_all_channels_func will be used in place of the
+ * generic channel enable function. This is needed for chips that have
+ * a LED Control Register that control more than simply the
+ * enable/disable state of the channel.
+ *
  * @enable_bits_per_led_control_register must be >=1 if
  * @led_control_register_base != %IS31FL32XX_REG_NONE.
  */
@@ -105,6 +114,7 @@ struct is31fl32xx_chipdef {
 	u8	enable_bits_per_led_control_register;
 	u16	brightness_steps;
 	int (*reset_func)(struct is31fl32xx_priv *priv);
+	int (*enable_all_channels_func)(struct is31fl32xx_priv *priv);
 	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
 };
 
@@ -228,6 +238,28 @@ static int is31fl3293_software_shutdown(struct is31fl32xx_priv *priv,
 	return is31fl32xx_write(priv, IS31FL3293_SHUTDOWN_REG, value);
 }
 
+/*
+ * Custom enable_all_channels function for IS31FL3206 because this
+ * variant has only one bit in the higher nibble for enable, and the
+ * lower nibble controls output current.
+ */
+static int is31fl3206_enable_all_channels(struct is31fl32xx_priv *priv)
+{
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
+	u8 num_regs = cdef->channels / cdef->enable_bits_per_led_control_register;
+	int i, ret;
+
+	for (i = 0; i < num_regs; i++) {
+		ret = is31fl32xx_write(priv,
+				       cdef->led_control_register_base+i,
+				       IS31FL3206_CONTROL_ENABLE_WITH_IMAX);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /*
  * NOTE: A mutex is not needed in this function because:
  * - All referenced data is read-only after probe()
@@ -315,6 +347,33 @@ static int is31fl32xx_reset_regs(struct is31fl32xx_priv *priv)
 	return 0;
 }
 
+static int is31fl32xx_enable_all_channels(struct is31fl32xx_priv *priv)
+{
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
+	int ret;
+
+	if (cdef->enable_all_channels_func)
+		return cdef->enable_all_channels_func(priv);
+
+	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
+		u8 value =
+			GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
+		u8 num_regs = cdef->channels /
+			cdef->enable_bits_per_led_control_register;
+		int i;
+
+		for (i = 0; i < num_regs; i++) {
+			ret = is31fl32xx_write(priv,
+					       cdef->led_control_register_base+i,
+					       value);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int is31fl32xx_software_shutdown(struct is31fl32xx_priv *priv,
 					bool enable)
 {
@@ -345,24 +404,12 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 		return ret;
 
 	/*
-	 * Set enable bit for all channels.
+	 * Enable all channels.
 	 * We will control state with PWM registers alone.
 	 */
-	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
-		u8 value =
-		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
-		u8 num_regs = cdef->channels /
-				cdef->enable_bits_per_led_control_register;
-		int i;
-
-		for (i = 0; i < num_regs; i++) {
-			ret = is31fl32xx_write(priv,
-					       cdef->led_control_register_base+i,
-					       value);
-			if (ret)
-				return ret;
-		}
-	}
+	ret = is31fl32xx_enable_all_channels(priv);
+	if (ret)
+		return ret;
 
 	ret = is31fl32xx_software_shutdown(priv, false);
 	if (ret)
@@ -552,7 +599,22 @@ static const struct is31fl32xx_chipdef is31fl3293_cdef = {
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
+	.brightness_steps			= 256,
+	.enable_all_channels_func		= is31fl3206_enable_all_channels,
+};
+
 static const struct of_device_id of_is31fl32xx_match[] = {
+	{ .compatible = "issi,is31fl3206",  .data = &is31fl3206_cdef, },
 	{ .compatible = "issi,is31fl3293",  .data = &is31fl3293_cdef, },
 	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
 	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
@@ -616,6 +678,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
  * even though it is not used for DeviceTree based instantiation.
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
+	{ .name = "is31fl3206" },
 	{ .name = "is31fl3293" },
 	{ .name = "is31fl3236" },
 	{ .name = "is31fl3236a" },

-- 
2.53.0

