Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908448;
	b=pfH/t0jW14hMzp0pYPnXJBRQruqIxHLsWK/xoKsifsgqFYRJsLaSqmcwS7PL6y16iEhZ
	 dvAh0NsNkSZqnjBb0a7V6W8FokhJOchCHVuO/IBDzBtloeL79/4VI6ZcOVL8Ku28XjqwO
	 cAOw49L3u11J/eNcdp1g0aUX6yaUGoUS7fbc2VFgwWeKwpQzdhJvAoCcfG0NKtLFZzAY7
	 ssV3Qcj+c+gvPWl9zdRY5JrvjLQfRnVNHi3iE3IbgZx3ViT/239WXDvi2knUdvE3LACJd
	 3ILfxVUf88kO8V/TiT65stuV2jzawwS2Z4KQaapA10b2ToTmhpW0NQymeciwACm9f1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VTR1r3e2F7VEcFoy94PWDeScai3boA+V/TEdD+MoFpM=;
	b=WqDdGQDKUmxsfzqEgAe7DN7ICs88ikLdA+Olg6h7+VoSuHG7zRwP0AZNK30D2JAWymrQ
	 EcpU20TxZSXMT7skBzSU7l+Ucn4rIqdQNrYx5Zz72KLsYRdrSV4wrwb3fhmnhB/Rz6Mzo
	 PmEuRoELXq/2/DFtOpsl5pWNkDMFK+i4r75ohFlNSHvzLqhZqLBP+K66jYyiUFsBwQOBl
	 6+m7B6JfYxTpsnzl+4iVXp0KbyRv2ZO3lB3gAphhVivux7+3eEC6TpTKd2q7sixt8i3Lf
	 9f9awKgntAA7kxuXhowBWVK2hg90cgLnlSNT6Gqckx6URPwvXP8QCBISE9eSGVkArpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZQtgwz0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF8606A323
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZQtgwz0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D261F000C5;
	Tue, 17 Nov 2026 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794908447;
	bh=VTR1r3e2F7VEcFoy94PWDeScai3boA+V/TEdD+MoFpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZQtgwz0qviDS6y5JmZJlLJB6ex76xoKyVjJyyKAbqjdrmlRhI7RAe8mDt35z16Hz
	 zjv2MnbkcxZpmY6o5bIMRz9zOkBIut74sqBn20nQxyq2pG8IOlz0QmEMvlMoipehjF
	 Zv04fgc4cl1nSlLxuurkQulDEYtpd1GKeaaynE/CaD301QZvCHnay4zPAdsW4Mh2YV
	 4+0s4tCfYhl8jTeazpsk2+k3n3tjCc67QyvU13BktPZjrXyEFF59mXKDIKy7RW45go
	 hlk7Zg4H1mAEpUfhzrLVCM1cy/hqewOWXqoySQpKaOfmhdNQju8Sg4bOW0p7KdUttK
	 tkEelg+gXtVyA==
Message-ID: <sashiko-outbox-218501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] leds: rgb: leds-qcom-lpg: add mutex lock in
 lpg_pwm_get_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-3-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
 <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-3-7a862240683f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:40:46 +0000
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
- [Low] leds: rgb: leds-qcom-lpg: subject capitalization and commit msg
  rationale
--

commit 836798f643edbd8121d300d8532e2745d0e06b99
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

> leds: rgb: leds-qcom-lpg: add mutex lock in lpg_pwm_get_state()
>=20
> Guard mutex lock at the top of lpg_pwm_get_state(), to make the
> register read atomic against the register write in lpg_pwm_apply().
>=20
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

[Severity: Low]
Is the commit message accurate about what lpg->lock serializes against in
mainline?

Since 1cc2e1faafb3 ("pwm: Add more locking"), the PWM core serializes
chip->ops->apply() and chip->ops->get_state() under chip->nonatomic_lock
in pwm_apply_might_sleep() and pwm_get_state_hw(), so lpg_pwm_get_state()
and lpg_pwm_apply() cannot run concurrently.  Taking lpg->lock in
lpg_pwm_get_state() still serializes pwm_dbg_show() -> pwm_get_state_hw()
against LED callbacks such as lpg_brightness_single_set(),
lpg_brightness_mc_set() and lpg_blink_set(), which program channel
registers via lpg_apply() under lpg->lock without holding
chip->nonatomic_lock (in addition to fixing the race with lpg_pwm_apply()
on stable kernels prior to 1cc2e1faafb3 ("pwm: Add more locking")).

Also, per LED subsystem convention, the subject description after the
driver prefix should be capitalized ("leds: rgb: leds-qcom-lpg: Add mutex
lock in lpg_pwm_get_state()").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com?pa=
rt=3D3
