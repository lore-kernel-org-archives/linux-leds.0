Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9D38F928
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477166; cv=none; b=b+7GcZp9GR8WeHgbZve6LHv8ks6lAmWrRiM523r+b2mUfSyma0r311cFXXCEd3vB3FwcZMT8lcCn8TSgNWfeNcZllWTTdTTJoCdZXL8aM0P826WK0A9OTKwZO+fkM9rhjGLoQj+jVp3VuJRCBhJ52O8n0XME3MjsmXQb63WkF/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477166; c=relaxed/simple;
	bh=EQMyRGDH5ClCLhkz1baExmiBAsLJ/uPZG8BF3lUDuE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QEkb3CiqerDIZxEhjFnMS73KZXfyvjxPDRtlSEi3fDKLuweCdpi7f04FldzFCG+uwADfnP8i1mbQb057J2fPUKm4Ocvvhohg2LjBVN9HxWRoxPXUfgVtVa+6g6lV9Sw0ShXEnFM6ck6C1SGS75M9CkhaCJGIV26B6eoi/OFkRek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQk/Y/7b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQk/Y/7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E321F000FF;
	Tue, 15 Sep 2026 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477164;
	bh=hh92DRyppgNYkvt4BxmpT4rEuapuSXiaAIN5HU90PVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQk/Y/7bAnsdearKGnGFK5IVQCDGO51pypcv1mb6nJSvMooWgWFijPZRMiqn8jfKs
	 IunMzJjn/8Lqn6c21fpostQQYagGOGizuPY0tzqzeX1DOM1kLn2TYAmbaD4hyPgTPk
	 kVmFN1q8k+qwWgN2Nhe22Lek8+s7lCFVER0SgKrm0X24h9xf1ecc0MnTMEoir9j63t
	 VbHg9GESvMXsckFaIGJZE0X0ZcW600Miqz1XWtP3FZYoIqVpGfMSwJ6xnzat36ZlkB
	 kiOSO7f+uCZnDAg7IqI4L5SAoJd1Lqr5rfyvfaRse2tsufNkiuKfknQnr/TsU8xySZ
	 Rvpjq0Z3LK+Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/13] leds: st1202: Program the channel current for
 hardware patterns
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB84978D7C1CC0367D1818093DC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84978D7C1CC0367D1818093DC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:59:24 +0000
Message-Id: <20260915125924.99E321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> A channel's output is ILED x Pattern_PWM / 4095, so a pattern is only
> visible while the analog current register holds a non-zero value.
> st1202_led_pattern_set() programs the PWM slots and starts the sequencer
> but never writes ILED, so a channel whose current is zero stays dark
> while pattern_set() reports success.
>=20
> Zero is reached by ordinary use. Writing 0 to brightness sets it, and so
> does switching away from the pattern trigger, because
> pattern_trig_deactivate() ends with led_set_brightness(LED_OFF). A
> sequence as simple as
>=20
>   echo none > trigger
>   echo pattern > trigger
>   echo "255 500 0 500" > hw_pattern
>=20
> [ ... ]
> last brightness written, decide what the channel shows while a pattern
> is running.
>=20
> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D7

