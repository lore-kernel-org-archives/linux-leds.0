Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208281;
	b=iR0p/HyfLnARpfbnzv7Acb1EN7LzvSTBB+ln8zY7CEwQw61CvwErVKDwrTy8FtegSlIg
	 XZ7tzQrgQThLP6iiDTh92QS5Nl1ilY9oU2nrRB58PWxrjJ1xu83SBTBx7fgpKhfTR+f6I
	 /QvEnQwQhrVM3TNBWBGpFZmR2TUSJMH7UbriQGeBq3K8zfgEjJDy+nUZCI0wR3NQXAC1H
	 U9MSeZl3ouAn09RMakDEG72KL009yWxpJXLP13zUI/je7hCyopk/Vv3t2e4B1YM0t0pVy
	 MvMK3DD0lYnhLmpHpvaJukPKL644x5xAwniCb8POMu7F5hJoFwL0ufGE2SC8rMQx8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208281;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2z/N5jLkrbPONB8X/HuMbly6PP1uv937O5YBdvWMIdI=;
	b=SSdfzOioW+leO3tup4Pxl+EfSDdjsvLiHOiemuHSpL1guxcCWTf6c3Pdis/jN5Gq9gTy
	 7qsCzccXfS91LGEdd1GGCBNOjmgxvmLjFNUOJsRPfVmGD+5C9qpZg0AEdLEQdpFWLO/o9
	 7VhwvyZzjHHUJBIwVtox3j4DOWRTAbj4dJUv2aglmu3uViy5NqeIxHRsQp8stQUW4GrBQ
	 qqY0FgO/ltHgrgOIzH5gkgkwnPBtp58OnvF7FSJiVCNzJn7WsVDbwFHYdvFQBVFduUEbe
	 0bSR+bHl3LfjbrlGZyqK1iqkmyH37zZ5i2EENmwkuX6Xmd23mS3IYXMZRjsKvqeYosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/BosrJe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD70606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/BosrJe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134791F0089F;
	Mon,  9 Nov 2026 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794208280;
	bh=2z/N5jLkrbPONB8X/HuMbly6PP1uv937O5YBdvWMIdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/BosrJeOoZwqJGEZIOI5C7mlQ52IYPn+EpidqlcViYutVBYwTFiKnE0zRb6uz3nY
	 xX57f1BczlbHvRMrWtWXBtqieRBYctuVIlVcgnIntRv1lwkrEOp4PGzZEUfx6vDS/o
	 PzrXcBgNxSOdB4pqQhYDES623MT34e7rrV5oKn6dFu7+CjOI/zot1hWhwW6WcujKM8
	 ibyWtKjvtLuB1qgICbhbqfdrfPVFanJSIFGmVSGvSHGdQc3teOxiyl3Go66cjslEmG
	 RJaV4rWnp02si3bSAjOMv3YF2ovELqPCMg2m1xk+xmaMaECFtt69lvRaNuUQ65odDG
	 5Uy6+Hl7/YMzQ==
Message-ID: <sashiko-outbox-204532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] tools/leds/uledmon: reject device names that are too
 long
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gu Bin" <gubin@cmss.chinamobile.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109070539.1922-1-gubin@cmss.chinamobile.com>
References: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
 <20261109070539.1922-1-gubin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 07:11:19 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> strncpy() does not NUL-terminate when the source is at least as long
> as the bound. uleds_dev.name is passed to the kernel with
> write(fd, &uleds_dev, sizeof(uleds_dev)), so a >=3D LED_MAX_NAME_SIZE
> byte argv[1] leaves name without a terminator and the write sends
> trailing bytes that are not part of a valid device name.
>=20
> Silently truncating such a name would create a device the user did
> not ask for, so error out instead, like the other argument checks
> already do.
>=20
> Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring user=
space LEDs")
> Suggested-by: David Lechner <david@lechnology.com>
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109070539.1922=
-1-gubin@cmss.chinamobile.com?part=3D1

