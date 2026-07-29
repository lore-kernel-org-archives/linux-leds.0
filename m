Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5853EDE75;
	Wed, 29 Jul 2026 23:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785367372; cv=none; b=cIc3CpeW4yOnCH9ryRgCh29AW4u2KkbN4ElGDBHdHHK0HZUZcrj1EbYjREh6yh3KAynGaWjbDeQ8Wu5beZVxIvyPSUjtROJchZxPVsTIMly3+jh4N4RmyoDayUGNv2DTX4bynX7POwTDeggnKI961DMWfuPczUFd9YUq5BUTkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785367372; c=relaxed/simple;
	bh=N8dDCF0MxGYEzkea4FajeJ9iIpy5xA6kiaBjXAxwkRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S+yFjqNH7+EZYAD1r44KVpd53+7j8j1mGKpC0WZmE+uoznc0A+0XXZ/j8IWRqV3Vpib+kj0fQfxUF+mX/GtQu6X5dPB8g5QqeZ1fTa+fZ+cf/aayQXcbPnP+h75DJuVxw5a1dEAOSKNvi3YVbrFSdPQi7xE/iMBq7ecy/7HEQME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrSF5CHE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrSF5CHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CEF1F000E9;
	Wed, 29 Jul 2026 23:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785367370;
	bh=970aEAZLUqVohZzpaTIqru10pdPYtTjvOHgNwAD5wkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DrSF5CHEr35/ljJT6wzrm3G1hIHLwrtNlB4dlUSq5rpURukjL/yesxIUO7Wxzj3yE
	 /qqw1NVjQaqH8L9YDeMdmR9++TwzueJ+Q/L5YvSiX9s3hAFBL1aoEH/NCeAccVP0O9
	 82DPgrAnJoR6XdAzk+GPSYM/nNTTlDcB5paBLDRpgUTEwX4JGuKmQl/k6/yMPCtx0e
	 3nbpJUJP2cR3EdhGATK7VQkDPgx0I+Vu7kXPpiSbQZ03d8B83CZplEfR7bgxKQ+9lW
	 KtR1svhlgN7oRrQFkUPiuvBP92uixgATz4adro+/NCE4Wjak1CuE9tXpwN6xyGqHCj
	 1RvLRNTb5yzxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-upstream-ltc3208-v8-2-6bdcc35e65d7@analog.com>
References: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
 <20260730-upstream-ltc3208-v8-2-6bdcc35e65d7@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 23:22:49 +0000
Message-Id: <20260729232249.A5CEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Regcache desynchronization leads to inability to turn off LEDs l=
eft on by bootloader
--

--- Patch [2]: [PATCH v8 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay LED Driver ---
commit 438e39dda8c60e73fe40abad6d35331fd8bb4b80
Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>

leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

This commit adds support for the Analog Devices LTC3208 Multidisplay LED
driver. It supports 7 distinct LED channels and uses I2C for configuration,
utilizing regmap for register access and caching.

> diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c
[ ... ]
> +static int ltc3208_probe(struct i2c_client *client)
> +{
[ ... ]
> +	regmap =3D devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap), "Failed to initial=
ize regmap.");

[Severity: Medium]
Does this code need to synchronize the register cache with the hardware
during initialization, for instance by calling regcache_sync() or explicitly
clearing the LED DAC registers?

If the bootloader or firmware leaves any LEDs physically turned on,
the regmap cache is still initialized with a default value of 0 for the
LED DAC registers (via ltc3208_reg_defaults), but the hardware itself
is not reset to 0.

If userspace later tries to turn off the LED by setting a brightness of 0,
will regmap_field_write() see that the requested value matches the
cached value (0) and optimize away the I2C transaction? This would leave
the LED physically on while the kernel and sysfs report it as off,
requiring the user to first set a non-zero brightness to force a hardware
update before they can successfully turn it off.

> +
> +	disable_camhl_pin =3D device_property_read_bool(&client->dev, "adi,disa=
ble-camhl-pin");
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-upstream-l=
tc3208-v8-0-6bdcc35e65d7@analog.com?part=3D2
