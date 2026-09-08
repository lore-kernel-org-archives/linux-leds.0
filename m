Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ECA1397;
	Tue,  8 Sep 2026 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788825690; cv=none; b=NOiaW0I3SmOpj/EQKrtNTmzTHqV2qyhe9bue3cHl17q8Yi+EpYyGkQXZxuA/vI1U+r91Yws/de9agbfZ0OtBl4wighERV0NOsVQRRf9+ZAMXRI34oJODljfLlXg1b8fPqzfSqCINSgNnwqqpbDwEHtscMGBfyLq1u53cw79vC0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788825690; c=relaxed/simple;
	bh=LpRSzKju3wvOkP4aTVCIbg8qjGbWaWBnmQSr6DLyHLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DIGHguUDeNQS4/lHV5NOIPN1+RLHBMX5X9Tv10ibnbXStd27YATpkvMqUOFmWMUx3b4AVEgN4BGg8dG2VDvsIz9peqFUkABbY20zl4zRHRWMyBxcaFebG1Yg2tbdxsDVhzogstAEexMnGEeh2UJ6cdNCzVueoTXB81mx824DClc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/J+54rR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/J+54rR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92201F00A3A;
	Tue,  8 Sep 2026 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788825689;
	bh=7CK/bew23iFxP1Jock3FHwNqbz8VgUHUgKDrtJuWtRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C/J+54rRpgIUAtasdCAQKt8R0YNlOgaj50Xx6It913erSjPgwQQ/04e/dpYSF38OI
	 PGRMJ3YXcBgOUUYMCsnFR5T1NCPLVNcNVelsmrVu8/UTGE0MBlKEpnGkJ8TjVUBUiF
	 TlkK27p20d6Pubn4Klk0n2yJnXrKTITvlfEOhPHeHSxZV4YYqoJZJs7qvlG5RnGU9E
	 w1nySW6haMWNHT5Ir9kZ1sul8Fp17q0CQYb/Jh77l6rNm0YhMmY5tyxxNmxqyl6+BA
	 nZ+Kog6/qKLi8svUUMEnWkE9+g1TctSlDL+Pi3qmn7rrikJaBJpuSKXCCeLI+1Fv9b
	 fdq4jP1hHLH4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/3] leds: aw2013: Add AW2027 support and rename to
 aw20xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-3-c9a7df12a701@postmarketos.org>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
 <20260907-aw2013-aw20xx-rename-v1-3-c9a7df12a701@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 00:01:28 +0000
Message-Id: <20260908000128.B92201F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check for the result of `device_get_match_data()`, wh=
ich leads to a kernel oops during manual sysfs driver binding.
- [Medium] The return value from `regmap_update_bits()` for configuring the=
 global IMAX register is ignored and overwritten.
- [Medium] Incorrect default current configuration for AW2027 assigns a glo=
bal register enum to a local scale, leading to 0mA output.
- [Low] The inline function `aw20xx_microamp_to_imax` lacks the `static` ke=
yword, creating a non-static inline definition that causes linker errors or=
 compiler warnings.
- [Low] Struct initialization uses a non-constant expression at file scope,=
 causing a hard compiler error.

Pre-existing issues:
- [High] Self-deadlock in `aw20xx_probe()` due to holding `chip->mutex` dur=
ing LED registration.
- [High] Late assignment of `chip->num_leds` breaks initialization during p=
robe and causes unbalanced regulator disables.
- [Low] Failure to use dev_err_probe() for regulator requests violates LED =
subsystem guidelines.
--

commit 66ff1fb4c5655ece202f9cdb3c5a3a75b313c787
Author: Paul Sajna <sajattack@postmarketos.org>
Subject: leds: aw2013: Add AW2027 support and rename to aw20xx

This commit adds support for the AW2027 LED driver by renaming the existing
AW2013 driver to aw20xx and abstracting chip-specific features. It introduc=
es
a common chipdef structure to handle differences in maximum current, current
mixing levels, and initialization registers.

> diff --git a/drivers/leds/leds-aw20xx.c b/drivers/leds/leds-aw20xx.c
> index 216755d6010fe..635965b712d48 100644
> --- a/drivers/leds/leds-aw20xx.c
> +++ b/drivers/leds/leds-aw20xx.c

[ ... ]

> +/* finds the closest current step to the given microamp
> + * given the max current and number of levels
> + */
> +inline u32 aw20xx_microamp_to_imax(u32 microamp, const struct aw20xx_chi=
pdef *cdef)
> +{
> +	return min_t(u32, ((microamp * (cdef->current_levels - 1))
> +			  + (cdef->current_max / 2)) / cdef->current_max,
> +		     cdef->current_levels - 1);
> +}

[Severity: Low]
Does this inline function need the static keyword? When compiling with C99/=
C11
standards, an inline function without static might require an external
definition, which could lead to build failures or linker errors.

[ ... ]

> +static const struct aw20xx_chipdef aw2013_chipdef =3D {
> +	.chip_id =3D AW2013_RSTR_CHIP_ID,
> +	.regmap_cfg =3D aw2013_regmap_config,
> +	.default_imax =3D 0b01, // 5mA
> +	.gcr2_imax =3D false,
> +	.current_levels =3D 4,
> +	.current_max =3D 15000,
> +};
> +
> +static const struct aw20xx_chipdef aw2027_chipdef =3D {
> +	.chip_id =3D AW2027_RSTR_CHIP_ID,
> +	.regmap_cfg =3D aw2027_regmap_config,

[Severity: Low]
Does this cause a compiler error due to non-constant initialization? Using
the global variable aw2013_regmap_config to initialize this struct by value
at file scope is not a constant expression in standard C. The same applies
below for aw2027_regmap_config.

> +	.default_imax =3D AW2027_IMAX_15MA,

[Severity: Medium]
Does this assign a global register enum to a property used for the LCFG loc=
al
current step? AW2027_IMAX_15MA expands to 0. Writing 0 to the 16-level local
current scale (AW20XX_LCFG_CUR_MASK) configures the LED for 0mA instead of
15mA if the led-max-microamp devicetree property is missing.

[ ... ]

> +	if (chip->cdef->gcr2_imax) {
> +		/* AW2027 supports 4-step global imax, and also a 16-step control for =
limiting
> +		 * individual current per LED. This doesn't map to the single value the
> +		 * devicetree provides super well, so set global imax  to maximum, and
> +		 * local imax to whatever gets us closest to the value in the devicetr=
ee
> +		 */
>  		ret =3D regmap_update_bits(chip->regmap,
> -					 AW2013_LCFG(chip->leds[i].num),
> -					 AW2013_LCFG_IMAX_MASK,
> -					 chip->leds[i].imax);
> -		if (ret) {
> -			dev_err(&chip->client->dev,
> -				"Failed to set maximum current for led %d: %d\n",
> -				chip->leds[i].num, ret);
> -			return ret;
> +				AW20XX_GCR2,
> +				AW20XX_IMAX_MASK,
> +				AW2027_IMAX_30MA);
> +
> +		for (i =3D 0; i < chip->num_leds; i++) {
> +			ret =3D regmap_update_bits(chip->regmap,

[Severity: Medium]
Is the return value for the global IMAX register update intentionally ignor=
ed?
The ret variable is immediately overwritten by the loop, meaning any hardwa=
re
I2C errors during AW20XX_GCR2 configuration will not be caught.

[ ... ]

> -		led->cdev.brightness_set_blocking =3D aw2013_brightness_set;
> -		led->cdev.blink_set =3D aw2013_blink_set;
> +		led->cdev.brightness_set_blocking =3D aw20xx_brightness_set;
> +		led->cdev.blink_set =3D aw20xx_blink_set;
> =20
>  		ret =3D devm_led_classdev_register_ext(&chip->client->dev,
>  						     &led->cdev, &init_data);

[Severity: High]
This is a pre-existing issue, but does assigning chip->num_leds after
registering the LED class devices cause initialization problems?
Looking at aw20xx_probe_dt(), chip->num_leds is set to i after the loop
completes. However, devm_led_classdev_register_ext() executes default trigg=
ers
synchronously, which call aw20xx_brightness_set(). If num_leds is still 0,
aw20xx_chip_in_use() silently returns false, skipping chip enablement and
causing unbalanced regulator disables while probe is still running.

[ ... ]

>  static int aw20xx_probe(struct i2c_client *client)
>  {
> -	struct aw2013 *chip;
> +	struct aw20xx *chip;
> +	const struct aw20xx_chipdef *cdef;
>  	int ret;
>  	unsigned int chipid;
> =20
> +	cdef =3D device_get_match_data(&client->dev);
> +

[Severity: High]
Does this need a NULL check? If a user with privileges manually binds the
driver to an I2C device via sysfs, device_get_match_data() will return NULL,
causing a kernel oops when it is later dereferenced.

[ ... ]

>  	mutex_lock(&chip->mutex);
> =20
>  	chip->client =3D client;
> +	chip->cdef =3D cdef;
>  	i2c_set_clientdata(client, chip);
> =20
> -	chip->regmap =3D devm_regmap_init_i2c(client, &aw2013_regmap_config);
> +	chip->regmap =3D devm_regmap_init_i2c(client, &chip->cdef->regmap_cfg);

[Severity: High]
This is a pre-existing issue, but does holding chip->mutex here cause a
self-deadlock during probe? Later in the probe path, aw20xx_probe_dt() calls
devm_led_classdev_register_ext(). If a default trigger is configured, it
synchronously calls aw20xx_brightness_set() which attempts to acquire the
same chip->mutex lock.

[ ... ]

>  	}
> =20
>  	ret =3D regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
> -				    chip->regulators);
> +					chip->regulators);
>  	if (ret) {

[Severity: Low]
This is a pre-existing issue, but does the regulator request code earlier
in aw20xx_probe() violate the LED subsystem guidelines? It uses manual
ret !=3D -EPROBE_DEFER checks and dev_err() instead of dev_err_probe(), whi=
ch
is required to correctly handle deferred probes and clean up the kernel log.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-aw2013-aw2=
0xx-rename-v1-0-c9a7df12a701@postmarketos.org?part=3D3
