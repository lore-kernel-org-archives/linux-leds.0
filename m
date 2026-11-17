Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909089;
	b=KTswLTWA4owZqz1yKdyVLv/PcwapstPoCuIALqLUlvkr9zUImJ/l7IkYQAffRSMMy15d
	 uYz9xDvzXP8wQ7fdEzLwm2p6ovIPpDZKvm09naCL6Nhcd8CRZ7mfKGXgrWHocyJSn0Prp
	 ymCA7bu8Nn3FK8Y4WvrU8XxA5N8ObsKmFCXFvrJTnztFUB1er9gyw1Fd2+woZ/CS0H77N
	 4JBIGr7l/5AhyDaaTMLE1WL9Yt9/IF1NqvIwYzG+I5Y4vEQkuQE53cXCo8uxVdD9Bx6rp
	 SC9Z+eptONuGvZ/sek7xM+omFDnDrG2XESRFA40CowWpaXP78q0krhIKBy8T6n/aZCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909089;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vTH3+/A5aWz9lJTsAgWOoecASDpaDD8WWGwkYGotmvI=;
	b=f9Pvn90mAreXRrN0XR08rKQ0CWAp9hmZj+o3+Xf5tv/fV0dvrpyHiQgXGbhn5Hj56K8A
	 1wHp2I0s09I6vR58zKeim5NJowbKeVpCS0dQ6mTIx9ncaARG3oB4LLAn0BX2XaFpqI62k
	 NOdf+8dDGkZVrLsp5EfHVzdKjlxpj+vctLZhfbYm+rWNtF5UUuq7jT8qdZFT47Qh96Ghq
	 t7n8mVj8pd2lqJPCU54OYY1zqF9Tp86fChVTTdh+BxKxXIRcdEju1VGruEC1D2agIAOXB
	 brHlotjtvypKBHchuFlK1yMCcjbti3PC1CkFyp1aGDAICYHNPiYBA5WsVss+z5v57uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jj3Nvkc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B19606A882
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jj3Nvkc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A421F000CC;
	Tue, 17 Nov 2026 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909089;
	bh=vTH3+/A5aWz9lJTsAgWOoecASDpaDD8WWGwkYGotmvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jj3Nvkc02XXXl9FZilIf7zAt9mxEB90ex+Eyj3DnHVs1eKUPP8BUmjn7Nd6cSQDf2
	 dC75DdPDgZaUibhjOxtePFP0zqD+T8jl5pw7fZcEBS6C3M3shKjWYuh/qqYqwe/hz9
	 zuDP53x1bKFFax55UBkzme4Bieyyogh+nGMeBea9WzyKGqkJBfAV71Gg3hIajGm5cM
	 7ZsNRL9wTn++faKbcihOB30KHqk6oeEg9qiR1yzWexQ6g9Rt6rc2ogMFPU8H3O5Km1
	 4MDKqZMrx1tR1CQUiIRdOaiQQb1lXDmBFqayMw8oxzzu1K08j2fszrOUu7z5dNFwVF
	 7u8LEL/mgNWbw==
Message-ID: <sashiko-outbox-218537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-4-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
 <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-4-7a862240683f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:51:28 +0000
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
- [Medium] leds: rgb: leds-qcom-lpg: corrupted get_state() after
  disabling freq mode
--

commit 2a10b372b4d1a0325069cf3509d6445ec569b2c0
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

leds: rgb: leds-qcom-lpg: Add PWM frequency mode support

This commit adds Frequency Mode (FM) support for capable Qualcomm LPG PWM
channels when a 50% duty cycle is requested and Frequency Mode provides
better timing accuracy than standard PWM mode.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 971f929116063..68c73bce103c3 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c

[ ... ]

> @@ -815,11 +1043,50 @@ static void lpg_apply_dtest(struct lpg_channel *ch=
an)
>  		     chan->dtest_value);
>  }
> =20
> -static void lpg_apply(struct lpg_channel *chan)
> +static int lpg_apply_freq_mode(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg =3D chan->lpg;
> +	bool enable_freq_mode =3D false;
> +
> +	if (!chan->freq_mode_capable)
> +		return 0;
> +
> +	if (chan->enable_freq_mode && chan->enabled)
> +		enable_freq_mode =3D true;
> +
> +	return regmap_update_bits(lpg->map, chan->base + PWM_FM_MODE_REG,
> +				  PWM_FM_ENABLE,
> +				  enable_freq_mode ? PWM_FM_ENABLE : 0);
> +}

[Severity: Medium]
Does clearing PWM_FM_ENABLE in lpg_apply_freq_mode() when a channel is
disabled cause lpg_pwm_get_state() to report a corrupted period and
duty_cycle?

When lpg_pwm_apply() disables a channel that was running in Frequency
Mode, lpg_apply_freq() and lpg_apply_pwm_value() return early because
!chan->enabled, leaving the Frequency Mode register values in
LPG_SIZE_CLK_REG, LPG_PREDIV_CLK_REG and PWM_VALUE_REG.  However,
lpg_apply_freq_mode() still runs and clears PWM_FM_ENABLE in
PWM_FM_MODE_REG (and lpg_pwm_apply() also resets config.enable_freq_mode
to false before checking state->enabled).

A subsequent lpg_pwm_get_state() call then sees PWM_FM_ENABLE =3D=3D 0 and
decodes the leftover Frequency Mode register values with the standard PWM
formula, corrupting the initial state read back by pwm_device_request() if
the channel is re-requested or re-exported via sysfs.  Should
lpg_apply_freq_mode() return early when !chan->enabled (matching
lpg_apply_freq() and lpg_apply_pwm_value()), with lpg_pwm_apply()
resetting config.enable_freq_mode only inside the if (state->enabled)
block?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com?pa=
rt=3D4
