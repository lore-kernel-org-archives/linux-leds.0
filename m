Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FB64D1F83;
	Mon, 19 Oct 2026 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421060; cv=none; b=Z58qsr5Zb+BIZ4mMfRsh/qdrPXn0AxZXlAdJVtgVGHHIrBvYxpJyM5mbWPFrn5B1mPwA7UE6+k1kQJELRbj0PVRcHsi4df9inRESTbmi7JI7Fc8Ymy9//WzzkDNQ1z7zV+kYhN4bV37nb9bWi5R1LGPe5VIH+JP3TAzKbTOxMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421060; c=relaxed/simple;
	bh=BzHlguVRDGn243HxthdpSWmhl6vWDFal+ulBsdbrE/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwdX5gyegAqKVKZwVsse11WGRkXeEZMMD5mkTW0RopisraYbdz/dqYt7p5/HSJM//zDpCh8FU2I59NBLSqDpxPJfZvqgpTJnYo2zPjsf0OXMh1EG81+HliSikvv5VfshpRMsJVjLx64P0VDLjl4YPweXoUcQ40nFWv94uWMYBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEn9dHSA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEn9dHSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAB61F000C4;
	Mon, 19 Oct 2026 14:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421059;
	bh=aBNqd6JFNU7OqTTmF0Y9kAceZh0q/au21FecJGMmahc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SEn9dHSAvdTVqt74t/ThZI05e1Do3f8fNCl/QvPs6kWEBDSmmqb2VfoRPLAf/QfUR
	 SiCitR18M/fDCVJTgPPWJzAERkC0qc6Q4EmJ7jsY17ypiHIhpdNz3GWoS6cq0r/8kj
	 BwXhdYbzqxd9VQQHrp2rc8+DCEumQtYNVeFEGWrzB81YlnKkKRJisy+fZXEnQvWy0/
	 E5k8ij2d7kaqeCONS78wYSDvcl9YnvXuGm+xLL2lrKB5EbdeEWI0mePt7EJmDMXTtf
	 6ZRJscYMRIwozHsxBmpB1X5yNvJYPVSrKdiLTP4PTumbNKnnodQEqN+k3o5r9dTPcc
	 +SEIv9EPX6xxw==
Date: Mon, 19 Oct 2026 15:44:13 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max
 current
Message-ID: <179198332384.839288.13126529382772558553@kernel.org>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013180933.487013-3-clamor95@gmail.com>
X-AI-Review-Draft: <20261013180933.487013-3-clamor95@gmail.com>

Wrong subject line.

Please review, explain or fix the Sashiko review(s).
If this is a set, this request includes the other patches too.

> The AAT2870 allows only 32 steps of brightness, with this amount defined
> by the maximum supported current. Remove the need for max_brightness by
> calculating the allowed number of steps from the maximum current.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
> index 8b790df1e842b..eb686e315921d 100644
> --- a/drivers/video/backlight/aat2870_bl.c
> +++ b/drivers/video/backlight/aat2870_bl.c
> @@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
>  	int brightness; /* current brightness */
>  };
>
> -static inline int aat2870_brightness(struct aat2870_bl_driver_data *aat2870_bl,
> -				     int brightness)
> -{
> -	struct backlight_device *bd = aat2870_bl->bd;
> -	int val;
> -
> -	val = brightness * (aat2870_bl->max_current - 1);
> -	val /= bd->props.max_brightness;
> -
> -	return val;
> -}
> -
>  static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
>  {
>  	struct aat2870_data *aat2870
> @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
>  	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
>  		 bd->props.brightness, bd->props.power, bd->props.state);
>
> -	ret = aat2870->write(aat2870, AAT2870_BLM,
> -			     (u8)aat2870_brightness(aat2870_bl, brightness));
> -	if (ret < 0)
> -		return ret;
> +	if (brightness) {
> +		ret = aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
> +		if (ret < 0)
> +			return ret;
> +	}
>
>  	if (brightness == 0) {
>  		ret = aat2870_bl_disable(aat2870_bl);
> @@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_device *pdev)
>  	else
>  		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
>
> -	if (pdata->max_brightness > 0)
> -		bd->props.max_brightness = pdata->max_brightness;
> -	else
> -		bd->props.max_brightness = 255;
> +	/*
> +	 * The maximum number of brightness steps is determined by the max current.
> +	 * The aat2870_current enum maps directly to the allowed brightness steps.
> +	 */
> +	bd->props.max_brightness = pdata->max_current;

What happens if 'pdata->max_current' is 0?  Above, we fall back to
AAT2870_CURRENT_27_9 when assigning 'aat2870_bl->max_current'.  Shouldn't this
use 'aat2870_bl->max_current' instead, and if 'aat2870_bl->max_current' is no
longer used anywhere else, should it be dropped from 'aat2870_bl_driver_data'?

>
>  	aat2870_bl->brightness = 0;
>  	bd->props.power = BACKLIGHT_POWER_ON;
> -- 
> 2.53.0
>

-- 
Lee Jones
