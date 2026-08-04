Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40893314D0D
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813260; cv=none; b=NXVAvAh0h161ggAkHrNLhzCGe80/Nea5VqwPUpxBcIpl9DVFSlrRORM3kAbalzab0aoCoFRft/J0o+La0Iht3XAGxRBT584tF02m+CzaMLv5YJD4CoKRk0vlXmdIY4u34XoCGiEnG4RsmRb4SxuC/xRWZXYUkRZ0SGHTzcQXmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813260; c=relaxed/simple;
	bh=WZzRrv1FJS8kswLmYf+EyZqEU7nmxDo236j5pP5Nhc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E1RCMwP+r8Gs9X3n8c35v9ptreX26+QvHYG2julKyviievqGkurnQrXET3WcHZnDk0Mq3rg9SraEb+SXutmhCeQ0IahNl7kDHOz4tPRIlE1chQtgXoW3wNHddpaDymWbLRFtMLc27o/VLJIr0iBJ1sHsPH5DH5N8GRX7lUbLSw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3neUyAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3neUyAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6801F000E9;
	Tue,  4 Aug 2026 03:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785813258;
	bh=pwfwF1E+vWFMuBOt14J3yWbEPmE9tGhB76aaQ4D7AO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k3neUyAzu023cjqDzovGv09MYhft2LIaEH5PQqUFKp86nHr4i5RPzFipDqdQhXdwQ
	 G1pPEXW1fJTwo9Jr/gMvvy2bv3nPkM83zUOf3x7snX58gYLAxPTg+Lkw0T70LGyc3f
	 9DknvCrXAEtiveDDHngDpxQJc0ajkJBWBtEdHmxRwemY+8T2Og/DuaGW+t6I1vh6IG
	 Wj08f7MnTufWW4g5umNagSI51TQntNhELanc5AGA/wudQyFduk9juXjwgaXz7wlqQx
	 VzkBIDJUG+COCkSNXRoE47TWjAUrR+508PnCneb6Ds+DnDWco5Mv3PsXtxnz5i6cpS
	 YAa9gvKgnauMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] backlight: aw99706: Validate all DT property
 values consistently
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260804030255.1934470-3-junjie.cao@intel.com>
References: <20260804030255.1934470-1-junjie.cao@intel.com>
 <20260804030255.1934470-3-junjie.cao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:14:17 +0000
Message-Id: <20260804031418.0E6801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C chip ID read is attempted before the hardware enable GPIO is a=
sserted.
- [High] Initial backlight brightness state is not synchronized to the hard=
ware during probe.
--

--- Patch [2]: [PATCH v3 2/3] backlight: aw99706: Validate all DT property =
values consistently ---
commit 7ac792a99fb6a9cdd91d97a6eb34756415f65058
Author: Junjie Cao <junjie.cao@linux.dev>

backlight: aw99706: Validate all DT property values consistently
   =20
The lookup helpers for dim-mode and ramp-ctl take a shortcut when
lookup_tbl is NULL, accepting any u32 value without range-checking.
This commit adds a field-width check for the NULL-table case so that
values exceeding the register field maximum are rejected. It also updates
the switching frequency table reserved marker to U32_MAX and changes
error returns to -EINVAL.

> diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/=
aw99706.c
> index e130f164303a2..6ec49b6cb14c6 100644
> --- a/drivers/video/backlight/aw99706.c
> +++ b/drivers/video/backlight/aw99706.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does aw99706_probe() attempt=
 an
I2C read before the hardware enable GPIO is asserted?

In aw99706_probe(), the driver calls aw99706_chip_id_read() before fetching
hwen_gpio and calling aw99706_hw_init() to assert the enable pin:

drivers/video/backlight/aw99706.c:aw99706_probe() {
    ...
	ret =3D aw99706_chip_id_read(aw);
	if (ret !=3D AW99706_ID)
		return dev_err_probe(dev, -ENODEV,
				     "Unknown chip id 0x%02x\n", ret);

	aw99706_dt_parse(aw, &props);

	aw->hwen_gpio =3D devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);
    ...
}

Could this cause the probe to fail with an I2C NACK or timeout if the
bootloader hasn't already left the GPIO asserted?


[Severity: High]
This is a pre-existing issue, but is the initial backlight brightness state
synchronized to the hardware during probe?

aw99706_probe() parses the default brightness and registers the backlight
device, but returns without flushing the initial state:

drivers/video/backlight/aw99706.c:aw99706_probe() {
    ...
	bl_dev =3D devm_backlight_device_register(dev, "aw99706-backlight", dev,
						aw, &aw99706_bl_ops, &props);
	if (IS_ERR(bl_dev))
		return dev_err_probe(dev, PTR_ERR(bl_dev),
				     "Failed to register backlight!\n");

	aw->bl_dev =3D bl_dev;

	return 0;
}

Since backlight_update_status() or aw99706_update_brightness() is never cal=
led
here, does this mean the parsed brightness and the backlight enable bit are=
n't
written to the hardware, potentially leaving a black screen during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804030255.1934=
470-1-junjie.cao@intel.com?part=3D2
