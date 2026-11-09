Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214965;
	b=iEelHeddG65Y0D7qdaCbGSRdLNYSH1LZxE0FM3+SXcdJDSc5zvwhgw0GIqggot8ejVhR
	 DDy4HJTipHtgYNXOFxBxuJ4XGuI0BZxIFB9GGOvURad8NQv2eMR9S8/iM8XkrAGOmpZ3L
	 bbXdo6eqFZev/4VKxvAQ9FpBdwAeJaZqs7DeAfxJGke1dBLMtbDZtzPKfdjxas3MRoz+W
	 aiuaZn7rNh7wijmD26nzhcJ2NKeTTPM0m2xIm2pXVvleXF0/yQfgOPZzFxdpfecdVX8gS
	 t2e9wWbKwRcBoM2xECnizvwQk0KO6NT933ORY2FbW3yXIPAB0fWdra/ubC1jHw0158g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214965;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QI+kJ+CfbsLzms0z24AJm2Z8M8plwf0XKXNvPD/BBwg=;
	b=TLzVyyZywTuaBpl9Efpsfi8EAfxxuFnSBnFlkhwTYTcOaeJluwBK3+fFAyILw8durbT6
	 mAI8eXvdj2/CWyyyzL21jf4fqwd4h0/g2dtBF6EsFY4JpKKoiSqWrl0DYSKNJeOomGJoA
	 rDZqPxDzSEQ+lmcDFCUqcwjdY4SKmau+kD6jTTiZ2JZO53S86Rhy+zqU4K8cfheE+bw08
	 +njMeaFh45HdALtGTbCWt/hLQaIUYh2RaOqbhwy1waXlv7+IRoej/5tJPoQ+FKNJJZrwA
	 DZtZihJwJgZoz3eIl9oEGiHnTMRhOb6Fv/tXeQI1Q5kQmr8rollAqbBpBwnTQK9Fhyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgIte+IN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50512606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgIte+IN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93611F008A2;
	Mon,  9 Nov 2026 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794214964;
	bh=QI+kJ+CfbsLzms0z24AJm2Z8M8plwf0XKXNvPD/BBwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QgIte+INsEROQzNEJtbl1gXsF+PtYBf8lpp+bLG+pPl9FGhYRfgpVDbnAJSZeshM2
	 AyfwTqxqcc0s2GoBqUMkIYbpmWJNEnXMH9ZRxEDoY977XR71aL29+3pVvhYhvr1MeU
	 xqQ1LdqvtzDR/V65ZZ4ahp28UZfC7YSLAsI+ta0Polu9BFKhJJEAu10MMUrQIOehAt
	 cKxGdiIBq9C7S47sbT/qtO6qPhyNlwrG2viL4Gww1p8lIrURrjjAJ8Inq3S/rGsxZI
	 iYfgK0scbEihtiXskuE4T6CLOFSC5VABHDBvr4+aUIclK7hUXVasn+5SPdZyf958nn
	 /XP6ScPcYVaDA==
Message-ID: <sashiko-outbox-204650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pwm: Fix active-low brightness with default-state
 keep
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <9524E319B9AF9D1A+20261109085822.3755803-1-raoxu@uniontech.com>
References: <9524E319B9AF9D1A+20261109085822.3755803-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:02:44 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> With default-state set to "keep", led_pwm_add() derives the initial
> brightness from the PWM duty cycle without accounting for active-low
> LEDs. However, led_pwm_set() inverts the duty cycle for these LEDs.
>=20
> For an enabled active-low PWM with zero duty cycle, the LED is fully
> on but its cached brightness is set to zero. Conversely, a full duty
> cycle is reported as maximum brightness instead of off. This exposes
> an incorrect brightness to userspace and can restore the wrong value
> after suspend. With an optional enable GPIO, the incorrect brightness
> also causes the wrong initial GPIO level to be selected.
>=20
> Invert the computed brightness for active-low LEDs, matching the
> conversion used by led_pwm_set() while leaving the PWM state intact.
>=20
> The supplied fix was reviewed and this commit message prepared with
> OpenCode AI assistance.
>=20
> Fixes: 3d3d65bd2764 ("leds: pwm: add support for default-state device pro=
perty")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/9524E319B9AF9D1A+20=
261109085822.3755803-1-raoxu@uniontech.com?part=3D1

