Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BFD376BF7;
	Tue, 13 Oct 2026 03:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862946; cv=none; b=dYnH2XOCOrnNYsjLHqntM94er2WiKRnWLkYktoEVhgednnr3cIekjaFh8feVZCUAWZGCwPzHk3mJZasDIzTxbDCX5dXw5abcvDrX2qG36ZGX2qhltavjVfVUF3jLcARHGQ2FCbNQGIh2A6eJWFuEQr88BLv7MkKHfYuSeoGpW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862946; c=relaxed/simple;
	bh=dHQeqNg/jRRi7oAwIw2mpx+CtG8LBt58jp86SX4jdDs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Kvd3R3jE7KOphLl9D3F1a+TppUVyNXi7eFB8wwWb9gUjFWhxGyz71iSA62Rbedo+xyKa3BSj7PgqI+15s9HgV8F6uhuKgntmIU0Z0eXmfSE+WcDQIFqG7IVt/Zo4QnOTV/lsC2crLsR/QgwliOAtVoA/7n3Ipo4MLfe/EVAYfoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqD1hkXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqD1hkXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8C61F00893;
	Tue, 13 Oct 2026 03:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791862945;
	bh=bowXWYi2tokdMtvLVOdZUjVGNBfCDjS17cJH5vRqC0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqD1hkXlnndg3tlKE/9dyuHRruou+MuwWTQh84ZlFBKUcgMLPI2ZXVfEcTmCAQkPe
	 8jaNQGcEn/REVO5RoaHkFvL6y6JqzMFhmI16B968h8wiySpehiNRJChIe0i64v52JL
	 fhgHMH4HadQALt79YADuwgf75CQ9yI5UxPQiy/WvLLn7/45bwxkASJrjfVI1Lq103O
	 u1na7MbFCM16QGIemyAx4L6RohPLg35cR1Qh0aVhBCcAhxvlRh0zfN+M/rIFvIICry
	 x0vuCv+B3b59R7CHPwpOEgfbG4tnIY6MpBN2ZtkmYxmYUPj7M5QdrwLn7SaSG+xWZ7
	 Rvp3diRzhAXbg==
Message-ID: <sashiko-outbox-168913@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>
References: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
 <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:42:24 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: Missing I2C device ID for is31fl3206 breaks legacy binding=
 and modaliases
- [Low] leds: Double I2C writes during initialization in is31fl32xx_enable_=
all_channels
--

commit 4f6d324bacf9d9547e9fba515fa86ec07e7ad36d
Author: Flavio Amieiro <flavio@amieiro.net>

leds: is31f132xx: Add support for is31fl3206

This commit adds support for the 12-channel IS31FL3206 variant to the
is31fl32xx led driver series. It introduces a custom enable sequence for the
new chip since its control register layout differs from existing variants.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 285085d274538..9c09548acabfa 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c

[ ... ]

> @@ -315,6 +342,33 @@ static int is31fl32xx_reset_regs(struct is31fl32xx_p=
riv *priv)
> +static int is31fl32xx_enable_all_channels(struct is31fl32xx_priv *priv)
> +{
> +	const struct is31fl32xx_chipdef *cdef =3D priv->cdef;
> +	int ret;
> +
> +	if (cdef->led_control_register_base !=3D IS31FL32XX_REG_NONE) {
> +		u8 value =3D
> +			GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> +		u8 num_regs =3D cdef->channels /
> +			cdef->enable_bits_per_led_control_register;
> +		int i;
> +
> +		for (i =3D 0; i < num_regs; i++) {
> +			ret =3D is31fl32xx_write(priv,
> +					       cdef->led_control_register_base+i,
> +					       value);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	if (cdef->enable_all_channels_func)
> +		return cdef->enable_all_channels_func(priv);

[Severity: Low]
Does this function perform redundant I2C writes during initialization?

Because the is31fl3206 variant defines a valid led_control_register_base
(0x17), the generic initialization loop executes first, writing 0x01 to the
12 registers.

Immediately following this loop, the custom callback is executed:

	if (cdef->enable_all_channels_func)
		return cdef->enable_all_channels_func(priv);

The custom callback is31fl3206_enable_all_channels() then loops over those
exact same 12 registers and overwrites them with the correct value (0x10).

Should the generic loop be placed in an else block, or should the custom
override function be called first and return early to avoid wasting bus
bandwidth and briefly configuring the chip with incorrect values?

> +
> +	return 0;
> +}

[ ... ]

> @@ -552,7 +594,22 @@ static const struct is31fl32xx_chipdef is31fl3293_cd=
ef =3D {
>  	.sw_shutdown_func			=3D is31fl3293_software_shutdown,
>  };
> =20
> +static const struct is31fl32xx_chipdef is31fl3206_cdef =3D {
> +	.channels				=3D 12,
> +	.shutdown_reg				=3D 0x00,
> +	.pwm_update_reg			=3D 0x13,
> +	.global_control_reg			=3D 0x26,
> +	.reset_reg				=3D 0x2f,
> +	.output_frequency_setting_reg		=3D 0x27,
> +	.pwm_register_base			=3D 0x04,
> +	.led_control_register_base		=3D 0x17,
> +	.enable_bits_per_led_control_register	=3D 1,
> +	.brightness_steps			=3D 256,
> +	.enable_all_channels_func		=3D is31fl3206_enable_all_channels,
> +};
> +
>  static const struct of_device_id of_is31fl32xx_match[] =3D {
> +	{ .compatible =3D "issi,is31fl3206",  .data =3D &is31fl3206_cdef, },

[Severity: Medium]
Is the new is31fl3206 variant missing from the i2c_device_id table?

While the device tree of_device_id table is updated here, the I2C device ID
array is31fl32xx_id does not appear to have a corresponding entry for
is31fl3206.

Could this prevent the driver from auto-loading on systems that rely on
legacy I2C modaliases, and prevent manual instantiation via the I2C
new_device sysfs interface?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-add-is31fl=
3206-support-v1-0-08c066cc241d@amieiro.net?part=3D2
