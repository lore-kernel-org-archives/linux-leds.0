Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792147F795;
	Thu,  6 Aug 2026 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048616; cv=none; b=Lv3kGWpeuyCUjr2U6xy12qG6Gk3Cs8L3VBdUHo8dfxRXPYHFCmafRJxH0GuHRJsu+eDebCXpjU08b1XueUpYsuaDfUYEez3xTXGHaldeCJ/w6FMgYDJyVvYsFt04lxrTgU5Wgx+37x6zSOY0BoV+dyJG1yy1etOUkU62zDzaPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048616; c=relaxed/simple;
	bh=kJbVqecujajyRc6zDYJskHihJSI5wE6raPXoPsh8z1E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PDAhnSWxpnb8JzuOKl8RL9F+VlnTyKSJanVsVPy+SfakYr/wdUKyIImXpOWuUM8PMPu54UpZJ9pvgkA+LmbQBINHpLQZ31oxjhEh+BxuuhCFo2Paxeb2Oci+1agu/EI7ioBDX3dNmV/DbTVzBTYetBzPs0Y6tQNj19joDp5nF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSfBU9Sj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSfBU9Sj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542301F000E9;
	Thu,  6 Aug 2026 20:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786048614;
	bh=QU8R7dJXp8ZoyOhMFrV+/sxVkWHJi8tv7msFXuZ2xQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSfBU9SjGcR5T50xZ9Xp1VzEdoFljVkfix00fjWdOVxxmIKNgo5mzmuGeSy8iNFEi
	 gNxZZj6l8wGvEUJqXatKQuxiDT15OH3f9NAag2EgVE2lruL4W/mm1Op9X3kd6x4bE/
	 jG1L11FLtcgsXdSv+Wtd4JraN1WJn9ClxFcfd3getTzXRCotvded5oD2fVqmcSQNeU
	 mCwnN0Dr6BuWxaYC0Od2kQS5twR/EtHwhb8McevK79nIHNOCAXzNiH02HW8d8j69hj
	 hMt8CKafMRkuO0omzBq2SOxDoEG+WOG3hFs69KAZbexb8J085f6u93craLhMuCKogl
	 bCx5ZMZl2kRxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] backlight: Add support for Orient Chip OCP8178
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wim de With" <wf@dewith.io>
Cc: lee@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806201541.101304-3-wf@dewith.io>
References: <20260806201541.101304-1-wf@dewith.io>
 <20260806201541.101304-3-wf@dewith.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:36:53 +0000
Message-Id: <20260806203654.542301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Restoring interrupts while the GPIO is driven low exposes the End-=
Of-Sequence pulse to arbitrary timing extension.
- [High] The driver calls `gpiod_set_value()` inside an atomic section with=
out verifying if the GPIO can sleep.
- [Medium] Missing onewire protocol re-initialization on system resume.
- [Medium] The protocol transaction is split across multiple atomic section=
s, exposing the inter-byte gap to interrupt latency.
--

--- Patch [2]: [PATCH 2/2] backlight: Add support for Orient Chip OCP8178 -=
--
commit a17d436f493c13ff679b7f63c64445e13b71e314
Author: Wim de With <wf@dewith.io>

backlight: Add support for Orient Chip OCP8178
   =20
Add a driver for the Orient Chip OCP8178 backlight controller.
   =20
The OCP8178 supports either PWM or a vendor-specific onewire protocol
over GPIO. This driver implements the single-wire protocol, which
enables setting static brightness levels without requiring a continuous
PWM signal from the host CPU.

> diff --git a/drivers/video/backlight/ocp8178_bl.c b/drivers/video/backlig=
ht/ocp8178_bl.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/video/backlight/ocp8178_bl.c

[ ... ]

> +static void ocp8178_bl_write_u8(struct ocp8178_bl *ocp8178, u8 value)
> +{
> +	unsigned long flags;
> +
> +	gpiod_set_value(ocp8178->gpiod, 1);
> +	udelay(OCP8178_1W_T_START_US);
> +
> +	local_irq_save(flags);
> +
> +	for (int i =3D 7; i >=3D 0; i--) {
> +		if ((value >> i) & 1) {
> +			gpiod_set_value(ocp8178->gpiod, 0);

[Severity: High]
Could this trigger a scheduling while atomic bug if the GPIO controller is
behind an I2C or SPI expander?

Since this bit-banging occurs inside a local_irq_save() block where hardware
interrupts are disabled, any GPIO accesses must not sleep. If the driver
is instantiated via Device Tree with a sleepable GPIO, gpiod_set_value()
will attempt to sleep in an atomic context.

Should probe() explicitly reject sleepable GPIOs by checking
gpiod_cansleep()?

> +			udelay(OCP8178_1W_HIGH_BIT_T_LOW_US);
> +			gpiod_set_value(ocp8178->gpiod, 1);
> +			udelay(OCP8178_1W_HIGH_BIT_T_HIGH_US);
> +		} else {
> +			gpiod_set_value(ocp8178->gpiod, 0);
> +			udelay(OCP8178_1W_LOW_BIT_T_LOW_US);
> +			gpiod_set_value(ocp8178->gpiod, 1);
> +			udelay(OCP8178_1W_LOW_BIT_T_HIGH_US);
> +		}
> +	}
> +
> +	gpiod_set_value(ocp8178->gpiod, 0);
> +
> +	local_irq_restore(flags);
> +
> +	udelay(OCP8178_1W_T_EOS_US);
> +	gpiod_set_value(ocp8178->gpiod, 1);

[Severity: High]
Is there a risk that the end-of-sequence pulse gets extended arbitrarily he=
re?

By calling local_irq_restore() while the GPIO is driven low, any pending
interrupts will run immediately. If system interrupt processing or softirqs
delay execution by more than 2.5ms (OCP8178_T_OFF_MS), the hardware will
interpret this extended low pulse as a command to disable the onewire mode.

This could cause the controller to unexpectedly power off and revert to PWM
mode, breaking backlight control.

Would it be safer to restore interrupts after the final gpiod_set_value()
call?

> +}
> +
> +static void ocp8178_bl_set_brightness(struct ocp8178_bl *ocp8178, u8 bri=
ghtness)
> +{
> +	u8 data =3D 0;
> +
> +	dev_dbg(ocp8178->dev, "setting brightness to %u\n", brightness);
> +
> +	data |=3D FIELD_PREP(OCP8178_DATA_ADDR, 0);
> +	data |=3D FIELD_PREP(OCP8178_DATA_VALUE, brightness);
> +
> +	ocp8178_bl_write_u8(ocp8178, OCP8178_DEVICE_ADDRESS);
> +	ocp8178_bl_write_u8(ocp8178, data);

[Severity: Medium]
Does the controller require strict timing between the address and data byte=
s?

Since ocp8178_bl_write_u8() only disables interrupts for the duration of a
single byte, an interrupt could fire between these two calls. If the 1-wire
hardware state machine has a maximum idle time, arbitrary interrupt latency
in the inter-byte gap might cause the controller to reset and drop the
brightness update.

> +}

[ ... ]

> +static const struct backlight_ops ocp8178_bl_ops =3D {
> +	.options	=3D BL_CORE_SUSPENDRESUME,
> +	.update_status	=3D ocp8178_bl_update_status,
> +};

[Severity: Medium]
Is BL_CORE_SUSPENDRESUME sufficient for restoring this hardware after suspe=
nd?

If the platform cuts power to the backlight controller during system suspen=
d,
the hardware will wake up in its default PWM mode. The backlight core will
simply call update_status() on resume to restore brightness, but the onewire
brightness commands will be ignored because the onewire mode hasn't been
re-enabled.

Should the platform driver provide pm operations to re-execute
ocp8178_bl_enable_onewire() on system resume?

[ ... ]

> +	ocp8178->gpiod =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(ocp8178->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(ocp8178->gpiod),
> +				     "gpio missing or invalid\n");

[Severity: High]
As mentioned above, since the driver requires microsecond precision
bit-banging in an atomic context, should we check gpiod_cansleep() here
and fail probe if the GPIO requires sleeping?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806201541.1013=
04-1-wf@dewith.io?part=3D2
