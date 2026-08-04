Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9284630BF69
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813335; cv=none; b=KLJi1Y56vAuppSOgYdLbBMrGb895JibENRUgzIYO6i2iQBtNZ+eH0Qy36+bl3tH/RoeH1yvUTWHnBTzBCWKcuxKQOMGISWiN8WbSzQX1GD8hP7WNPi/rzpnYaIiugOARO86DSVpNmGVwuXckNBCRXsTY9GeQsGCV3Lnf3loxL6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813335; c=relaxed/simple;
	bh=22baQKYhdC/8pEa1aTXBiqNGDHxxTZoWyCaCKGiMaTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pErG144LJeh4FmwnqDHEuQvlgZjEoSLm07nVZG7eJ9OUivReZzrZE/fNBC3u0n/zo+YsFNk1/KEv8Yh7NGQWN3wMD6E3EPHJXA05HvZUCmgaK6FQUmtWKRwjbUOIJF4R3+2WrBwf+PxWaHg4j8k26khiO22G5zOqDO8qR/O1nak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8TbuyY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8TbuyY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CD41F00A3A;
	Tue,  4 Aug 2026 03:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785813334;
	bh=Pf4NxLroK6RaL2a1Y2//tPATGRTgTegVkXZ3orDWCjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k8TbuyY2Qgu/VH7JA1fLdXrFoUTRFmx+5DYsjADkoohcDY8s4OgG+Y3kkBBHzOviP
	 LSST/wVm7gDz85fayedKNFH1xvVtvtMIO9FhHaR8Vcg4szWvagmCexElCz+Phv+abj
	 Rlzql6FCwuI/hTHa9LOGEvczwl1xGMof2eFYAaB8O9SNMqR/tfL3QTMYKvcv2PEOey
	 NptMxUeigHUWNhkcBAUYjKJXDc+RyWr2eviE0Fyf/7O2iuDW9ajuepCiZBqC6BZWmH
	 p8P6r6fWwO3CudbIOv5RvOQ8M3wyc9b9b2f55xjnxFh5GMQ5D4zia/0nXw7ecciO6f
	 Wwy9+f+vcWqig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] backlight: aw99706: Honor the core blank state
 in update_status()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260804030255.1934470-4-junjie.cao@intel.com>
References: <20260804030255.1934470-1-junjie.cao@intel.com>
 <20260804030255.1934470-4-junjie.cao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:15:33 +0000
Message-Id: <20260804031533.B5CD41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C read is performed before the hardware is powered up or enabled.
- [High] The initial backlight state parsed from device tree is never appli=
ed to the hardware during probe.
--

--- Patch [3]: [PATCH v3 3/3] backlight: aw99706: Honor the core blank stat=
e in update_status() ---
commit 4fd7fd023a2e220d60fcbcb9c519d9b49b430467
Author: Junjie Cao <junjie.cao@linux.dev>

backlight: aw99706: Honor the core blank state in update_status()

update_status() passes props.brightness straight to the hardware and
ignores the power/blank state tracked by the core. Writing 4 to the
bl_power sysfs attribute or blanking the framebuffer therefore leaves
the backlight lit.

> diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/=
aw99706.c
> index 6ec49b6cb14c6..c4a66b59ecf13 100644
> --- a/drivers/video/backlight/aw99706.c
> +++ b/drivers/video/backlight/aw99706.c
> @@ -340,7 +340,7 @@ static int aw99706_bl_update_status(struct backlight_=
device *bl)
>  {
>  	struct aw99706_device *aw =3D bl_get_data(bl);
> =20
> -	return aw99706_update_brightness(aw, bl->props.brightness);
> +	return aw99706_update_brightness(aw, backlight_get_brightness(bl));
>  }
> =20
>  static const struct backlight_ops aw99706_bl_ops =3D {

[Severity: High]
This is a pre-existing issue, but I noticed an I2C read is performed before
the hardware is powered up or enabled.

In drivers/video/backlight/aw99706.c:aw99706_probe():

	ret =3D aw99706_chip_id_read(aw);
	if (ret !=3D AW99706_ID)
		return dev_err_probe(dev, -ENODEV,
				     "Unknown chip id 0x%02x\n", ret);

	aw99706_dt_parse(aw, &props);

	aw->hwen_gpio =3D devm_gpiod_get(aw->dev, "enable", GPIOD_OUT_LOW);

	ret =3D aw99706_hw_init(aw);

Will the driver probe fail with -ENODEV here if the hardware is disabled by
default, since the hardware enable GPIO (aw->hwen_gpio) is not requested and
asserted until later via devm_gpiod_get() and aw99706_hw_init()?


[Severity: High]
This is also a pre-existing issue, but the initial backlight state parsed f=
rom
device tree is never applied to the hardware during probe.

In drivers/video/backlight/aw99706.c:aw99706_probe():

	bl_dev =3D devm_backlight_device_register(dev, "aw99706-backlight", dev,
						aw, &aw99706_bl_ops, &props);
	if (IS_ERR(bl_dev))
		return dev_err_probe(dev, PTR_ERR(bl_dev),
				     "Failed to register backlight!\n");

	aw->bl_dev =3D bl_dev;

	return 0;

Does the backlight remain off during the entire boot process until userspace
writes to the sysfs brightness attribute?

The probe function completes without calling backlight_update_status() to
synchronize the parsed device tree brightness properties to the hardware, a=
nd
the backlight core does not automatically sync the initial software state
upon registration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804030255.1934=
470-1-junjie.cao@intel.com?part=3D3
