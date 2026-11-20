Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162731;
	b=MmU5hob7aLxzkv9nCTbB3qfkRiIlpEGTJHu8/lx0icnpm/YhI7hUI5HZWquvKg5y/+Jv
	 I8x+1sZMFN1nGN+w163rXbNdjdSdwvQnOovVbF/ZnOhI7crBvoh9oO+HIEhMf4UBm7Phi
	 4kF3L+n7bpQxaayj12zgVm6MKcDywQDV8Rg9DyfJnQ1oQ2rHdCi3ZycMrveadrmqlwibU
	 1eUwAp9WL7Nj/d/1hcDULWdFe2rFHwO3qOmB2dGR12Mmk9/KItqDp+Oon+WaBbkh0g84D
	 IButDiMRliGElxafMieLAlrSgyXVDRXfi3vJrmrkjCdkEnxneVwifucoX/3EdLlSmWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EURp5IaK/gwHSkkWBU3bd8YgPlDtZXwC1YvImYjJNXg=;
	b=dATIDTt/eIb7r6Lm94y5YrB7qFB5L9bY0fYazcLuC7FJM9DX+WbVHD7atLyZrbgtFNBC
	 jIgVDaQ+HAauUJj46yj0af282pOir0R1JtdLOn+3xhPtzwsNyorMNu6Tq1zhQUfvlul1q
	 kS474c6WowlpzL4km68B106/j8/1A12maeTDcy3Bg8Dxtya/iqB3h0fJmdBmfd9jKyhnE
	 TlYSo+wU2KbJcB59qAt0dWGWb6DDGo7zEDerZJ3D9HFClnYiO9SAymaGhvXD+Xpe9a5PX
	 4Y8RSyt8UdWluX91du6tWNtVLAMP+Nr53xJaps1kXFnfyfx/ALvz+K2XxwqXZ6QABUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0ZKxsnW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52F606A320
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0ZKxsnW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665851F000C4;
	Fri, 20 Nov 2026 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162731;
	bh=EURp5IaK/gwHSkkWBU3bd8YgPlDtZXwC1YvImYjJNXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e0ZKxsnWxlnJaA0ILsGnLqGfl2kK4ngXsK8PBo+xjmYrISxkZbPpB6omnE1ayyBqD
	 kz2SS2gHpTsRRGfHxOw0DTOC4/qldgZluSIXneS7HjawE19Bmku9PkXFSacWb77r9Z
	 N6wot4ueoTJiR+8/1cF+M43q/8BQLq+gZ/WzYSSoGcuIkSwOqABJ+OQhk/l75bTFgs
	 vsvZ0rCasVtKX4wHiXaKSIfW1lmhuw8Zjar3HQr3MRSuvro4wsl0SzPip1nzy6J9ft
	 Q8PS7+A51XIE5QfPUdnU56xI84uHP+lWBks6ZDmng91rN2CWgox7IMGZ74wZ9kwMWn
	 orHmVhET3oaew==
Message-ID: <sashiko-outbox-224705@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/4] dt-bindings: net: dptel,dap8211r: add
 LED nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120081106.2919010-3-a.shimko.dev@gmail.com>
References: <y> <20261120081106.2919010-1-a.shimko.dev@gmail.com>
 <20261120081106.2919010-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 08:18:51 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Document the optional "leds" node supported by the DAP8211R PHY.
>=20
> The PHY exposes three configurable LED outputs, each of which can be
> assigned a color, a function and a default trigger.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120081106.2919=
010-1-a.shimko.dev@gmail.com?part=3D2

