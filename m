Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528214;
	b=TgwjIOIeF5Zy9DdQgXHKgqRXkoTxY0HMvKjI4f1/rBBdkVr5m3Ri+vSasADHg0nUOi+i
	 qzetCbKK+U4WGgt1Qj/W+vgG2aIk7xQBHiyPiXgmu/xV8yiviYr1nGUcx0h635Ho7LKd/
	 9L041eQM4i6tQUvOG8oppIbMy8NX5nUuGlPPaednb+dra+6eBb7QaPcrIYr9IVPyGdgW5
	 I4NAOw9PFK7m0SL8c6gmwBIn3kpzKW40mgA5DaOojKSnCRaQTHyUm7AC0wxrlcE01nx9i
	 UySxxwry+OwAeEQsvJeas6LL790SBP3bn2nbEpdU7rN37ZPqQ2dAZtqe+asNSKcjtVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528214;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MfqWgYZHrt379FPVWCUOLxR/30Fz8SppQWjQktvFWR8=;
	b=pedzR+zGzd6n88VvoCkM4BwrT7Y2f5nH7b+6yCSuRRVQx82trfUvgLjDhoVEhIKCOyox
	 dhBxD/lA8Iuyx7VIhZPT49oDzbyMqv/zc0i6NIdgjBvvsMcpz3IAFjKi5O58sDuaL3b+8
	 lXe9s2Yp6InKIEpa7uAQXxgaP6i68i+zSqBX9mVa36U6u79PIJSYMt3aPyY4Y4fll8Q0S
	 hUrbYfmzkSJeKp9EVkktSfyfwiaruwpJ4SSqZrfv/p3DwhH27B6wIAPgSr9d1ctP8BS5x
	 bI7GQtR+k6PMW7oz7+nTFJUhypE5recb5nReD8gTJwqLFgRXSSfZCANK+GBTMoc8dkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQjJcp8V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6F606A885
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 00:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQjJcp8V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E101F000C6;
	Fri, 13 Nov 2026 00:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528214;
	bh=MfqWgYZHrt379FPVWCUOLxR/30Fz8SppQWjQktvFWR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TQjJcp8V5mgqbYS25y4Y1zMVMf+3sHhr5D1awqdF8leN0swsKOtBKQVZt4HkiLfAE
	 Gqtrr13ccXx1cF56E5ovzdhnsTpA8OI+ULNssF5c/QRQ8ljWPlORGkCTYAziEL8TT0
	 yiFEqix5+LwRCa0Fg/uzYLjX0F19bBeX21meUryB2WoXvvo+WRlbP7DJyZWUAcP20p
	 uRkTawGEreIRpXj17aSMiONxa0l6Rr27D6TcfiE+nxRFx5tJW76M0zvGWaLYXcZ0Vv
	 1Y2hEX/mws1iBOQ1Fb8nNTit5zhxeX/cg12qgf+hdURyLznXBKVM3MP7bsuSo1yZvd
	 Zbv0zpuNIe7LA==
Message-ID: <sashiko-outbox-211973@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261112-aw2013-aw20xx-rename-v6-1-251eca340abc@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v6-1-251eca340abc@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 00:03:34 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Paul Sajna <sajattack@postmarketos.org>
>=20
> The aw2027 is largely the same as the aw2013, with the
> exception of the way the max current is written to registers.
> This exception makes it different enough to not work without
> driver modifications, but similar enough to fall under the
> umbrella of the same driver.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-aw2013-aw2=
0xx-rename-v6-0-251eca340abc@postmarketos.org?part=3D1

