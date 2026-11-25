Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614319;
	b=toyqjqUondNP6GP9/1SJEfxUlLnqxKXBGgr5sB9ebWGvTKLWYEXYLG0FenO8zB+l9M8t
	 wdfHdJ5ld8xjUSOWaG9PbukWUasuYgXcyyKq0ozQkAP1ZJrrlVfXTV+4ICbj+cfHnYpcP
	 xApkf9+dYz4KLucDBu3mtjO/XCGeWF52DCMbFQL0PYahlaeEk7js2d0YdpWn4YWICxREZ
	 L8alC/UcG/iHKssZSbarHzCFKp3L7o0/dW/Q6KGHAVQeOvK9ECFVPibLvgLpklUFehFuw
	 Dgr7VZWX9Cl8WBkPV7qnxgN2r1W+/l66kiSQuSvGmU4rRGPrkPNcGcgbDIwPhC6bH3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614319;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MV6thWkbd5qiWnJwLmMr5SqIWXDcMURkK2/X+KzbMdA=;
	b=ns/0tPWDbugKWc5AOVZbVFdfYJX40qcLFIROtRpCqDVGeeQe9UjKiqpPCSL3UDrqeHiC
	 Nf3BY0zepbE6mScd1EcDTximj7Gs1bZZTFN/xzHrJGmnmTl22zHkG0en9+IHHliTQfy+L
	 anKbROb/S2jD/1RNkR0ShHKbdjqk0o9XvJPwdEhQrKzWFJxZm46sWZmNSi7DgMi53P2OA
	 p2FjJY4uw4Zg7Omb6TXUOkM253NwgH1+eD5tYzkiRFeknSqMotpPBcyYavy40YO5gD4dT
	 Fm4UxwXWpoVehpPe1vcISDLSmbQjHegMmuSk3xhGW2w22D55bmKcy4Imx01vE5BbtQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1Lp0Nev;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375D606A326
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1Lp0Nev
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8E31F000C0;
	Wed, 25 Nov 2026 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614318;
	bh=MV6thWkbd5qiWnJwLmMr5SqIWXDcMURkK2/X+KzbMdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k1Lp0Nev2aP04Hl9CQdPM7w3R+zkXQ4iUjzSkUY+ZXDPnOm5Nh5XT+ULSD2xB1pbM
	 Y6VA94iGKr++PkBG98zqYbCmTXvuwthVZmIfFHad2bpljoeU9iuRRGGzEY9LY0m3Jk
	 bIAhp5XBkpf10Lv5awr05kHX0PJEn9yHE4Tvv9/SASbG8KuDG3x53U6BRSmqlAx8Gy
	 OKMsfnW7X5S2FsEXxKEXTsF55SsNScQJtbtkFYx4KTkvFCAwwaolRWzspfz3olwyK3
	 Fkhq8jVVkMU5Z57hxBGp8jpTKUuQTwz9lo9tLu6uAcKkL8aFkxAmP8wMwN+YS+CzuF
	 1g2jVmQEu/sTw==
Message-ID: <sashiko-outbox-233500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261125134013.2692510-1-congnt264@gmail.com>
References: <20261125134013.2692510-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:45:18 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> sgm3140_probe() gets the LED child node with device_get_next_child_node(),
> which returns it with its reference count raised. The error path puts the
> reference, but a successful probe returns before reaching that code, so t=
he
> reference is never dropped. The v4l2 flash sub-device takes its own
> reference on the node, and the LED class device only stores the pointer,
> so nothing else needs the probe's reference after probe returns.
>=20
> Put the reference before returning success.
>=20
> Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125134013.2692=
510-1-congnt264@gmail.com?part=3D1
