Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA737CD40;
	Tue, 13 Oct 2026 03:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862925; cv=none; b=spQ7PPKdgNwmhnpDL4zhwJgtyb+LOtDZ0UxD8mdszlvRjLsPNFFrd/EjtiWwf/DD4ZWjVpInxctfFu/7JFzt/m5cYYRm9XA7b0WVR2HPz/PsD6QAiIjzLt8qbJWjpmSA/wYn7BdQFB34nvAXW7QwuS0KfdAXeHtrnFWaDKwcoSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862925; c=relaxed/simple;
	bh=LgqZ2r/2M4U9cdgg84ni2Lkez1AJ3jOC2ynvvPA/G40=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i7kt+s1BoBWINFGf93ULh1ylLzIIAfgk8eItuJYns/3DRWjVTHQGWDhUU5YN/yePE6Acp64wXrSNPIIpRZB9ZmYQKmPHoMVxBewiv5NImGGATSTRzVdtKhThgb+8j/KQ8xCTflrmu3pr62F93/nGHQfA6mXUJndk0ibbfvZL/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbQGNknb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbQGNknb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCCD1F000FF;
	Tue, 13 Oct 2026 03:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791862924;
	bh=TMpqeSpJpMq25eQazLVdcuUaoKDVQ9KiyQ/0JfXj4kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fbQGNknbHreW0ikjeEcLtGpZbSjdvYJ9TRvUfDFrUYfcH5Xsp8wXGQV4v6j+3mCvw
	 ZXW0wr30iZTBmGZvQ5r3koVr334sVOacFHPuhI2nISWC/2G7Ns8lC0jf+FuACDyZ7V
	 /iDKwXuP0ibeY5+46dLxrYYBtKPZpToDX9wACwvfhYJ3Hugbf9sh1vZf1dTEHdO+a8
	 OqPI0QJNug7JWMhUZziz8M4wDEOI7QK9Gxen8hUAR3u75VlmRYJwwv6+RpyXqY/+xz
	 wHSOPQplOValWLal9vBRwX1TB0HzAaCkdi2c2sZshf9pcN9psjZuRWXPBBaIEOnAF+
	 E1SUCBYw60exQ==
Message-ID: <sashiko-outbox-168912@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: is31f132xx: Add support for is31fl3206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261013-add-is31fl3206-support-v1-1-08c066cc241d@amieiro.net>
References: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
 <20261013-add-is31fl3206-support-v1-1-08c066cc241d@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:42:03 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: Double execution of LED control register initialization
- [Medium] leds: Missing is31fl3206 entry in legacy i2c_device_id table
--

commit 4f6d324bacf9d9547e9fba515fa86ec07e7ad36d
Author: Flavio Amieiro <flavio@amieiro.net>

leds: is31f132xx: Add support for is31fl3206

This patch adds support for the IS31FL3206 variant to the is31fl32xx LED
driver. It introduces a custom function to enable all channels since this
chip uses a different LED control register layout.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 285085d274538..9c09548acabfa 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c

[ ... ]

> @@ -315,6 +342,33 @@ static int is31fl32xx_reset_regs(struct is31fl32xx_p=
riv *priv)
>  	return 0;
>  }
> =20
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

[Severity: Medium]
Since is31fl3206_cdef sets both led_control_register_base and
enable_all_channels_func, won't this generic loop write 0x01 to all 12 cont=
rol
registers first?

Because there is no early return or else branch here, won't it fall through=
 and
call the custom enable_all_channels_func, which writes 0x10 to the exact sa=
me
registers again?

Does this double-write waste I2C bandwidth during probe/resume and briefly
leave the hardware in an unintended state?

> +
> +	return 0;
> +}
> =20

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
>  	{ .compatible =3D "issi,is31fl3293",  .data =3D &is31fl3293_cdef, },
>  	{ .compatible =3D "issi,is31fl3236",  .data =3D &is31fl3236_cdef, },

[Severity: Medium]
This adds the "issi,is31fl3206" string to the of_device_id match table, but
shouldn't a corresponding "is31fl3206" entry also be added to the is31fl32x=
x_id
array (the i2c_device_id table) further down in the file?

Does omitting this entry break driver auto-loading via I2C modalias and
sysfs-based device instantiation on non-DT platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-add-is31fl=
3206-support-v1-0-08c066cc241d@amieiro.net?part=3D1
