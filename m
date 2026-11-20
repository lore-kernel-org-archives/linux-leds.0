Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162732;
	b=NEKL0y8M8WDeqoeUw1MEqe8FmxzL4nEITtKmvH651isrqWwPRRZVXfyQV3w8Aw88m6k5
	 ijwlPC3gvZ1TqEBEOHlj1FKnxFavPrBRSZzYPTkLEyJmYuv4r+fLRd56L0/EMjzb/UWpc
	 QVkvxWooW/X7i1aSzGOKdCOvfae4mgl4ieZH8VuhE1tlY8/CBQlXfnYjA/HvFjfOswgPj
	 c5djXQ8N9Ouu2GYB5rasaL81fz47qj6AtlbnMe1EvT6tDlHG5tuHVGx2V+2G0ijGUzIC9
	 CNum7r0aNPJ/BCd814TNPApXLj6bk81Oeb9NZ6WxnHSHSvNdWHRaBwJuf4IdILbePGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y7Pu4jNNqALcp+i2zZnd+rG6O/fRzAoQJVeFNp61v/o=;
	b=OoWPSRQVA8DkvxHDi4c80peDO5wyo6rYKuu3zHEFBi7VqFxK/+0NTxEflra5Ay+9ug1I
	 0+/SI279aM3p47NIgfy+JbWBrKVJU+kMZjKhK8VBcqVFbe7Fhx+MU+uTHBosLUeIjd0/6
	 RiWxQ126gn+HqeGquElCIgtbKSZFYxJEMDGL4siMjXRUlOLvs5Y+Cp1EP1cPhbZqC5/9m
	 3e4e4+xeJ6JnuUO99y3eFSiTgs2MeRVm8XCPWd0qhf4aJNLfSNZ4+vfW/tRHP5zWIXFpQ
	 fnjIp0uOmb+SvvF4+rJU6/bPtL1JTtKZHSG3E7M6+JuSJbQkh+DIycg47+Ram29y9bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUwBKPBU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A9606A32C
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUwBKPBU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D51F000D1;
	Fri, 20 Nov 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162732;
	bh=Y7Pu4jNNqALcp+i2zZnd+rG6O/fRzAoQJVeFNp61v/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XUwBKPBUiil/PpQcc5maM8WMtH5PsjMqp2A+vHj4eCywAhRA1FF0b8I2AyvM2OePp
	 i6vLKVv48zziY8IOcYuCHP0psqaBnB6J906M0qlwl0OCUm4FEvTuQo8+NrvNFGJTaN
	 bNKJkRKp4M+4eGYliQPjgB4pyypSWVoNYbJDi2PJSQYpMgNoGpXLQw1jiZbABJI7jp
	 ypL+UB3klQIDPGX81ub6arZWPSno8UKXjBBbtkt/y7WJSs0hr8ygwoqae7ycqvIbVB
	 x2KnogOfM3xleGgT7ipIlDPIJKjA+wkCneNWEDD7OBuxtn1nK4ZWlgeraCrrlGnHQ/
	 /0LZRhFnmBTBA==
Message-ID: <sashiko-outbox-224706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/4] net: phy: dap8211r: add extended
 register write helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120081106.2919010-4-a.shimko.dev@gmail.com>
References: <y> <20261120081106.2919010-1-a.shimko.dev@gmail.com>
 <20261120081106.2919010-4-a.shimko.dev@gmail.com>
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

> Add dap8211r_write_ext() to write extended registers via the indirect
> access registers of the PHY.
>=20
> This will be used to write extended registers of the DAP8211R.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120081106.2919=
010-1-a.shimko.dev@gmail.com?part=3D3

