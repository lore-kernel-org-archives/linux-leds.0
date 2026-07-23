Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD535AC37
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825796; cv=none; b=qHSUv46VYNleTI7ocv2wVHUJgXUx8yW+cg/v2kUCeaJGxP3O9BqxhW06Sp9QfoISjuFlid7i9CId0hgF54xpvYpqhxP78B0F4dT5wv/Myed/Mbake68g783d3vbrgiaySA/dlC87ZBHL8KK0LGRMo/VhBDuQFzDGMIa1qgl82Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825796; c=relaxed/simple;
	bh=PXKrxLEt/wosASE/73m4SoEFZgdDYbBYXa7LIgmfVn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FcvvHeGagniAY9B+VNUjNcBo3tcf8Jn2G8ge+VFqbnIj3TRwzpk/yHo0jrbE2B1uWnkaJ3PLHEpr5VO9mWanbsSIf2PNDzTXCqO/CIShTvoJRune4LyzpX0pnq3SWNFZWkPqYtovCh8HESqD11apnQXcGNg5j20WeVJs8OpfB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3x+JcAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3x+JcAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83C31F000E9;
	Thu, 23 Jul 2026 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825795;
	bh=e9CzAFQuwAp+YYy3+LVSBqeTP3/Y+iiLGXNilmKcrtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3x+JcAn5dWcaycwdE0SAfez2Wu3nYLdGgBoev3JyZinkkaSrqrgKcT6+I0jYB4H1
	 PkpMviOH0hFSi0BBlqpI+vXLKmgV3aXsbkPFKeI2Elen37iRoVgUTaaAgmpa8h50Gl
	 X03J3Mm2CfEbl2U5ais60gjTZXgjq6RwnyY5nonBruG8ZemjiPDbpx7tdcUwpb1KJl
	 6s1moUFdzUEEtJhji3WOvvbxIzvCVX34EoE/uOqxdBXpSs/iZSisdsXAJF6ECwD2EK
	 Yj7H/ZBS8kJMY73c8nHiJfhSBS5V2YPwVRzIcwwRY1AH0lknw54ENZpQCMb7z3hXIM
	 tZnpQ/pbqlawA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] leds: lp8788: convert to dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260723164612.3146-2-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
 <20260723164612.3146-2-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:56:32 +0000
Message-Id: <20260723165633.E83C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.

Pre-existing issues:
- [High] The driver directly mutates a global static configuration structur=
e during initialization, causing cross-contamination between devices or acr=
oss probes.
--

--- Patch [2]: [PATCH v2 2/4] leds: lp8788: convert to dev_err_probe() ---
commit 757b3eb36736561a1f3fc533b95dcae04a897dbc
Author: Arunachalam <arun07172003@gmail.com>

leds: lp8788: convert to dev_err_probe()

This patch replaces open-coded dev_err() and return sequences with
dev_err_probe() in the lp8788 driver. It improves error handling and proper=
ly
manages deferred probing.

> leds: lp8788: convert to dev_err_probe()

[Severity: Low]
This isn't a bug, but should the word "convert" be capitalized to match
the LED subsystem commit naming conventions?

> diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
> index 9b9525ccca157..259ac50e8498f 100644
> --- a/drivers/leds/leds-lp8788.c
> +++ b/drivers/leds/leds-lp8788.c
> @@ -143,16 +143,12 @@ static int lp8788_led_probe(struct platform_device =
*pdev)
>  	mutex_init(&led->lock);
> =20
>  	ret =3D lp8788_led_init_device(led, led_pdata);

[Severity: High]
This is a pre-existing issue, but does modifying the global configuration=20
structure cause cross-contamination between devices?

Looking at lp8788_led_init_device() in drivers/leds/leds-lp8788.c:

static int lp8788_led_init_device(struct lp8788_led *led,
                                  struct lp8788_led_platform_data *pdata)
{
        struct lp8788_led_config *cfg =3D &default_led_config;
        ...
        if (pdata) {
                cfg->scale =3D pdata->scale;
                cfg->num =3D pdata->num;
                cfg->iout =3D pdata->iout_code;
        }

If there are multiple instances, modifying cfg (which points to the
global default_led_config) might cause subsequent instances without platform
data to inherit the mutated configuration rather than the defaults. Could
we make a local copy of the configuration instead?

> -	if (ret) {
> -		dev_err(dev, "led init device err: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "led init device err\n");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164612.3146=
-1-arun07172003@gmail.com?part=3D2
