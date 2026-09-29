Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099BB47ECC2;
	Tue, 29 Sep 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676817; cv=none; b=gILiU0VTWAxGF7dpLR8YgojEJPTvwCDMQtWD2CIZr2iiNxfJAc7IKPhwUh5vrRc2wRlUgUxPwLR3L6ZCEVkLHyphLCKYZrOr2zmDOxaN6NaGNBriztmlihPWEkKt5lORJEmVshmF5RmmgQqEKcLIbk+0aUzxhGAPJYzMeywufZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676817; c=relaxed/simple;
	bh=imsng58a+/4gTFCbL/rJKuCvk9AThAC9CqAN6MHYNas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAqb3AQlD5idrjKw6Rigzv9OMN7KOtrdcifNl2KM4LC7EEnIXpSMKjJHBLdz/j7cLAC2DJca3PJJsbXTtPlRYBpx9yeTg1BpcBIr/gfzOQpZbAIvWpl3uI/uCrdhFtPmx+iUTRwXfWsDHk/abAy8MSdI7Yeex+g+L27WlzkZX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3g+Jowu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3g+Jowu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82CD1F000FF;
	Tue, 29 Sep 2026 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790676802;
	bh=Uo2Ng6wtWC0FkzjabJoP2mHrzpD5Juo3eVHvrvGVevw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q3g+Jowu0wDH6Y3ReObcsj+O43By1MZHmxCP0MufflC6uxWFhhh1e3uslXwpRF4l7
	 HEkMzzFScSwR6H1KmCq0ylyvPr+QWyTnhfOesJJs/8KPPV8woZCLTP1FHebW6hU4vZ
	 dMKxXJUXyPFQ9VHvgnisQEISn/VGMHcfIz446VduYfEiW7yN2qA6M2Hnur5OM8pPj5
	 ZQq+zwKobLnFURZGKeV9pYI73LH9LrGgzKxqAVSAtEyt15Rw24gCQvM+yGEcoADxmZ
	 7WrMdoGuOPyi4VRk92G+0L4ejAS7CooJMfyQdRnOVXm5762ySRG8csv8qwA2/JDDhb
	 +oQuApHTYKZDg==
Date: Tue, 29 Sep 2026 11:13:17 +0100
From: Lee Jones <lee@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] leds: pca995x: Add support for group brightness
 control
Message-ID: <179025020617.457255.2187144572484405270@kernel.org>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <391973ce0168438612861bfe8570b6890af0f44e.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <391973ce0168438612861bfe8570b6890af0f44e.1790087890.git.nora.schiffer@ew.tq-group.com>
X-AI-Review-Draft: <391973ce0168438612861bfe8570b6890af0f44e.1790087890.git.nora.schiffer@ew.tq-group.com>

--- checkpatch.pl: clean (0 issues) ---

On Tue, 22 Sep 2026, Nora Schiffer wrote:

> When LEDs are set to PWM mode with group control enabled, their
> brightness can control using a global "group PWM" setting, modulating
> the individual LEDs' brightness with a second PWM running at a different
> frequency. This lowers the minimum duty cycle from 1/256 to 1/65536
> (averaged over the modulated signal). Group brightness control is
> particularly useful to adjust for different levels of ambient light.
>
> For simplicity, group PWM mode is always enabled, with the reset default
> of 255 as group brightness. This reduces the effective duty cycle by
> 1/256 at all individual brightness levels (the individual PWM signals
> are modulated with the 255/256 duty cycle group PWM), which should be
> imperceptible.
>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/leds/leds-pca995x.c | 46 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 61d2581b976ce..d6438b576b186 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -35,6 +35,7 @@
>  #define PCA995X_LED_OFF			0x0
>  #define PCA995X_LED_ON			0x1
>  #define PCA995X_LED_PWM_MODE		0x2
> +#define PCA995X_LED_PWM_MODE_GRP	0x3
>  #define PCA995X_LDRX_MASK		0x3
>  #define PCA995X_LDRX_BITS		2
>
> @@ -52,6 +53,7 @@
>  struct pca995x_chipdef {
>  	unsigned int num_leds;
>  	u8 pwm_base;
> +	u8 grppwm;
>  	u8 irefall;
>  	u8 eflag_base;
>  };
> @@ -59,6 +61,7 @@ struct pca995x_chipdef {
>  static const struct pca995x_chipdef pca9952_chipdef = {
>  	.num_leds	= 16,
>  	.pwm_base	= 0x0a,
> +	.grppwm		= 0x08,
>  	.irefall	= 0x43,
>  	.eflag_base	= 0x44,
>  };
> @@ -66,6 +69,7 @@ static const struct pca995x_chipdef pca9952_chipdef = {
>  static const struct pca995x_chipdef pca9955b_chipdef = {
>  	.num_leds	= 16,
>  	.pwm_base	= 0x08,
> +	.grppwm		= 0x06,
>  	.irefall	= 0x45,
>  	.eflag_base	= 0x46,
>  };
> @@ -73,6 +77,7 @@ static const struct pca995x_chipdef pca9955b_chipdef = {
>  static const struct pca995x_chipdef pca9956b_chipdef = {
>  	.num_leds	= 24,
>  	.pwm_base	= 0x0a,
> +	.grppwm		= 0x08,
>  	.irefall	= 0x40,
>  	.eflag_base	= 0x41,
>  };
> @@ -114,11 +119,10 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
>
>  	/*
>  	 * Change LDRx configuration to individual brightness via PWM.
> -	 * LED will stop blinking if it's doing so.
>  	 */
>  	return regmap_update_bits(chip->regmap, ledout_addr,
>  				  PCA995X_LDRX_MASK << shift,
> -				  PCA995X_LED_PWM_MODE << shift);
> +				  PCA995X_LED_PWM_MODE_GRP << shift);

If we use group PWM mode to scale brightness, what happens when 'brightness' is
'LED_FULL'?  The 'switch' statement above sets 'PCA995X_LED_ON', which typically
bypasses PWM entirely.  Won't this cause an LED set to 255 to ignore the group
brightness and be fully on, while an LED at 254 is scaled down?

>  }
>
>  static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf)
> @@ -190,10 +194,41 @@ static ssize_t has_errors_store(struct device *dev, struct device_attribute *att
>  	return ret ?: count;
>  }
>
> +static ssize_t group_brightness_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));

'dev_get_drvdata(dev)' again?

> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap, chip->chipdef->grppwm, &val);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static ssize_t group_brightness_store(struct device *dev, struct device_attribute *attr,
> +				       const char *buf, size_t count)
> +{
> +	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));
> +	u8 val;
> +	int ret;
> +
> +	ret = kstrtou8(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(chip->regmap, chip->chipdef->grppwm, val);
> +
> +	return ret ?: count;
> +}
> +
>  static DEVICE_ATTR_RW(has_errors);
> +static DEVICE_ATTR_RW(group_brightness);
>
>  static struct attribute *pca995x_attrs[] = {
>  	&dev_attr_has_errors.attr,
> +	&dev_attr_group_brightness.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(pca995x);
> @@ -270,11 +305,16 @@ static int pca995x_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_put_nodes;
>
> -	/* Clear errors on probe */
> +	/* Clear errors on probe, use GRPPWM register for group brightness control */
>  	ret = regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
>  	if (ret)
>  		goto err_put_nodes;
>
> +	/* Full group brightness */
> +	ret = regmap_write(chip->regmap, chipdef->grppwm, U8_MAX);
> +	if (ret)
> +		goto err_put_nodes;
> +
>  	/* IREF Output current value for all LEDn outputs */
>  	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
>  	if (ret)
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
>

-- 
Lee Jones
