Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081943;
	b=r9A4QNCkiyVxqN2imskgbIe4Qo4nxh67oj+35s/boWp3CteXGHTW6Cn41ALr2uutIJZK
	 Uyj+v1q+I7C0rQndD1pDIIk7FqH1ClUNrkUAwAnKNuzEtdpk8J78b5m564sF6ZsPyEPwb
	 8kcxdc3UhC6Nni62H6fH3TYXWvbjIr5EeVV5O8FHYJ380kgpvb7+EZLLtBB7gMA/XPe42
	 mT5I01o+ibOgESIqwKi+y2IJ6QrzOSBCBDzMvDTr+ROIWez5Gh/SvUJtd1iX/K8CxEQw7
	 Ye9EFBednDrtvFm467sHt+zE8H4OjyWlQaGz6C3txIRjB6nNfcXAx6Lx5uGA4YgZoSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081943;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=+j1gnztevXlUswsw0ge6c+Se1x19hqIf8bjXN0pWbBk=;
	b=WsMuyCMr/zlPRgbA9DwAGD3ZPkx5Sss1cikPVcGHhrBdZJ4/X/OwyhSXdzziU0ak4Ga1
	 Nmv7Y6pyQg8GBJEjr/f/nPH7h4APQ+xC9HTBXMCmOH/ONvhim2yRmQEecK9JLoJSkf/7w
	 SotRLIUo85QunIqssY2AaCRXYVLEjP4bbK/xIGVucAeJgU6kyj/+qkYccWOhUHKd3Pc8A
	 b3HA+T/c1v+s0CE+syI4S9zLwYPwbLz+ynG+7IZodzyq7aQqnLZaN+AOt7jr5zU/sPekx
	 t/wLHjFAIg22VYrN48O9lXNBchi6nsb8MnIq49FnWWnwfYLVoyh/CxvsYWnq7Z7PJ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRtiPftJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804A606A324;
	Thu, 19 Nov 2026 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRtiPftJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10331F000C4;
	Thu, 19 Nov 2026 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795081943;
	bh=+j1gnztevXlUswsw0ge6c+Se1x19hqIf8bjXN0pWbBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRtiPftJvZqhTAsT2hCX3EGmT5OhYIGr3Zcnoh4nmc4HQrnl8dwyLwng3EhVjpc84
	 Ba4du+Dbr4cKKiYVG2chfJ/WMtRWh4uwGHgzZNZ9On1qj12L4HObPGYp7Ap5ndLIVk
	 zG0f3E7qZeU83ZadrG9lbPbHHjBCLpY9DMyb8f3nrDtChH9xwrgsUv4HMnHn7VnXip
	 jYPD7m/vxYdzivGI2WvqgT9ntpOwj35Hk2KABfyhXzPo9YKoeJsI3eNUDAP5oD4r96
	 x8EUNIRLNeQmu4qDXEQE+2+TcQ69bsrTZKXkIczYhWjEP6OfidA83rrEqrP0QwAEJI
	 MsMoHKD5RhOJQ==
Date: Thu, 19 Nov 2026 09:52:18 +0000
From: Lee Jones <lee@kernel.org>
To: Tobias Johansson <tobias.johansson@axis.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] leds: lp50xx: Read default intensity from devicetree
Message-ID: <179442102947.44545.9103121805533352120@kernel.org>
References: <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>
X-AI-Review-Draft: <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>

On Mon, 09 Nov 2026, Tobias Johansson wrote:

Please review, explain or fix the Sashiko review(s).

> Read the default-intensity property for each LP50xx multicolor
> component so that the configured color intensities are available
> when brightness is applied. This allows LEDs to use the intended
> RGB values without first writing multi_intensity from userspace.
>
> Leave the intensity at zero when the property is absent.
>
> Signed-off-by: Tobias Johansson <tobias.johansson@axis.com>
> ---
>  drivers/leds/leds-lp50xx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 20bfb315bda1..019a3e3cad05 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -522,6 +522,8 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  				dev_err(priv->dev, "reg %i out of range\n", multi_index);
>  				return -EINVAL;
>  			}
> +			fwnode_property_read_u32(led_node, "default-intensity",
> +						 &mc_led_info[multi_index].intensity);

(multi_index >= LP50XX_LEDS_PER_MODULE) only tests for values too large.

What happens if `multi_index` is < 0?  OOB?

>  			mc_led_info[multi_index].color_index = color_id;
>  			mc_led_info[multi_index].max_intensity = 255;
>
> ---
> base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
> change-id: 20260914-b4-leds-lp50xx-default-intensity-345d4cc702b4
>
> Best regards,
> -- 
> Tobias Johansson <tobias.johansson@axis.com>
>

-- 
Lee Jones
