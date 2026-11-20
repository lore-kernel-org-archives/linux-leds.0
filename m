Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133407;
	b=5f8WmejBRw7d2DLe6QoJTPHxQD7aSAcoXCt5eYV7msUIqcAGi7lEMYkstw54o9f+0o4o
	 f0gws/QRCtpyfQ3NJmYTPvy2NYGejWa9tY+o5qlGjYdESeiHIYJNCDutTCcgz+biSJOwX
	 h2+y9KAes7PwrrrGetNUj6NoL9HAqeGkDuRD4A9twQUr0NnByeAuadaSVHvGUsTLeKP7d
	 xW2usO5oDoLVhJtyzM4a0HbaAtcPH0j7qnSTGpMRtFeJQmNmSc8Ca1nujOx6tuQ8xJ00q
	 hHW6I+G1PQFkJSs9bYPQd0Y+R7kraThFnpKSVyTjrjH8XwdOKsIAUz1Erq/ZjQBadzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133407;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lxQHSJM14rECEhz9rPv2EyWic5H+NG9N/831Uh/elKI=;
	b=fCnkLI/V52abPfM4H2dGgBy7l+HDcuJG0ev18+Q6wlNUeAvWvnjpFgjENS9+OXT5wRf1
	 snfRCKeVW+PTMf5//fTvX6qR8Dgg2uEqh7E9CUhnrPrLBciskZDDlAe8XCZR5lija2Osu
	 lR3ANOF9+0J/OyVKXyUBYDrjUGv1SALXh78sb7MY1bXTqASxRVP8jekz1ysBpUPmmSz9W
	 jSb8PLN/ofswl7uWsWDYSy7cc1DOir9Zg+Dytj8x5Qoptm52OfrG7Z7wAy5noYQCr54ni
	 GzYwnX7G2C/KKdGY9PVOGqtDUbVbxR1MNHo1SinkKIt4EhGdnT7j3w1ZJ7NhIdw3/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9Laz3Eh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E260A2612
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9Laz3Eh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8E61F000CA;
	Fri, 20 Nov 2026 00:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133407;
	bh=lxQHSJM14rECEhz9rPv2EyWic5H+NG9N/831Uh/elKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9Laz3EhFA0MaHpDrg4UQZceOH2FYgRlcUYtFngy/LyW34ZJSUhMrfKGCyagK8njZ
	 1sIW3NCpAFkmSDxiTLYAGBCzkdiWXSvc1BjKgI8ZiMKFUVOKANhuhZQfYo2V3Nsfmm
	 EXH1VMpfl9LuEX5WZxTXfRLVM5vzA8VQpujtj0cX8U7ppB6EQX7FHIt2Ygtgugq4UT
	 FQ0Qgltl6SAbb21zcAgNSgg1I6BD547EXrk8BDepDB0w6jkKeKAl+ZiQgxNR0Ox/2H
	 NB4g1Ols89W5IzBbjnjZDAlTj+WDAI5Luf2utiD1DLBYB87ByRW3vTU5AjrPYcMjtU
	 ULi3QV336FIqg==
Message-ID: <sashiko-outbox-224245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/11] leds: rgb: ktd202x: Add Etek ET6326 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-7-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-7-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:10:06 +0000
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
> The Etek ET6326 is a KTD2026 with a different flash period encoding:
> a period setting of n selects (n + 1) * 128 ms, from 128 ms to 16.38 s,
> where the KTD202x selects 256 ms + n * 128 ms and uses its last setting
> for one shot mode.
>=20
> Move the number of LEDs and the flash period limits into per chip
> capabilities and add the ET6326, so the timer trigger gets the delays it
> asked for.
>=20
> Report the on time rounded to the nearest millisecond rather than down.
> The shortest ET6326 period is 128 ms, and 1/256 of it rounded down is
> 0 ms, which the timer trigger passes back with the next delay_off
> write, where an on time of 0 turns the LED off. Rounded, the delays
> read back also give the same on time when they are written again.
>=20
> Link: https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_data=
sheet.pdf
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D7

