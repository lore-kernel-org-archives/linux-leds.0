Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A2F1FCFFC;
	Thu,  6 Aug 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019534; cv=none; b=UVge96238GDsmVcOFAKyOEMelv+EJkmp68+ZpICSuqg5OIzx/2tKGaP8vwwol44HtQB82NLDPv6yMpYGFIo+UL/gXNXdNQMsGLKxbJD8NxqdFhat6v7c5yOrGdjfLo8Vc2N+Pjh6Um44YX49M+9OiG5EwOLUJDHHppVrVONQrSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019534; c=relaxed/simple;
	bh=smpJYJqF8e3ziYOJtg32MMEL2nNazZZtznKr2xIpgJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjInREWoTQRDZLR6/F+Ng3VgIYtUJ9Pqefp3epHxg+YE0K3l385pueF6CofkDAgAFCbt5YqUkQGWrD3QqZuugk2dohzmLK8EYRlvlwaey5mrC1TOTJOAJotAqpTtsQxCyqKTD8n+8XQbUpxTTsMD1tSGcKt2fQJOTBzGqOp670g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUmljaQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUmljaQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C466B1F000E9;
	Thu,  6 Aug 2026 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786019532;
	bh=XHJNQZ5IFw3CYesDuEowSBW28oxMm5faDddTpKyADcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUmljaQsVgy9oHDNJc4I5IcwLLuOyGyyAdmPGEVsuNL4JVC0SBFCf5pz8BHaIB+64
	 pr2FOff5s/tprtyLfPY5b9bYurxZTGxIRKXLsbR1Sqj4+R79MqLY7K5F7ZXeXhie5P
	 Ivu3ERleLRdLQjp96nGem45tuZwuu+0yHG/XDpKxHZL6+zxeRfnHpTtVyXcsVzRQVA
	 CqfJvZGusiMJ3Ptx+oOZOaizkH2pQs5uejyByVkBNWj5iCLSzXEfRfVKG3FTVE2S/6
	 XBnSJmfE2THUAy1bkEjlggQe9pQbUyEtH/ELv2cinaG2HQtQIv8A+9Ynu4cHzK3lcq
	 KaOKV31EAhdBQ==
Date: Thu, 6 Aug 2026 13:32:09 +0100
From: Lee Jones <lee@kernel.org>
To: kr494167@gmail.com
Cc: pavel@kernel.org, s.trumtrar@pengutronix.de, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: lp5860: fix init error-path locking
Message-ID: <20260806123209.GD2869284@google.com>
References: <20260720104838.98101-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720104838.98101-1-kr494167@gmail.com>

On Mon, 20 Jul 2026, kr494167@gmail.com wrote:

> From: surendra <kr494167@gmail.com>
> 
> lp5860_device_init() unlocks lp->lock after updating the device mode.
> An lp5860_init_dt() failure then jumps to err_disable, which attempts to
> unlock the mutex a second time before disabling the chip.
> 
> Unlock immediately after the register update and keep the common error
> handler lockless.
> 
> Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
> 
> Signed-off-by: surendra <kr494167@gmail.com>

Full names in SoBs please.

> ---
>  drivers/leds/rgb/leds-lp5860-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index fd0e2f6e6e0f..e21d5f2302be 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -204,9 +204,9 @@ int lp5860_device_init(struct device *dev)
>  	mutex_lock(&lp->lock);
>  	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
>  				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
> +	mutex_unlock(&lp->lock);
>  	if (ret)
>  		goto err_disable;
> -	mutex_unlock(&lp->lock);
>  
>  	ret = lp5860_init_dt(lp);
>  	if (ret)
> @@ -215,7 +215,6 @@ int lp5860_device_init(struct device *dev)
>  	return 0;
>  
>  err_disable:
> -	mutex_unlock(&lp->lock);
>  	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
>  	return ret;
>  }
> -- 
> 2.55.0

-- 
Lee Jones
