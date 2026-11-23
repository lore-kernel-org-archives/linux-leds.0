Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416204;
	b=n+z+JA9OprCX6Cb6/enAMQTiMddkQBXA9Sftu6HoW6MhW+vweS93wuKi/PU8YWOl3TrN
	 HHY3mYGkAd4cYkpDhDw/+OOcbnu4Y5eVHjD1GQM0lCw5Vgx9v8ojdy+6lryXly4BDmFa2
	 03DJ0DddDwMXlF2eqmV3iXm3uuht5J/E6FzPgvayj4dt+iTHjvYmeuFA72G03vC+7aGhq
	 EjUZCkw4UFRCBjON8axGPMDMxMhCWTCtTizrVEiStwapB8AgDaTnpLeOEeUHu+SOWs2km
	 qXlnH5yxnyo0spXErd56K2XdDvQr+GkSkoZLc1aww2ZwiKPS79kj+4C/lQHRzb4pmLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Gx2p4vtKm253vPIW2Z9DShfhjmxcspJpVceUrjpmu8=;
	b=VpIDbcc9uKfhgfjw8zEatUd7j2sqD0sMY4AcvDItpcYnMLVhO76PqwCewZReHdAifQur
	 1cYZOgVdKTu0xOoalnkWDpYWRxnJxsC9H8s6qARKloZxeWpg/FhCXHN09IDFQLDpTVbqC
	 l2iIrdnVNAu9rq0ZmF5yozYYVgHHb4XlGB77AiYuGrjOwQTa8zXXF/dE0EtQmhBlXVMHq
	 kx8hLEY368gxxKNHyZbBP5fTOc8tYAq7VOBfdkrLvnZp7Tg70rFwSktgg8zipdWhcNGHP
	 lVirN1pnlBJvRY2B4Zgof8Duktssn01/AR0AQ6f+DFyo+Wll9AH/ga1jF0RpnTsfqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEDY6xwr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D99606A31A
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEDY6xwr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405701F000D0;
	Mon, 23 Nov 2026 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416203;
	bh=3Gx2p4vtKm253vPIW2Z9DShfhjmxcspJpVceUrjpmu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEDY6xwrUsegd4YKoZ8KJkRUztp3/zlKgWOfyYFpQbFGwLcuhH8e8T65300jKOw9p
	 Y9BGVCZwovcM/48Cx3grGqBfvPfO4oTrCpMoXTgUNxpR8k0avq+u2neyRlmypVM/ow
	 e7tXSBzZ3lHeVe+NCqNRzzDcPLY+OCFaHpKlcHHyfpbcfU5fVqGofQ17LaMWfnF7kp
	 tqSNVuyN6fDOXoaMZNRcXrye0VajjOPtP48d/ZFrdv9ZMg9OQ3vP71ztLsTUlIsYy8
	 zcN/wp+s+Uf6cVu9hl4VXTibZG2my7GmmYFEP4qLUv0SfJZp89MtQmvoOZuwnbUCCL
	 Ipzbd3jMUBqZw==
Message-ID: <sashiko-outbox-228777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT
 leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-1-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
 <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-1-2e885f60fbeb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 06:43:22 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] leds: rgb: leds-qcom-lpg: broken 1-entry LUT and hi_pause in
  lpg_pattern_set()
--

commit 08fbbc17e523563ad041317b9d25935cac2226e0
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak

This commit adds a has_lut boolean to struct lpg_channel so single-entry
LUT allocations where pattern_lo_idx equals pattern_hi_idx are properly
tracked and freed in lpg->lut_bitmap.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 24ffe079f2215..5d0d015d67e78 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c

[ ... ]

> @@ -668,7 +674,7 @@ static void lpg_apply_lut_control(struct lpg_channel =
*chan)
>  	unsigned int hi_idx =3D chan->pattern_hi_idx;
>  	u16 step =3D chan->ramp_tick_ms;
> =20
> -	if (!chan->ramp_enabled || chan->pattern_lo_idx =3D=3D chan->pattern_hi=
_idx)
> +	if (!chan->ramp_enabled || !chan->has_lut)
>  		return;
> =20
>  	hi_pause =3D DIV_ROUND_UP(chan->ramp_hi_pause_ms, step);
> @@ -709,7 +715,7 @@ static void lpg_apply_control(struct lpg_channel *cha=
n)
>  	if (chan->enabled)
>  		ctrl |=3D LPG_ENABLE_CONTROL_OUTPUT;
> =20
> -	if (chan->pattern_lo_idx !=3D chan->pattern_hi_idx)
> +	if (chan->has_lut)
>  		ctrl |=3D LPG_ENABLE_CONTROL_RAMP_GEN;
>  	else
>  		ctrl |=3D LPG_ENABLE_CONTROL_SRC_PWM;

[Severity: Medium]
Does enabling the ramp generator when pattern_lo_idx =3D=3D pattern_hi_idx
cause the hardware to iterate across the entire LUT on a 2-step
palindrome pattern?

In lpg_pattern_set(), a 1-entry LUT pattern is explicitly prohibited for
that reason, but the check runs before ping-pong compression halves a
2-step palindrome (len =3D=3D 2) down to actual_len =3D=3D 1:

drivers/leds/rgb/leds-qcom-lpg.c:lpg_pattern_set() {
	...
	/*
	 * Specifying a pattern of length 1 causes the hardware to iterate
	 * through the entire LUT, so prohibit this.
	 */
	if (len < 2)
		goto out_free_pattern;
	...
	/* The pattern length to be written to the LUT */
	if (ping_pong)
		actual_len =3D (len + 1) / 2;
	else
		actual_len =3D len;
	...
	if (lpg->lut_base || lpg->lut_sdam) {
		lo_pause =3D pattern[0].delta_t;
		hi_pause =3D pattern[actual_len - 1].delta_t;
	...
}

Previously, the pattern_lo_idx !=3D pattern_hi_idx checks prevented
programming LPG_LO_IDX_REG =3D=3D LPG_HI_IDX_REG and enabling
LPG_ENABLE_CONTROL_RAMP_GEN when actual_len =3D=3D 1.  With chan->has_lut
replacing those checks, a 2-step palindrome now programs a 1-entry LUT
range into the ramp generator, and also sets hi_pause from
pattern[0].delta_t instead of pattern[1].delta_t.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com?pa=
rt=3D1
