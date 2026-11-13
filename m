Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569207;
	b=rSHUqfdmtA/wZfju7A7/3LALXVfAKSbMxB8NFlItO8FcJNm9uDiULoKIvaxd2f0ArVQ9
	 8IrS5WeZlCjp8oUjtm3q7C/1PH/MFrXYoTfVlD9vosjo1Y1D02ezUDM7bA8BWGcjBP9oS
	 O8OYrOD0WVHi4cyqotHqUJ31Gl5RO9vaPI5X9AATgGnWW0AtxZNZyeHuS2OYAR1J/IDQH
	 /2XPWcWLm5peifqQxrjqyBGD4l3F1NfsRXz2n/zkgbrBIo9soJv8N69jb4hVwBryQFkbe
	 HUq7SyDvoJ1/n2Ee8yZNZDWRVZA29QJM6eKddxYETECA8TkGjPRgYqHxG744Mjw7aXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569207;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=geUCnLJl+TadYIbQKteS2dwwXhLkQiG5VM8jWF7kMsU=;
	b=e19lCnbNBqO/YJeIB3M4QiLch7YqoDUaJTzC2BADDYAKU+Trw+/pQUb+QoyTSXoXUafc
	 ZijaWhaTNEgd6BY9SCTb4Wt1f5uqb+UPZoGR8LrQO/9kopPRr49AN5jaBQtLhFMC5mf0Q
	 BZ39tyKueXAK53SKjgKevRtfIMxUwTBOv2oZuNnLR7v84wGpbuW47xTBr/Welqm9JpN8m
	 /6oefvr6SbiC1SgXBqYfcEQZ5HleG5ubp1hFtLEXdzYSXrIv2534xnRG1mqa01mE6JRlT
	 Ao/fi96rMxtAmunz4i922wlmSzFAdc1zp/Suuk67fEIItkHJwzv9DN7IJLsGyQwKqIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kal99QzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165CE606A31C;
	Fri, 13 Nov 2026 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kal99QzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D831F000C4;
	Fri, 13 Nov 2026 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794569206;
	bh=geUCnLJl+TadYIbQKteS2dwwXhLkQiG5VM8jWF7kMsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kal99QzIaLsgg6/FPoCvabsaE8/f0o9MhxN9OMrizQB0qN37Xku30Pp2cITWhHIAr
	 9gtObiGhlQVYkJeBoH985VgutLloiGUax5dz8fC92SiZ6+4uet3Xavwczd1It7ixOw
	 OJLPAB2F3WvDIdHzQ/l3Q7iwEeG6mqzPZ+gVpCadx41WLzoav5LYquj3rSnsDDmS+t
	 jeHJoTNl0oM2QU+LcoK7hz+pxE/IQ4MIhe/MQefai1rx1dPjM/KGO15c9sDKFw60xX
	 tTMF3KVRZ34zr+sJerE+j2S8DESk810C+ABtXQwABTXpwEfttPKmb5gJCZow+8TaAy
	 SuC1WYDbNXRjw==
Date: Fri, 13 Nov 2026 11:26:41 +0000
From: Lee Jones <lee@kernel.org>
To: Flavio Amieiro <flavio@amieiro.net>
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
Message-ID: <179370064610.793788.8239015594326628135@kernel.org>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
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
In-Reply-To: <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
X-AI-Review-Draft: <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>

--- checkpatch.pl (1 issue) ---
Line 83: WARNING: DT compatible string "issi,is31fl3206" appears un-documented -- check ./Documentation/devicetree/bindings/
----------------------------------

On Wed, 28 Oct 2026, Flavio Amieiro wrote:

> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control (in the lowest
> nibble).
>
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
>
> This commit adds support for this IC allowing the chipdef to define an
> offset for the enable bits inside the LED Control Register.
>
> The limitation that already existed for other variants is still in
> this one: all LEDs are enabled and set with maximum current, letting
> brightness be controlled by the PWM registers.
>
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
> ---
>  drivers/leds/leds-is31fl32xx.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> index 285085d27453..586713ff7d98 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -77,6 +77,7 @@ struct is31fl32xx_priv {
>   * @pwm_registers_reversed: : true if PWM registers count down instead of up
>   * @led_control_register_base : address of first LED control register (optional)
>   * @enable_bits_per_led_control_register: number of LEDs enable bits in each
> + * @enable_bits_offset_in_led_control_reg: offset of the enable bit in the LED Control Register
>   * @brightness_steps    : number of brightness steps supported by the chip
>   * @reset_func          : pointer to reset function
>   * @sw_shutdown_func    : pointer to software shutdown function
> @@ -88,6 +89,12 @@ struct is31fl32xx_priv {
>   * necessary registers to a known initialization state. This is needed
>   * for chips that do not have a @reset_reg.
>   *
> + * @enable_bit_offset_in_led_control_reg determines the offset of the
> + * enable bits from the least significant bit of the LED control

Make sure you run W=1, particularly when changing Kerneldoc.

> + * register. This is needed for chips that have a LED Control Register
> + * that control more than simply the enable/disable state of the
> + * channel such as the IS31FL3206.
> + *
>   * @enable_bits_per_led_control_register must be >=1 if
>   * @led_control_register_base != %IS31FL32XX_REG_NONE.
>   */
> @@ -103,6 +110,7 @@ struct is31fl32xx_chipdef {
>  	bool	pwm_registers_reversed;
>  	u8	led_control_register_base;
>  	u8	enable_bits_per_led_control_register;
> +	u8	enable_bits_offset_in_led_control_reg;
>  	u16	brightness_steps;
>  	int (*reset_func)(struct is31fl32xx_priv *priv);
>  	int (*sw_shutdown_func)(struct is31fl32xx_priv *priv, bool enable);
> @@ -351,6 +359,7 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
>  	if (cdef->led_control_register_base != IS31FL32XX_REG_NONE) {
>  		u8 value =
>  		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);

Feel free to unwrap this - you can use up to 100-chars to avoid this.

> +		value = value << cdef->enable_bits_offset_in_led_control_reg;

Could we avoid mixing declarations and statements here?

Also, instead of shifting afterwards, could we just pass the offset
directly to 'GENMASK()', or use '<<='?

>  		u8 num_regs = cdef->channels /
>  				cdef->enable_bits_per_led_control_register;
>  		int i;
> @@ -552,7 +561,22 @@ static const struct is31fl32xx_chipdef is31fl3293_cdef = {
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
> +	.enable_bits_offset_in_led_control_reg	= 4,
> +	.brightness_steps			= 256,
> +};
> +
>  static const struct of_device_id of_is31fl32xx_match[] = {
> +	{ .compatible = "issi,is31fl3206",  .data = &is31fl3206_cdef, },
>  	{ .compatible = "issi,is31fl3293",  .data = &is31fl3293_cdef, },
>  	{ .compatible = "issi,is31fl3236",  .data = &is31fl3236_cdef, },
>  	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
> @@ -616,6 +640,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
>   * even though it is not used for DeviceTree based instantiation.
>   */
>  static const struct i2c_device_id is31fl32xx_id[] = {
> +	{ .name = "is31fl3206" },

Looks like this is going to need rebasing on -next to apply.

>  	{ .name = "is31fl3293" },
>  	{ .name = "is31fl3236" },
>  	{ .name = "is31fl3236a" },
>
> -- 
> 2.53.0
>

-- 
Lee Jones
