Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908775;
	b=Y9Fq49+XAA8hpJYPrqz+K5G9ssWixyGnkoPyHJVCehiar2wKKxF71V/nn5h4R24HgbwL
	 4url1uQNvlFMvZxBMe46ozs7kcmaCrMGwmeYHTmBnBLb2aGOeLFcZGbN7i7rPyobchwW0
	 hF24zXSU0sRhr6JIA4eDSCz8KdR/SMSMOIbNVZg654EhiUlwrgdeqVg1DVJg6UkZ+f+0l
	 W6eSja6XDc111Z/5mQ4CwF/DrCwK/X3lg4Alotbmkqyxcb8lbhSUl+RZIBY6E1dRABsDt
	 8nZMK+2DmP9pdX8JTR82IkJig46FV70pC83wXrpXth2Isoj83z41HWGiYzH3wEklR/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908775;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VDMDPqsetkT83j5WarKOPeVvpO4q2HO21pojhwjepk0=;
	b=Px7lvJCh/bSIVJStcqIyAPKPMUEjE3jEH/czHjzffed/66Eg5cvHPTTubKyTSWFtNpzg
	 3PlbeFZQCf6pENqdv9Li4r+/RlQYUtj1KvCnuoEm/M7cUB07MI/0+0JHlhVilW6i1qEDn
	 14EuaC/f+FUuQWkaW0ZSejb27HlxAcmMni4Su6wEaPzi3hxPTsD/ZpBMXZaqV8X7SChd9
	 xCbLuf+JN4rFqVEDCV/5foWD3zyYy7KB6in0+djWmYz/MFXYOORnlFYMZ7/PUT2W7xsCp
	 VE8tQD/HHgxDIIl5qIIFEyaiG46LXY72U58Bq9AJJPmnp28KX9leXyfzBDR9rDjS9aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKkSlLTV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523E60A2600
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKkSlLTV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3AB1F000C4;
	Tue, 17 Nov 2026 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794908775;
	bh=VDMDPqsetkT83j5WarKOPeVvpO4q2HO21pojhwjepk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EKkSlLTVWdS/wZ1I18JTOvOuLeTSW2NrbMuA6XIDwI2o6kawp1vxlLaF9gujYoG77
	 LtIlMCml8uECBbwxrPuMWsZNZq29PyfTyuSM0cde1xJKZsykcNUB6j72T93NNhak7h
	 xLwq7WSuUz4L65jV36ozRrJbnpgWRUB/YWUb9yj7JomBty5qStefJqC0OWyIjDgGAD
	 AJa7dZBol8m2VwkCAAxn3pwh/opsxooMtf/O/8JtKCiFcxQ5k1/4tIRGJ13LAo/Ki4
	 BDQmnXbQOPQSGaH/J3WpxjI9m5SfHhrBNTwAGK2DpC3phb2MwemiV30lxAh2v6hT/Q
	 xuqrpRJ01E4cg==
Message-ID: <sashiko-outbox-218519@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-1-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
 <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-1-7a862240683f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:46:14 +0000
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
- [Medium] leds: rgb: leds-qcom-lpg: single-entry LUT still treated as
  no pattern
--

commit 75c60a80d1268626e9de041f3218e5d2d8274c04
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak

This commit adds a has_lut flag to struct lpg_channel to track LUT
ownership separately from the pattern index range so that single-entry
LUT allocations are freed when clearing a pattern.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 24ffe079f2215..e14a3316bf221 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
[ ... ]
> @@ -1118,6 +1124,8 @@ static int lpg_pattern_set(struct lpg_led *led, str=
uct led_pattern *led_pattern,
> =20
>  		chan->pattern_lo_idx =3D lo_idx;
>  		chan->pattern_hi_idx =3D hi_idx;
> +		/* The 1st channel owns the LUT while other channels share it */
> +		chan->has_lut =3D i =3D=3D 0;
>  	}

[Severity: Medium]
Can a 2-step palindrome pattern actually run when ping_pong compresses
it to a single LUT entry with lo_idx =3D=3D hi_idx?

Although lpg_lut_free() now checks chan->has_lut, the pattern activation
paths still check whether chan->pattern_lo_idx !=3D chan->pattern_hi_idx:

drivers/leds/rgb/leds-qcom-lpg.c:lpg_brightness_set() {
    ...
		if (brightness =3D=3D LED_OFF) {
			chan->enabled =3D false;
			chan->ramp_enabled =3D false;
		} else if (chan->pattern_lo_idx !=3D chan->pattern_hi_idx) {
    ...
}

lpg_apply_control() and lpg_apply_lut_control() check the same condition,
so a single-entry LUT never enables the ramp generator and falls back to
static full-brightness PWM output.  In addition, the comment earlier in
lpg_pattern_set() notes that a pattern of length 1 causes the hardware
to iterate through the entire LUT, suggesting ping_pong compression
should not reduce a 2-step pattern to actual_len =3D=3D 1 in the first plac=
e.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com?pa=
rt=3D1
