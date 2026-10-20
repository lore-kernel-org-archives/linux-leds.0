Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498808;
	b=TgtUQp9KkyXc8x4pOS9MNLswCJhpYLq5ii1CeruK1BjuG3pCrI2DNduKDtO9NucDHKJC
	 6fYweD3A99/cuhx5uymiOTPBAYyOfb0DDzFYhYMvUDcaMsgqPqMvKFHEyPztiEN37MGng
	 TGqjgaJMFoEq7yqJr+Ugr4mpPgC7DLbXPyJt/RHGNKv0GIwEzopijWORKVPxuELwxQXWT
	 2bUvuGf5nh96501d8poyJnp2YEqsbC2iiJjlLBvrtJYkTMygtFUFnNArjwKvmQIkQHSLm
	 ycshB3D8q8rU1SRnZ+W2nU7xod402Llp6PX2bB6mYGE6YcxClKSKn5wt2Ba1eK8aPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498808;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=TCdVXSGSguFVS8MyCXGGA3abu+IxpKh+QZmcP+izsyA=;
	b=oviIGUAVXzdbq9LcCohloM8yEH4Ve62FYzkaw9pY/VeFT4xeLy6VIB0Pw/dT2ovF1ATr
	 /0xj/e5l3XwNiHDIlWhiViHliYQHSjoftWr6ZXk4TiY2Mjs1uX6Dr6iZVl9Eol9hGu0yX
	 Ys8w+Ape5yy6V+Sow4AiwUQisM4V4Jvw67I7NuxW9j4M9BEiazc79ZsFtjczqduNdllxh
	 DCEuyFY0CNXlJMQF/aWu3dNNBrv03PDRfqsRPB2elEinOqNVDQ3THp+8hrAa01oh2S7oX
	 uw+kCIhf1NRWxYk+gaV89uMiPe2HCmOFKxKOCDVmzgUz8ns7wHRiaXztaFY3NE5aPAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJVVRKIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66073606A31D;
	Tue, 20 Oct 2026 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJVVRKIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C761F000C7;
	Tue, 20 Oct 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498808;
	bh=TCdVXSGSguFVS8MyCXGGA3abu+IxpKh+QZmcP+izsyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJVVRKIgFSrexqVCXORSbEEkGUOmcayAeVWkSMcowf9fEW/8t0izGWKURoeTxgG/h
	 2INlCShOxU8v8ox4jyiyboFzmXwwrOb9mnVhNOlMu+rz+LMviFbnUWItE7hd/B5W/v
	 /S1F/imWQ5mV76y/qmlOMQcoAXCdBuUnQ9Q0oTUvEQFOxjCHwx+uPDLk7fNJ+YXLtL
	 PMrY9K24sDgpHb4J4ug489b5PPaUsaKGbFfKFiOk/jgHYYUNExxXqJdbuv093y04O/
	 a1dqKNHfR/78kiXdDr1YG1oc1MxdxuVijOG1rpoJCZViC2T9tk0tP7HlTofMGVYbuu
	 JXYbsAKN0yQIA==
Date: Tue, 20 Oct 2026 13:20:03 +0100
From: Lee Jones <lee@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 51/53] leds: Add driver for the SGI Fuel and Tezro
 front-panel LEDs
Message-ID: <179198335037.839288.6380344650126608454@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
 <bdc0fa8089faf9ce4ff80695035173ab59357227.1791890466.git.kaloz@kernel.org>
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
In-Reply-To: <bdc0fa8089faf9ce4ff80695035173ab59357227.1791890466.git.kaloz@kernel.org>
X-AI-Review-Draft: <bdc0fa8089faf9ce4ff80695035173ab59357227.1791890466.git.kaloz@kernel.org>

--- checkpatch.pl: clean (0 issues) ---

On Tue, 13 Oct 2026, Imre Kaloz wrote:

> The SGI Fuel and Tezro front-panel LEDs are set through the L1 system
> controller, whose LED request switches off every LED outside its mask,
> so send the pattern of both LEDs on each change. Probe takes over the
> PROM's state without writing it.
>
> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
> ---
>  drivers/leds/Kconfig     |  12 ++++
>  drivers/leds/Makefile    |   1 +
>  drivers/leds/leds-ip35.c | 144 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 157 insertions(+)
>  create mode 100644 drivers/leds/leds-ip35.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d0d3182236be..9ca75364264b 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -1035,6 +1035,18 @@ config LEDS_IP30
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-ip30.
>
> +config LEDS_IP35
> +	tristate "LED support for SGI Fuel and Tezro"
> +	depends on LEDS_CLASS
> +	depends on SGI_IP27
> +	help
> +	  This option enables support for the red and white front-panel
> +	  LEDs of SGI Fuel and Tezro workstations, which the L1 system
> +	  controller drives.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-ip35.
> +
>  config LEDS_ACER_A500
>  	tristate "Power button LED support for Acer Iconia Tab A500"
>  	depends on LEDS_CLASS && MFD_ACER_A500_EC
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index a68244bd50fb..b45d1d70c431 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
>  obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
>  obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
>  obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
> +obj-$(CONFIG_LEDS_IP35)			+= leds-ip35.o
>  obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
>  obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> diff --git a/drivers/leds/leds-ip35.c b/drivers/leds/leds-ip35.c
> new file mode 100644
> index 000000000000..fba918265e3d
> --- /dev/null
> +++ b/drivers/leds/leds-ip35.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED driver for the SGI Fuel and Tezro front panels, which the L1
> + * system controller drives.
> + *
> + * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/leds/common.h>
> +
> +#include <asm/sn/l1.h>
> +
> +struct ip35_leds;

Can you find another way to avoid: leds->led->leds->led->leds ...

> +struct ip35_led {
> +	struct led_classdev cdev;
> +	struct ip35_leds *leds;
> +	unsigned int mask;
> +	unsigned int state;
> +};
> +
> +struct ip35_leds {
> +	struct mutex lock;	/* protects ->state of both LEDs */

Not sure that comment is required.

> +	struct ip35_led led[2];
> +};
> +
> +/*
> + * ON and BLINK switch off every LED outside their mask, so each change
> + * sends the pattern of both LEDs. A steady LED next to a blinking one
> + * cannot be shown; the blinking one wins.
> + */
> +static int ip35_led_update(struct ip35_led *led, unsigned int state)
> +{
> +	struct ip35_leds *leds = led->leds;
> +	unsigned int old, on = 0, blink = 0;
> +	int i, ret;
> +
> +	mutex_lock(&leds->lock);

guard(mutex)(&leds->lock) ?

> +
> +	old = led->state;
> +	led->state = state;
> +
> +	for (i = 0; i < ARRAY_SIZE(leds->led); i++) {

for (int i = 0; ...

> +		if (leds->led[i].state == L1_LED_ON)
> +			on |= leds->led[i].mask;
> +		else if (leds->led[i].state == L1_LED_BLINK)
> +			blink |= leds->led[i].mask;
> +	}
> +
> +	if (blink)
> +		ret = l1_set_leds(blink, L1_LED_BLINK);
> +	else if (on)
> +		ret = l1_set_leds(on, L1_LED_ON);
> +	else
> +		ret = l1_set_leds(L1_LED_RED | L1_LED_WHITE, L1_LED_OFF);
> +
> +	if (ret)
> +		led->state = old;
> +
> +	mutex_unlock(&leds->lock);
> +
> +	return ret;
> +}
> +
> +static int ip35_led_set(struct led_classdev *cdev, enum led_brightness value)
> +{
> +	struct ip35_led *led = container_of(cdev, struct ip35_led, cdev);
> +
> +	return ip35_led_update(led, value ? L1_LED_ON : L1_LED_OFF);
> +}
> +
> +/* The L1 blinks at a fixed 2 s period of its own, whatever the delays. */
> +static int ip35_led_blink_set(struct led_classdev *cdev,
> +			      unsigned long *delay_on,
> +			      unsigned long *delay_off)
> +{
> +	struct ip35_led *led = container_of(cdev, struct ip35_led, cdev);
> +
> +	*delay_on = 1000;
> +	*delay_off = 1000;

If the hardware only supports a fixed 2s period (1000ms on / 1000ms
off), shouldn't we only accept it when '*delay_on == 0 && *delay_off ==
0' (or when both are already 1000) and return '-EINVAL' otherwise so the
LED core falls back to software blinking for other requested rates?

> +
> +	return ip35_led_update(led, L1_LED_BLINK);
> +}
> +
> +/* The PROM leaves the white LED lit and the red one dark. */
> +static const struct {
> +	const char *name;
> +	unsigned int mask;
> +	unsigned int state;
> +} ip35_led_info[] = {
> +	{ "white:" LED_FUNCTION_STATUS, L1_LED_WHITE, L1_LED_ON },
> +	{ "red:" LED_FUNCTION_FAULT, L1_LED_RED, L1_LED_OFF },
> +};
> +
> +static int ip35_leds_probe(struct platform_device *pdev)
> +{
> +	struct ip35_leds *leds;
> +	int i, ret;
> +
> +	leds = devm_kzalloc(&pdev->dev, sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(&pdev->dev, &leds->lock);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(leds->led); i++) {

As above.

> +		struct ip35_led *led = &leds->led[i];
> +
> +		led->leds = leds;
> +		led->mask = ip35_led_info[i].mask;
> +		led->state = ip35_led_info[i].state;
> +		led->cdev.name = ip35_led_info[i].name;
> +		led->cdev.max_brightness = 1;
> +		led->cdev.brightness = led->state == L1_LED_ON;
> +		led->cdev.brightness_set_blocking = ip35_led_set;
> +		led->cdev.blink_set = ip35_led_blink_set;
> +
> +		ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ip35_leds_driver = {
> +	.probe		= ip35_leds_probe,
> +	.driver		= {
> +		.name	= "ip35-leds",
> +	},
> +};

This padding is creeping me out.

Why would you line-up things that aren't at the same level?

> +module_platform_driver(ip35_leds_driver);
> +
> +MODULE_AUTHOR("Imre Kaloz <kaloz@kernel.org>");
> +MODULE_DESCRIPTION("SGI Fuel and Tezro front-panel LED driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ip35-leds");
> -- 
> 2.47.3
>

-- 
Lee Jones
