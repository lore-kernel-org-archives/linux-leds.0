Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C93F328C
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737765; cv=none; b=lottqO2F2IJzhyDCDy8sDMXFao/xcWIbQnloHvB7fNfhIWoKawM/MZ1Css/4Xj/jnGBSCnPGvcXqjctuTL+DRmhlJ825R+3edOsS2iPy0Jg4NpjmXW+6QKVQ6WiBhlBivB14cybM+7sNHzDkXQSdMY50q4R87iR2bKkz7nTAVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737765; c=relaxed/simple;
	bh=Fa5L3yNhIMS8M6FND+7gj4m8amGwXr59N1pbIfaI+Ao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oc6gwf+0Ok7TdaqmR7Y8Ob/0wQLRkbtNiBj4SAZ3yKCt1sUuJsQFe6+lQw11cC+5iHXffHKqP48E9F6Nhmt4IDk28DnBsdcaYo/pyRGrOHYP+0IEq8HBt/AP5Sc7/j6Ogd2buNnoyL1xmRQUX4iZ3Rx4yWW9rnejI9Y8+wIZLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaSihOJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaSihOJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4A21F000E9;
	Wed, 22 Jul 2026 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737763;
	bh=YdbWntaOeSeE1GbDfJk9xbR0lwqI3TPX4V0RFglh5zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CaSihOJ+Ep6jo90peqB+6EDlTWAjN3iCoDM4PB5+dZ000XnYLmAka4sS3/ltuN9gB
	 3reC0s9ehozkMQ90c4x4b9yGC0DH+/YW08TWGedIyK3cPum2IsQixA0+mwL+zHJVjy
	 SGGWzCFH/rjy1RcsQaTb6gymc0UST6um2savkTcGqN/t46/LeVfEZQ/DpB8gzVvpJq
	 TDu5OWeduOa1UZ0wrpsK/un6J1RIfYFsiIVaO84WBwrXJaDg3jCY/ToYnKZIcNdiXB
	 iY8GtjcZdbQ4ZRQIfJHOu3ktT1qLG+SeG1o29F/AbG3qn4RVr/eKfgyAM7Cv6a8KSx
	 in2km+CMFi+RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] leds: flash: s2m: Wire up of_match_table in
 platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260722161519.9610-3-kr494167@gmail.com>
References: <20260722161519.9610-1-kr494167@gmail.com>
 <20260722161519.9610-3-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:29:23 +0000
Message-Id: <20260722162923.AE4A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Wiring up `.of_match_table` enables direct Device Tree instantia=
tion, exposing a type confusion vulnerability when fetching parent driver d=
ata.
--

--- Patch [2]: [PATCH v2 2/2] leds: flash: s2m: Wire up of_match_table in p=
latform driver ---
commit cd6fb1d1b9477929b7cbc1702f65841f007fe9ea
Author: Surendra <kr494167@gmail.com>

leds: flash: s2m: Wire up of_match_table in platform driver

This commit assigns s2m_fled_of_match_table to the platform driver's
of_match_table to enable DT-based probing and module auto-loading. It also
adds validation for the parent device and its driver data in the probe
function to prevent null pointer dereferences.

> --- drivers/leds/flash/leds-s2m-flash.c
> +++ drivers/leds/flash/leds-s2m-flash.c
> @@ -279,10 +279,17 @@ static int s2mu005_fled_init_channel(struct s2m_led=
 *led, struct device *dev,
>  static int s2m_fled_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct sec_pmic_dev *ddata =3D dev_get_drvdata(dev->parent);
> +	struct sec_pmic_dev *ddata;
>  	struct s2m_led *led;
>  	int ret;
> =20
> +	if (!dev->parent)
> +		return -ENODEV;
> +
> +	ddata =3D dev_get_drvdata(dev->parent);

[Severity: Medium]
Since the driver can now be instantiated directly via the device tree
because of the of_match_table addition below, is it safe to blindly cast
the parent's driver data to struct sec_pmic_dev here?

If the device tree node is placed under a generic bus like simple-pm-bus
instead of the expected sec-core MFD parent, the parent will be valid but
will have unrelated driver data. Accessing ddata->regmap_pmic would then
read from an arbitrary offset, potentially causing memory corruption or a
kernel panic.

Could this be safely mitigated by using dev_get_regmap(dev->parent, NULL)
instead of assuming the exact driver data layout?

> +	if (!ddata)
> +		return -ENODEV;
> +

[ ... ]

> @@ -339,6 +346,7 @@ MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
>  static struct platform_driver s2m_fled_driver =3D {
>  	.driver =3D {
>  		.name =3D "s2m-flash",
> +		.of_match_table =3D s2m_fled_of_match_table,

[Severity: Medium]
Does wiring up the of_match_table here expose the driver to generic OF
matching, allowing direct DT instantiation without enforcing the expected
parent type?=20

This appears to bypass the MFD core's controlled instantiation, making the
type confusion issue mentioned above possible.

>  	},
>  	.probe =3D s2m_fled_probe,
>  	.id_table =3D s2m_fled_id_table,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722161519.9610=
-1-kr494167@gmail.com?part=3D2
