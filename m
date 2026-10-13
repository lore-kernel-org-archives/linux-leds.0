Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B3477292;
	Tue, 13 Oct 2026 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915413; cv=none; b=N1kMYorZRO6s9BH6y7aambHkPVqTUrx+0JLOo82e4TgBQGmUEBLzPpsQgSfP0nJvdTtqc3B+Z86nuULuZ6w/Xduf5tzsuYkf0LA0G8rhMkWf4EZDMIB3t3wiAdHE2oP/XGpCJMm9OZgggcyO49IjU1zdzV+nz8BhfnlkrLVFUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915413; c=relaxed/simple;
	bh=cOIlXwh//bc5iAVtNk61YMw0SAcrFYA3K7qWfVU2cxw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jg9zGWrs67hHHFEA3+9jAdsEE86ZXVyaUGtQehlAwe2748sERDnK3v3QwkHZpRmr1EEKAzvZ5YQalCZw/jqhuqtNl7JD42WJc/3wHEqtbk0bMZZD9W03vWD8kk+XZABZTkQhzdoMZ/vySEMUJTKafNS7lQZYTxI1YOhdaOAQ3g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlTNQhot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlTNQhot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BF91F000FF;
	Tue, 13 Oct 2026 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915404;
	bh=d6gxlL56eKPPYrcopIYJhrR06Tfnwl5dj59P0UUTSdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlTNQhot4IAe+alzJ1Kz/Nzi34UQqutbyaGH/XDZKQ+WJZ42YUJaGO6YfSqyRodgb
	 Yjh/NvboeZ79UChx//oILxERYt10coxahIuoPfKKNFffNmvr85Ktuj+OP9qVq2zVcg
	 8l8UwZfpeyuuFq+unxUUCDaW1Eq4Ykc5dWVJPkUx3JLNMfR26Z6NgoCyDRJdwHLY6e
	 7zdRd4nAssmWe9398XJpWV6N0K4VUj5JFKmCiDl4BTNdA1Z5BxI3/Xs2HSCkyhM/o8
	 OgzHxaW9LvWONaMfIqgUhiqh0sNVV35I7EWux7/j8cuuUYjKUpRMQ5q5fincbkhRQy
	 HdH42QdJSPTPw==
Message-ID: <sashiko-outbox-170306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max
 current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261013180933.487013-3-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:16:44 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: aat2870: Backlight max_brightness incorrectly initialized to 0
--

commit 236a2bd14466123f025d53f0e3094d82e1e098d7
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: aat2870: Derive brightness steps from max current

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

> diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlig=
ht/aat2870_bl.c
> index 8b790df1e842b..eb686e315921d 100644
> --- a/drivers/video/backlight/aat2870_bl.c
> +++ b/drivers/video/backlight/aat2870_bl.c
[ ... ]
> @@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_device =
*pdev)
>  	else
>  		aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> =20
> -	if (pdata->max_brightness > 0)
> -		bd->props.max_brightness =3D pdata->max_brightness;
> -	else
> -		bd->props.max_brightness =3D 255;
> +	/*
> +	 * The maximum number of brightness steps is determined by the max curr=
ent.
> +	 * The aat2870_current enum maps directly to the allowed brightness ste=
ps.
> +	 */
> +	bd->props.max_brightness =3D pdata->max_current;

[Severity: High]
Should this be assigning aat2870_bl->max_current instead of
pdata->max_current?

If pdata->max_current is 0, this bypasses the fallback logic applied just
above and assigns 0 to bd->props.max_brightness. Could this cause a
regression where aat2870_bl_update_status() rejects all valid positive
brightness updates?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013180933.4870=
13-1-clamor95@gmail.com?part=3D2
