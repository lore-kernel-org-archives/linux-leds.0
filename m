Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD53FC5AB;
	Thu,  9 Jul 2026 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588441; cv=none; b=opKhCttaxO2r80ona9ebn23KJoeDlG06w3aKOgoorJkCBDwPp50X7TOjZX4wLbQP7ExPHYjgviVi3bkVQUl4bA4QwmPkndTZiVqMn8d89x5JY/oBOkszbjB7b7+eQmA+uMxV/42/aS4Bn/iCCVuxLiivDTAydxZFJgXXr72bFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588441; c=relaxed/simple;
	bh=vNq1wsNr9lQ+0z71LFnZmGLimBKqoami+YGUG2/Pf/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLlfQqQaGNo2pz81BlJ/tMA8rySvp6K9w/aRNsH1xC8qXuikywXv8B2wvhhw2GPI2UBiaPaKyZXemgmbMCQsOVnhrHWn0QXU5ShG8C0g5U/UNJYVLDKNC1u6/uhMJTO0l4at/nWkr/KeMfDm1x2HLGG3If8l/PrBaokrUJ+3zr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8kQEEP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8kQEEP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166C81F000E9;
	Thu,  9 Jul 2026 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588439;
	bh=wcRYlrRxH5YTdS8aip1E3DXRidbYYtKSRXKi/B8atXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8kQEEP5w+mHTJCHtBYYWDS9V+GB8VAecU2869vo304qxrxVdhaTE1fBwlo6f7wq1
	 AHenbAs/IPNmvkQZtvFu/sKHmD+3ji53eVAYqF3mUbWFRKhBYVlBelR3veJLbfgUGq
	 fiEXVaWzNfojEPWmISTkAleZ1q1jUmJ7LOhUuAoyNoCkrnpOt4VXW2e20z6OdbSUvE
	 PfVbkq92u9UwDjCt2WehwY5Bg5fTT7v/0VWSaqtf/XIOy3NdbLWSyes3l5dULajbDc
	 7nidPKU1jmtZoHy6bP9OaLvhcg4dCZ4N8QmZNklvxNm/Tz9lEg8u9sbdeWDJDGWyAi
	 UJcM8xOXAiBSw==
Date: Thu, 9 Jul 2026 10:13:56 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Mert Seftali <mertsftl@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: pwm: Annotate leds[] with __counted_by()
Message-ID: <20260709091356.GA2045740@google.com>
References: <20260702155452.67594-1-mertseftali@web.de>
 <20260702160459.9BC4E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702160459.9BC4E1F00A3A@smtp.kernel.org>

On Thu, 02 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The addition of the `__counted_by(num_leds)` annotation causes an unconditional out-of-bounds trap during probe.

Can you provide comment or remediation please?

> --
> 
> commit f2069ade09481403f091ed2758ef698b0c75c2cc
> Author: Mert Seftali <mertsftl@gmail.com>
> 
> leds: pwm: Annotate leds[] with __counted_by()
> 
> This commit adds the __counted_by(num_leds) attribute to the flexible array
> member leds[] in struct led_pwm_priv for bounds checking. It also updates
> led_pwm_add() to accept the led_pwm_data element directly, leaving num_leds
> to be incremented in the caller.
> 
> > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > index 6c1f2f50ff854..dabdf04235826 100644
> > --- a/drivers/leds/leds-pwm.c
> > +++ b/drivers/leds/leds-pwm.c
> > @@ -36,7 +36,7 @@ struct led_pwm_data {
> >  
> >  struct led_pwm_priv {
> >  	int num_leds;
> > -	struct led_pwm_data leds[];
> > +	struct led_pwm_data leds[] __counted_by(num_leds);
> >  };
> 
> [ ... ]
> 
> > @@ -193,9 +191,10 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
> >  
> >  		led.default_state = led_init_default_state_get(fwnode);
> >  
> > -		ret = led_pwm_add(dev, priv, &led, fwnode);
> > +		ret = led_pwm_add(dev, &priv->leds[priv->num_leds], &led, fwnode);
> 
> [Severity: High]
> Does evaluating &priv->leds[priv->num_leds] before incrementing num_leds
> trigger an out-of-bounds trap under UBSAN_BOUNDS or FORTIFY_SOURCE?
> 
> Because leds is now annotated with __counted_by(num_leds), the compiler
> expects the valid indices to be less than num_leds. When this loop starts
> in led_pwm_create_fwnode(), priv->num_leds is initially 0. Taking the address
> of index 0 when the count is 0 will fail the bounds check and trigger a
> splat during driver probe.
> 
> >  		if (ret)
> >  			return ret;
> > +		priv->num_leds++;
> >  	}
> >  
> >  	return 0;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260702155452.67594-1-mertseftali@web.de?part=1

-- 
Lee Jones
