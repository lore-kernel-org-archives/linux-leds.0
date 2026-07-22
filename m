Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7E43F3295
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737776; cv=none; b=fSN/OIiqWNYVs7NnPSmTsod+P9rPt9Ac6saNGnJ6sxQz/UThY3S6BB4sQdQXl2MfwWymagROJoZQ1aEEyKQUttfP/49fKWS3f3x7JVP3zI7sWRcPdNIE+xsZa3ChuxGeFUmDl7vF/qjF1CTI/6OcLIA1XTUfdvankFQ/O9GZpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737776; c=relaxed/simple;
	bh=K8kEFitRuTGWL/N4HjFpSvc2m5VZYNldND5h8L3Qpa0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aNnKpo9LA48FpCVqsbJ343bsszP03pkiCyKUmkf9H9qRehZHtJQYs/22uKFOP/0B2fRbG40P1u026J++A/WE6zfONEq/i+vTf27BMILUsaz6nwALYamoqK0E6K87ymiU9yucRp29DQTDsFZRNkE1Bgf1IiRfQs+5FSZBcYUs6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mfe7oL7X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mfe7oL7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B141F000E9;
	Wed, 22 Jul 2026 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737774;
	bh=nwGlkhojdYiMAONHhTwhxcUBv1pBucoBTX7qjJkhKBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mfe7oL7Xlayb+V6FITYxoQNuj5ZVNBn392+PU/FLzUdq6UdTLf8ahq4kdiXp4Zmk6
	 fCDeTTT4V+YTqLfUJrJ6aaOMEQelcnD9L0mfhXqYKEZBdnBhilF6FmUilZK/26xLBn
	 t06eer3TpR0JG/rX06QWItSao9jKI1jiVjYZ5PCBTZE24/Ifst6MDOOLQy6zuqLExD
	 Pl4oRPWqUeyeSFUA3mR2loybhxhQx8dIrwaNf6f3CzBkjy/w9wPp9XiacUXa6lNwTl
	 Y773AvBPLrAi7152i+Y26QvR1hREsw47e1KEBb0BiNHSclrRbNZpMAh9ln3TxIhNgH
	 KfhGXM1eYFYvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: rgb: s2m: Wire up of_match_table in
 platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260722161519.9610-2-kr494167@gmail.com>
References: <20260722161519.9610-1-kr494167@gmail.com>
 <20260722161519.9610-2-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:29:34 +0000
Message-Id: <20260722162934.73B141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Type confusion and potential crash due to unsafe cast of parent =
drvdata when probed via Device Tree.
--

--- Patch [1]: [PATCH v2 1/2] leds: rgb: s2m: Wire up of_match_table in pla=
tform driver ---
commit fe8555b3e7add30597af4722b7f9538af69ac8af
Author: Surendra <kr494167@gmail.com>

leds: rgb: s2m: Wire up of_match_table in platform driver

This commit assigns the of_match_table in the platform driver to enable
Device Tree matching. It also adds validation for the parent device and its
driver data to prevent a NULL pointer dereference during probe.

> diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-=
rgb.c
> index d239f54eee901..7ac2b1160c1e3 100644
> --- a/drivers/leds/rgb/leds-s2m-rgb.c
> +++ b/drivers/leds/rgb/leds-s2m-rgb.c
> @@ -363,11 +363,18 @@ static const struct mc_subled s2mu005_rgb_subled_in=
fo[] =3D {
>  static int s2m_rgb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct sec_pmic_dev *pmic_drvdata;
>  	struct s2m_rgb *rgb;
>  	struct led_init_data init_data =3D {};
>  	int ret;
> =20
> +	if (!dev->parent)
> +		return -ENODEV;
> +
> +	pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	if (!pmic_drvdata)
> +		return -ENODEV;
> +
>  	rgb =3D devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
>  	if (!rgb)
>  		return -ENOMEM;
> @@ -415,6 +422,7 @@ MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
>  static struct platform_driver s2m_rgb_driver =3D {
>  	.driver =3D {
>  		.name =3D "s2m-rgb",
> +		.of_match_table =3D s2m_rgb_of_match_table,

[Severity: Medium]
By enabling Device Tree matching here, the driver can be probed natively=20
via DT. This exposes the driver to being probed under arbitrary parents=20
rather than strictly the expected MFD parent.

If probed under an unexpected parent (such as an I2C controller or another
platform device), that parent's driver data is blindly cast to=20
struct sec_pmic_dev * earlier in s2m_rgb_probe():

    pmic_drvdata =3D dev_get_drvdata(dev->parent);

Could this lead to memory corruption or a crash when the type-confused=20
pointer is later dereferenced in s2m_rgb_probe() to fetch the regmap?

    rgb->regmap =3D pmic_drvdata->regmap_pmic;

Would it be safer to retrieve the regmap using dev_get_regmap() instead,=20
to ensure we safely get a valid regmap pointer regardless of the parent=20
device type?

>  	},
>  	.probe =3D s2m_rgb_probe,
>  	.id_table =3D s2m_rgb_id_table,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722161519.9610=
-1-kr494167@gmail.com?part=3D1
