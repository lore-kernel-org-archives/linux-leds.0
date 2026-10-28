Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176074;
	b=UKmwQ8BTmxXbAQFbrzUBkP853F7QeDNk85RDF1z6hGIK7wDul4OE0coyFVChPErFqYth
	 kgdlLsUeEdsYBdg3A3ZkwWFWNfGs0LVHlUmpHgNQ37rbN4LumAx+YSqpe6WNHrVWxkmH1
	 DJW80AOvWlwaMzy2ZwkW0iyvh//AEqgsQqBN1tGyOv8DvvWS/teRlD+12pLnCW56nGUOJ
	 culEFGjWQGEWN/uWzubKgXC16ImvVxwB97/u2L1g680pQZ8EOztW7YhPQR3SRNajwa/us
	 gTQ0KW6smGRdR/VLwIZ6pFcDKc1KhUtA3D/UIekhoF5XczRjOpE50UY4u5wCw/pLofQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176074;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Uuk5OJWURLcuBfsyApQijyTwDO2GTGeBkMnuWqRI6JM=;
	b=VRwkD1tmbNF57THRo4QQRaZuIS2f09v47vKiEcSwwsI3ewKZOXB9rTaLxBxUVty/stLz
	 Y5eSQgmUpZGA21+7zNrFBeUmXv/mQHce/YrBAts4BZPeWZ+9fqAtzvAYm4GKZVejbuKcG
	 42ybj+vPrUft5aBzrSb5LumOUufShVF3o4+tACNL5dn5UIStexfE9AzEMtrj15phS8ngK
	 9VyTTyDGQGJxXgBigI6lSjAEy8tCPOI4ziqtXQEXK0jLuD1zfO17cJr3nRGhcFp9//Sbt
	 hdIGTO0eyRd7R8+YH2salOYJDCWvtq73p6hmulIRjvaJxJKHL3xvFuUscWcp2bs0nYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1cJRS0K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF0606A323
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1cJRS0K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD421F01829;
	Wed, 28 Oct 2026 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176074;
	bh=Uuk5OJWURLcuBfsyApQijyTwDO2GTGeBkMnuWqRI6JM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M1cJRS0KED0bINCM/SXakdaDFcdKkPWWxWXMwWFUiZ4SyCVfcOoRywxMhr4+J9LPc
	 T4SVPnHeuR0SXXKMYRj06ASOb+mkClsdspzP5Cp2irvwHdnBAifEs5n2Oxkp2MyJeK
	 PW2YA2iBF9a0mFr8ZOXda/lh8leDKqpiiluSw1LF0GLBORX3MPgY6khpki7YCdEASq
	 gZZ/DSC/lKYDCrTzua5N+AK+ihlJk7JjOh92gzI6rLDClKrmTMx234BXyXwScbaYz5
	 tJO1c5vDZ5NcGbb/7gdPvCuCpF5J83LfOge5kksb5WmijwTdnP13kQ4liLMrRO2aGy
	 +jH7KxSCXZyVQ==
Message-ID: <sashiko-outbox-187627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] checkpatch: suggest nonnull attribute conversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <bc2cd702455e58feb777cdb230e3ba4f7e1db60f.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <bc2cd702455e58feb777cdb230e3ba4f7e1db60f.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:53 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The kernel provides the __nonnull_args() macro as the preferred form for
> marking pointer arguments as non-NULL. Add a check suggesting the macro
> over the raw __attribute__((nonnull)) spelling, consistent with the
> existing attribute conversion suggestions.
>=20
> Examples:
>=20
>   WARNING: Prefer __nonnull_args(1, 2) over __attribute__((nonnull(1, 2)))
>   #11: FILE: drivers/soc/aspeed/aspeed-lpc-snoop.c:230:
>   +__attribute__((nonnull(1, 2)))
>=20
>   WARNING: Prefer __nonnull_args() over __attribute__((nonnull))
>   #11: FILE: drivers/soc/aspeed/aspeed-lpc-snoop.c:283:
>   +__attribute__((nonnull))
>=20
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D10

