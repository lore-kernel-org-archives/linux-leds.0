Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263275;
	b=dNyI85yBzMEBSLQBJGis0H7LssFlmY9wqSFkciVa9MmPHZpEbcSdS+CD3yMrAR7o4a2B
	 2HrJTntkmLYZmFHzBdEqaOuIraivOkb/IXHLzHyiHBI5piOf4jgQS/Zj7hHCi0kASx5/0
	 LhyeoSn8wQF5/rbaM9YsfiN9OySj6H7cftTTzXobsTvEjq6ABp6jovLphzMGeGI4V4HEB
	 1FAKK7eZccXqT9UrpJ3RWllhWDsosxRRAimvysI7Ic75Ps4USGQaALX0qVC0GzRUDC+IH
	 8GoGSexf7naVJiNxzW9/v8up1fkcJ35OUOuSCbXYigcOSOv9mJSVtY6lS6b/cYuLUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f6bGIyDMNV65Ko2F7VO289BtMAt1Pb3qzZvVYQp8cT8=;
	b=4b0eb5Evcf9vUsinWTChVeLuJHPPzU1fzCgLyGBiUlFeTTrthgjBfbIAoPN+b7nK5BH8
	 4gdsSBtW0nv+s2FS/ltzYU2FkO6/VgvOMN5PrZP4VyAYxGNGYg9dqr1XcnJUxXmPDTfZq
	 zfG2XZynVHqz5wVovaJKQcflgv9x0DuTWPXyQSJfJrn7j/m0vbUO1CXrj5drCGHKBqqCC
	 NhR0CpIrru8dxAC83EhX8G87c9UMbJQ83OZG9zEnuWiH2oRxXlo9rWKHzeJme/ZXf9jpF
	 IN9/9CQRMIzyUOkDozpjDxGJEccv/Wg8vVSBY+BcF388SWGuz8yU5Zf6+jsSJevP59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oxKxXZvD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533FC606A31D
	for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oxKxXZvD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E467C1F01828;
	Thu, 29 Oct 2026 08:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263275;
	bh=f6bGIyDMNV65Ko2F7VO289BtMAt1Pb3qzZvVYQp8cT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxKxXZvDso4SGzAfaANR9XFTrmk51Zs6hkTQazxoa8d85K9cWZ5sGvjt4Xk6HC0aR
	 hZlsvWmtPc+S1XaE8nGEAKR+URUUQUNaxAloVxmhcekuUNYFtKTgLLAJlte2pQjEVt
	 m1k1ciHyUuN+i6fUw3hX477ybPDy3vVb9db/3u6PANDaSDpm4v2CcVo9atlD45okKZ
	 HR1zI6Dn8xEprZrP8bCq2KCnsCp7kBNh22LLVKBV2K5APnh3cS6b6LXcjS9esaI0Mi
	 3W2wP0mTzwYgpmSD3ZTV9hEKPzVPrq83HfcAjA6KZn5PiO8EvJqI/JTJtuS0GzT9Uy
	 LYzJCISTI4TRA==
Message-ID: <sashiko-outbox-188982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: ti,lm36922: Correct filename to
 match convention
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 08:41:14 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Convention is to name binding files by one of the compatibles, so fix
> the typo in the name: '.' -> ','.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029083811.4335=
4-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

