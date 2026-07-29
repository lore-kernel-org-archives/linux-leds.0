Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9E414A0E
	for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319119; cv=none; b=VF5PuEkPRxq9thE2/DHeOSpySvfu2y2R6H37QTsfqfqIzkOcuPpoDFvvb9wgOdUx5xQUIX1vLWo3zwOsinXG5P0+iM+Z3xxte3WT9P3z1AbJ2XVmE8mBlzsKSgRUt1wbgebr4Jmui9B1SlVFbkRGthWPqHyFuSTT/Pt1NIE0Lig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319119; c=relaxed/simple;
	bh=ihZU8UyZW8856lKHStxhcX9fjQXkd5dT6+JRY9qim5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cAmPyeQ8sdXY0RWAcemkUhWT0lLrB1nbIzswIxVk3IYnqoejxEZZpaArYboLfnjaTSdlO/LyH5cwmhyXQ/EZ3nAKxuK0rG72OOgezwmfxVZI8+k9/OeNJG1WM/Jr6SYSFcEgvag+qmosg6WYc91HinICxhn4/ri5HL9zV83LRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BakD2wiL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BakD2wiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2C31F000E9;
	Wed, 29 Jul 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319117;
	bh=8lMTB0pbzAT0Jd0QT9aIIbnBV/8I7x47vuCNpobpTeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BakD2wiLhK9VPSyVWFaDSiio6SKARq8dzNBigflZYk+664NxIrlAoPbvi+sqYIKMs
	 70I4FMdXoflK+spnEgHVUhpBWe1WHURmm7jBSYph2PFe1IkwvdH5Rn6o2cB27ttriI
	 CMBNPk+q6DWKZLUeRUQ/ta2PsF5gjpcZ75DBrpzTULNoWpHvCGtmPbnUuxkzn0GeD+
	 bVg2lfi+3jLaeTnunI61R/QSU+PEtbbfsOE2gXPoDilA0zsTPNL78acYeZvhbtVhZU
	 2Om4UA+WB34Jd8SBkQSqug4/3mii4/Spxdeb5FoXNMjI8+//uW45JuSpxoN7jfpHMC
	 KnFIk3P54vqBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
References: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 09:58:36 +0000
Message-Id: <20260729095836.EE2C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The FM mode frequency calculation uses truncated clock periods, =
causing the driver to select configurations that generate a hardware period=
 longer than requested, which violates the PWM API contract.
- [Medium] The driver unconditionally logs a `dev_err` when the opportunist=
ic FM mode fallback fails, allowing unprivileged userspace to spam the kern=
el log (DoS vector).
- [Medium] Disabling the PWM unconditionally clears the FM mode hardware bi=
t, causing subsequent state readbacks to return severely corrupted period a=
nd duty cycle values.
--

--- Patch [1]: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode sup=
port ---
commit 7ebdd4f9eacf70734e7346f7608c74a404663422
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
   =20
Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency Mode
(FM) that can generate waveforms with more frequency points than the standa=
rd
LPG PWM mode. Add FM support so that when the duty cycle is requested to be
exactly 50%, FM mode is used by default for finer-grained frequency resolut=
ion.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index d7d6518de30f2..166009ef53af8 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
[ ... ]
> @@ -413,10 +425,105 @@ static int lpg_lut_sync(struct lpg *lpg, unsigned =
int mask)
> =20
>  static const unsigned int lpg_clk_rates[] =3D {0, 1024, 32768, 19200000};
>  static const unsigned int lpg_clk_rates_hi_res[] =3D {0, 1024, 32768, 19=
200000, 76800000};
> +static const unsigned int lpg_clk_period_ns[] =3D {0, 976562, 30517, 52};
>  static const unsigned int lpg_pre_divs[] =3D {1, 3, 5, 6};
>  static const unsigned int lpg_pwm_resolution[] =3D {6, 9};
>  static const unsigned int lpg_pwm_resolution_hi_res[] =3D {8, 9, 10, 11,=
 12, 13, 14, 15};
> =20
> +static int lpg_calc_freq_fm(struct lpg_channel *chan, uint64_t period_ns)
> +{
[ ... ]
> +	for (clk =3D 1; clk < clk_len; clk++) {
> +		last_err =3D U64_MAX;
> +
> +		for (exp =3D 0; exp <=3D LPG_MAX_M; exp++) {
> +			/* Calculate pwm_value_lsb for this (clk, exp) pair */
> +			lsb_tmp =3D period_ns;
> +			lsb_tmp =3D div64_u64(lsb_tmp, clk_period_arr[clk]);

[Severity: Medium]
Will this division by a truncated nanosecond value (e.g. 52 ns instead of
52.0833 ns for the 19.2MHz clock) artificially increase the computed LSB?

The PWM framework API contract expects the actual generated period to be
equal to or less than the requested period, but this calculation causes the
hardware period to exceed the requested period.

> +			lsb_tmp >>=3D (exp + 1);
[ ... ]
> +	if (!found) {
> +		dev_err(chan->lpg->dev,
> +			"FM: Cannot generate period %llu ns\n", period_ns);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Since the caller lpg_pwm_apply() gracefully falls back to standard mode
when this returns an error, will unconditionally logging a dev_err allow
unprivileged userspace to spam the kernel log with period requests outside
the FM mode bounds?

> +
> +	chan->clk_sel =3D best_clk;
> +	chan->pre_div_exp =3D best_exp;
[ ... ]
> +static void lpg_apply_frequency_mode(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg =3D chan->lpg;
> +
> +	if (!chan->fm_capable)
> +		return;
> +
> +	regmap_write(lpg->map, chan->base + PWM_FM_MODE_REG,
> +		     chan->use_fm ? PWM_FM_ENABLE : 0);
> +}

[Severity: Medium]
When disabling the PWM in lpg_pwm_apply(), state->enabled is false, which
causes chan->use_fm to be set to false.

Will this unconditionally write 0 to the register, clearing the FM mode
status bit while leaving the clock values intact as FM values?

If the driver is unbound and rebound, or if the hardware state is read back
upon export, this could cause the driver to incorrectly interpret the FM
values using standard mode formulas, yielding corrupted period and duty cyc=
le
values.

[ ... ]
> @@ -1230,28 +1349,42 @@ static int lpg_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
[ ... ]
>  	if (state->enabled) {
> -		ret =3D lpg_calc_freq(chan, state->period);
> -		if (ret < 0)
> -			goto out_unlock;
> +		use_fm =3D chan->fm_capable && (state->duty_cycle =3D=3D state->period=
 / 2);
> =20
> -		lpg_calc_duty(chan, state->duty_cycle);
> +		if (use_fm) {
> +			ret =3D lpg_calc_freq_fm(chan, state->period);
> +			/*
> +			 * fallback to use the standard mode if frequency
> +			 * mode couldn't satisfy the requested period
> +			 */
> +			if (ret < 0)
> +				use_fm =3D false;
> +		}
> +
> +		if (!use_fm) {
> +			ret =3D lpg_calc_freq(chan, state->period);
> +			if (ret < 0)
> +				return ret;
> +
> +			lpg_calc_duty(chan, state->duty_cycle);
> +		}
>  	}
> +
> +	chan->use_fm =3D use_fm;
>  	chan->enabled =3D state->enabled;
> =20
>  	lpg_apply(chan);
[ ... ]
> @@ -1296,9 +1432,32 @@ static int lpg_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
[ ... ]
> +		if (fm_active) {
> +			if (clk_idx >=3D ARRAY_SIZE(lpg_clk_period_ns))
> +				return -EINVAL;
> +
> +			/*
> +			 * FM period formula:
> +			 *   period =3D 2 * (pwm_value_lsb + 1) * (2^exp) * clk_period_ns
> +			 */
> +			pwm_value &=3D 0xff;
> +			state->period =3D (u64)2 * (pwm_value + 1) * (1 << m) *
> +					lpg_clk_period_ns[clk_idx];

[Severity: Medium]
Does calculating the state back into nanoseconds using the same lossy clock
period array also cause inaccurate state readbacks here?

> +			state->duty_cycle =3D state->period / 2;
> +		} else {
> +			state->period =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
> +					((1 << resolution) - 1) * pre_div * (1 << m), refclk);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-lpg-pwm-fm=
-support-v1-1-16d3c72a9921@oss.qualcomm.com?part=3D1
