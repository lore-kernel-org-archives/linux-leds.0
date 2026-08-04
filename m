Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A3384CEA
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 03:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785814097; cv=none; b=RWXdorvbUqTgATo62I3b8gS2KGN5lPGYS9VTrJglDQsGGQMHooBZJXCYJK3eUvU22jn5Ax6/6xS38HVY19aPKtz1YFcKD9tr/mAORUwAxapMrAx3/yKD/vmTNqLVq6RBgV0bnpckafSSQ/V8LARzIXhju8vJ4MluR9wrimBVIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785814097; c=relaxed/simple;
	bh=DGuhG9u1Qq8HanlgIsoAmKcxewJT3kmNN+IavDBcATw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+kzuszCWUayjqofmPtSrO793nHxX31PvOQbHBkoT1v+Tt0J+7r5u5cYOzWo7BdjEYNkgJJPrZzFOv9PHyYcbgp0s1ZbuPfCE5kOfhBJlt2h5PidmKgnkQbe3IebUv8v79Dx1iZl5SoG9DVHAlD8PiERV0nwuvLQghK870BOzZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnHxTo9b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnHxTo9b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A271F000E9;
	Tue,  4 Aug 2026 03:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785814094;
	bh=zS6lAv/NKkk4qUZ4wB75SYXv2NeSue8/s+3IWl6Sb+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lnHxTo9b+ShdpPvoXzWNQQS4qbmQFyyHsLURidtxFZoun3sKFOEsNV1pppEdTDp5Y
	 IrYJ5/CnPt7Qd2Lvp1A3LbMo5PRpiwLi7rhezHqowBIC6PIeiNxL6UGDCv97nTJoCb
	 qzbw4aLAJKuk2csGrjjrpwAdJJfDUIyJUjAYkT4GRGVtOXDgCJKOtrUjrTRhpgEM3p
	 fWbYxYJziaD44whJJeQ/PpXd7JNUSlX9T1Qe4i5eW7OiyB9tVUU3fiPKXY5WPD4vCc
	 WpK9LnV5lzZKARJCtxBMdG30YTb/ME3IRsNXmmhVkkA3jVvyerWhInMxSvrIoF1wMi
	 B62fUgRrWgKwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] backlight: aw99706: Fix DT property names to
 match binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junjie Cao" <junjie.cao@intel.com>
Cc: lee@kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org
In-Reply-To: <20260804030255.1934470-2-junjie.cao@intel.com>
References: <20260804030255.1934470-1-junjie.cao@intel.com>
 <20260804030255.1934470-2-junjie.cao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:28:13 +0000
Message-Id: <20260804032814.69A271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver attempts to read the I2C CHIPID register before configu=
ring and asserting the hardware enable GPIO.
- [High] The `update_status` callback directly uses `bl->props.brightness` =
and fails to account for backlight blanking or suspend power states.
- [High] The initial `default-brightness` parsed from the device tree is ne=
ver applied to the hardware.
--

--- Patch [1]: [PATCH v3 1/3] backlight: aw99706: Fix DT property names to =
match binding ---
commit 0780fe78c9307963271e82c84a46a86db0bcde59
Author: Junjie Cao <junjie.cao@linux.dev>

backlight: aw99706: Fix DT property names to match binding

The driver reads four tuning properties without the unit suffixes that
the binding mandates. Fix by aligning the property name strings in
aw99706_dt_props[] with the binding.

> diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/=
aw99706.c
> index 18299faf06ad4..e130f164303a2 100644
> --- a/drivers/video/backlight/aw99706.c
> +++ b/drivers/video/backlight/aw99706.c
> @@ -130,23 +130,23 @@ static const struct aw99706_dt_prop aw99706_dt_prop=
s[] =3D {
>  		AW99706_CFG0_REG, AW99706_DIM_MODE_MASK, 1,
>  	},
>  	{
> -		"awinic,sw-freq", aw99706_dt_property_lookup,
> +		"awinic,sw-freq-hz", aw99706_dt_property_lookup,

[ ... ]

[Severity: High]
This is a pre-existing issue, but does aw99706_bl_update_status() handle
backlight blanking or suspend power states?

drivers/video/backlight/aw99706.c:aw99706_bl_update_status() {
	struct aw99706_device *aw =3D bl_get_data(bl);

	return aw99706_update_brightness(aw, bl->props.brightness);
}

By directly accessing bl->props.brightness instead of using
backlight_get_brightness(bl), the driver ignores BL_CORE_FBBLANK and
BL_CORE_SUSPENDED flags, keeping the screen illuminated when it should be
blanked.

[Severity: High]
This is a pre-existing issue, but can the device probe successfully if the
I2C read occurs before the hardware enable GPIO is asserted?

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

If the bootloader does not leave the enable GPIO asserted, the device will =
be
powered off or in reset, rendering I2C communication impossible.

[Severity: High]
This is a pre-existing issue, but is the initial default-brightness applied
to the hardware?

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

The probe routine successfully parses default-brightness and registers the
backlight device, but doesn't call backlight_update_status(bl_dev) to sync
the parsed initial brightness to the hardware registers.

Without an explicit initial brightness update to overwrite the hardware res=
et
state, the display remains off upon boot until userspace manually sets the
brightness.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804030255.1934=
470-1-junjie.cao@intel.com?part=3D1
