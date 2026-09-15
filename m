Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491433B058F
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477584; cv=none; b=fu36SoNBBi/d1hCpvbW3THcyWtmDfT3wUVhFzTAD1YH+MR+/90fVcwAbxQwjr3DO+IkO2ClBXnqeIZYoRnovdT1/t1PRGw3I6NvfUk06QnWPAZ6IHj71pj8DUe+6+k265MelwmcyWiLg/9DTCzTECRITEXHnrZfDryyYTnFExpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477584; c=relaxed/simple;
	bh=lnF1XQHQ2MAM+Qik9jsRMTqGlSv1i1nr4IkpSNLS7nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qzUybJSrjnZvy7Puwq422g+EFyVKmqSh9YUbTOW+upvpTNB0SZw1mBzCTMB7/+h1EA/Tjj2bqaWvLKRhDW8JhSUDl4n7O2x2HjWU+PJtS3xvtfJ54gbmsopZAV5ysW1oyufirXZ7+8waaxoREMm/rlPnW2yE51SFrgQU+9jKbkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CElPBJLR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CElPBJLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B253F1F00893;
	Tue, 15 Sep 2026 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477582;
	bh=6+uFj4boOfSpn9ChlbFkE8vp3mF7hJWqZtyu+iYHvh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CElPBJLRr1CCh+qWHgZYiDc3mOZrKYiUEGz/j0GoSkayfnxjbhYBxAzjKTc+M2WAa
	 3q07nwOX4PoXiN902yO3m7Zcfxem4ehrgieJCkzDuiUB9rqmU6IrOp+tP7YoSQXmoj
	 wqCCDxySN6GbBw5dh7N+JFIMcp/O3EYWAJvEvrhiKkes8ZMF185ClikL3+4agvmqEm
	 erd8c+Gs2VhmFINeq/+Rge/smbQPQP2F0yGyL0O1wim+qYfNOpJbbbZY7QIT1NDN72
	 +/xNHQ5qTC8Hc+daLV19AJsAyt6qGU7k+3kOmS0igyi+KY62yheoupkc+XkC6ULZt5
	 tn8FGrRxBO03Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] leds: st1202: Cap the channel current in
 st1202_led_set()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497C60D1D2921DD0384926FC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497C60D1D2921DD0384926FC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:06:22 +0000
Message-Id: <20260915130622.B253F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: broken brightness scaling and saturation when max-brightne=
ss > 255
--

commit 1bc7b66ecae1ce3e4dd27e771fe90fae2aa2ecc9
Author: Manuel Fombuena <fombuena@outlook.com>
Subject: leds: st1202: Cap the channel current in st1202_led_set()

This commit limits the channel current register value written in
st1202_led_set to U8_MAX to prevent 8-bit wrap-around when the device
tree declares a max-brightness greater than 255.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 39129206b78d6..5e4a8b80cfe47 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -207,7 +207,8 @@ static int st1202_led_set(struct led_classdev *ldev, =
enum led_brightness value)
>  			return ret;
>  	}
> =20
> -	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
> +				min_t(unsigned int, value, U8_MAX));

[Severity: Medium]
Does capping the value here instead of scaling it cause broken dimming
curves when max-brightness is configured to a value greater than 255 in
the device tree?

If a value like 4095 is used for max-brightness, capping instead of
linearly scaling causes all requests above 255 to fully saturate the
output at max hardware current rather than scaling proportionately.

Additionally, does this clamping affect the digital PWM scaler in
st1202_brightness_to_pwm() when called from st1202_led_pattern_set()?

If the clamped analog limit of 255 is passed to st1202_brightness_to_pwm()
as both the clamp limit and the scaling denominator instead of the actual
ldev->max_brightness, the function appears to calculate:

255 * 4095 / 255 =3D 4095

This would result in a 100% PWM duty cycle for any pattern brightness
above 255.

Would the lack of linear scaling also cause confusion during sysfs reads
if st1202_brightness_get() returns the raw 8-bit register value instead
of a scaled representation up to ldev->max_brightness?

>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D12
