Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223304;
	b=USvCVYrLyhKTkrBeTjcaPkBcLTbX8A4r2OZx8L2EHmMWqiqrKDb9dxi4TrwlwgBlMueU
	 xkMvshhckI4iH+Z+TXG3+v24qsYFaTzkcQa1NkcDkDyRkB/5hOJG1KE/F9RGsVosytH1T
	 MtGKNCxLrc8gGbn72htSQJFGWU6N3Qm0ejBX6Bfl+nQXOQmIp9XWf2GRj052CjJrZeFvy
	 2hqFuTYvmhmNQeh1+JsulxO2H5Ngc+oKhUbB69mJWVMIhsWceoZkoX0WxfRW2Nx3DLgMB
	 SJQmTXR2NvDiHMqNqx0NpO3M5kZ8CXCieK7tDNyvp+wHntgMTGfC40GQbdbfTReDKww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UJJDjm1SLJLRQvjACm13wx8rIqc/a2YkqGWEYGYqfaM=;
	b=vKh9Uwxd8jX/pUill50jP8ukuIK72ZFWdBTPIumObhZWVZUo2yAKyWubEXTWNDRKriV8
	 AbjEdau5XKltUN11+K8IFOZ7kR5jpm26Gvq4AEzoUxwTrn7S2jno8cktcK4kVQmEQ1zN+
	 Z2VIpGEVlVgeWkxGHx5pEpBJy1+UWz6gSd/2KatEhTnBbEbmcD5/FxLkPHIZ967roLMAU
	 JtibrHWW0Pc8BNu1OWlrIegKMJ9xDWQYU7x3lO4Fc0eGwzUdk46/Nnm75F2Ce9aS0I0Zt
	 EOVuUaQGlFrpU+IYZfExokex9jwcjWwmoh3lBAPMB4DcGV56Wiwt3PXIW8NdD/cHPGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReN+EwTr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3226606A31A
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 21:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReN+EwTr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C81F01825;
	Wed, 28 Oct 2026 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793223303;
	bh=UJJDjm1SLJLRQvjACm13wx8rIqc/a2YkqGWEYGYqfaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ReN+EwTroRxmNjacAdHm1GHKiqSyha5mQi933o32xEE+eR3Eb6MA31H9EJsdla7OT
	 75OQfQrSQbGsuW+Pc14Wqe4krobjQ2+Al6Dw1WpbDUvGaMXl6vAuzuZIdBT4NhiqPY
	 xiu5Hz0t5rTCN4EmyzIRxLT/bNUxDGmFpAJZFGcf3aFt/BF/PV6Zju8c2XaO4f9HlU
	 Cv9ebHa9IvclOo0a96MbT1TLY/FqS3peqU0YDKJCaXGMFzuwx6zXC7NV8iPbIuPuQz
	 /u6vFNycSFRQbiCGpYa/TJVZMjx/cn6EXLwdUewjMeWnvoB70lOwUfM/wDrtnYSX+u
	 ZrYLJ/bXJY5ow==
Message-ID: <sashiko-outbox-188461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261028-add-is31fl3206-support-v4-1-e331cee9fcb3@amieiro.net>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-1-e331cee9fcb3@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 21:35:02 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> This is a 12 channel variant of the is31fl32xx led driver series.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-add-is31fl=
3206-support-v4-0-e331cee9fcb3@amieiro.net?part=3D1

