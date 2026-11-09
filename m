Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251412;
	b=FPA81+YPO4M3JsYKetsRjRf1Z+rYLcm2jeApYQJ7iBcOY4l79fgxVCLWpQZF/SQ9Tyfe
	 Kd9+ScuKVtbXdQ2u9fXNm7fEKfi5LKEAjemTz2BqkoYiiMoqctQjEZcX6SF8sGZLO8zmz
	 pozW3ipvumflQZbYnxPwK+chAW6GpSEBBedP7muw/ehnte+7cp5KF6YpdQ5n1YMUzIhhQ
	 dEeOs85ZLX0R+UWxntaWfneXE93zHC8FhUJFb3GkV6FEEGON/IEjxUKlQ4f5H+G3V0cSp
	 h4BQ3ahZVIvUiCYKPfNsioM+E7hH0j8hYx8sYhiiq1dthE6Y1D+UsSQMCTJGQS0DTkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ajOseqXNTEPyO9qCLJY0VA378Mocsilhr31v1bv5sDg=;
	b=HWOvHcwEoAzu4asi+EmXgTPMq2vFOyRT3DBbKNp67vxuNnt53Ur+HlMOk3Nl5x3I2D0c
	 VEfRGQvy1b8B8yayY1fQZZpXPMd1jKU8f0Hkbff6A/mTl39GVOIyBXsoy96IGv2qB1NBx
	 airfCDlcte5b4hOM7UzG9iKBth6Sel2oAHJ1InKgPFia7QV7/Qt7nJxxnI0OSOoLGM7oB
	 PKD8SBl9WQwem/XEINyj1yb1LsGZKciG4S9AUQKm3FRR1990x31Tmdzjfzo8lQaLbbTz4
	 JLEozX+iiPr9XqKQB3COo+IwApaHVycVl6c6gXCYTUbdHYSR8CK6Qvm6qWZLdfyhxTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihdvfF4+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD602606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihdvfF4+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30EF1F0089F;
	Mon,  9 Nov 2026 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251410;
	bh=ajOseqXNTEPyO9qCLJY0VA378Mocsilhr31v1bv5sDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ihdvfF4+bYO1qw4xIXBtT3uHzM581ANHvRTzKWQ9/7isgBwQsjNAR7rAp5BvqVRah
	 mf6wlln55MA6VWwpRyLfLKQoVtsWMuW01aNRyY/D54iqeerAduGMAZm7kLXBAfUMY/
	 VYqYIhaQU9yv1zxnMKxiYdnVJgAZ243pjtTgHJX7011iJSr1bcwH/jTJAPEGrhJOLo
	 pTk/uCwIfF7ooP8gJL1t2fWzThb6yPCIfwMVcNPcWmO/q2WZLE1CqNJEvPMdgMC+6V
	 N9ZKliTAtd7SnLkykchpBo/UeYgG18uZ70iVqc7ARPBxUViPZjdeL1I7Jvmt7FyDeQ
	 2FRB3lAO2+vsA==
Message-ID: <sashiko-outbox-205463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] leds: rgb: ktd202x: Keep the unlit colors of a
 blinking LED off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-5-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-5-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:10:10 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> blink_set() switches every channel of a multicolor LED to the flash
> timer, or to always on when delay_off is 0, including the colors whose
> brightness is 0. Their current register still holds the last brightness
> they had, or the 10 mA default, so for example a red blink set with a
> multi_intensity of "255 0 0" also blinks green and blue.
>=20
> Leave the channels of the colors with no brightness off, as
> brightness_set() does. A single color LED now passes its brightness too.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D5

