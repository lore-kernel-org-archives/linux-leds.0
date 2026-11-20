Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181300;
	b=bF1fUWGR5TQWVlTFSmzVJS+SdCP/OCNinoo3WyuCBxU1a7A9nzUZqTj0wLrz5Ddm6dBj
	 t3zSFLsXLzgyumpF7N/mUyBJhlFkzEjxrpST9HIClgGgMJffkgwhNiF4DlKsogI9NePbM
	 sVM8iFLLxO719646MnL0pnFMa0Uv9AECSYh+9DUk1egBzsIzRDgJZNBf+PaBz92KzzR2t
	 +pEL8nOTCSuMP//lfgX03PDj9m3dee51hl2cvZPu1G0V7gGMCZ8wMdq/yJrx4BP/cl4l0
	 kKNnNoLKv4OlA6VwIP8G06hwsEJMqrr4ogT/ow8+L8Hvzop+SPk4Y70z9OyQqrlURgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181300;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dw/wqul3jkVK1v2PHFYmPgAb6KHPPBe1pyFk8fCMTR8=;
	b=I3D3cGnmHjpbrNSUEZMXVSZkzMQ262GHr/DyIbwmxUjWKevSw4JpKxNs1rE8TriiOfnr
	 xgwGcYM1HNz0ryzoREK+9NDNyA8e2dDGlr6Tw+1C/0GIUQ1J//n2w1unnFMkccUbiUI31
	 2DrNqAyc8wYQKw6qvmlQcjj7q3t88JomiSXfaJQEE9yW1VgZ5YK5ODT9F6sefiyxMmof4
	 pkH2i7/O9f0iKCfi44Z5PHNBalXh/8nkhJG6gxxSCxBjMT4g8X3oyHIjPNfWpyQ1/xZPu
	 fBkzVJZf20YvRFdDTfMBfS+hmNqldvaHcg6vcq/tqsq51c8K6UlvTChYZleIIYhO+5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSXyWpF6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54D1606A331
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lSXyWpF6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964AE1F000C6;
	Fri, 20 Nov 2026 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181299;
	bh=Dw/wqul3jkVK1v2PHFYmPgAb6KHPPBe1pyFk8fCMTR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lSXyWpF63RsrwimCZA4a3JOrjQ2N/OwIH0YihS5t4qUjW7lJmv078ZZjl7xGrXaP8
	 gsrBjeDejfLea34+eQScHsogboEwVkHIlvOWFC9zY8saodtpDh4TbJzE5B4LW8bFJ0
	 AAlvPKUZyv9qiyEY3Mm+YeIgKRiV62aoT0mvlro2GPYO0kOQraNlanVsG5ZamImEBZ
	 UJT+RdJI6LXmd22jSu5sKkJ3q6p7osg2hB0kbS2tEnSFqlWfLJ2M+pwqz7te0l0B1W
	 3rKFs4gJBsE7A0lNlyjtCfaA3Cz8mVuO7hJ++LK/EMOzavcvcp2GPCLTz7U1k9o9Iv
	 LIyRTKC3cOsLw==
Message-ID: <sashiko-outbox-225238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120-add-is31fl3206-support-v6-1-0969fd6292ab@amieiro.net>
References: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
 <20261120-add-is31fl3206-support-v6-1-0969fd6292ab@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:28:19 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-add-is31fl=
3206-support-v6-0-0969fd6292ab@amieiro.net?part=3D1

