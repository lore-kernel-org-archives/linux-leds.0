Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5B26159E;
	Sun, 11 Oct 2026 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746416; cv=none; b=dAVC7rk10ovo0xmiAzOetUOI0kwg2jXX8On7mWsjOUZ5H7LcNqS5Ok1Wq6K64l0AENmrd+1qbyuYGMVYKFSB+zotoOtPXJR+/5bDEBkTNwEF4yFBsBWZ1Nh7xyneFy9S10wq+Ciwgl69FUc8xVGR0u4Mat6Eya0/FF0v0KSLtc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746416; c=relaxed/simple;
	bh=JM/eyGiBx7MIduRkUWMFgmbVj+YSkHtAAmSAWXnuREA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=akV8TJ+CTlllbVmM61VjZ3q2yBhryRYZ80nFYD7FFW5QFVJnQq2rihmRuzCWdeAYJ8xoSycneQJyZwQSdYefSZAMes6JQWOeoxeYZqbmMspIe/Hd+KyiU23pTYTSpgZ0X3Tzz6pqxj6DTFqS6YPXyOUWG/4mlDgY/U8xSzO6qFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNrlT158; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNrlT158"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB0C1F0089B;
	Sun, 11 Oct 2026 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791746414;
	bh=JoNlAQ1d0hEgXgn9KBDqNJVwTd+6UEio4qrPEEyAQS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aNrlT1588uLT34Wnn+3L4DYbmJJUEYedMOgD9ppsFL5DswFtbUCkX7mxC2La8JSKe
	 JINIYEayeRl4l0Ju9W3LKHt0hSp24nwtNRZV3sXhsk8fLBw5FfFT6YWZV9nMfdbgJr
	 txWejfh6eZSTd/P/d21oJVx74AvaozNPpA6eWjG1pO9jTRdZkB54guswvNeBNPKsxl
	 c82j1nE3eRNRPIvKh/As0pbgW+boM786TTf7jfBiN5V5xHoNXX/mlyrz1op5xQ+Dan
	 PcuqdbKIDuOnV1bgvxKxjZjFyqG9peJIPhm2C4wWAGHhBev+OnEoFvkyQZ7aF3tVAr
	 1j2yObWU7wILw==
Message-ID: <sashiko-outbox-167401@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] leds: flash: Add support for the TI LM3643 dual
 LED flash driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261011191026.149338-3-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-3-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 19:20:13 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: missing hardware startup delay after asserting enable GPIO
- [Low] leds: non-standard commit message prefix used
--

commit e9482e46025f29c98cd459b067571fee928be4b6
Author: Rillian Grant <rillian.grant@gmail.com>

leds: flash: Add support for the TI LM3643 dual LED flash driver

This commit introduces support for the Texas Instruments LM3643 dual LED
flash driver over I2C. The chip provides torch and flash modes with
programmable current and timeouts via a shared synchronous boost converter.

> leds: flash: Add support for the TI LM3643 dual LED flash driver

[Severity: Low]
This isn't a bug, but does this commit subject violate the subsystem naming
conventions?

According to the LED subsystem guidelines, embedding subsystem subdirectory
names like flash into the prefix hinders Git history categorization. Embedd=
ing
implementation details can also create rigid and non-reusable drivers.

Could the driver name lm3643 be used in the prefix instead, such as
"leds: lm3643: "?

> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-l=
m3643.c
> --- /dev/null
> +++ b/drivers/leds/flash/leds-lm3643.c
[ ... ]
> +static int lm3643_probe(struct i2c_client *client)
> +{
[ ... ]
> +	hwen =3D devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(hwen))
> +		return dev_err_probe(dev, PTR_ERR(hwen), "failed to get enable GPIO\n"=
);
> +
> +	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +	i2c_set_clientdata(client, chip);
> +
> +	chip->regmap =3D devm_regmap_init_i2c(client, &lm3643_regmap_config);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(dev,
> +				     PTR_ERR(chip->regmap),
> +				     "failed to allocate register map\n");
> +
> +	ret =3D regmap_read(chip->regmap, LM3643_REG_DEV_ID, &dev_id);

[Severity: Medium]
Does this sequence require a hardware startup delay after asserting the ena=
ble
GPIO?

The lm3643_probe() function drives the HWEN GPIO high and then shortly after
initiates an I2C regmap_read() to fetch the device ID. Failing to provide a
programmatic delay (e.g., via usleep_range) might cause the I2C transfer
to fail on platforms where the CPU executes the bus transaction before the
hardware state machine and internal oscillator are fully initialized.

Could a small delay be added here to ensure the chip is ready for I2C traff=
ic
before the register read is attempted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011191026.1493=
38-1-rillian.grant@gmail.com?part=3D2
