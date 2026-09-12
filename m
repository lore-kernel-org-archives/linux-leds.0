Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D5353EF7
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253376; cv=none; b=QDpNqOvP7fymBtB0T3oxru5bh6u+O+cZbKQ1XqH2oUygq0TW6KmziL228TY1GT3ZvYO/jZJBV6X531Vl5DTDLIld6/1pNDHwPzH073BFUfbMB6Ob6j/HPsACV2gIB16fUjWzBzrZ2XC87SyYw1zAxDBChuOEhDNtqf855ehxsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253376; c=relaxed/simple;
	bh=C/Bl4bDx9jPuHJkzMxE1bMXjBnX8y0i5YO2SoNm8U/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TGWiDr55T5dNC7S+DlXg+xMh4BRll800jZX8z+sv8Pz0CUj7uOcabGVLbR3q7OKN5yPVhUaQQ5Uz2Y21/cBcN551x9VZWD1QBTw8Ts4tZiTFdnawkDCN2/hfOiMAtF7tQ7T0DgIBwR1yDPnsuLp9OKFTGVWdEYIOgpTM39tZQPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc4c0/Tm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc4c0/Tm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2EA1F000FF;
	Sat, 12 Sep 2026 22:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253375;
	bh=H9dlRyB02Fedq3b2mbSDbo0v+C6Ylz01CO8/P3i8PNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tc4c0/TmBiAxS0c+3s53xFsXlNbKkVHQaMqSR7OcsgxxgnU4unXkGy2N9SO3AkNU8
	 cvl2T8v806G7O5XZDQLH1ofaFqWQkjNZKz0MwIesgoYVnmT2nW3qeEor5V48ioMByp
	 bnUt2ivFClP9t9XESSdwORfdQdO1lfZLsVXAGCJR6jiPCY/uoxeQ/d6JhnmZ45uk4s
	 rTR8uGgmKHAUQJ0Xup2IEzjDgFberUdwkqLTSIqMu311E0oU2Tdu9ZEng/z2a3Leum
	 RCQDMsvm4cyy8yzDQ2VTEk2+NrdTu1f/PCfsL2zu/p1OPuN2uqxEO30GgLdEK97US+
	 PwlZxBMPWCxPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/11] leds: st1202: Program the channel current for
 hardware patterns
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497746317561206D7C20DAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497746317561206D7C20DAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:49:34 +0000
Message-Id: <20260912224935.3C2EA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `st1202_led_pattern_clear` and `st1202_led_pattern_set` manage the=
 global sequencer state and shared duration registers on a per-channel basi=
s, corrupting other active patterns.
--

commit e1c407fc5be28a96fa9e3c96385b607f0ca18728
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Program the channel current for hardware patterns

This commit modifies the hardware pattern setup to properly program the
analog current register (ILED) so that programmed patterns are visible. It
also ensures the current is released when a pattern is cleared to avoid
latching the LED on.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 5558ac9612a15..5042fe88fbff7 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -221,6 +221,10 @@ static int st1202_led_pattern_clear(struct led_class=
dev *ldev)
> =20
>  	guard(mutex)(&chip->lock);
> =20
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, LED_OFF=
);
> +	if (ret !=3D 0)
> +		return ret;
> +
>  	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHA=
SE_SHIFT);
>  	if (ret !=3D 0)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does writing ST1202_CONFIG_REG_PHASE_SHIFT
here abruptly halt the shared global sequencer for all channels?

Since st1202_led_pattern_clear() and st1202_led_pattern_set() are executed =
on
a per-channel basis via led_cdev.pattern_clear, clearing the PATS and PATSR
bits in the shared ST1202_CONFIG_REG appears to corrupt the state machine a=
nd
stop any hardware patterns currently executing on other LEDs on the same ch=
ip.

Additionally, further down in st1202_led_pattern_clear(), there is a loop
that writes 0 to ST1202_PATTERN_DUR + pattern. Can this zero out the chip-w=
ide
global duration registers and destroy the pattern sequence timings for all
other active channels?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D7
