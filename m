Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494238;
	b=HJUFujGNx4nDc580aOKGB2ljyP2Iz56uPfsInNrXL2NoEYttfZCi8dJwIAr9G/grTxYA
	 fuh/QeHph/5k5IrRoFgcT8v3peSdlrpD34qsl2lN+D9TSqVs6tG9mGlw7LuI4xiepb+yo
	 PUSMTfgiBTD7XfLyHO1muH2EbXT91Wo5ZIq6BNGOIrCE7sBOqexzCPs3LMLld0r/h4DRn
	 UPasUZJuVWK4o7PFKA3bdaDXBGoiIjyJc3LwIPr/NaO/A6LH4TT3JoWL/apDDOdRuPFYi
	 Q3JehmSlEQTOYvl4lKlZAsN2lFw+Ttp22dIu2/fqbJ91tLOS/Seu68tpEoBUyWf7oOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494238;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=Q+8hmYVwSuQQaSXfjPgdsvBl0XEA6DarkJ9b0W+ddiI=;
	b=ArvEe4C1npmxSSAqlrQlVDFuDuoBjESxqCNBYJ8YXiqHFrB8D0qn6H/wRrorNUmkh98E
	 jOpG8js6ChxZ7ZFUYcpdC1gdDxpIm7YkL/na0TR7Ik/KRxfJVGBSVhoVC3+gSLF0b81bX
	 K3yObY4qVV9gQITxfcZCB/L86d8Pq85P/AamWNHOsmNfuCjfq2BrnLhMLOBI0raGIV4Qy
	 NxUIRuJYSfjhTMBNj0ZrIiReMZAg7PF1y/unMiqyrutFvDBuY8f5AWYpseazGjgq/UXFW
	 wUjA07Cl32g6NPoNdeQv7TgmuNJ1nnIyxLI7QoaNv0QXx5exSakPi1N1nkwC7Un2UjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QbMbt0a+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71699606A319;
	Tue, 20 Oct 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QbMbt0a+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06D81F000C4;
	Tue, 20 Oct 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792494238;
	bh=Q+8hmYVwSuQQaSXfjPgdsvBl0XEA6DarkJ9b0W+ddiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QbMbt0a+WSlFf6HPyB0w2tGgOUAacWPjd4wAqylOrlRY6e+N+g0lbKbRBvOmeHI8G
	 NOuJoch7658dOAyydZhUEAbpJUXE/RL5DbySWyYJxVIA7ik9IPhODyowBWjl2X/Zp3
	 IRMxTsGLSp8wH6LCtSJVUsbDWd5J8RYWH4Hk3D6xrAk4W+X4zwMBMnHyjStcunUmyD
	 gGgoTRrYu5gU1DlRfzQ8ozQL0EGwMd2tQ6KEXIx8N/ae9fGmH04jMyNFJR0iIauw3u
	 f8gYMx1yKiC5Zuzu59CRzfuY/XtmHj+jQUgv93g1SAAXLl3V674nwxg0HM2WscpEC6
	 V2uBj1vPwSL5A==
Date: Tue, 20 Oct 2026 12:03:52 +0100
From: Lee Jones <lee@kernel.org>
To: Flavio Amieiro <flavio@amieiro.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: is31f132xx: Add support for is31fl3206
Message-ID: <179198370454.839288.5327794631276643738@kernel.org>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
 <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
X-AI-Review-Draft: <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>

--- checkpatch.pl (1 issue) ---
Line 172: WARNING: DT compatible string "issi,is31fl3206" appears un-documented -- check ./Documentation/devicetree/bindings/

This true, or is it documented in this set?

> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control.
>
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
>
> This commit adds support for this IC following the previous limitation
> of the other variants: all LEDs are enabled and set with maximum
> current, letting brightness be controlled by the PWM registers.
>
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
> ---
>  drivers/leds/leds-is31fl32xx.c | 95 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 79 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 285085d27453..a22d814be4b0 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -49,6 +49,9 @@
>  #define IS31FL3293_RESET_MAGIC 0xc5
>  #define IS31FL3293_MAX_MICROAMP 20000
>
> +/* Custom LED Control enable value for IS31FL3206 */
> +#define IS31FL3206_CONTROL_ENABLE_WITH_IMAX BIT(4)
> +
>  struct is31fl32xx_priv;
>  struct is31fl32xx_led_data {
>  	struct led_classdev cdev;
> @@ -79,6 +82,7 @@ struct is31fl32xx_priv {
>   * @enable_bits_per_led_control_register: number of LEDs enable bits in each
>   * @brightness_steps    : number of brightness steps supported by the chip
>   * @reset_func          : pointer to reset function
> + * @enable_all_channels_func  : pointer to enable all channels function
>   * @sw_shutdown_func    : pointer to software shutdown function
>   *
>   * For all optional register addresses, the sentinel value %IS31FL32XX_REG_NONE
> @@ -88,6 +92,11 @@ struct is31fl32xx_priv {
>   * necessary registers to a known initialization state. This is needed
>   * for chips that do not have a @reset_reg.
>   *
> + * If non-NULL, @enable_all_channels_func will be used in place of the
> + * generic channel enable function. This is needed for chips that have
> + * a LED Control Register that control more than simply the
> + * enable/disable state of the channel.
> + *
>   * @enable_bits_per_led_control_register must be >=1 if
>   * @led_control_register_base != %IS31FL32XX_REG_NONE.
>   */
> @@ -105,6 +114,7 @@ struct is31fl32xx_chipdef {
>  	u8	enable_bits_per_led_control_register;
>  	u16	brightness_steps;
>  	int (*reset_func)(struct is31fl32xx_priv *priv);
> +	int (*enable_all_channels_func)(struct is31fl32xx_priv *priv);
>  	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
>  };
>
> @@ -228,6 +238,28 @@ static int is31fl3293_software_shutdown(struct is31fl32xx_priv *priv,
>  	return is31fl32xx_write(priv, IS31FL3293_SHUTDOWN_REG, value);
>  }
>
> +/*
> + * Custom enable_all_channels function for IS31FL3206 because this
> + * variant has only one bit in the higher nibble for enable, and the
> + * lower nibble controls output current.
> + */
> +static int is31fl3206_enable_all_channels(struct is31fl32xx_priv *priv)
> +{
> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> +	u8 num_regs = cdef->channels / cdef->enable_bits_per_led_control_register;
> +	int i, ret;
> +
> +	for (i = 0; i < num_regs; i++) {

New for() loops should initiate the variable.

  for (int i = 0; ...

> +		ret = is31fl32xx_write(priv,
> +				       cdef->led_control_register_base+i,

Spaces around '+' please.

> +				       IS31FL3206_CONTROL_ENABLE_WITH_IMAX);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * NOTE: A mutex is not needed in this function because:
>   * - All referenced data is read-only after probe()
> @@ -315,6 +347,33 @@ static int is31fl32xx_reset_regs(struct is31fl32xx_priv *priv)
>  	return 0;
>  }
>
> +static int is31fl32xx_enable_all_channels(struct is31fl32xx_priv *priv)
> +{
> +	const struct is31fl32xx_chipdef *cdef = priv->cdef;
> +	int ret;
> +
> +	if (cdef->enable_all_channels_func)
> +		return cdef->enable_all_channels_func(priv);

I detest pointers to functions at the device driver level.

Please find another way to do this.

> +	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
> +		u8 value =
> +			GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> +		u8 num_regs = cdef->channels /
> +			cdef->enable_bits_per_led_control_register;
> +		int i;
> +
> +		for (i = 0; i < num_regs; i++) {

As above.

> +			ret = is31fl32xx_write(priv,
> +					       cdef->led_control_register_base+i,

As above.

> +					       value);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int is31fl32xx_software_shutdown(struct is31fl32xx_priv *priv,
>  					bool enable)
>  {
> @@ -345,24 +404,12 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
>  		return ret;
>
>  	/*
> -	 * Set enable bit for all channels.
> +	 * Enable all channels.
>  	 * We will control state with PWM registers alone.
>  	 */
> -	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
> -		u8 value =
> -		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> -		u8 num_regs = cdef->channels /
> -				cdef->enable_bits_per_led_control_register;
> -		int i;
> -
> -		for (i = 0; i < num_regs; i++) {
> -			ret = is31fl32xx_write(priv,
> -					       cdef->led_control_register_base+i,
> -					       value);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> +	ret = is31fl32xx_enable_all_channels(priv);
> +	if (ret)
> +		return ret;
>
>  	ret = is31fl32xx_software_shutdown(priv, false);
>  	if (ret)
> @@ -552,7 +599,22 @@ static const struct is31fl32xx_chipdef is31fl3293_cdef = {
>  	.sw_shutdown_func			= is31fl3293_software_shutdown,
>  };
>
> +static const struct is31fl32xx_chipdef is31fl3206_cdef = {
> +	.channels				= 12,
> +	.shutdown_reg				= 0x00,
> +	.pwm_update_reg			= 0x13,
> +	.global_control_reg			= 0x26,
> +	.reset_reg				= 0x2f,
> +	.output_frequency_setting_reg		= 0x27,
> +	.pwm_register_base			= 0x04,
> +	.led_control_register_base		= 0x17,
> +	.enable_bits_per_led_control_register	= 1,
> +	.brightness_steps			= 256,
> +	.enable_all_channels_func		= is31fl3206_enable_all_channels,
> +};
> +
>  static const struct of_device_id of_is31fl32xx_match[] = {
> +	{ .compatible = "issi,is31fl3206",  .data = &is31fl3206_cdef, },
>  	{ .compatible = "issi,is31fl3293",  .data = &is31fl3293_cdef, },
>  	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
>  	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
> @@ -616,6 +678,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
>   * even though it is not used for DeviceTree based instantiation.
>   */
>  static const struct i2c_device_id is31fl32xx_id[] = {
> +	{ .name = "is31fl3206" },
>  	{ .name = "is31fl3293" },
>  	{ .name = "is31fl3236" },
>  	{ .name = "is31fl3236a" },
>
> -- 
> 2.53.0
>

-- 
Lee Jones
