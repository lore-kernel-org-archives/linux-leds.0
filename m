Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3338F928
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477008; cv=none; b=Vn2lokDO83Xrhv1ie24eWsxXPMV5ZT8uZfELkpbBsKRMm3lB/Cxq1lXmdPQuIquVv2DcED6dR6rOIo4+om/XXzeEZ5vfG36orkea5EyoGT1xx8na5DQXSnMyqbKZ1uRYiP/HlySTa1CRTKWmV/2tWFdoe0xtIvFnEruO7pi2XJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477008; c=relaxed/simple;
	bh=PS0+hNCzzc5DPwF7/lYIUxitQ0pigVwecHxbhnSyQ9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gV/M5B8CXTO8YxP0OVM+WDuo3jGaInU5xhhN7lPj29VdqzUwVsxtUNp3KsZrZpo/58P1Q1zjBqes7rYOJmLhmIpJYB0JMfzpv3XABJW+1sDkf+RpWURoDmZzOH1rtU+MB4BeROHZTArX5Wa9IpD7k+nXrYRlasjAT62vc+GKek4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba9uWFgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba9uWFgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74C01F000FF;
	Tue, 15 Sep 2026 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477005;
	bh=PS0+hNCzzc5DPwF7/lYIUxitQ0pigVwecHxbhnSyQ9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ba9uWFgiqoUMWIz9EQkPbs+/ajhFV4cUEtlpTWDQEJcJSBedh8PQKptsiPBQ+Kp1Y
	 /q2ya0qW/y6uhqzS1Qmvi41Xyj7TLY4ghhUc5R0BE8+SMBVh7drVakdgvokrkTv3iE
	 Ft3r3yGoHBKZtJGIY2zO8BoIRxrgfmw8KGvK50cW/qJ+sUIkHmNenayD/GmPOAZCQ+
	 S2IXogqt1mH0JT2OMiP0DmiTRytEPvjoS9zPMug2F7RIy6t/n4aH1K7dXi1LCNBXKR
	 jt2W0LLza7nlapTpKUQswMuhxnFpeV+VN/aea/QV8OwR4J7zNpdQlzOOSWAcNcJX0+
	 fMZxBPxfchGCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] leds: st1202: Scale pattern brightness to the
 12-bit PWM range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497B938D3592582E17CB757C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497B938D3592582E17CB757C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:56:45 +0000
Message-Id: <20260915125645.C74C01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The LED1202 PWM registers are 12 bits wide, but st1202_led_pattern_set()
> writes the 8-bit brightness value carried by struct led_pattern into
> them unscaled. A pattern step asking for full brightness therefore
> drives the channel at 255 out of 4095, about 6% duty cycle, so a pattern
> is dimmer than the same brightness set directly.
>=20
> Scale the value to the full PWM range before programming it.
>=20
> Scale against max_brightness rather than the register maximum. The LED
> core takes max_brightness from the DT max-brightness property, so a
> board can declare a ceiling below full scale, and the pattern trigger
> already rejects steps above it. Scaling against a hardcoded 255 would
> leave such a board unable to reach its own declared maximum from the
> pattern path while the brightness path reaches it.
>=20
> Scaling divides by max_brightness. The LED core replaces a zero
> max-brightness from the device tree with LED_FULL, so the divisor should
> never be zero, but the helper returns zero rather than rely on that.
> max_brightness is capped at U8_MAX, the driver's own maximum, so a
> device tree declaring more than the part supports is treated as full
> scale. struct led_pattern brightness is signed, so clamp both ends and
> floor a negative value to LED_OFF rather than let it wrap.
>=20
> Document that a step is relative to max_brightness, since the range
> given in the documentation no longer holds when the device tree sets
> max-brightness.
>=20
> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D6

