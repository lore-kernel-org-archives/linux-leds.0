Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3373F105D
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 02:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883443; cv=none; b=DgMDL37st4RkbKOCRLegXOXvuHPqXV08PaAs9D0nKhcUWLlrdn1LxFhH5w/Bfj3bvd4MPqgnS9KvV0t+uyng90VNCmvcGVRcbkoAzGwJun+rhibWGuCHCNXYhhX5xGLrpIneU82wjgwlituxRDCv0oa3lHbEGyQ5huZG8J1QlcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883443; c=relaxed/simple;
	bh=yKKg+TcBzS0RRtfgEhwkc/L7pVIfVX2hoN15ChKCC6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEClGy5diOvg+20Tz60/pqQ4ZFusw+6ZCcDxRYKZOpJUzXSfY/ooQUu9nWxYjB6/QlHqr8JoPfWcNZiC9oHkseZXHt6GluIjVXqC1yjJsSIWS1D5Ul1uI4w6Z+jxsMM60XZZbL8x/GuYH4MADSnT0xbIH6FPi7ltvGFZBePEGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPdmsZlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPdmsZlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35FE1F000E9;
	Fri, 28 Aug 2026 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787883442;
	bh=yKKg+TcBzS0RRtfgEhwkc/L7pVIfVX2hoN15ChKCC6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bPdmsZlx/jULyPYyekF14TgaEtQrFMogKtEK9GVG5ZkEvF274vmmF15hH75pfBEx/
	 I7kUqnby4yZKlGW6gEkVESZx1w+Q0ILGA0xprfGvLVe7Nc+qm8io+ET6gV9yraEPeK
	 D591lkZU+h1c+GhuaxY6VCxmsgykLxnd3lrUjGhvln+GkhMZhNoUmhpK07YYfOrcFT
	 6DLNOptQ0dJdmRG49QRLzepD/q9XVcxLkejZfG/zEo8Zph3k6ZWW5C5DLrq8u1Zh4t
	 yZyHiRt1fuTtjIyhOFCECIN9rjyfiXMbczX9OTDc+5HYqSRabtZSfQBYDdp0+xRrhi
	 3XdYu61wXqWyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
References: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 02:17:21 +0000
Message-Id: <20260828021721.E35FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
> Mode (FM) that can generate waveforms with more frequency points than
> the standard LPG PWM mode. The trade-off is that the duty cycle can
> only be fixed at 50%. Add the FM support. When the PWM channel is
> requested to set a duty cycle to exactly 50%, use FM mode by default
> as it provides a finer-grained frequency resolution in that case.
>=20
> Also, guard mutex lock at the top of lpg_pwm_get_state(), to make the
> register read atomic against the register write in lpg_pwm_apply().
>=20
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-lpg-pwm-fm=
-support-v3-1-88ae5208c57b@oss.qualcomm.com?part=3D1

