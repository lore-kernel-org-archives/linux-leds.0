Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59C27707;
	Sun,  2 Aug 2026 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672708; cv=none; b=k7lk2PQ76O8v3c1+5JhUZMbN3Jwzsd2ulCnc1J5MJ+0OvQg9BlOADhZn0eagxO+KHfWgRaLcNlu/Yw6dCDYlpHAnITI6357XDjDmK82QpvinK5f62bRFh6ZrrkK+HeSBBLw9FjoSbs19xiwDSvA9XhU5fzhWer6U//MrZS8byaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672708; c=relaxed/simple;
	bh=8H05jnG4ozk2RdnuX2njil2TQnwBcQN++4KHq7BmntE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cVR52wyyBBbWCaPRQEiZP983pzMhIdzN4pq5wO8ySn+S/GHfZ9m5VxslQENDwB9hRBd4urs1PeIlUFdkVrCGpJcVsMY8H9OvDbrv2RMHQ/utWshbDatwXZsJlDO3ESEzcY53VMf/5eMGvatmguLrtZOQf7w8jsvLOR/3wOcjaFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFOCCF+s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFOCCF+s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483D11F000E9;
	Sun,  2 Aug 2026 12:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672706;
	bh=MLzgeqYO5SoX0WQN6Y0lA932waDHEPHd5uSKtpq5T+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IFOCCF+sERyHYq1VA6r2U3Pd6SMNYO1pL4IozrTOHoJHSt4COl5pGCLx7JN9yxBgl
	 UOqzR19KRoFvvz34A+F/eaxRVITmHB+WO7PMJl4x+pFNfp9B2BxQeg5sDK1o6KL0HT
	 RuUGnjgMT3Xw+WIVLEwCAQ19NqgQwpS37Xk08RnW3dXk+hgY+s0TT9Ez5iR0z5aTM6
	 7tbedTaRCmiY154uxYilZ/WzylTdUR9uV2eJtweQ41G3QxqqgC7L3VsCKihc5NeiK8
	 zw8bTxtZ0zCP8Nx6xJaZvMFxx+ursrAcQ6YlNaP6/NOt9astG/PbmBkqnwK66uu45p
	 P/uoDRGzFRWtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 2/2] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802115727.50411-3-wahrenst@gmx.net>
References: <20260802115727.50411-1-wahrenst@gmx.net>
 <20260802115727.50411-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 12:11:45 +0000
Message-Id: <20260802121146.483D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Device Tree Binding & Implementation Mismatch for `default-inten=
sity`

Pre-existing issues:
- [High] 32-bit unsigned integer overflow and potential division by zero in=
 brightness scaling calculation
--

--- Patch [2]: [PATCH V2 2/2] leds: rgb: leds-group-multicolor: Implement d=
efault-intensity ---
commit 3299ece4693e9a064de7eb3b6ca548536d4ca2ef
Author: Stefan Wahren <wahrenst@gmx.net>

leds: rgb: leds-group-multicolor: Implement default-intensity

Currently it is not possible to specify the initial color of a LED multicol=
or
group during boot. This commit implements the default-intensity property
similar to the leds-pwm-multicolor driver, falling back to the maximum
intensity if the property is missing.

> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/=
leds-group-multicolor.c
> index a707d51c6a4bd..f0e6c2a25a070 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -108,8 +108,14 @@ static int leds_gmc_probe(struct platform_device *pd=
ev)
> =20
>  		subled[i].color_index =3D led_cdev->color;
> =20
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity =3D max_brightness;
> +		ret =3D fwnode_property_read_u32(led_cdev->dev->fwnode, "default-inten=
sity",
> +					       &subled[i].intensity);

[Severity: Medium]
Will this parse the default-intensity property from the correct node?

Based on the device tree binding documentation for leds-group-multicolor, t=
he
default-intensity property is expected to be located in the parent multicol=
or
group node.

However, in leds_gmc_probe(), the driver attempts to read it from the
monochromatic sub-LED fwnode instead:

    ret =3D fwnode_property_read_u32(led_cdev->dev->fwnode, "default-intens=
ity",
                                   &subled[i].intensity);

Does this code ignore valid configurations where the property is placed in =
the
parent node according to the schema?

> +
> +		/* In case default-intensity is missing, fallback to maximum */
> +		if (ret)
> +			subled[i].intensity =3D max_brightness;
> +		else if (subled[i].intensity > max_brightness)
> +			subled[i].intensity =3D max_brightness;
>  	}
> =20
>  	/* Initialise the multicolor's LED class device */

[Severity: High]
This is a pre-existing issue, but is there a potential integer overflow and
division by zero when scaling brightness in leds_gmc_set()?

When leds_gmc_set() calculates the brightness for the monochromatic sub-LED=
s,
it uses 32-bit unsigned arithmetic:

drivers/leds/rgb/leds-group-multicolor.c:leds_gmc_set() {
    ...
    mono_brightness =3D DIV_ROUND_CLOSEST(brightness * intensity * mono_max=
_brightness,
                                        group_max_brightness * group_max_br=
ightness);
    ...
}

If the underlying LEDs have high max_brightness values configured (for exam=
ple,
65535 for a PWM period), the numerator can wrap around, resulting in a
calculated brightness of 0.

Furthermore, if group_max_brightness happens to be exactly 65536, the
denominator overflows to exactly 0, which would lead to a division by zero
panic during brightness adjustment.

Could this arithmetic be adjusted to prevent overflows with high brightness
values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802115727.5041=
1-1-wahrenst@gmx.net?part=3D2
