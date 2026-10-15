Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84CE3E3170;
	Thu, 15 Oct 2026 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079288; cv=none; b=eHLSLtUqQW7RXmLrHlyms/Ob2cEKG03Sn9Py2qlJztTM4AiFC+W5/uuo6HGIice4HB6s+VkZDVs6Ou3rLEpZDMA1yixwBhpdKtfiNiCOBF25gLeHl8UL/9s/p74l1mbiF13cMnx1/XxjQUz/11JMn+nvnk3Xb908h4kSrFRBkuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079288; c=relaxed/simple;
	bh=KLUY8dL35IhdVIH3PWjrPrVUXD/a//dX3Jxp0VsU3Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfuYzj6aSUiTPqDogx2eZodTY3qzpJG0GM3RqFmkNRN2nCz8XIMHOJcy99VRzysPPuMJy3i/n6bIJyBBJFwiiMMGrb7zU1VbM0Ukr940jdEStgboALjFJN7loy6Z07Te+na665MindN2GlwqroVIgHhwDkHncqO7ZvCw3N7N+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrPMHN6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrPMHN6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1B91F000C4;
	Thu, 15 Oct 2026 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079274;
	bh=dP0qdNl6DzZgA1oCybzgMWhUKBRrzwDH62fU+ZHZ8l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrPMHN6NLyW6KL1LfSNx3K68LHINsN5poboQB6X7sFr/icDLbJPBAMJCFajCIi3Gl
	 J1jGCCyqs0aTs5RdMRn6nrmVeNPsUYMU9Nto14emHPG03Da3XFGBt+HKsgZVK0WLdP
	 g3l4GhXRAz8aEXItl9na9cvrKQMigMMwj4pMt0bNZy/l05+cV2cvTohda95yEA8TwC
	 +07Uxg6M0VQB9OLVUX1o917P5csdmFv+khfdnXlQk4rf7zM6ndknOllNI82/7s8AId
	 wdI/bcY/FcQlG0JxW8IxCtC6jOfP1OCZoYV02u2S05D1gEiEZQzdPXMi4WbzUrlsha
	 N5n0NGNQJ++sg==
Date: Thu, 15 Oct 2026 16:47:48 +0100
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
Subject: Re: [PATCH v5 09/11] leds: pca995x: Add sysfs files for error
 reporting
Message-ID: <179198432570.839288.16507714780245784283@kernel.org>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <5ec0d621cc430d730e51845d4aafb1c2be166fbc.1791207391.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ec0d621cc430d730e51845d4aafb1c2be166fbc.1791207391.git.nora.schiffer@ew.tq-group.com>
X-AI-Review-Draft: <5ec0d621cc430d730e51845d4aafb1c2be166fbc.1791207391.git.nora.schiffer@ew.tq-group.com>

On Mon, 05 Oct 2026, Nora Schiffer wrote:

> The PCA9955B/PCA9956B have builtin failure detection. Provide sysfs files
> for individual LED status (reporting "okay", "short-circuit" or
> "open-circuit") as well as a global "has_errors" flag. has_errors is
> sticky and must be cleared by writing "clear" to the sysfs file.
>
> Failure detection on the PCA9952/PCA9955 (without "B") works differently
> and is currently unsupported.
>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/leds/leds-pca995x.c | 112 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 108 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 3d6053625b1c9..359803d0030fb 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -8,6 +8,7 @@
>   * Copyright 2023 Marek Vasut
>   */
>
> +#include <linux/bits.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -24,6 +25,9 @@
>  /* Auto-increment disabled. Normal mode */
>  #define PCA995X_MODE1_CFG		0x00
>
> +#define PCA995X_MODE2_CLRERR		BIT(4)
> +#define PCA995X_MODE2_ERROR		BIT(6)
> +
>  /* LED select registers determine the source that drives LED outputs */
>  #define PCA995X_LED_OFF			0x0
>  #define PCA995X_LED_ON			0x1
> @@ -37,19 +41,37 @@
>  #define PCA995X_IREFALL_FULL_CFG	0xFF
>  #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
>
> +#define PCA995X_EFLAG_UNSUPPORTED	U8_MAX
> +
> +#define PCA995X_EFLAG_BITS		2
> +#define PCA995X_EFLAG_MASK		GENMASK(1, 0)
> +
>  #define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
>
>  struct pca995x_chipdef {
>  	unsigned int num_leds;
>  	u8 pwm_base;
>  	u8 irefall;
> +	u8 eflag_base;
>  	u8 mode2_cfg;
> +	const struct attribute_group **attr_groups;
>  };
>
> +static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf);

Please avoid forward declaring functions.

Shuffle things around so that it is not required.

> +
> +static DEVICE_ATTR_RO(status);
> +
> +static struct attribute *pca995x_led_error_attrs[] = {
> +	&dev_attr_status.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(pca995x_led_error);

Are these documented as per the guidance?

> +
>  static const struct pca995x_chipdef pca9952_chipdef = {
>  	.num_leds	= 16,
>  	.pwm_base	= 0x0a,
>  	.irefall	= 0x43,
> +	.eflag_base	= PCA995X_EFLAG_UNSUPPORTED,
>  	/* Reset default */
>  	.mode2_cfg	= 0x05,
>  };
> @@ -58,16 +80,20 @@ static const struct pca995x_chipdef pca9955b_chipdef = {
>  	.num_leds	= 16,
>  	.pwm_base	= 0x08,
>  	.irefall	= 0x45,
> -	/* Reset default */
> -	.mode2_cfg	= 0x01,
> +	.eflag_base	= 0x46,
> +	/* Reset default + clear errors on probe */
> +	.mode2_cfg	= 0x01 | PCA995X_MODE2_CLRERR,
> +	.attr_groups	= pca995x_led_error_groups,
>  };
>
>  static const struct pca995x_chipdef pca9956b_chipdef = {
>  	.num_leds	= 24,
>  	.pwm_base	= 0x0a,
>  	.irefall	= 0x40,
> -	/* Reset default */
> -	.mode2_cfg	= 0x05,
> +	.eflag_base	= 0x41,
> +	/* Reset default + clear errors on probe */
> +	.mode2_cfg	= 0x05 | PCA995X_MODE2_CLRERR,
> +	.attr_groups	= pca995x_led_error_groups,
>  };
>
>  struct pca995x_led {
> @@ -119,6 +145,77 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
>  	}
>  }
>
> +static ssize_t status_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct pca995x_led *led = ldev_to_led(led_cdev);
> +	struct pca995x_chip *chip = led->chip;
> +	const struct pca995x_chipdef *chipdef = chip->chipdef;
> +	const char *status = "unknown";
> +	unsigned int val;
> +	int shift, ret;
> +	u8 reg;
> +
> +	reg = chipdef->eflag_base + (led->led_no / PCA995X_OUTPUTS_PER_REG);
> +	shift = PCA995X_EFLAG_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG);
> +
> +	ret = regmap_read(chip->regmap, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	switch ((val >> shift) & PCA995X_EFLAG_MASK) {
> +	case 0:
> +		status = "okay";
> +		break;
> +	case 1:
> +		status = "short-circuit";
> +		break;
> +	case 2:
> +		status = "open-circuit";
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", status);
> +}
> +
> +static ssize_t has_errors_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pca995x_chip *chip = dev_get_drvdata(dev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap, PCA995X_MODE2, &val);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", !!(val & PCA995X_MODE2_ERROR));
> +}
> +
> +static ssize_t has_errors_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct pca995x_chip *chip = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!sysfs_streq(buf, "clear"))
> +		return -EINVAL;
> +
> +	ret = regmap_update_bits(chip->regmap, PCA995X_MODE2,
> +				 PCA995X_MODE2_CLRERR, PCA995X_MODE2_CLRERR);
> +
> +	return ret ?: count;
> +}
> +
> +static DEVICE_ATTR_RW(has_errors);
> +
> +static struct attribute *pca995x_error_attrs[] = {
> +	&dev_attr_has_errors.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group pca995x_error_group = {
> +	.attrs = pca995x_error_attrs,
> +};
> +
>  static const struct regmap_config pca995x_regmap = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -185,6 +282,7 @@ static int pca995x_probe(struct i2c_client *client)
>  		led->led_no = reg;
>  		led->ldev.brightness_set_blocking = pca995x_brightness_set;
>  		led->ldev.max_brightness = 255;
> +		led->ldev.groups = chipdef->attr_groups;
>  	}
>
>  	/* Disable LED all-call address and set normal mode */
> @@ -202,6 +300,12 @@ static int pca995x_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_put_nodes;
>
> +	if (chipdef->eflag_base != PCA995X_EFLAG_UNSUPPORTED) {
> +		ret = devm_device_add_group(dev, &pca995x_error_group);
> +		if (ret)
> +			goto err_put_nodes;
> +	}
> +
>  	for (i = 0; i < chipdef->num_leds; i++) {
>  		struct led_init_data init_data = {};
>
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
>

-- 
Lee Jones
