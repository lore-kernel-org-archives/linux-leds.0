Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593242;
	b=oTXhFkliHnPGHqKjYN2eM3coAfY8W/kv/Nnq5QD+SLQSnwusHkJlsI6e+3aZNQXNnDMG
	 lJRNP1Iw8R+5iP4fz5/mWcdWDqEevKccXCgMWx8nra8wpWsdf/GPn4AkLQ/utkVwaOqDG
	 biTRXBQXN2MAUlRRsbMEnTQQlWTgO+7EDbY7jRw2WE1CfVVrAXqdPnJ034MbNnceIgOgx
	 cpQCUwO1I90GwCPevVVM2emDm2iwWe6Yh2YZw187iFzFCvUanXyIOwNvZj3c8qf0j0qlJ
	 c1Bjev804hBNWjCTB2IPhumYe0Y5jZjxobLokP0jbb2VO0VaBXEicSAriXgayttxmIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593242;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XLLarCVpsTgHSDBaaacxJiJc753se36iMYyv/wJ72Kk=;
	b=NLq/B+cghc6nU7ld4rLXf5Dj8VeQ7qneaTtETEDuJzyf0swAPmYr1erE2KD0XED75bGZ
	 TIxCOPPwwozg87esvY5lxgt+UOyNiaNhg4I/muQBd1j9V7GEvG9bXK8uK6KlxjpUdOq5i
	 +4UGmuPjuTm0FUqTOqJbhmcT1VpqMyh24K+mh++3SmqPYgwwbG3+JSiYyTGqd+Xzeuti4
	 lXmnnUEJbBQEZQtYee79/RbfYwfDdgVUHK1WBRxwDPzRKLrsyBGoHsOtM20S67Hm+xfwE
	 gPW7oLM5QwpkNejcK0TizyPzrcwYQXCBG6fzd+RmCga7Ea4E6VslxMmd7QWhnGQ7pHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ldxzyd3B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D02606A32D
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ldxzyd3B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0F11F000C5;
	Wed, 21 Oct 2026 14:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593242;
	bh=XLLarCVpsTgHSDBaaacxJiJc753se36iMYyv/wJ72Kk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ldxzyd3BMXsWfOLgsDUaAiX0rknx3LJsDeP0VVXkcV0WD6tv7HvIgpWXvLr03byRQ
	 fk/eR9StlNP7bT9U5WGL/LrXRjVYSmfP/vR+99eD4FMp9yMzIMujtA3FdHCsYUx18V
	 l/n15ew1Pxf9XRWDARn/b/11dqGrCF13kq69/Gcd+WKsDAQoI7yEDjRMMCMxppsvUb
	 qSy9NNNGYgjxJBE47hJjrzD5V65uYkyXhkgivGowPrDoDsaykIx0C1TRnuEytx7kvr
	 6aseiRy/fByHePpS3Bq4Egy9ejHfnfs52cLGIh3PDRHTL2a5UfUhnia2TWbAKyUBlI
	 95ZEM7qIfD0Og==
Message-ID: <sashiko-outbox-180382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: mlxreg: Fix missing fan LEDs on systems reporting
 a unit count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Radensky" <fradensky@nvidia.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261021142824.603605-1-fradensky@nvidia.com>
References: <20261021142824.603605-1-fradensky@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:34:01 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Vadim Pasternak <vadimp@nvidia.com>
>=20
> LED platform data is shared between systems of the same family, and the
> driver registers only the LED instances that are actually present on the
> running system. The platform data entry names a capability register and
> a bit in it, and an entry whose bit is clear is skipped.
>=20
> The capability registers are a single byte wide, so a bitmap cannot
> describe more than eight units, which is not enough for systems with ten
> fan drawers. Recent CPLD revisions therefore report a count of the units
> present instead of a bitmap, and do so uniformly rather than only where
> the bitmap would overflow, leaving no per unit bit to test. Platform
> data describes such an entry by its 'slot', the one based index of the
> unit the LED belongs to, and leaves 'bit' at zero.
>=20
> [ ... ]
>=20
> Fixes: 783259e9b19d ("platform: mellanox: Introduce support of Nvidia sma=
rt switch")
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021142824.6036=
05-1-fradensky@nvidia.com?part=3D1

