Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD763B42FC
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477241; cv=none; b=sih87SlotjWSSVWcZy0JoFPhWvsnqgeVmeFvLcWQlAEjIGThmqv8Ze64FuhQ8IZmDjIqO2l4r2cB2aTiXAl5jU322rIWd4OaWfsnIPajg6bdm8NWz6GgtfprzzEyVn/KjOBlrbBOoN7Y4q9s7RqfLQEkSTYrgTUHWv3nOuy1L6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477241; c=relaxed/simple;
	bh=k76EMRRrg5DcjFZZXT5fQ8bmEzEUHtO0H2zA+Nn8VNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RAAPD0u5+jBrTxshmQhD7U4nV8fjQkI4emKYPt9MJBMHhhTMURZzSBILe3yM4+eIAlkCuNlW4lojaEl3ykXsMDF7w/W3qIQlRPrzMS438+ar4QzjzcINQLujA28dQfT//Q/U8vjipVRLQu+up4D5wiwpZ1nks2NUykpiYcUrE9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyFgR4SE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyFgR4SE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486FD1F0089B;
	Tue, 15 Sep 2026 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477240;
	bh=k76EMRRrg5DcjFZZXT5fQ8bmEzEUHtO0H2zA+Nn8VNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fyFgR4SEPvN7b7YUDpm1L+Q1YC/5cTg9TBZ4FAi/YQ4H78+ATDgjLvVZLhfA/beQn
	 e/R67EfR/b7wDEzy16sJvm8W79WAhC72ZlJuQGRuYWrUMViZ66R+ILiZ7uHraqJjYN
	 eRZvoJ52+akJiovZdMyTpBTKU21obFsBVZxaK7nQNz91/KcVkUJLYep8ic4LbKb/rG
	 dbFBMHY4NshQCle+pNp++i1JarArbIZOqStb5JcSgWCdA8dPeskXnweMPNpLWuoz3D
	 3DYSXNkA0TDRfaSUowFbEDyM8gyfgEooS7ZhQMrePfcn0KIHJOiT1i1el/3wXi/7Kb
	 /50fDS2I0HygA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/13] leds: st1202: Give the channel current ceiling
 a single helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497935DA426302FB808A81EC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497935DA426302FB808A81EC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:00:39 +0000
Message-Id: <20260915130040.486FD1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The channel current register is 8 bits wide, while max_brightness comes
> from the device tree and can be larger. The brightness, pattern and
> blink paths each apply that limit on their own, open-coding the same
> min_t() against U8_MAX, and the blink path previously drifted from the
> others by ignoring max_brightness altogether.
>=20
> Move the limit into st1202_iled_max() and use it in all three places.
> Each path programs the same value as before: the LED core already limits
> brightness to max_brightness, so capping it against st1202_iled_max() in
> st1202_led_set() gives the same result as capping it against U8_MAX.
>=20
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D13

