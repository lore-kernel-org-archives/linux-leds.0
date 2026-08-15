Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839117745;
	Sat, 15 Aug 2026 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835513; cv=none; b=ULpKogZgJ+L3EGx1rqSHvPwORIbB+0Xwdsd2+Xxr+SBLcCRJpV6v/LP4/b5x5JOnDvZ6zw811VEdhkhG6Ubf0o4muJHlKxfYe7URN+/DtyrBWQgKMQK82pwqpncwkS01IED3N/nhsOL7B+EhByYU9JfklyGYwc4v7fQq6ktg+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835513; c=relaxed/simple;
	bh=wxwvUijD3WQUxMsZZWZU+nccI6zEY+EAxNHVvQ1oZpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=odZBA9oTgYgkZ9L+0Srf0UuT/rdokzilykwC2MqLqUT40dAZZR2K41M7uvYEi68wwm+32ihlwc/By+etU/ECY0ZG1QqetAGusBSAtjD1DLrURBX7qCGPOtyDMagq9FORrCsrZBUTZn/N6c9YkLlM67OC4xSLb5s+zONH+nIWXb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IODENpBk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IODENpBk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949C41F00A3A;
	Sat, 15 Aug 2026 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835512;
	bh=INLR1kONlP0Ebk3sxWMDon6TwtlwnyPp5ldiUDFjh8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IODENpBkzrV2Jy9G1YQAJfpaHAYywDqc6SdknAYNCCce5iq+nZuQh6TNGSnLRUwmu
	 Bqd++rMNAmiAOD3JcBwqYjaCRMB9qH3JRaOEUGGfaQGIzqx8lmSQZ2kN7t73n32Yaw
	 a8Joepztu7sszqc7DjaZVS7R7aHGhG4AEl6MaWJqSdUGPcCrrpsz2sylY1yuXas4l0
	 5v/C83ystotWSttOrDyUrDtBS7/Ona5TVWrqfXImzi+o43SCflbWXt236nkwOvfbqs
	 lbDlKKbGlbuUjZlMst+NYL3eykBB3UhS3+uVA7QuE+LLeAXWrvlIPDLCxzXkMVqaVp
	 3OP7uTEbRXspQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 2/7] leds: is32fl3207: Add controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <200b35cd5847c318f4330dd162147b648c402601.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <200b35cd5847c318f4330dd162147b648c402601.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:51 +0000
Message-Id: <20260815231151.949C41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] `is32fl3207_clear_retained_scaling` fails to latch the zeroed sc=
aling registers, leading to a brief LED flash during hardware initializatio=
n.
--

--- Patch [2]: [PATCH net-next v5 2/7] leds: is32fl3207: Add controller dri=
ver ---
commit 63a2ff2e96d1f984d184b4b7a9733188419e971d
Author: Ahmad Byagowi <ahmadexp@gmail.com>

leds: is32fl3207: Add controller driver

Add an I2C driver for the Lumissil IS32FL3207 18-channel LED controller.
Individual and multicolor LEDs are exposed through the LED class, with
support for brightness and channel scaling.

> diff --git a/drivers/leds/rgb/leds-is32fl3207.c b/drivers/leds/rgb/leds-i=
s32fl3207.c
> new file mode 100644
> index 0000000000000..6a46f97ba50a5
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-is32fl3207.c
[ ... ]
> +static int is32fl3207_clear_retained_scaling(struct is32fl3207 *chip)
> +{
> +	u8 scaling[IS32FL3207_NUM_CHANNELS] =3D { };
> +	int ret;
> +
> +	ret =3D regmap_write(chip->regmap, IS32FL3207_REG_CONTROL, 0);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_bulk_write(chip->regmap,
> +				 IS32FL3207_REG_SCALING(0), scaling,
> +				 sizeof(scaling));
> +}

[Severity: Medium]
Will this fail to latch the zeroed scaling registers, leading to a brief LED
flash during hardware initialization?

The zeroing of the scaling registers is performed in software shutdown with=
out
entering normal operation or issuing a PWM_UPDATE, leaving the active hardw=
are
registers at their old values.

> +
> +static int is32fl3207_hw_init(struct is32fl3207 *chip)
> +{
> +	u8 scaling[IS32FL3207_NUM_CHANNELS] =3D { };
> +	u8 pwm[2 * IS32FL3207_NUM_CHANNELS] =3D { };
> +	int disable_ret;
> +	int ret;
> +
> +	/* Software reset requires normal operation (SSD =3D 1). */
> +	ret =3D regmap_write(chip->regmap, IS32FL3207_REG_CONTROL,
> +			   IS32FL3207_CONTROL_ENABLE);

[Severity: Medium]
When normal operation is enabled here to issue the software reset, will the
unlatched active registers drive the LEDs using their retained pre-boot val=
ues
and cause a flash?

The controller requires normal operation and a write to the PWM_UPDATE
register to latch new values into the active output stages. Because the
zeroed scaling values remain unlatched in shadow registers, this write to
enable normal operation causes the active registers to hold their pre-reboot
retained values, briefly illuminating the LEDs until the reset is processed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D2
