Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD174DD6DA;
	Thu,  3 Sep 2026 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449435; cv=none; b=n0Cpgxw9TOKIwprPN8l/GxSu+UcWy8HcoTqUJgCcWSgO6cX6wnLZkeI0dXRgsXMGPrDQ8XsixBW5Gfr1AkfJXxWxd+K3JVIBEI5imANendp/c7c37OsxdDC7d0oVoDIrFOW4vufhhnDFa9GnbyjUpYTfI3OmbCSuqtVOt8F55kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449435; c=relaxed/simple;
	bh=q1h4COYr4xqcVWashBN8YM3/NUGSYuMVN0Ajs0pVZ+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6akaW7NtCaNtEEYck1iZqyPs+YUPSMDkudK86R/atyRdH7GwFfBWihEqa7okov7iqLbK0GcjMZUHwkO94cjSNNSKCc7GX59zBo4pn0mmoa0+2aJti/wlqxFC8R5+HwN9+HuO6usAN8RBDlvTudrDwfyk2GnJstLZ9gQE+nbQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEwRv+8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEwRv+8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C731F000E9;
	Thu,  3 Sep 2026 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449432;
	bh=fbKTdfeKDtwoK8eCy3/X7THf/KRhRtOiXTYFRNCWDSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dEwRv+8H+iOj1Grkg06sBeowciW6wGxtbWyq1vPlxAfBwXlQy6UT7yEJHIYSusbmY
	 F4Go7mt1Xg/bpb6+mM1eluf5LPubu+qExO6aSicABITYQIey8CGydGHubMxofvE/21
	 N9SIMHzt7DnEgr+S2e0N/BlgzMR6WovO3+jx+0Xjy93p6DD/2HfPRpGykTPEfFoUwL
	 uIACYei65nTYxxLjFvKwXzmUAC3w4peOfrs8AehTmLDqLOufa+nwqPZzc0lF9bHfsw
	 ucZVKOYXBGDWW9oUOknYZrhobDm386lbCIOUINGsK2avX/aKeOCBAnbDs4BDaPnZtX
	 grYvQb49x6DkQ==
Date: Thu, 3 Sep 2026 16:30:28 +0100
From: Lee Jones <lee@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Message-ID: <20260903153028.GU2133376@google.com>
References: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>

On Thu, 27 Aug 2026, Fenglin Wu wrote:

> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
> Mode (FM) that can generate waveforms with more frequency points than
> the standard LPG PWM mode. The trade-off is that the duty cycle can
> only be fixed at 50%. Add the FM support. When the PWM channel is
> requested to set a duty cycle to exactly 50%, use FM mode by default
> as it provides a finer-grained frequency resolution in that case.
> 
> Also, guard mutex lock at the top of lpg_pwm_get_state(), to make the
> register read atomic against the register write in lpg_pwm_apply().

Would it be better to split this submission into two separate patches? One to
address the locking in 'lpg_pwm_get_state()' and another to introduce the new
Frequency Mode support.

> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Dependency:
> 
> This change was made based on the LED color balance fix change which
> is under review and has not yet been merged:
> 
> https://lore.kernel.org/linux-arm-msm/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/
> 
> This change should be applied on top of that one.
> ---
> Changes in v3:
> - Fixed Sashiko review comments:
>   1. Instead of using an array with pre-rounded values in lpg_clk_period_ns[],
>      calculate the clk period by using the lpg_clk_rates[] to improve accuracy.
>   2. Move the subtype check in lpg_init_channels() so the check in lpg_calc_freq_fm()
>      could be removed along with the error message, also change the message
>      to a debug level when calculating the period in FM failed.
>   3. Check if the requsted period is out of the frequency mode support range
>      at the beginning of lpg_calc_freq_fm().
>   4. Update PWM_FM_ENABLE bit based on the channel enabling status in
>      lpg_apply_frequency_mode().
>   5. Add mutex gaurd in lpg_pwm_get_state() to protect the register read
>      from the register write in lpg_pwm_apply().
> - Link to v2: https://patch.msgid.link/20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com
> 
> Changes in v2:
> - When assigning lsb/best_lsb value to period_actual, cast it to u64 1st then add 1.
> - Link to v1: https://patch.msgid.link/20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 203 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 187 insertions(+), 16 deletions(-)
> 
> diff --git "a/drivers/leds/rgb/leds-qcom-lpg.c" "b/drivers/leds/rgb/leds-qcom-lpg.c
> index 24b1f570f524..2907ddb3a568 100644
> --- "a/drivers/leds/rgb/leds-qcom-lpg.c"
> +++ "b/drivers/leds/rgb/leds-qcom-lpg.c"
> @@ -21,6 +21,8 @@
>  #define  LPG_SUBTYPE_PWM	0xb
>  #define  LPG_SUBTYPE_HI_RES_PWM	0xc
>  #define  LPG_SUBTYPE_LPG_LITE	0x11
> +#define PWM_STATUS1_REG		0x08
> +#define  PWM_FM_PRESENT		BIT(0)
>  #define LPG_PATTERN_CONFIG_REG	0x40
>  #define LPG_SIZE_CLK_REG	0x41
>  #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
> @@ -42,6 +44,10 @@
>  #define PWM_SEC_ACCESS_REG	0xd0
>  #define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
>  
> +/* offset 0x50: PWM_FM_MODE_REG on LPG_SUBTYPE_PWM */
> +#define PWM_FM_MODE_REG		0x50
> +#define  PWM_FM_ENABLE		BIT(7)
> +
>  #define SDAM_REG_PBS_SEQ_EN		0x42
>  #define SDAM_PBS_TRIG_SET		0xe5
>  #define SDAM_PBS_TRIG_CLR		0xe6
> @@ -110,6 +116,8 @@ struct lpg_data;
>   * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
>   * @pattern_lo_idx: start index of associated pattern
>   * @pattern_hi_idx: last index of associated pattern
> + * @fm_capable: hardware supports Frequency Mode
> + * @use_fm: set the period using Frequency Mode
>   */
>  struct lpg_channel {
>  	struct lpg *lpg;
> @@ -146,6 +154,9 @@ struct lpg_channel {
>  
>  	unsigned int pattern_lo_idx;
>  	unsigned int pattern_hi_idx;
> +
> +	bool fm_capable;
> +	bool use_fm;

frequency_mode_enabled

>  };
>  
>  /**
> @@ -238,11 +249,13 @@ struct lpg {
>   * @sdam_offset:	Channel offset in LPG SDAM
>   * @base:		base address for PWM channel registers
>   * @triled_mask:	bitmask for controlling this channel in TRILED
> + * @fm_capable:		channel hardware supports Frequency Mode
>   */
>  struct lpg_channel_data {
>  	unsigned int sdam_offset;
>  	unsigned int base;
>  	u8 triled_mask;
> +	bool fm_capable;
>  };
>  
>  /**
> @@ -435,6 +448,101 @@ static const unsigned int lpg_pre_divs[] = {1, 3, 5, 6};
>  static const unsigned int lpg_pwm_resolution[] = {6, 9};
>  static const unsigned int lpg_pwm_resolution_hi_res[] = {8, 9, 10, 11, 12, 13, 14, 15};
>  
> +static int lpg_calc_freq_fm(struct lpg_channel *chan, uint64_t period_ns)

What's "fm"?

> +{
> +	unsigned int best_clk = 0, best_exp = 0, best_lsb = 0;
> +	unsigned int clk, exp, lsb;
> +	unsigned int clk_len;
> +	u64 lsb_tmp, period_actual;

What's the rational for lsb_tmp?  Why not just use lsb?

> +	u64 curr_err, last_err;
> +	u64 min_err = U64_MAX;
> +	u64 max_period_ns;
> +	bool found = false;
> +
> +	clk_len = ARRAY_SIZE(lpg_clk_rates);
> +
> +	/* Check if the requested period exceeds what freuqency mode can support */

Spelling error - please use spell-check throughout.

> +	max_period_ns = div64_u64((u64)NSEC_PER_SEC * (U8_MAX + 1) * (1 << (LPG_MAX_M + 1)),
> +				   lpg_clk_rates[1]);

This is pretty much unreadable.

May I suggest you use a couple of MACROs to make it easier to understand.

> +	if (period_ns > max_period_ns)
> +		return -EINVAL;
> +
> +	/*
> +	 * Formula (rearranged to solve for pwm_value_lsb):
> +	 *
> +	 *                      period_ns * clk_rate
> +	 * pwm_value_lsb = ------------------------------  - 1
> +	 *                 2 * (2^pwm_exp) * NSEC_PER_SEC
> +	 *
> +	 * For each (clk, exp) combination, calculate pwm_value_lsb and then
> +	 * use it to calculate the actual period. Store the combination that
> +	 * yields the closest match to the desired period.
> +	 *
> +	 */
> +

This line is superfluous.

> +	for (clk = 1; clk < clk_len; clk++) {

for (int clk = 1; ... for throwaway iterators.

> +		last_err = U64_MAX;
> +
> +		for (exp = 0; exp <= LPG_MAX_M; exp++) {

As above.

And what's 'exp'?

Can we improve the nomenclature to make this whole thing less obfuscated.

> +			/* Calculate pwm_value_lsb for this (clk, exp) pair */

Avoid variable names in comments - plain English please.

> +			lsb_tmp = div64_u64(period_ns * lpg_clk_rates[clk], NSEC_PER_SEC);

How about using mul_u64_u32_div() to avoid overflows?

> +			lsb_tmp >>= (exp + 1);
> +
> +			if (lsb_tmp == 0 || lsb_tmp - 1 > U8_MAX)

Why?  Comment please.

> +				continue;
> +
> +			lsb = lsb_tmp - 1;
> +
> +			period_actual = (u64)(lsb) + 1;
> +			period_actual <<= (exp + 1);
> +			period_actual = div64_u64(period_actual * NSEC_PER_SEC,
> +						  lpg_clk_rates[clk]);

As above.

> +			curr_err = period_ns - period_actual;
> +			if (curr_err < min_err) {
> +				min_err = curr_err;
> +				best_clk = clk;
> +				best_exp = exp;
> +				best_lsb = lsb;
> +				found = true;
> +			}
> +
> +			if (curr_err > last_err)
> +				break;
> +
> +			last_err = curr_err;
> +		}
> +	}
> +
> +	if (!found) {
> +		dev_dbg(chan->lpg->dev,
> +			"FM: Cannot generate period %llu ns\n", period_ns);

If you're returning an error, this should be dev_err().

> +		return -EINVAL;
> +	}
> +
> +	chan->clk_sel = best_clk;
> +	chan->pre_div_exp = best_exp;
> +	chan->pwm_value = best_lsb;
> +
> +	/* pre-div and pwm-resolution don't impact frequency mode */

Again, English instead of variable names please and "do not" is better.

> +	chan->pre_div_sel = 0;
> +	chan->pwm_resolution_sel = 0;
> +
> +	/* Calculate actual period for reference */
> +	period_actual = (u64)(best_lsb) + 1;
> +	period_actual <<= (best_exp + 1);
> +	period_actual = div64_u64(period_actual * NSEC_PER_SEC,
> +				  lpg_clk_rates[best_clk]);
> +	chan->period = period_actual;
> +
> +	dev_dbg(chan->lpg->dev,
> +		"Frequency mode: period=%llu ns -> clk=%u Hz (idx=%u), exp=%u, lsb=%u (actual=%llu ns, err=%llu ns)\n",
> +		period_ns, lpg_clk_rates[best_clk], best_clk, best_exp, best_lsb,
> +		period_actual, min_err);

These are seldom useful after initial development - please consider
removing it.
> +
> +	return 0;
> +}
> +
>  static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
>  {
>  	unsigned int i, pwm_resolution_count, best_pwm_resolution_sel = 0;
> @@ -802,11 +910,26 @@ static void lpg_apply_dtest(struct lpg_channel *chan)
>  		     chan->dtest_value);
>  }
>  
> +static void lpg_apply_frequency_mode(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +	bool use_fm;

Initialise this to false.

> +
> +	if (!chan->fm_capable)
> +		return;
> +
> +	use_fm = chan->use_fm && chan->enabled;

Then do:

	if (chan->use_fm && chan->enabled)
		enable_frequency_mode = true;
> +
> +	regmap_update_bits(lpg->map, chan->base + PWM_FM_MODE_REG,
> +			   PWM_FM_ENABLE, use_fm ? PWM_FM_ENABLE : 0);
> +}
> +
>  static void lpg_apply(struct lpg_channel *chan)
>  {
>  	lpg_disable_glitch(chan);
>  	lpg_apply_freq(chan);
>  	lpg_apply_pwm_value(chan);
> +	lpg_apply_frequency_mode(chan);
>  	lpg_apply_control(chan);
>  	lpg_apply_sync(chan);
>  	if (chan->lpg->lpg_chan_sdam)
> @@ -1318,28 +1441,42 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  {
>  	struct lpg *lpg = lpg_pwm_from_chip(chip);
>  	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +	bool use_fm = false;
>  	int ret = 0;
>  
>  	if (state->polarity != PWM_POLARITY_NORMAL)
>  		return -EINVAL;
>  
> -	mutex_lock(&lpg->lock);
> +	guard(mutex)(&lpg->lock);
>  
>  	if (state->enabled) {
> -		ret = lpg_calc_freq(chan, state->period);
> -		if (ret < 0)
> -			goto out_unlock;
> +		use_fm = chan->fm_capable && (state->duty_cycle == state->period / 2);
>  
> -		lpg_calc_duty(chan, state->duty_cycle);
> +		if (use_fm) {
> +			ret = lpg_calc_freq_fm(chan, state->period);
> +			/*
> +			 * fallback to use the standard mode if frequency

"Fallback ..."

> +			 * mode couldn't satisfy the requested period
> +			 */
> +			if (ret < 0)
> +				use_fm = false;

Should we use 'if (ret)' to check for errors instead of 'if (ret < 0)' here?

> +		}
> +
> +		if (!use_fm) {
> +			ret = lpg_calc_freq(chan, state->period);
> +			if (ret < 0)
> +				return ret;

Is 'ret > 0' valid?  If not, just 'if (ret)'.

> +
> +			lpg_calc_duty(chan, state->duty_cycle);
> +		}
>  	}
> +
> +	chan->use_fm = use_fm;
>  	chan->enabled = state->enabled;
>  
>  	lpg_apply(chan);
>  
> -out_unlock:
> -	mutex_unlock(&lpg->lock);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> @@ -1347,20 +1484,24 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  {
>  	struct lpg *lpg = lpg_pwm_from_chip(chip);
>  	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +	bool fm_active = false;

This is different again?

>  	unsigned int resolution;
>  	unsigned int pre_div;
> +	unsigned int clk_idx;
>  	unsigned int refclk;
>  	unsigned int val;
>  	unsigned int m;
>  	u16 pwm_value;
>  	int ret;
>  
> +	guard(mutex)(&lpg->lock);
> +
>  	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
>  	if (ret)
>  		return ret;
>  
>  	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
> -		unsigned int clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
> +		clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
>  
>  		if (clk_idx >= ARRAY_SIZE(lpg_clk_rates_hi_res))
>  			return -EINVAL;
> @@ -1368,7 +1509,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  		refclk = lpg_clk_rates_hi_res[clk_idx];
>  		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
>  	} else {
> -		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
> +		clk_idx = FIELD_GET(PWM_CLK_SELECT_MASK, val);
> +		refclk = lpg_clk_rates[clk_idx];
>  		resolution = lpg_pwm_resolution[FIELD_GET(PWM_SIZE_SELECT_MASK, val)];
>  	}
>  
> @@ -1384,9 +1526,29 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  		if (ret)
>  			return ret;
>  
> -		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * ((1 << resolution) - 1) *
> -						 pre_div * (1 << m), refclk);
> -		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
> +		if (chan->fm_capable) {

And one more, just for good luck!

> +			ret = regmap_read(lpg->map, chan->base + PWM_FM_MODE_REG, &val);
> +			if (ret)
> +				return ret;
> +
> +			fm_active = !!(val & PWM_FM_ENABLE);
> +		}
> +
> +		if (fm_active) {
> +			/*
> +			 * FM period formula:
> +			 *   period = 2 * (pwm_value_lsb + 1) * (2^exp) * NSEC_PER_SEC / refclk
> +			 */
> +			pwm_value &= 0xff;
> +			state->period = DIV_ROUND_UP_ULL((u64)2 * (pwm_value + 1) * (1 << m) *

When 1 is shifted, it usually makes sense to use BIT().

> +							  NSEC_PER_SEC, refclk);
> +			state->duty_cycle = state->period / 2;
> +		} else {
> +			state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
> +					((1 << resolution) - 1) * pre_div * (1 << m), refclk);
> +			state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
> +					pwm_value * pre_div * (1 << m), refclk);
> +		}
>  	} else {
>  		state->period = 0;
>  		state->duty_cycle = 0;
> @@ -1560,7 +1722,8 @@ static int lpg_init_channels(struct lpg *lpg)
>  {
>  	const struct lpg_data *data = lpg->data;
>  	struct lpg_channel *chan;
> -	int i;
> +	unsigned int status;
> +	int ret, i;
>  
>  	for (i = 0; i < data->num_channels; i++) {
>  		chan = &lpg->channels[i];
> @@ -1572,6 +1735,14 @@ static int lpg_init_channels(struct lpg *lpg)
>  		chan->sdam_offset = data->channels[i].sdam_offset;
>  
>  		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
> +
> +		if (chan->subtype == LPG_SUBTYPE_PWM && data->channels[i].fm_capable) {
> +			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
> +			if (ret < 0)
> +				return ret;
> +
> +			chan->fm_capable = !!(status & PWM_FM_PRESENT);
> +		}
>  	}
>  
>  	return 0;
> @@ -1895,7 +2066,7 @@ static const struct lpg_data pm8350c_pwm_data = {
>  		{ .base = 0xe800, .triled_mask = BIT(7), .sdam_offset = 0x48 },
>  		{ .base = 0xe900, .triled_mask = BIT(6), .sdam_offset = 0x56 },
>  		{ .base = 0xea00, .triled_mask = BIT(5), .sdam_offset = 0x64 },
> -		{ .base = 0xeb00 },
> +		{ .base = 0xeb00, .fm_capable = true },
>  	},
>  };
>  
> 
> ---
> base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
> change-id: 20260728-lpg-pwm-fm-support-5f0a4636d3dc
> prerequisite-change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3:v6
> prerequisite-patch-id: 931a69abc7b07f7f5b5603e8159c092d9a54703f
> 
> Best regards,
> --  
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> 

-- 
Lee Jones
