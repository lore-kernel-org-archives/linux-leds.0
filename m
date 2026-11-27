Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789800;
	b=TPYBnTxg+syuzR2CoTSBB6hsWHn9yc1L3DXwVMqkRpNYdC+ivsFlPQNtTB7d5JHffyZ4
	 qo5LQnqGwEMdEEvMJNkvu9ESy4B9ivcidC+skJJ2ZBFY8r9S5I1Ds16MuvkVXquTD/Ezi
	 PRF/NHdVd59lEz9DwS+6XlQ+LTct4RxrpONnJ9M+iIB6cutjtT55oWaN5Bxl9w1PXNGOw
	 OJuU4FHcWh4JfuXLwJabUs9IpaXAvEPmAzxRxX067pKxUgZiYH5jLzqdOXgvh2ewy7sQ4
	 JbZ5GJFL/yzi9wTa0yoh9FW/Ya4zp3Qo4nHayj2f+426L6Tpx+EpdsFtsoqJM6uSgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789800;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=OV62amTqoqN+ewSTRfp0O1PNmNfTA8XKczw4DCF9VmM=;
	b=QvZYRHfuw1xCOyczYz7qNZtG1cbEOPFB/mRBwWM15LGM0y8ItM0KC0GbRlt5Xt7XpnM5
	 KDwtVsLbBuHdjPS+afO15SXYy0I/MO3OvXREX8xibVwEExyRGwE/rBzKeuYO5TNqCaKvZ
	 YdQZ/ohcxH88v3yw2JDy5sCNc2XI37rM7EI06XcL7+r+UKWs2UiX5ldYIo3qrT6MZrC2N
	 hHLah41KHEVRiRaP82lKrzbOYBj1koTv6xRSZi0ogVoro74ddg20ho3pqDivRfCMl5qWv
	 DwMV/CdYXSSSknc6LYmup1OndH3KKYYKJqNhd56PCU+CfTiebcjdUKw6ChV/Supccgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1QKsWqy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D1606A32D;
	Fri, 27 Nov 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1QKsWqy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07B91F00898;
	Fri, 27 Nov 2026 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789799;
	bh=OV62amTqoqN+ewSTRfp0O1PNmNfTA8XKczw4DCF9VmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1QKsWqyCGev7jYT+VXVHzNFLCcUdi8BOFQxcEJmzyp5Y1XZbmaeBgGuYZ96fJPl6
	 kU2Bwm/aq7ypeuhDtYw9mqs3AIPI0QQ1WMtE1MeAyLWLqa0qsFmtyKH9zCcEcP5vuY
	 9iI9zZxPyyEjMibcBxM9L8gVFLQpEcToK5lywOg/WXhDcmr8faB9o5lFbZt1LHd831
	 OHhKk7XmjVXnbXwWvvVMzhXVPy1P9YLrKQXHzS1chsHZ6zV9n2g1QjBUiUsrZRyFia
	 BOUFlWHeLcj+vngnv16RC8gGqB0I6msO9KpL+MXQ6yG8V6+TYqpRL/Jk0xVLxHC+d/
	 k6V+zw+gWsKtQ==
Date: Fri, 27 Nov 2026 14:29:45 +0000
From: Lee Jones <lee@kernel.org>
To: pladow@gmail.com
Cc: Nam Tran <trannamatk@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: lp5860: Add I2C interface support
Message-ID: <179568570057.32537.6911328929277957458@kernel.org>
References: <20261120-add-i2c-support-for-lp5860-v2-1-bcb2ce00a7f5@gmail.com>
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
In-Reply-To: <20261120-add-i2c-support-for-lp5860-v2-1-bcb2ce00a7f5@gmail.com>
X-AI-Review-Draft: <20261120-add-i2c-support-for-lp5860-v2-1-bcb2ce00a7f5@gmail.com>

On Fri, 20 Nov 2026, Peter LaDow via B4 Relay wrote:

> From: Peter LaDow <pladow@gmail.com>
>
> This patch adds I2C bus support to the Texas Instruments LP5860 RGB LED

Just tell us what's happening.  No "This patch ...".

> matrix driver.
>
> The LP5860 supports both SPI and I2C interfaces depending on the hardware
> IFS pin configuration, but the existing driver only implements the SPI
> bus interface (leds-lp5860-spi).
>
> Changes include:
> - Adding the leds-lp5860-i2c bus driver module to handle the LP5860's
>   10-bit register addressing scheme over I2C.
> - Updating Kconfig and Makefile so I2C and SPI bus support can be built
>   independently or together.

This is also not expected / wanted.

Take a look at the Git history to see how we usually describe changes.

> Tested on ZymqMP (ZU3) with an LP5860 connected over an AXI IIC at
> base address 0x40 (A1=0, A0=0) at 400kHz.
>
> Signed-off-by: Peter LaDow <pladow@gmail.com>
> ---
> Changes in v2:
> - Use designated initializer (.name = "lp5860") in i2c_device_id table
> - Link to v1: https://patch.msgid.link/20261120-add-i2c-support-for-lp5860-v1-1-30bc97dcbf78@gmail.com
>
> To: Nam Tran <trannamatk@gmail.com>
> To: Lee Jones <lee@kernel.org>
> To: Pavel Machek <pavel@kernel.org>
> To: Griffin Kroah-Hartman <griffin@kroah.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
>  drivers/leds/rgb/Kconfig           |  12 ++++
>  drivers/leds/rgb/Makefile          |   1 +
>  drivers/leds/rgb/leds-lp5860-i2c.c | 139 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>
> diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
> index 3f6786616a7d..5dfca8949464 100644
> --- a/drivers/leds/rgb/Kconfig
> +++ b/drivers/leds/rgb/Kconfig
> @@ -78,6 +78,18 @@ config LEDS_LP5860_SPI
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called leds-lp5860-spi.
>
> +config LEDS_LP5860_I2C
> +	tristate "LED Support for TI LP5860 I2C LED driver chip"
> +	depends on I2C
> +	depends on OF
> +	select LEDS_LP5860_CORE
> +	help
> +	  If you say yes here you get support for the Texas Instruments
> +	  LP5860 LED driver for I2C bus connections.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp5860-i2c.
> +
>  config LEDS_NCP5623
>  	tristate "LED support for NCP5623"
>  	depends on I2C
> diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
> index a59c13396a22..0e35bf16d615 100644
> --- a/drivers/leds/rgb/Makefile
> +++ b/drivers/leds/rgb/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
>  obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
>  obj-$(CONFIG_LEDS_LP5860_CORE)		+= leds-lp5860-core.o
>  obj-$(CONFIG_LEDS_LP5860_SPI)		+= leds-lp5860-spi.o
> +obj-$(CONFIG_LEDS_LP5860_I2C)		+= leds-lp5860-i2c.o
>  obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
>  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
>  obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
> diff --git a/drivers/leds/rgb/leds-lp5860-i2c.c b/drivers/leds/rgb/leds-lp5860-i2c.c
> new file mode 100644
> index 000000000000..97948cde54a9
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-lp5860-i2c.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include "leds-lp5860.h"
> +
> +#define LP5860_I2C_NUM_PAGES	4
> +
> +struct lp5860_i2c {
> +	struct i2c_client *clients[LP5860_I2C_NUM_PAGES];
> +};
> +
> +static int lp5860_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct lp5860_i2c *i2c = context;
> +	int ret;
> +
> +	ret = i2c_smbus_read_byte_data(i2c->clients[reg >> 8], reg & 0xff);

What prevents 'reg >> 8' from exceeding 'LP5860_I2C_NUM_PAGES - 1' if a caller
or debugfs passes an out-of-range register?  Setting 'max_register' in
'lp5860_i2c_regmap_config' bounds normal regmap accesses as long as
'LP5860_MAX_REG' is strictly less than 0x400, but guarding or masking the page
index (or checking 'LP5860_MAX_REG') makes the invariant explicit.

Also, no magic numbers.  You should define these.

> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ret;
> +	return 0;
> +}
> +
> +static int lp5860_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct lp5860_i2c *i2c = context;
> +
> +	return i2c_smbus_write_byte_data(i2c->clients[reg >> 8], reg & 0xff, val);
> +}
> +
> +static const struct regmap_bus lp5860_i2c_regmap_bus = {
> +	.reg_read = lp5860_i2c_reg_read,
> +	.reg_write = lp5860_i2c_reg_write,
> +};
> +
> +static const struct regmap_config lp5860_i2c_regmap_config = {
> +	.name = "lp5860",
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +	.max_register = LP5860_MAX_REG,
> +};
> +
> +static int lp5860_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct lp5860_i2c *i2c;

'i2c' makes this sound like it's part of the I2C API, and it only
contains an array of i2c_clients, making the whole thing superfluous.

Why not just:

	clients = devm_kcalloc(dev, LP5860_I2C_NUM_PAGES, sizeof(*clients), GFP_KERNEL);

> +	struct lp5860 *lp5860;
> +	unsigned int multi_leds;
> +	unsigned int page;
> +	int ret;
> +
> +	if ((client->flags & I2C_CLIENT_TEN) ||
> +	    client->addr < 0x40 || client->addr > 0x4c || (client->addr & 0x03))

Please define the magic numbers.

Use tabs not spaces - and they are 8 not 4.

> +		return dev_err_probe(dev, -EINVAL,
> +				     "Use the page-zero I2C address (0x40, 0x44, 0x48 or 0x4c).\n");

Don't list out raw values in user-facing documentation like this.

> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "SMBus byte-data transactions are not supported.\n");
> +
> +	multi_leds = device_get_child_node_count(dev);
> +	if (!multi_leds)
> +		return dev_err_probe(dev, -ENODEV, "LEDs are not defined in Device Tree!\n");
> +
> +	if (multi_leds > LP5860_MAX_LED)
> +		return dev_err_probe(dev, -EINVAL, "Too many LEDs specified.\n");
> +
> +	lp5860 = devm_kzalloc(dev, struct_size(lp5860, leds, multi_leds), GFP_KERNEL);
> +	if (!lp5860)
> +		return -ENOMEM;
> +
> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	i2c->clients[0] = client;
> +	for (page = 1; page < LP5860_I2C_NUM_PAGES; page++) {

for (int page = 1; ...

> +		i2c->clients[page] = devm_i2c_new_dummy_device(dev, client->adapter,
> +							       client->addr | page);

This last part needs a comment.

> +		if (IS_ERR(i2c->clients[page]))
> +			return dev_err_probe(dev, PTR_ERR(i2c->clients[page]),
> +					     "Failed to reserve I2C register page %u.\n", page);
> +	}
> +
> +	lp5860->regmap = devm_regmap_init(dev, &lp5860_i2c_regmap_bus, i2c,
> +					  &lp5860_i2c_regmap_config);
> +	if (IS_ERR(lp5860->regmap))
> +		return dev_err_probe(dev, PTR_ERR(lp5860->regmap),
> +				     "Failed to initialise Regmap.\n");
> +
> +	lp5860->dev = dev;
> +
> +	ret = devm_mutex_init(dev, &lp5860->lock);
> +	if (ret)
> +		return ret;
> +
> +	i2c_set_clientdata(client, lp5860);
> +
> +	return lp5860_device_init(dev);
> +}
> +
> +static void lp5860_i2c_remove(struct i2c_client *client)
> +{
> +	lp5860_device_remove(&client->dev);
> +}
> +
> +static const struct of_device_id lp5860_i2c_of_match[] = {
> +	{ .compatible = "ti,lp5860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lp5860_i2c_of_match);
> +
> +static const struct i2c_device_id lp5860_i2c_ids[] = {
> +	{ .name = "lp5860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, lp5860_i2c_ids);
> +
> +static struct i2c_driver lp5860_i2c_driver = {
> +	.driver = {
> +		.name = "lp5860-i2c",
> +		.of_match_table = lp5860_i2c_of_match,
> +	},
> +	.probe = lp5860_i2c_probe,
> +	.remove = lp5860_i2c_remove,
> +	.id_table = lp5860_i2c_ids,
> +};
> +module_i2c_driver(lp5860_i2c_driver);
> +
> +MODULE_DESCRIPTION("TI LP5860 RGB LED I2C driver");
> +MODULE_LICENSE("GPL");
>
> ---
> base-commit: c016466c8c8b01af27ac66d97b64fa9c9e431a3d
> change-id: 20261120-add-i2c-support-for-lp5860-97f38b2ebe1c
>
> Best regards,
> --  
> Peter LaDow <pladow@gmail.com>
>
>

-- 
Lee Jones
