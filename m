Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493113;
	b=Nc/eS5udHspkgBH67kws7FmJA1k9wNmmi9BrETH2qYoeP+Q9ipoo9Goh4eCDY/R1Aumi
	 oqVaDaeBK1GtQg37MUXgTJMH/mz44JzZPDiQEaJaiqdidzVM0yrUZWMxj4o1/sIDuvb/U
	 fQn/m3H3Foq6JzRfPcfFczQ1SATgwzZa1t4OyosKwHCRSUK0c36y0XQzR1dVkNNi9qSMM
	 4lj49nsMd8fZyc7zY0m+vThBqXmQyl0f0o5NGZYJ6tO7r+er8ITZ9+lXvr0wD4TBbNEWc
	 uc0F1J7G3tWArcqGkeHsj/R/+wh6LlSHiroDRyEY8p1+xlbnqzlFi0Jqwp0bF/NJw7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493113;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=uvAch2o0lqP49nEWgLAUALEuCWRKvHijNtCYKP40UeI=;
	b=5sSr9Dnp0jsjXPbkcUg/li3drfBugKVzu4HeeiP+4hvPTYicLR202E6w0OG0MOAV8FMX
	 pZqarMdSgfzRSwNz6612svPV88iWYgEx2UdiYMaajD4Wp3l9gJru9zOjuXISOgSyCyHMy
	 /oMHHPDzTtNVwoaSWsKdwxpv3YE2u5vW1tQfjcPHu5ziPjwjujatNxBMV2ojYJVpFaHPx
	 n7SVi6KPZ6+vBi/I3AswiETVnP0PynDbknS8AJpqLd8cE7IixV+JU/VpuzKdYtH5WoSof
	 QGtkhic2nEmSPs+H3/L9BulisDigG+UxPEJltMC7nYJnQ7jdztFPyP6Qxs8NlQ6EGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ja9oF/93";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8EE606A31E;
	Tue, 20 Oct 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ja9oF/93
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FABC1F000C4;
	Tue, 20 Oct 2026 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792493112;
	bh=uvAch2o0lqP49nEWgLAUALEuCWRKvHijNtCYKP40UeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ja9oF/939fAFcaeSC+w4Ts0+EaLv6RSA1+YmbQN6ZJ2d6rUbYcRa9XhApH1dFEK3n
	 rdpQxdD0BvSPyg3hnUoJNPpTgx2AWJ4I7qMtsVXfNxUK3RK1Pgdh8Aei7XQJglXjpw
	 OwsXvI8dZbx/u8hoND+dWSLkblSZ+uVJ5jsLLXjuE3KMnd9GLqdt4KqwhERpSBP7zO
	 nvR6NoANO68maTDGdIspSm0bS+F2O4Ic6A+y/+SjPFI0hjDHDKeIjtXvh2NAWqUPF2
	 ZmfAn+v4BNwAGiny08jrYzZthDW0kB9CR3D8v1/hvOzdIN9YvlMedss2+2xmtsKB8A
	 eT7xTJ4YNmk8A==
Date: Tue, 20 Oct 2026 11:45:06 +0100
From: Lee Jones <lee@kernel.org>
To: Rillian Grant <rillian.grant@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI
 boards without LED nodes
Message-ID: <179198404917.839288.1364319566324835013@kernel.org>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
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
In-Reply-To: <20261011191026.149338-4-rillian.grant@gmail.com>
X-AI-Review-Draft: <20261011191026.149338-4-rillian.grant@gmail.com>

Andy, et al., Please see below.

On Sun, 11 Oct 2026, Rillian Grant wrote:

> From: Ruslan Koreev <koreev.r@gmail.com>
>
> Lenovo ThinkPads enumerate the LM3643 through ACPI (HID TXNW3643)
> without a _DSD, so the device has no LED child nodes and the driver
> refuses to probe. On these laptops the chip drives the Windows Hello IR
> flood illuminator, with both current sources feeding a single LED, and
> Lenovo's Windows driver applies a fixed configuration to any LM3643 it
> finds.
>
> Add a DMI table that provides that description as a software node when
> the firmware offers none: one IR flash LED on both outputs, with torch
> and flash limits well below the chip's maximums. Start with the ThinkPad
> X1 Carbon Gen 14.
>
> The description is keyed by DMI instead of being applied to every
> TXNW3643 because the wiring is a board property: which output feeds
> which LED and how much current the LED tolerates cannot be read from the
> chip, and a wrong guess overdrives an LED. The firmware cannot be fixed
> from the driver side, and a per-board table is what x86-android-tablets
> does for devices whose ACPI tables describe nothing either. Boards with
> a _DSD are not affected, the fallback only runs when the device has no
> child nodes. The limits are conservative because the LED part is not
> documented; the illuminator is bright enough for face authentication at
> a fraction of them.
>
> Tested on that laptop: torch through /sys/class/leds/ir:flash lights the
> ST VD55G1 IR camera's field of view, and the resulting frames are good
> enough for face authentication.
>
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
> [rillian: add reg property to match the DT binding]
> [rillian: change DMI activation log to dev_dbg()]
> [rillian: use DMI_EXACT_MATCH]
> Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
> ---
>  drivers/leds/flash/leds-lm3643.c | 93 ++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
> index cbe66e90d8e1..18ac75df72e2 100644
> --- a/drivers/leds/flash/leds-lm3643.c
> +++ b/drivers/leds/flash/leds-lm3643.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
> +#include <linux/dmi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/led-class-flash.h>
> @@ -691,6 +692,92 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
>  	return lm3643_register_v4l2(dev, led, fwnode);
>  }
>
> +/*
> + * Lenovo ThinkPads enumerate the chip through ACPI (HID TXNW3643) without a
> + * _DSD, so the LED is not described by firmware. On the boards below it drives
> + * the Windows Hello IR flood illuminator, with both current sources feeding a
> + * single LED. Describe that with a software node, with torch and flash limits
> + * (100 mA and 300 mA per output) well below the chip's maximums.
> + */
> +static const u32 lm3643_ir_flood_sources[] = { 0, 1 };
> +
> +static const struct property_entry lm3643_ir_flood_props[] = {
> +	PROPERTY_ENTRY_U32("reg", 0),
> +	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
> +	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
> +	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_IR),
> +	PROPERTY_ENTRY_U32("led-max-microamp", 200000),
> +	PROPERTY_ENTRY_U32("flash-max-microamp", 600000),
> +	PROPERTY_ENTRY_U32("flash-max-timeout-us", 100000),
> +	{ }
> +};
> +
> +static const struct software_node lm3643_ir_flood_root = {
> +	.name = "lm3643",
> +};
> +
> +static const struct software_node lm3643_ir_flood_led = {
> +	.name = "led-0",
> +	.parent = &lm3643_ir_flood_root,
> +	.properties = lm3643_ir_flood_props,
> +};
> +
> +static const struct software_node *lm3643_ir_flood_nodes[] = {
> +	&lm3643_ir_flood_root,
> +	&lm3643_ir_flood_led,
> +	NULL
> +};
> +
> +static const struct dmi_system_id lm3643_dmi_leds[] = {
> +	{
> +		/* Lenovo ThinkPad X1 Carbon Gen 14 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
> +		},
> +		.driver_data = (void *)lm3643_ir_flood_nodes,

Andy, et al.,

I don't usually allow data from other registration mechanisms to be
passed through another (MFD data via OF for instance).

Is this okay?

> +	},
> +	{ }
> +};
> +
> +static void lm3643_remove_dmi_leds(void *data)
> +{
> +	struct device *dev = data;
> +	const struct dmi_system_id *id = dmi_first_match(lm3643_dmi_leds);
> +
> +	set_secondary_fwnode(dev, NULL);
> +	if (id)
> +		software_node_unregister_node_group(id->driver_data);
> +}
> +
> +static int lm3643_add_dmi_leds(struct device *dev)
> +{
> +	const struct dmi_system_id *id;
> +	const struct software_node **nodes;
> +	int ret;
> +
> +	if (!has_acpi_companion(dev))
> +		return 0;
> +
> +	id = dmi_first_match(lm3643_dmi_leds);
> +	if (!id)
> +		return 0;
> +
> +	nodes = id->driver_data;
> +	/* The nodes are static: a second chip on the same board cannot reuse them */
> +	if (software_node_fwnode(nodes[0]))
> +		return dev_err_probe(dev, -EBUSY, "LED description already in use\n");
> +
> +	ret = software_node_register_node_group(nodes);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register the LED description\n");
> +
> +	set_secondary_fwnode(dev, software_node_fwnode(nodes[0]));
> +	dev_dbg(dev, "no LED nodes in firmware, using the DMI description\n");

Please remove temporary debug prints before submitting.

> +
> +	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
> +}
> +
>  static int lm3643_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -701,6 +788,12 @@ static int lm3643_probe(struct i2c_client *client)
>  	int ret;
>
>  	count = device_get_child_node_count(dev);
> +	if (!count) {
> +		ret = lm3643_add_dmi_leds(dev);
> +		if (ret)
> +			return ret;
> +		count = device_get_child_node_count(dev);
> +	}
>  	if (!count || count > LM3643_NUM_CHANNELS)
>  		return dev_err_probe(dev, -EINVAL, "%u LED nodes found, expected 1 to %d\n",
>  					 count, LM3643_NUM_CHANNELS);
> -- 
> 2.56.0
>
>

-- 
Lee Jones
