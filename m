Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0052EF67A
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 04:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264125; cv=none; b=sdeLfeCf9zUr8lqTJYIjJK/pxeqDf1qUBjGRmv0OLgs+yUfLEanJjHJFQPZr0HZ3q97RkhRzDWDxck3GyK+gVESf44P0moIW7rhtf/UYFvKxl3kM1gkNEgiqoCHCmXKniJrRWphB3ZDysXTC1sS16WmkL+0maII9eETSuAWeZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264125; c=relaxed/simple;
	bh=5uSPwFf1t+Rp7gmv6vIblUiohOKQwzqRLxKm8TdsFgE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=if0UYUoMo4SL9us7ub5CsSWl6E6lYKp5XTUVq7dO9vnou1G+kkaAxA2Oyj1ellWz4MBDOCPzpdn+oFRFVNZOgjewI2UwwzAnQv07RClOd5uPacE68k+1DJ0tDfpgXoHh1LNZ8a1K/708vEyCxLr/MjAszd5y0vsTXwLh69WRm0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDTvaFMb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDTvaFMb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A762B1F000E9;
	Fri, 17 Jul 2026 04:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784264123;
	bh=EBmF2DdPv2IUtbKn3hAg+gTQIG8yCU42vrWicM7p/S4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDTvaFMbMGffFrq0LdMqzRS3aw7jwkpSPs9wP9Avm2mdMaUpRHiqSkcX8/fn6nAem
	 4vjFlMYmpC+UKaGcAFWRYn/9vQA6VeXCO6YHAE/0JDaUHVm0GzIeEBNXYUhOotwJcJ
	 35fmjnBrjEAGBv3z6j+/nPU9oDJDG9vqEjPMrxrjafrgH/kb4NbNwaJ0wA8WwLwupT
	 OjZgzEVabBY9grPO+MHlgKOQgYnLXh3NWTytqA8PpTz3+52a7TEG7R22TtKu1Md4Ej
	 xtTJXL6O8OYthgQSCyKqe8W0d2uK+D5JrzYeiZo9q1BO5qBYnRzwTmEooz4iDWhTDI
	 m8LTrJi4FrtYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 04:55:23 +0000
Message-Id: <20260717045523.A762B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver permanently leaks a hardware LUT slot and fails to trig=
ger patterns when a 2-step palindrome pattern evaluates to an `actual_len` =
of 1.
--

--- Patch [1]: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing=
 in HW pattern mode ---
commit c5b003f7bc9326bf3784a70ad883c39b215ae496
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mo=
de

This commit splits out pattern preparation into lpg_prepare_pattern() and
adds support for per-channel scaling so the hardware pattern respects
multi-color LED balances. It also updates the LUT storage paths to handle
the dynamically allocated scaled patterns.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index d7d6518de30f2..24b1f570f5244 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c

[ ... ]

> @@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, s=
truct led_pattern *led_pattern,
>  	 * duration of all steps.
>  	 */
>  	if (lpg->lut_base || lpg->lut_sdam) {
> -		lo_pause =3D pattern[0].delta_t;
> -		hi_pause =3D pattern[actual_len - 1].delta_t;
> +		prep->lo_pause =3D pattern[0].delta_t;
> +		prep->hi_pause =3D pattern[actual_len - 1].delta_t;
>  	} else {
>  		if (delta_t !=3D pattern[0].delta_t || delta_t !=3D pattern[actual_len=
 - 1].delta_t)
> -			goto out_free_pattern;
> +			return -EINVAL;
> +		prep->lo_pause =3D 0;
> +		prep->hi_pause =3D 0;
>  	}
> =20
> +	prep->data =3D no_free_ptr(pattern);
> +	prep->len =3D actual_len;

[Severity: High]
This is a pre-existing issue, but does this logic permanently leak a
hardware LUT slot if a 2-step palindrome pattern is provided?

If a user-space process provides a 2-step pattern where both steps have the
same brightness, the ping_pong logic earlier in lpg_prepare_pattern() will
calculate actual_len =3D (2 + 1) / 2, which evaluates to 1.

When this length-1 pattern is subsequently stored, it allocates 1 slot where
lo_idx and hi_idx are equal. Because they are equal, lpg_brightness_set()
treats the configuration as a static brightness instead of playing the
pattern.

Later, when the pattern is cleared and lpg_lut_free() is called with this
lo_idx and hi_idx, it hits this early return:

static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int=
 hi_idx)
{
	int len;

	len =3D hi_idx - lo_idx + 1;
	if (len =3D=3D 1)
		return;

	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
}

Does this early return bypass bitmap_clear() and permanently leak the LUT
slot for the remainder of the device lifecycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-lpg-rgb-co=
lor-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com?part=3D1
