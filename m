Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EFB4399EE;
	Wed, 22 Jul 2026 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743670; cv=none; b=QRN0CZiNfYkDEAOETuIaYJCwrUvO7f8s9VpzZ54HpfCYlwf6sWzu3T9ZXGugT+UAorCcb1448UraTuwmQcGhmm+rKL9KB9sR+AKt8ddr8/faqUfIz7hBgPu86jUFxw+lrjsVIYAduQrsM+RLTCjYgeugkob71XnWwV0R6WNzHUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743670; c=relaxed/simple;
	bh=rJ+kTvnfaGER1WW6GyZ3Mv9vYdW44osxCNz++p/COac=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hl+VG0Pz0e+EGD1VNgr02+eHYIZWCl5edIb1BTaRGeoFVe9VFg9TQw6iVJOQLoPSt9TVgb6bpv2Od2cTsRJqv+JfzqicNZZzOElzDNV1gaUsZOGOyfbXybOz+s5C3WmsdfVbJOJd/PkAUQx7WtuqfJvhqYDtKyXdOIapXxpXvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lAg6L7D1; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lAg6L7D1"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F0AC2842C1;
	Wed, 22 Jul 2026 20:07:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vzjTGDj5sXH; Wed, 22 Jul 2026 20:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784743658; bh=rJ+kTvnfaGER1WW6GyZ3Mv9vYdW44osxCNz++p/COac=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=lAg6L7D11D1+NE3o0VpKkTQnuLYZMGjZ16rLuwFGNKOT+8o8JIplwTw6Yg0Ow7dZm
	 MoQyE1ZOMPSUF4bp0lcE/G5j1p9B9AKy2Gg6nOKhEZ84iGLzbmQ43oq3FOBPGMxCsb
	 ftzrNsxUc3lEJ0nzU5ypTSWe3eWf04RvDlCcFQbB8wNqErTCkAkzPhVIcbNYUm9ISx
	 I55MGtfLJv5I67XpSLBOq/q+Gc4QbELn3uuYy0yrnMU/BKZUyg4o0CKLWY0WJbx2X1
	 M3r4yBQA+uPQ+EGtMkc+u9WohyolpVeWsrKm/T0SjG/CdN71yYS780PiLYkH1bun2t
	 SQLMRUcyPJAYw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 23:37:31 +0530
Message-Id: <DK5ATMJWZJ1H.T34TPO0MO3N8@disroot.org>
Cc: <kauschluss@disroot.org>, <linux-leds@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] leds: rgb: s2m: Wire up of_match_table in
 platform driver
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: <kr494167@gmail.com>, <lee@kernel.org>, <pavel@kernel.org>
References: <20260722161519.9610-1-kr494167@gmail.com>
 <20260722161519.9610-2-kr494167@gmail.com>
In-Reply-To: <20260722161519.9610-2-kr494167@gmail.com>

On 2026-07-22 21:45 +05:30, kr494167 wrote:
> From: Surendra <kr494167@gmail.com>
>
> The driver defines and registers s2m_rgb_of_match_table via
> MODULE_DEVICE_TABLE(of, ...) but never assigns it to the platform
> driver's .of_match_table field. As a result, the kernel never matches
> this driver against a DT node with compatible "samsung,s2mu005-rgb",
> making the MODULE_DEVICE_TABLE entry dead code.
>
> Wire the table up so that DT-based probing and module auto-loading
> work as intended. In addition, validate dev->parent in s2m_rgb_probe()
> to prevent a NULL pointer dereference if probed without parent driver dat=
a.
>
> Fixes: 63ccd117f425 ("leds: rgb: Add support for Samsung S2M series PMIC =
RGB LED device")
> Signed-off-by: Surendra <kr494167@gmail.com>
> ---
>  drivers/leds/rgb/leds-s2m-rgb.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/rgb/leds-s2m-rgb.c b/drivers/leds/rgb/leds-s2m-=
rgb.c
> index d239f54eee90..7ac2b1160c1e 100644
> --- a/drivers/leds/rgb/leds-s2m-rgb.c
> +++ b/drivers/leds/rgb/leds-s2m-rgb.c
> @@ -363,11 +363,18 @@ static const struct mc_subled s2mu005_rgb_subled_in=
fo[] =3D {
>  static int s2m_rgb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct sec_pmic_dev *pmic_drvdata;

This seems to be a separate change. I guess it's preferable having it
as a separate patch.

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

1. This is a MFD sub-device, dev->parent shall always be present. But
there's no harm in being extra careful here.

2. For error codes other than -ENOMEM, we do not return from probe this
way, instead:

	return dev_err_probe(dev, -ENODEV, "error message\n");

>  	rgb =3D devm_kzalloc(dev, sizeof(*rgb), GFP_KERNEL);
>  	if (!rgb)
>  		return -ENOMEM;
> @@ -415,6 +422,7 @@ MODULE_DEVICE_TABLE(of, s2m_rgb_of_match_table);
>  static struct platform_driver s2m_rgb_driver =3D {
>  	.driver =3D {
>  		.name =3D "s2m-rgb",
> +		.of_match_table =3D s2m_rgb_of_match_table,

By the way, it works just fine without it, when built as a module.

The reason it wasn't added was in a comment in a previous revision [1],
but it was removed after reviews.

[1] https://lore.kernel.org/all/20260225-s2mu005-pmic-v3-9-b4afee947603@dis=
root.org/

>  	},
>  	.probe =3D s2m_rgb_probe,
>  	.id_table =3D s2m_rgb_id_table,

