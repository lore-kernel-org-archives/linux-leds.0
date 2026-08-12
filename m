Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96F3FD96E;
	Wed, 12 Aug 2026 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533422; cv=none; b=Vy6brFcphqdIbG06qpOFuINj9+v3Q0Dqe8Vuf78RRQ5B8WDemKOLi9FpbilGAIiHZAs2D6qPgJ3gcv/vLMDtnS6ff+dFe19tA8vojjZPLpWABfJnZmSFUWmVE+DuVxrgiqBzSt2qAHDBMoj2uMRNkXgapVivSFVZCMTEdEpglaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533422; c=relaxed/simple;
	bh=TRgP7Yv8pbjX9wj02/2/0NvysmVT+LsoVPO9If2dsx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0UaP8lTa1i5kAtvKRRPA0cGSxPIOMyzELIJRtDgXao2twpI2OUcAkIDD81TZnfEnCTrNJJJFkjNB0wp/KFfXkTVTbZpil4OL6TctYMZY3DYe0by8yznetRwT+BAZi/B7dk8gklG8PiGgsEOgZSG6WycPNtT8HcrO23vu78uXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvSj/LcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvSj/LcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35271F000E9;
	Wed, 12 Aug 2026 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533420;
	bh=K3eu/2zht12wXyuIEHF2K5H3+j1OZvzg/0m5iIt8lo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GvSj/LcPVcDVlFVF+W5H+d3fc9rvRleVNLeRTLdjw03MMu1JzpcWNS5OgAWrZdryA
	 /Do+pBQUBua2HuCWlz8Xca57XwcpuA020bnRUMAUWSKVfAiTpQLarOXuIEwkakzPAf
	 IK6Nv+zL5Y48QhnitC+u2j1mIZ2CQ5sP0ASzic38xAq7crXm+W7HLqnGcXTXDBDxMM
	 ONpa1EC8zpsPIYfb5JggQltrg1scKAEyqQFuN6oZMnOKLVsqO2LW1oDcF3Y4ESMgcQ
	 f1FqacK7ClF+3aqzNlzN5icDmshWGEKRy8j4ki87rKZ6Hd0DH89XHDSbIuXFXVJWNB
	 0sTxbAexLELEg==
Date: Wed, 12 Aug 2026 12:16:57 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Message-ID: <20260812111657.GI1072730@google.com>
References: <20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com>
 <20260805061648.A41811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805061648.A41811F000E9@smtp.kernel.org>

On Wed, 05 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The use of truncated, pre-calculated constants in `lpg_clk_period_ns` causes the generated hardware PWM period to exceed the requested period, violating the PWM framework constraint.
> - [Medium] Disabling a PWM channel unconditionally clears the hardware FM mode bit but leaves other frequency registers unchanged, causing subsequent get_state() calls to report incorrect values.
> - [Medium] Unprivileged user space or client drivers can spam the kernel log by repeatedly requesting valid PWM periods that trigger an expected fallback path from FM mode to standard mode.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [1]: [PATCH v2] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support ---
> commit 130380cf6f5abd5ee895e64c041b5980974d3c55
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
>     leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
>     
>     Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
>     Mode (FM) that can generate waveforms with more frequency points than
>     the standard LPG PWM mode. The trade-off is that the duty cycle can
>     only be fixed at 50%. Add the FM support. When the PWM channel is
>     requested to set a duty cycle to exactly 50%, use FM mode by default
>     as it provides a finer-grained frequency resolution in that case.
> 
> > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > index d7d6518de30f2..4d39cb8f21673 100644
> > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> [ ... ]
> > @@ -413,10 +425,105 @@ static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
> >  
> >  static const unsigned int lpg_clk_rates[] = {0, 1024, 32768, 19200000};
> >  static const unsigned int lpg_clk_rates_hi_res[] = {0, 1024, 32768, 19200000, 76800000};
> > +static const unsigned int lpg_clk_period_ns[] = {0, 976562, 30517, 52};
> 
> [Severity: Medium]
> Will this truncated precision in lpg_clk_period_ns[] cause the generated hardware period to exceed the requested period?
> 
> The PWM framework requires the generated hardware period to be equal to or less than the requested period. By pre-calculating the clock period and truncating it (e.g., 1000000000 / 19200000 = 52.0833 ns truncated to 52 ns), the division in lpg_calc_freq_fm() uses a smaller period. This yields a larger multiplier, which can result in an actual hardware period that exceeds the originally requested period.
> 
> [ ... ]
> > +		for (exp = 0; exp <= LPG_MAX_M; exp++) {
> > +			/* Calculate pwm_value_lsb for this (clk, exp) pair */
> > +			lsb_tmp = period_ns;
> > +			lsb_tmp = div64_u64(lsb_tmp, clk_period_arr[clk]);
> > +			lsb_tmp >>= (exp + 1);
> [ ... ]
> > +	if (!found) {
> > +		dev_err(chan->lpg->dev,
> > +			"FM: Cannot generate period %llu ns\n", period_ns);
> > +		return -EINVAL;
> > +	}
> 
> [Severity: Medium]
> Is it necessary to log a dev_err() here when a period cannot be generated in Frequency Mode?
> 
> Looking at lpg_pwm_apply() below, when this fails, it explicitly falls back to standard mode gracefully without failing the overall PWM request. This could cause kernel log spam if a user-space application or client driver repeatedly requests valid PWM periods that happen to fall outside of the Frequency Mode hardware limits.
> 
> > +
> > +	chan->clk_sel = best_clk;
> [ ... ]
> > @@ -784,11 +891,23 @@ static void lpg_apply_dtest(struct lpg_channel *chan)
> >  		     chan->dtest_value);
> >  }
> >  
> > +static void lpg_apply_frequency_mode(struct lpg_channel *chan)
> > +{
> > +	struct lpg *lpg = chan->lpg;
> > +
> > +	if (!chan->fm_capable)
> > +		return;
> > +
> > +	regmap_write(lpg->map, chan->base + PWM_FM_MODE_REG,
> > +		     chan->use_fm ? PWM_FM_ENABLE : 0);
> > +}
> 
> [Severity: Medium]
> Does this unconditionally clear the FM mode bit when a channel is disabled?
> 
> In lpg_pwm_apply() when disabling a channel (state->enabled is false), use_fm starts as false. The function sets chan->use_fm = false and calls lpg_apply(). 
> 
> Unlike lpg_apply_freq() or lpg_apply_pwm_value(), which check if (!chan->enabled) and return early, lpg_apply_frequency_mode() will execute the regmap_write() and clear the PWM_FM_MODE_REG.
> 
> This leaves the other frequency and PWM value registers untouched. When lpg_pwm_get_state() is later called to read the state of the disabled channel, it will see FM mode is disabled and incorrectly interpret the lingering hardware register values using the standard mode formulas.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com?part=1

-- 
Lee Jones
