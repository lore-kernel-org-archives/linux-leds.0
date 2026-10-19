Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DDF331EB8;
	Mon, 19 Oct 2026 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411230; cv=pass; b=Vcgwfx0Nw5WHdK/vFkzTBpnGW5RQ9qVokNtPmSKqHbXU49bNW2m2hm0x/gDXe/VWGaMZP2bF1FPvcUrsgomfMyjAR9fhE2UFB8vIQzL+GQWUr3elyK+38HM+nDpYOQ46o9yE0ZCeqtFMMS9lc5l9wPq45reHtNvbhgcquUlQmU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411230; c=relaxed/simple;
	bh=4OHHxQhZBBCjsrkGA25xIASIYzzJUDnrs1vWa4Nc60c=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LMzlk4xftE3BdvK3pAiq2PZbWVLJFjKAgtQclWTWpkINcyqiPK3qK9ubcD5BCz5Eg+GaDTMToKV7gUQmITel7WfuhBh+ws8yboPIzHPp1r6UDxRSw6mVPRYNUtXf+fxZZtQyPKPAWVXagQuFjlxfhA+YMkSeNQ5iECBuPDs0ock=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WM0daakc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WM0daakc"
ARC-Seal: i=1; a=rsa-sha256; t=1792411223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ml95xptg8kGNxUgXi1lhlNaurJNKlhSifEI8YNCvi6E8ouNKsXP5ime0e4crUJjjzAX9qexB6tA0GPF2bLIZwDXP7pGMcvqrYiGb3qa8/01YpvktKFp2dEVDfQLMPj1Cth//sOu7dp1YnA0b5apRV8FDebNlB+XbQK8IhjbsNi4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792411223; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=26bXN4Bu7on4psJb8ckerwsQrlSiwrNIOlQD+EwXNHA=; 
	b=QK5b5v8GP+s/vE9AJOG5vL4/ZW9JXacJbDiYQunEyd5riJKSBkIJOdPD8xS8q1jc2D/YcLuemzQjRFGKZ7rKzI1FkHrijBHX0RgThXR8xxl4EEBme/115emCrEWQgYrSQBrtA6xQXaBJ3EZaHQimGoOEfBetxncdX5fEhhiwQuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792411223;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=26bXN4Bu7on4psJb8ckerwsQrlSiwrNIOlQD+EwXNHA=;
	b=WM0daakcUgK3I4x+sa8XMGxv737jqhxYEEkC75hlRyBhwFkKUvKi7+vxnrK40vcs
	KvoAhutQ2BtitvS/FIrVr2r5wJcK8Amnq29LKCUogTGdY8N0x0Nod+2B5wZ/jML9Kw8
	5XktR+DYZ0djHD2lPF2V5Yf4JB9WCz4IQZNnaaPGiHdI4inLl1UdWVWZv2MRaixXDd5
	Nn+Cb9isaJjTHMxprDMomv+gczVmQeqIvlXTDiwhISxN6bnedVjmaz3zhO5eWndKBFY
	sFX8BiQxYS0BSCvlhOJFQIyI9xjJZzSOd+vA0ixTVwI1dz3I+qZUiolF/opNamxYAJp
	HFAt608b6Q==
Received: by smtp.zohomail.com with SMTPS id 1792411220966830.1771096378308;
	Mon, 19 Oct 2026 05:00:20 -0700 (PDT)
Message-ID: <9a13ff3a5d799a50cc1353b94af9be6c70d87f47.camel@rong.moe>
Subject: Re: [PATCH 10/10] leds: multicolor: Adjust maximum subled
 intensity during initialization
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018135339.1109271-11-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
	 <20261018135339.1109271-11-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:54:07 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Armin,

Nice cleanup!

On Sun, 2026-10-18 at 15:46 +0200, Armin Wolf wrote:
> The maximum brightness of a LED device is fixed after having called
> led_classdev_init(), so performing the adjustment during runtime is
> no longer necessary.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/leds/led-class-multicolor.c | 40 ++++++++++++-----------------
>  1 file changed, 16 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class=
-multicolor.c
> index 9b8c37f7bdf4..875c615c33fc 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -14,24 +14,6 @@
>  #include <linux/uaccess.h>
>  #include "leds.h"
> =20
> -static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcl=
ed_cdev, size_t index)
> -{
> -	unsigned int max_intensity;
> -
> -	/*
> -	 * The maximum global brightness value might still be changed by
> -	 * led_classdev_register_ext() using devicetree properties. This
> -	 * prevents us from changing subled_info[X].max_intensity when
> -	 * registering a multicolor LED class device, so we have to do
> -	 * this during runtime.
> -	 */
> -	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
> -	if (max_intensity)
> -		return max_intensity;
> -
> -	return mcled_cdev->led_cdev.max_brightness;
> -}
> -
>  int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>  				 enum led_brightness brightness)
>  {
> @@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct device=
 *dev,
>  {
>  	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>  	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
> -	unsigned int max_intensity;
>  	int len =3D 0;
> =20
> -	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
> -		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
> -		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		len +=3D sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].max_=
intensity);
>  		if (i < mcled_cdev->num_colors - 1)
>  			len +=3D sprintf(buf + len, " ");
>  	}
> @@ -98,8 +78,8 @@ static ssize_t multi_intensity_store(struct device *dev=
,
>  		goto err_out;
>  	}
> =20
> -	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
> -		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
>  		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_i=
ntensity);
>  	}
> =20
> @@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct devi=
ce *parent,
>  	if (ret < 0)
>  		return ret;
> =20
> +	/*
> +	 * The maximum global brightness value might still be changed by

s/still be/have been/ ?

Thanks,
Rong

> +	 * led_classdev_init() using devicetree properties. Because of this
> +	 * we can only adjust subled_info[X].max_intensity after said function
> +	 * was called.
> +	 */
> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++)
> +	{
> +		if (!mcled_cdev->subled_info[i].max_intensity)
> +			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightness=
;
> +	}
> +
>  	led_cdev->dev->type =3D &led_multicolor_device_type;
>  	ret =3D led_classdev_add(led_cdev);
>  	if (ret < 0)
