Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB069415F04;
	Wed, 12 Aug 2026 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535354; cv=none; b=kEqDRSlYZHSIxWmTysgpQ8KwsXS0bXDHk2mqEhFE+98mGDwGMBveUBXuWu1gAzR1lVmkbTzAjJjgqMVHWwMcqb0YvcRXNeY0CQsiVmFhkTs3pUDIECyrZAp36HV4CZMe19+JyhNA+J7y5W0ZxkMdyg73hdl2ZFJyNLf6HrPfT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535354; c=relaxed/simple;
	bh=O5QfDXkQPR1v0lL81/QnW71DoXuZvYROA4M4nhDk+ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqByjgjl0dZLQpnqG/qCg6OQU7VqJ8AYVhtwU04vaPXZd74SV8bmrv/nVRIoIGcKzXmlY8DjSU4DMNm1QKzvpKSJygbibrsiPI0EZw+QRhrYn2m3vlnJCqYlRsF+hVgy37KIrgmTasWPKjmDyTzsFxSy7AChS2+T9UCWpnKyGtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxsqoQBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxsqoQBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E5B1F000E9;
	Wed, 12 Aug 2026 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786535353;
	bh=wvtn8+Hg8XXxnR/RECDRpEosppKPyAiBlZW5iL0iBbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZxsqoQBasq2Y6dNgW08AsIqEHOnxMLUdaTUWMN4H7FhWG4CJ0CUm21UbEC4mDrzGu
	 RK6s/74K3QIdHy11+Fpvt5NtmUTveGLcfxSIccrt9EwGbmUacceoZoKzNR1jogTCoE
	 0WG7WHVatql7bJt+1cvBT93QAqY/eTIjIJL8XXu3dIU/sI8lmtgnkLUg2p918S/5mQ
	 iYq1wViM7bqtXpms/otQY95Svz3IMPvqdW3e1uObJHMfpJ5UqG66lrzelG5OtF8a8Q
	 J9UXM/jmRYohjsKzcovSmLAlfRd2cHhehG1qfm99OA7GpKRFnR9RhjAM8rnorlhJU6
	 zU9+xin653XtA==
Date: Wed, 12 Aug 2026 12:49:09 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: kr494167@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: lp5860: fix LED teardown ordering using
 devm_add_action_or_reset()
Message-ID: <20260812114909.GL1072730@google.com>
References: <20260806145527.114844-1-kr494167@gmail.com>
 <20260806150309.D22311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806150309.D22311F000E9@smtp.kernel.org>

On Thu, 06 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional self-deadlock during probe due to incorrect lock lifetime using `guard(mutex)`.
> - [Low] Undeclared variable `ret` used in `lp5860_probe()`.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [1]: [PATCH v2] leds: lp5860: fix LED teardown ordering using devm_add_action_or_reset() ---
> commit fa14917dcf9d1637bf1292a82596892d65e73078
> Author: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> leds: lp5860: fix LED teardown ordering using devm_add_action_or_reset()
> 
> The driver previously disabled the chip in its remove callback before devres
> unregistered the LEDs. This patch fixes the teardown ordering by registering a
> devm action to disable the chip, ensuring it happens after LED unregistration.
> It also converts mutex initialization to use devm_mutex_init().
> 
> > diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> > index fd0e2f6e6e0f4..bbe299e36ad53 100644
> > --- a/drivers/leds/rgb/leds-lp5860-core.c
> > +++ b/drivers/leds/rgb/leds-lp5860-core.c
> [ ... ]
> > @@ -197,38 +204,24 @@ int lp5860_device_init(struct device *dev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = devm_add_action_or_reset(dev, lp5860_disable_action, lp);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/*
> >  	 * Set to 8-bit PWM data without VSYNC.
> >  	 * Data is sent out for display instantly after received.
> >  	 */
> > -	mutex_lock(&lp->lock);
> > +	guard(mutex)(&lp->lock);
> >  	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
> >  				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
> >  	if (ret)
> > -		goto err_disable;
> > -	mutex_unlock(&lp->lock);
> > -
> > -	ret = lp5860_init_dt(lp);
> > -	if (ret)
> > -		goto err_disable;
> > -
> > -	return 0;
> > +		return ret;
> >  
> > -err_disable:
> > -	mutex_unlock(&lp->lock);
> > -	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
> > -	return ret;
> > +	return lp5860_init_dt(lp);
> 
> [Severity: High]
> Does this code introduce a self-deadlock during probe?
> 
> By replacing the explicit mutex_lock/unlock with guard(mutex), the lock
> lifetime is extended to the end of lp5860_device_init(). This means the
> lock is held while calling lp5860_init_dt().
> 
> However, lp5860_init_dt() eventually calls lp5860_set_mc_brightness(),
> which attempts to acquire the exact same lock:
> 
> drivers/leds/rgb/leds-lp5860-core.c:lp5860_set_mc_brightness() {
>     ...
>     guard(mutex)(&led->chip->lock);
>     ...
> }
> 
> Since Linux mutexes are non-recursive, will this cause an unconditional
> deadlock during initialization?
> 
> >  }
> >  EXPORT_SYMBOL_GPL(lp5860_device_init);
> >  
> > diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
> > index 5e0c44854a680..13ad90362d5f0 100644
> > --- a/drivers/leds/rgb/leds-lp5860-spi.c
> > +++ b/drivers/leds/rgb/leds-lp5860-spi.c
> [ ... ]
> > @@ -61,22 +61,15 @@ static int lp5860_probe(struct spi_device *spi)
> >  				     "Failed to initialise Regmap.\n");
> >  
> >  	lp5860->dev = dev;
> > -	mutex_init(&lp5860->lock);
> > +	ret = devm_mutex_init(dev, &lp5860->lock);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: Low]
> Is the ret variable declared in lp5860_probe()?
> 
> It looks like the local variable ret was never declared in this function,
> which will cause a build failure.
> 
> >  
> >  	spi_set_drvdata(spi, lp5860);
> >  
> >  	return lp5860_device_init(dev);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260806145527.114844-1-kr494167@gmail.com?part=1
> 

-- 
Lee Jones
