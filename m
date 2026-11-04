Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805417;
	b=Rhk4yz1Y/dJbNKno6idh0Zdgx6SsK7bgsqnuXHZJm7TvemgCoaxPSt6PiZ7qaTa6aZFE
	 PuaFfc9EtCKjueZQf1PDpjFo2fCXOTMbln6sXJ4YprB1pF2w0f+s3lmzh6PMkSObpNS9y
	 AmEOPQkjAEp0F2+77fAjjwpSuXRr8ylb/R6kOmbkxyi8wHQyOiUu2JKF/vkpwfzRKkdWU
	 H1icjRdiYRds0GMAZa/AGRZhyIIRmVx5l2Wm5wQ+xxWjvWhTp82ovwQnFhtelp13WbNen
	 Z7Td55HeETPKUW26KKCMDHIbR+35mfDKT5L7iUT+ao5pMsR0o5/YKdnkxZvgysXUE3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805417;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=+ujcZSwz/83lrvr7TwjbA/nnj3jCHCu3CReqCbjjg4k=;
	b=bueFKtyogFa4VdbGBoR7l8ZJ1jQq4aSH5SWeDIGLPk26Czrk4Nojys828tUWD/Cj4r5C
	 Tsc4uZsT6r4/rHSu+GlcTDz44tOIIIQk52ppY19ZHSB4tu8K4UTJMFiJJ9lbgGkvd3c5G
	 /oXHKEyd6PYg3E02jUmWHXW+ucB4StuCImJCkufy8l3vIGAB1DTNWwwWqJJ6H6kz/hjSr
	 oZUp6aH8qvaRzaPRKpg3SvRdbH4RZL+epqgG2sCAjdJ3xbm7uEkILhpLO7HXh3lY6gtoE
	 UW4KpFoaRISB4kC1/wO9frzL4csh1vvDpyIWgXgg56UWpjrwJrPt3vEm2DoiZTnu1ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dm5xgmQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A536082BCA;
	Wed,  4 Nov 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dm5xgmQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95D11F000C1;
	Wed,  4 Nov 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793805416;
	bh=+ujcZSwz/83lrvr7TwjbA/nnj3jCHCu3CReqCbjjg4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dm5xgmQs9vbq7KABM0NpP+ZAPLa4DMSzqyEkuaod8cucwB6X9XbLcnMIa0roPCHFz
	 sT/WbrfWDG6BxHcVATi74iVbVZSvQEdv59vX49p9Th126pTDX1IB3+vnndDkV/R1DC
	 hTa1kHj3tspFrTDiA4eH12ypLKwAL8eLt0q7EVOecxr9em1O0Qk4FKsZM/nlTbBeaZ
	 NuqLcukapd9avErN1jWbC66S/aGcyF8YonWIFu7iscB2umKswNJTAQCNRewyrLEqyl
	 97j3lRwHg+CohE/dpjOgt7pZTXLCTmwgHFPUaWpWVAZwGE1VUNZTRA6njfbiWlX0eZ
	 sx1DJbSrPwS/w==
Date: Wed, 4 Nov 2026 15:16:53 +0000
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
Message-ID: <179318844110.3606039.5801345229436270811@kernel.org>
References: <20261027115006.86032-1-clamor95@gmail.com>
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
In-Reply-To: <20261027115006.86032-1-clamor95@gmail.com>
X-AI-Review-Draft: <20261027115006.86032-1-clamor95@gmail.com>

--- checkpatch.pl (1 issue) ---
Line 38: WARNING: please write a help paragraph that fully describes the config symbol with at least 4 lines
----------------------------------

On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:

> Add a small driver to control the LED cell provided by the MAX8907 PMIC.
> The LED does not require any specific configuration and is folded into the
> PMIC's node.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
> Changes in v2:
> - rebased so patch is now applicable to linux/next
>
> Changes in v3:
> - added check if led is off for get callback
> - added dedicated MAX8907_REG_WLED_MODE_ON mask
> - switched to devm_led_classdev_register_ext
>
> Changes in v4:
> - platform_set_drvdata dropped
> - init_data.devicename dropped
> - added MODULE_ALIAS
> ---
>  drivers/leds/Kconfig        |  7 +++
>  drivers/leds/Makefile       |  1 +
>  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
>  drivers/mfd/max8907.c       |  1 +
>  include/linux/mfd/max8907.h |  2 +-
>  5 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/leds/leds-max8907.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 788e689fe875c..3796c562919fe 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -813,6 +813,13 @@ config LEDS_MAX77705
>  	help
>  	  LED driver for MAX77705 PMIC from Maxim Integrated.
>
> +config LEDS_MAX8907
> +	tristate "LED support for MAX8907 PMIC"
> +	depends on LEDS_CLASS && MFD_MAX8907
> +	help
> +	  This option enables support for on-chip LED drivers on
> +	  MAXIM MAX8907 PMIC.

As requested on v3, please expand this help text to at least 4 lines to satisfy
'checkpatch.pl'.

> +
>  config LEDS_MAX8997
>  	tristate "LED support for MAX8997 PMIC"
>  	depends on LEDS_CLASS && MFD_MAX8997
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 3da746279bb81..24efda3fbaa44 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
>  obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>  obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
>  obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
> +obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
>  obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
>  obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
>  obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
> diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> new file mode 100644
> index 0000000000000..a5c445f75d1b1
> --- /dev/null
> +++ b/drivers/leds/leds-max8907.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/err.h>
> +#include <linux/leds.h>
> +#include <linux/mfd/max8907.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define MAX8907_REG_WLED_MODE_ON	BIT(0)
> +
> +struct max8907_led_data {
> +	struct max8907 *max8907;

As asked on v3, what is 'max8907' used for?

> +	struct regmap *regmap;
> +	struct led_classdev cdev;
> +};
> +
> +static enum led_brightness max8907_led_get_brightness(struct led_classdev *cdev)
> +{
> +	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
> +	unsigned int brightness_lvl;
> +	int ret;
> +
> +	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &brightness_lvl);
> +	if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> +		return LED_OFF;
> +
> +	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_lvl);
> +	if (ret)
> +		return LED_OFF;
> +
> +	return brightness_lvl;
> +}
> +
> +static int max8907_led_set_brightness(struct led_classdev *cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
> +	int brightness_lvl, ret;
> +
> +	brightness_lvl = clamp(brightness, LED_OFF, LED_FULL);
> +
> +	if (brightness_lvl) {
> +		ret = regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_lvl);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
> +				  MAX8907_REG_WLED_MODE_ON,
> +				  brightness_lvl ? MAX8907_REG_WLED_MODE_ON : 0);
> +}
> +
> +static int max8907_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
> +	struct led_init_data init_data = { };
> +	struct max8907_led_data *ddata;
> +
> +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->max8907 = max8907;
> +	ddata->regmap = max8907->regmap_gen;
> +
> +	init_data.fwnode = dev_fwnode(dev->parent);

This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.

Since there is no child node, why not set 'ddata->cdev.name' directly
and use 'devm_led_classdev_register()'?

> +
> +	ddata->cdev.brightness = LED_OFF;
> +	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
> +	ddata->cdev.max_brightness = LED_FULL;
> +
> +	ddata->cdev.brightness_get = max8907_led_get_brightness;
> +	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
> +
> +	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
> +}
> +
> +static struct platform_driver max8907_led_driver = {
> +	.driver.name = "max8907-leds",

Cute.  But please expand.

> +	.probe = max8907_led_probe,
> +};
> +module_platform_driver(max8907_led_driver);
> +
> +MODULE_ALIAS("platform:max8907-leds");
> +MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");

Your name is misspelt here.

> +MODULE_DESCRIPTION("MAX8907 LED driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index e282dd82ece69..826d7768fd8d0 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>
>  static const struct mfd_cell max8907_cells[] = {
> +	{ .name = "max8907-leds", },

Separate patch.

>  	{ .name = "max8907-regulator", },
>  	{ .name = "max8907-rtc", },
>  };
> diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> index e222250f0cc1e..35b2ede54f856 100644
> --- a/include/linux/mfd/max8907.h
> +++ b/include/linux/mfd/max8907.h
> @@ -112,7 +112,7 @@
>  #define MAX8907_REG_CHG_IRQ2_MASK	0x81
>  #define MAX8907_REG_CHG_STAT		0x82
>  #define MAX8907_REG_WLED_MODE_CNTL	0x84
> -#define MAX8907_REG_ILED_CNTL		0x84
> +#define MAX8907_REG_WLED_CNTL		0x85
>  #define MAX8907_REG_II1RR		0x8E
>  #define MAX8907_REG_II2RR		0x8F
>  #define MAX8907_REG_LDOCTL20		0x9C
> -- 
> 2.53.0
>
>

-- 
Lee Jones
