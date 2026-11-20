Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133465;
	b=3lrU+yJAxy5tICNLZwKOflE2V/MziO5ld7opJvMzrfR+KXJCJKckryHb+oIQgnayLDBR
	 B/0d4Y6WVbLjGJty7tKVLFTQV57drFe56QKGBFNTrSjUesu2d5JE1UMb1++mxzyBtdpd9
	 +fs9aKWJKhlNkNubzJG52Z8G/bm2VJuZcGLXgTdpYy8FuDH7Fas64SioZv49+nRdb9Ug/
	 fyfakb9qk2AKbUk6O8YltBKZkAtSsf6uZMIdA8Cx2UDylar87hVtrcIfbYfAuo7RlsDiv
	 vuxAtPFFDWJZflL6IG5robKF8jyU3PkDsKfdbSpO0/Kg1KnOL1N7D4GAjpmWKsQF0VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y3lR6b/uleVAogHWNQ7jQ5/xqhyNGR6VwfGDllA/1b0=;
	b=pJO/FEaJU6p03LLrgJI1RBOagWg0Z+TPdusPH5gPU9QP8EwIWLRkAYPCHdkJ9Bw1+c+i
	 B1ZimIYNPDoyblr1517B1AeYY6TkYP7+egJB59qCSAIf7fFmwpUDrA/3bMsgGkJORNlhr
	 tKjRovzDZuPpSebdFaVCMIRmSjp40uhTUEo+4YQNE7p63vBBzQC9oVyPBVvNCjOiZRPeG
	 TS8vcat5mTRPezaNd12DR2a7lJBW8LskPNr1xtjUiojkrl83d+oZe/xz5LN8yTn8CDbff
	 6xjw+cTjcsx+rjmbBp7I5dccq2ilM51ZsYphF+BjYusPHGdi9gj+wrhqP+s+7shPEiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMuPdh12;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB83606A33A
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMuPdh12
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8241F000C4;
	Fri, 20 Nov 2026 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133465;
	bh=y3lR6b/uleVAogHWNQ7jQ5/xqhyNGR6VwfGDllA/1b0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMuPdh12y6UDu6W+RZHChgW5aWekPluvudwx92tFcfBCblaRWTM1NdZWLUajrYP83
	 Xc4MdI6rUdU46RIgYQQDG+Spwx5ieoCLWlqH875pfev71MhmmONPa67U/KMS9xAsOA
	 YQEPx3jcKDEbw1lEcM9f4NTHpE4d0Ht1JweiE/7YE90hGj1pPFa8EqBI4tFYc0FSJE
	 fTJVvrVS5Vqjr8x0Z7uAoxcGrLFbNa2mLgGl4HfDzhiX7csSY70/0U+STVkjxGeq9Y
	 sc/LosFAZzlG9u8oSP8Q9djpYr3YN046h/MYohZt3AIVKL2nvwE8lYEBYjrABN+Ijt
	 dmM4iGfk1AYAg==
Message-ID: <sashiko-outbox-224251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/11] leds: rgb: ktd202x: Keep the unlit colors of a
 blinking LED off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-5-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-5-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:11:04 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D5

