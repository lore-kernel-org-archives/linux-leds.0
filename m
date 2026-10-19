Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A4356767;
	Mon, 19 Oct 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421472; cv=none; b=l/wA39/f69rTVsqjI5QGuHj041zQIHwp+3/lk6992r5zdUUWTilXK/Ms28Ai95EWioKQqHd2phGK64WaXwIOtRXmuqUaeweGXt3AikI740ihotbN8YCh642VJEEL7OQKskL+iWJ+f0c5YyCfLnfa19Ieh8nL5Ztr+tJdCs0c5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421472; c=relaxed/simple;
	bh=A8fuQ0NHwsnFaJFz0bEbjc8KhxQOYjBSxS3WtPY3fX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m24P6AYdkrCtcY1RsIPfm8QQ1uIkzJojHhpjDsoXEPrA1zLoJSJYDg76cKbTeDjfZ+i1bEpz9RGTGzfxlVZHzrTxU01mFIvDr1G9Po7gTxPvHb4SAajf6GZAucKNFBLr5bgXvZLKBbq+dZ8eEp/OhP8uTDrQtDUP7mTaRLAXd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnCUiMhY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnCUiMhY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8932E1F000C4;
	Mon, 19 Oct 2026 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421470;
	bh=AhGtNkW/Au0X6+Smv+ruARwYKKJ/M3mDdnyD8Ld0g6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CnCUiMhYz45/u4bryd0iO/1Knz0HPTMCaGUe4/rgvN662svhuO6KRSq0RyPngvSak
	 MyBSvaPBir/z+9abnuryZ4S9FuaFRvmzx/TJvKe7tsBRyJLFFbpx9ystMgWX/tCTGq
	 w5bqrGaoQm6YHU1RpfK6yPpvm72nJyvxJZUAlhiY3eT1HpRsEyB72bqxoCkL0BajQv
	 jdwlPXgCo10seXAVI5kibGtr/34a5xxSCZMSgGo0nnfLu/oZAmeHs4eHFAJfCU9zv0
	 YbOHpRcpPuOCwIQ/J1cCyR6l0+BAzEoZMunn7ooARNaVpC20udcGHexJjoHg0Oa/A5
	 TN9VetQP1YKRg==
Date: Mon, 19 Oct 2026 15:51:04 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] mfd: aat2870: Convert to use OF bindings
Message-ID: <179198329794.839288.10569542357230656958@kernel.org>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013180933.487013-4-clamor95@gmail.com>
X-AI-Review-Draft: <20261013180933.487013-4-clamor95@gmail.com>

On Tue, 13 Oct 2026, Svyatoslav Ryhel wrote:

> Conversion of the AAT2870 driver to use OF bindings requires a few complex
> changes that should be done simultaneously.
>
> The AAT2870 essentially provides two functions via child devices:
> backlight and regulators. Both functions are fairly self-sufficient and
> may not be populated on the final board. Consequently, the MFD
> registration API was replaced with of_platform_populate(), and each
> sub-device was given its own compatible string.
>
> Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> was converted to use modern gpiod/OF helpers, allowing the redundant
> aat2870_enable() and aat2870_disable() helpers to be removed.
>
> The aat2870-regulator driver was updated to register each of the four LDOs
> from a dedicated OF node using modern regulator framework.
>
> The aat2870-backlight driver was changed to populate all required
> properties from a dedicated Device Tree node. Its channel map was updated
> to use u8 instead of int. Furthermore, because the maximum current is now
> parsed as an absolute value rather than an enum entry, the calculation and
> application of the maximum current were updated accordingly.
>
> All of the changes above allow platform data to be removed entirely.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/mfd/aat2870-core.c            | 115 +++++--------------
>  drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
>  drivers/video/backlight/aat2870_bl.c  |  51 +++++----
>  include/linux/mfd/aat2870.h           |  95 +--------------
>  4 files changed, 121 insertions(+), 299 deletions(-)
>
> diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> index 0d56cd6fbc6a5..909c14ee60323 100644
> --- a/drivers/mfd/aat2870-core.c
> +++ b/drivers/mfd/aat2870-core.c
> @@ -16,8 +16,15 @@
>  #include <linux/gpio/legacy.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/aat2870.h>
> +#include <linux/of_platform.h>
>  #include <linux/regulator/machine.h>

Since we are moving away from legacy GPIO and MFD APIs here, does it
make sense to replace '<linux/gpio/legacy.h>' and '<linux/mfd/core.h>'
with '<linux/gpio/consumer.h>'?

> +struct aat2870_register {
> +	bool readable;
> +	bool writeable;
> +	u8 value;
> +};
> +
>  static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
>  	/* readable, writeable, value */
>  	{ 0, 1, 0x00 },	/* 0x00 AAT2870_BL_CH_EN */
> @@ -61,34 +68,6 @@ static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] = {
>  	{ 0, 1, 0x00 },	/* 0x26 AAT2870_LDO_EN */
>  };
>
> -static struct mfd_cell aat2870_devs[] = {
> -	{
> -		.name = "aat2870-backlight",
> -		.id = AAT2870_ID_BL,
> -		.pdata_size = sizeof(struct aat2870_bl_platform_data),
> -	},
> -	{
> -		.name = "aat2870-regulator",
> -		.id = AAT2870_ID_LDOA,
> -		.pdata_size = sizeof(struct regulator_init_data),
> -	},
> -	{
> -		.name = "aat2870-regulator",
> -		.id = AAT2870_ID_LDOB,
> -		.pdata_size = sizeof(struct regulator_init_data),
> -	},
> -	{
> -		.name = "aat2870-regulator",
> -		.id = AAT2870_ID_LDOC,
> -		.pdata_size = sizeof(struct regulator_init_data),
> -	},
> -	{
> -		.name = "aat2870-regulator",
> -		.id = AAT2870_ID_LDOD,
> -		.pdata_size = sizeof(struct regulator_init_data),
> -	},
> -};
> -
>  static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *val)
>  {
>  	int ret;
> @@ -196,22 +175,6 @@ static int aat2870_update(struct aat2870_data *aat2870, u8 addr, u8 mask,
>  	return ret;
>  }
>
> -static inline void aat2870_enable(struct aat2870_data *aat2870)
> -{
> -	if (aat2870->en_pin >= 0)
> -		gpio_set_value(aat2870->en_pin, 1);
> -
> -	aat2870->is_enable = 1;
> -}
> -
> -static inline void aat2870_disable(struct aat2870_data *aat2870)
> -{
> -	if (aat2870->en_pin >= 0)
> -		gpio_set_value(aat2870->en_pin, 0);
> -
> -	aat2870->is_enable = 0;
> -}
> -
>  #ifdef CONFIG_DEBUG_FS
>  static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *buf)
>  {
> @@ -332,9 +295,7 @@ static inline void aat2870_init_debugfs(struct aat2870_data *aat2870)
>
>  static int aat2870_i2c_probe(struct i2c_client *client)
>  {
> -	struct aat2870_platform_data *pdata = dev_get_platdata(&client->dev);
>  	struct aat2870_data *aat2870;
> -	int i, j;
>  	int ret = 0;
>
>  	aat2870 = devm_kzalloc(&client->dev, sizeof(struct aat2870_data),
> @@ -348,60 +309,29 @@ static int aat2870_i2c_probe(struct i2c_client *client)
>
>  	aat2870->reg_cache = aat2870_regs;
>
> -	if (pdata->en_pin < 0)
> -		aat2870->en_pin = -1;
> -	else
> -		aat2870->en_pin = pdata->en_pin;
> +	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(aat2870->en_pin))
> +		return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pin),
> +				     "Failed to get EN GPIO\n");
>
> -	aat2870->init = pdata->init;
> -	aat2870->uninit = pdata->uninit;
>  	aat2870->read = aat2870_read;
>  	aat2870->write = aat2870_write;
>  	aat2870->update = aat2870_update;
>
>  	mutex_init(&aat2870->io_lock);
>
> -	if (aat2870->init)
> -		aat2870->init(aat2870);
> -
> -	if (aat2870->en_pin >= 0) {
> -		ret = devm_gpio_request_one(&client->dev, aat2870->en_pin,
> -					GPIOF_OUT_INIT_HIGH, "aat2870-en");
> -		if (ret < 0) {
> -			dev_err(&client->dev,
> -				"Failed to request GPIO %d\n", aat2870->en_pin);
> -			return ret;
> -		}
> -	}
> -
> -	aat2870_enable(aat2870);
> -
> -	for (i = 0; i < pdata->num_subdevs; i++) {
> -		for (j = 0; j < ARRAY_SIZE(aat2870_devs); j++) {
> -			if ((pdata->subdevs[i].id == aat2870_devs[j].id) &&
> -					!strcmp(pdata->subdevs[i].name,
> -						aat2870_devs[j].name)) {
> -				aat2870_devs[j].platform_data =
> -					pdata->subdevs[i].platform_data;
> -				break;
> -			}
> -		}
> -	}
> +	gpiod_set_value(aat2870->en_pin, 1);

Is this needed when 'devm_gpiod_get_optional()' already requested the pin with
'GPIOD_OUT_HIGH'?

>
> -	ret = mfd_add_devices(aat2870->dev, 0, aat2870_devs,
> -			      ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
> -	if (ret != 0) {
> -		dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
> -		goto out_disable;
> +	ret = devm_of_platform_populate(&client->dev);
> +	if (ret) {
> +		gpiod_set_value(aat2870->en_pin, 0);
> +		return dev_err_probe(&client->dev, ret, "Failed to populate cells\n");
>  	}
>
>  	aat2870_init_debugfs(aat2870);
>
>  	return 0;
> -
> -out_disable:
> -	aat2870_disable(aat2870);
> -	return ret;
>  }
>
>  static int aat2870_i2c_suspend(struct device *dev)
> @@ -409,7 +339,7 @@ static int aat2870_i2c_suspend(struct device *dev)
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct aat2870_data *aat2870 = i2c_get_clientdata(client);
>
> -	aat2870_disable(aat2870);
> +	gpiod_set_value(aat2870->en_pin, 0);
>
>  	return 0;
>  }
> @@ -421,7 +351,7 @@ static int aat2870_i2c_resume(struct device *dev)
>  	struct aat2870_register *reg = NULL;
>  	int i;
>
> -	aat2870_enable(aat2870);
> +	gpiod_set_value(aat2870->en_pin, 1);
>
>  	/* restore registers */
>  	for (i = 0; i < AAT2870_REG_NUM; i++) {
> @@ -436,6 +366,12 @@ static int aat2870_i2c_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
>  				aat2870_i2c_resume);
>
> +static const struct of_device_id aat2870_match_table[] = {
> +	{ .compatible = "skyworks,aat2870" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aat2870_match_table);
> +
>  static const struct i2c_device_id aat2870_i2c_id_table[] = {
>  	{ "aat2870" },
>  	{ }
> @@ -444,6 +380,7 @@ static const struct i2c_device_id aat2870_i2c_id_table[] = {
>  static struct i2c_driver aat2870_i2c_driver = {
>  	.driver = {
>  		.name			= "aat2870",
> +		.of_match_table		= aat2870_match_table,
>  		.pm			= pm_sleep_ptr(&aat2870_pm_ops),
>  		.suppress_bind_attrs	= true,
>  	},

-- 
Lee Jones
