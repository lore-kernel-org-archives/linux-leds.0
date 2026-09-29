Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247250B8B4;
	Tue, 29 Sep 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676744; cv=none; b=nQsTRJb2Tv075kX5JsQ8dSogusIjAn4u/SXafMYVDgN9N7yuNOzvjK0NXCatXuI/H0bRiLqgQFCkOhBCHrBsy6LpHxNaB6J6K1IyaxHPRiSpyKVIfj7G6rtURyJlcw6s96+OZcHkBBeLIjQiZMVjxYLIl8skLsjN75VtpNimIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676744; c=relaxed/simple;
	bh=ioaMLeF6q2PatiRAthuS+ZRGJ7hPCF0//N/P4Q2M6Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZxm/Z1sxdFm20mfgIQCiMPNv/hOWVDt+RXgLovC3vWwdNMWM5cLylPCEabwzGUFOoKi5Grjwih9Xn4Ba8nDNzxBvbTLtrHPCzbl9IoYOdd4Hr1ji16RPXVxmQBKTEsHQgvKDcjnU8sybUT7/Wlayg4p0N316X4v/YcdmLNWUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzKh09EG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzKh09EG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E1A1F00893;
	Tue, 29 Sep 2026 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790676729;
	bh=/4CvABZnKbbe9C5npHYR1hapNjew8smn4EPxCxSMgKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SzKh09EGyFuPVUtJYdmPRecilz+i8QOrQ9ikbbB3EYuqEZIBiSZ+ymjB+2yA4d2wK
	 XGnideKKeTdZhuZEflJlrfpuE7NKS3LfIUyKFmmNraW4KEHLtj8LtTXdIZ18osQ9C8
	 otptqdSzvHWVefcBRN0C+XIzteNaMyKUHAOtabG0A2lRn9EQLGzvckBkrtqF2E1TbI
	 bkE/Os+/jvgsW7XtK4DZr6SgR2pzmiPnO65iNdjUjjUGY4j/oqNcrP9dRvnu/J2jfD
	 7LjMlO/IJ9rx8rAVCB5fNnfhQFc2YeXKTIz+tNCMCntqP4KeMzI+8E66QgWGEz/MUW
	 DFYSoz4xgPlcA==
Date: Tue, 29 Sep 2026 11:12:04 +0100
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
Subject: Re: [PATCH v3 08/10] leds: pca995x: Add sysfs files for error
 reporting
Message-ID: <179025018163.457255.7741092289370888752@kernel.org>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>
X-AI-Review-Draft: <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>

On Tue, 22 Sep 2026, Nora Schiffer wrote:

> The PCA995x has builtin failure detection. Provide sysfs files for
> individual LED status (reporting "okay", "short-circuit" or
> "open-circuit") as well as a global "has_errors" flag. has_errors is
> sticky and must be cleared by writing "clear" to the sysfs file.
>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/leds/leds-pca995x.c | 112 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 13cce0c3fdc19..57b5d2d6e035d 100644
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
> @@ -24,6 +25,12 @@
>  /* Auto-increment disabled. Normal mode */
>  #define PCA995X_MODE1_CFG		0x00
>
> +#define PCA995X_MODE2_CLRERR		BIT(4)
> +#define PCA995X_MODE2_ERROR		BIT(6)
> +
> +/* Clear errors on probe, group brightness control, linear adjustment */
> +#define PCA995X_MODE2_CFG		PCA995X_MODE2_CLRERR
> +
>  /* LED select registers determine the source that drives LED outputs */
>  #define PCA995X_LED_OFF			0x0
>  #define PCA995X_LED_ON			0x1
> @@ -37,30 +44,37 @@
>  #define PCA995X_IREFALL_FULL_CFG	0xFF
>  #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
>
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
>  };
>
>  static const struct pca995x_chipdef pca9952_chipdef = {
>  	.num_leds	= 16,
>  	.pwm_base	= 0x0a,
>  	.irefall	= 0x43,
> +	.eflag_base	= 0x44,
>  };
>
>  static const struct pca995x_chipdef pca9955b_chipdef = {
>  	.num_leds	= 16,
>  	.pwm_base	= 0x08,
>  	.irefall	= 0x45,
> +	.eflag_base	= 0x46,
>  };
>
>  static const struct pca995x_chipdef pca9956b_chipdef = {
>  	.num_leds	= 24,
>  	.pwm_base	= 0x0a,
>  	.irefall	= 0x40,
> +	.eflag_base	= 0x41,
>  };
>
>  struct pca995x_led {
> @@ -112,6 +126,83 @@ static int pca995x_brightness_set(struct led_classdev *led_cdev,
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
> +static DEVICE_ATTR_RO(status);
> +
> +static struct attribute *pca995x_led_attrs[] = {
> +	&dev_attr_status.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(pca995x_led);
> +
> +static ssize_t has_errors_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));

Why not 'dev_get_drvdata(dev)' instead of bouncing through the i2c_client?

> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(chip->regmap, PCA995X_MODE2, &val);
> +	if (ret)
> +		return ret;
> +
> +

Stray blank line.

> +	return sysfs_emit(buf, "%d\n", !!(val & PCA995X_MODE2_ERROR));
> +}
> +
> +static ssize_t has_errors_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct pca995x_chip *chip = i2c_get_clientdata(to_i2c_client(dev));

As above.

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
> +static struct attribute *pca995x_attrs[] = {
> +	&dev_attr_has_errors.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(pca995x);
> +
>  static const struct regmap_config pca995x_regmap = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -176,6 +267,7 @@ static int pca995x_probe(struct i2c_client *client)
>  		led->led_no = reg;
>  		led->ldev.brightness_set_blocking = pca995x_brightness_set;
>  		led->ldev.max_brightness = 255;
> +		led->ldev.groups = pca995x_led_groups;
>  	}
>
>  	/* Disable LED all-call address and set normal mode */
> @@ -183,11 +275,20 @@ static int pca995x_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_put_nodes;
>
> +	/* Clear errors on probe */
> +	ret = regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
> +	if (ret)
> +		goto err_put_nodes;
> +
>  	/* IREF Output current value for all LEDn outputs */
>  	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
>  	if (ret)
>  		goto err_put_nodes;
>
> +	ret = device_add_groups(dev, pca995x_groups);

Why not devm_* and remove the clean-up?

> +	if (ret)
> +		goto err_put_nodes;
> +
>  	for (i = 0; i < chipdef->num_leds; i++) {
>  		struct led_init_data init_data = {};
>
> @@ -202,7 +303,7 @@ static int pca995x_probe(struct i2c_client *client)
>  		if (ret < 0) {
>  			dev_err_probe(dev, ret, "Could not register LED %s\n",
>  				      chip->leds[i].ldev.name);
> -			goto err_put_nodes;
> +			goto err_remove_groups;
>  		}
>
>  		led_fwnodes[i] = NULL;
> @@ -210,6 +311,9 @@ static int pca995x_probe(struct i2c_client *client)
>
>  	return 0;
>
> +err_remove_groups:
> +	device_remove_groups(dev, pca995x_groups);
> +

You can remove this if you move to devm_*.

>  err_put_nodes:
>  	for (i = 0; i < chipdef->num_leds; i++)
>  		fwnode_handle_put(led_fwnodes[i]);
> @@ -217,6 +321,11 @@ static int pca995x_probe(struct i2c_client *client)
>  	return ret;
>  }
>
> +static void pca995x_remove(struct i2c_client *client)
> +{
> +	device_remove_groups(&client->dev, pca995x_groups);
> +}
> +

As above.

>  static const struct i2c_device_id pca995x_id[] = {
>  	{ .name = "pca9952", .driver_data = (kernel_ulong_t)&pca9952_chipdef },
>  	{ .name = "pca9955b", .driver_data = (kernel_ulong_t)&pca9955b_chipdef },
> @@ -239,6 +348,7 @@ static struct i2c_driver pca995x_driver = {
>  		.of_match_table = pca995x_of_match,
>  	},
>  	.probe = pca995x_probe,
> +	.remove = pca995x_remove,
>  	.id_table = pca995x_id,
>  };
>  module_i2c_driver(pca995x_driver);
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>
>

-- 
Lee Jones
