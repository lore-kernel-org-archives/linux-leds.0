Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263228D831
	for <linux-leds@vger.kernel.org>; Wed,  5 Aug 2026 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910610; cv=none; b=aps9gRuGMwxmmrj7Dhn//gdkE9oiQ2JL307PyHhxX6CWlwr4s+BobfqfZ8989d15fJh7qQaviBdQgjBvd0tlxy5Ero1z2ZYDlcEYIhY9RLSf7GNmvd4IzbaZn/FZ+VEoYNFbLKlaS3hVVrg2sJBQUB2e5b3x0JlwqcrBS8i/FUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910610; c=relaxed/simple;
	bh=stVsx+2jyXIk47mfR6ZSlRps0QdFNNQB9saz4fPvkaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KRRGs9OnMdcjlfim0ECgXDgysiGSHBrlYcR/KkB7LieXEWpXgW+66rEvrXP4jn/XYdcC8Nasp6d59HKRro+/qq+D9g23iFSCKfu0Zr1doI1aWzIrPWsbGbjW7t5IEVWbtgM5yI1lExR54adzi8bIeoxHgX3KzixBPfWUhnoHaFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6QXBONL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6QXBONL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41811F000E9;
	Wed,  5 Aug 2026 06:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785910608;
	bh=T9bJljAmdCUR59ZkZW+LWuWQs9nMD0wpPfT7CZD5WS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6QXBONLsAzqTUhrODR54W5PFOQkYmvSoiOLjkwNFcuIm4cnoYw4YE3jdWWXnO0Cz
	 tpjsiS2i4QrqXlB9yveU5kCTuIvZlkqqoclChxYV56fUOnK5MPsJk6jiUJXVckbCy4
	 LwxGNC7MpOogQEfe3Su/vRI8F6/0J+0s64NsqQ5MuC4gu3Ye0quw4oPP48CBswzHEo
	 eLg2+tlzeIRWp3+Ls9MRB5u3n5l0Yhj+6n9TCQEUxcKJHeJIVZh9lhTxMsZ98b5SdT
	 XbUX1JEBirhamUenNqCKFeF+3sIQJMfGZ6k1wbEe3LWcbi9IeGK+ync8/jM4no2l05
	 zItLKbj2mC3tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com>
References: <20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 06:16:47 +0000
Message-Id: <20260805061648.A41811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The use of truncated, pre-calculated constants in `lpg_clk_perio=
d_ns` causes the generated hardware PWM period to exceed the requested peri=
od, violating the PWM framework constraint.
- [Medium] Disabling a PWM channel unconditionally clears the hardware FM m=
ode bit but leaves other frequency registers unchanged, causing subsequent =
get_state() calls to report incorrect values.
- [Medium] Unprivileged user space or client drivers can spam the kernel lo=
g by repeatedly requesting valid PWM periods that trigger an expected fallb=
ack path from FM mode to standard mode.
--

--- Patch [1]: [PATCH v2] leds: rgb: leds-qcom-lpg: Add PWM frequency mode =
support ---
commit 130380cf6f5abd5ee895e64c041b5980974d3c55
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

    leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
   =20
    Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
    Mode (FM) that can generate waveforms with more frequency points than
    the standard LPG PWM mode. The trade-off is that the duty cycle can
    only be fixed at 50%. Add the FM support. When the PWM channel is
    requested to set a duty cycle to exactly 50%, use FM mode by default
    as it provides a finer-grained frequency resolution in that case.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index d7d6518de30f2..4d39cb8f21673 100644
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

[Severity: Medium]
Will this truncated precision in lpg_clk_period_ns[] cause the generated ha=
rdware period to exceed the requested period?

The PWM framework requires the generated hardware period to be equal to or =
less than the requested period. By pre-calculating the clock period and tru=
ncating it (e.g., 1000000000 / 19200000 =3D 52.0833 ns truncated to 52 ns),=
 the division in lpg_calc_freq_fm() uses a smaller period. This yields a la=
rger multiplier, which can result in an actual hardware period that exceeds=
 the originally requested period.

[ ... ]
> +		for (exp =3D 0; exp <=3D LPG_MAX_M; exp++) {
> +			/* Calculate pwm_value_lsb for this (clk, exp) pair */
> +			lsb_tmp =3D period_ns;
> +			lsb_tmp =3D div64_u64(lsb_tmp, clk_period_arr[clk]);
> +			lsb_tmp >>=3D (exp + 1);
[ ... ]
> +	if (!found) {
> +		dev_err(chan->lpg->dev,
> +			"FM: Cannot generate period %llu ns\n", period_ns);
> +		return -EINVAL;
> +	}

[Severity: Medium]
Is it necessary to log a dev_err() here when a period cannot be generated i=
n Frequency Mode?

Looking at lpg_pwm_apply() below, when this fails, it explicitly falls back=
 to standard mode gracefully without failing the overall PWM request. This =
could cause kernel log spam if a user-space application or client driver re=
peatedly requests valid PWM periods that happen to fall outside of the Freq=
uency Mode hardware limits.

> +
> +	chan->clk_sel =3D best_clk;
[ ... ]
> @@ -784,11 +891,23 @@ static void lpg_apply_dtest(struct lpg_channel *cha=
n)
>  		     chan->dtest_value);
>  }
> =20
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
Does this unconditionally clear the FM mode bit when a channel is disabled?

In lpg_pwm_apply() when disabling a channel (state->enabled is false), use_=
fm starts as false. The function sets chan->use_fm =3D false and calls lpg_=
apply().=20

Unlike lpg_apply_freq() or lpg_apply_pwm_value(), which check if (!chan->en=
abled) and return early, lpg_apply_frequency_mode() will execute the regmap=
_write() and clear the PWM_FM_MODE_REG.

This leaves the other frequency and PWM value registers untouched. When lpg=
_pwm_get_state() is later called to read the state of the disabled channel,=
 it will see FM mode is disabled and incorrectly interpret the lingering ha=
rdware register values using the standard mode formulas.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-lpg-pwm-fm=
-support-v2-1-bc4d1041eeda@oss.qualcomm.com?part=3D1
