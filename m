Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955653;
	b=AtZf48gtQKGVPlVqj8bDc+g3NeDv7czHfNhKeLSbG7GicXGunDDx3s1/yjeO9FqwWUAg
	 V4c/7mlI1FEFgDfifC2vT7ChvQlTFzc86IV9yf0OzB7ogjCJ9W+9kWtTUfnus5QwkTO2B
	 +1VgI5zvlhGmbLHYWfr1ML5EON6acrPtSoExID1rqSObjYhBeO20qR4C3eFQM55788f6o
	 mc4IlAMRolWdDzLY5IxPGXj0x2poNOZXE5A6uduAojAG0AxrWacakIQwXSzIe4vSOiPDi
	 ySdRou/r6LRhLECPVvDDAiYgUIsJKiRmtk6X6OdBWauPS70xYKZE9qyOIsCCyDg/Xcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955653;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/kVacjMGznLJYleKDXLu4QbznPnvQfG/rDMUraBzvo4=;
	b=QDNB04BbbCIJfgjzgLCcSuHUfQDE6Qbp8CBIcgiAqEUYv4B5hp7Up+/F6VZZCvvq5X3m
	 B7DaJBL+a8aYenZ6pHWiAkQoiTPbwVHCTHMUUvkz0zemHgS7DRDNMDrQydLHuvt8L6EdN
	 BhP13sUOMP7g8jxdOr5w50hM9Q/G6M5PnY5PRCFY2eowsSP6x6J1T16zouLDYuEu0nqiR
	 y4b7ddXYsSVBQmZI5ORtMwcCtLSfH0qrqdipaUtlxB0NcjGhjO+0JATAykrcLBeXWoFD/
	 oF77a0Kr+S8eA8PzhD1//2fGkh/CfaB7wGuddkyKqtpkodn+FeycdU5VCHtcQOgy7ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/d846xk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F5606A31A
	for <linux-leds@vger.kernel.org>; Sun, 25 Oct 2026 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/d846xk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E481F01825;
	Sun, 25 Oct 2026 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792955653;
	bh=/kVacjMGznLJYleKDXLu4QbznPnvQfG/rDMUraBzvo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/d846xkDSOJIOQWFy/DvygKgEC3gh+OvfRtbUHJ580ei55ZZz5ohaB0Of6zfg4VN
	 Qe81X2xZGPalyNIlQHjLfSLn4V+TU4GhbDTfJxuPp6X/+gpefOw8rXtv8ooKckHPLo
	 sQ3oWpMJ5C00qtkWPPs/px168rgqvbw5CYf3guHrfpvxKSjR+ggE82+WppQD9do23k
	 loDqYSq0M9vAYhc1cAq/Fc4T+AVgwChk509afLCUfj6kRbDouYgaJcl8C5ogTJwV7Y
	 x1ITsbIvhRpAdk9Ty6OskF0cZV6urTbZQMMUWecLT2BLzbsrVAS2te/vyUuo4LRRV4
	 ROsAFUYjWWVbA==
Message-ID: <sashiko-outbox-184357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp50xx, max77705: use
 fwnode_for_each_child_node_scoped() to fix fwnode leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selby Mashiki" <mashikiselby@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261025190331.449462-1-mashikiselby@gmail.com>
References: <20261025190331.449462-1-mashikiselby@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 19:14:12 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> In lp50xx_probe_dt(), the inner fwnode_for_each_child_node(child,
> led_node) loop returns -EINVAL on two error paths (when reading "reg"
> fails or multi_index is out of bounds) without calling
> fwnode_handle_put(led_node), leaking the child reference.
>=20
> Similarly, in max77705_add_led(), fwnode_for_each_child_node(np, child)
> returns early when max77705_parse_subled() fails without calling
> fwnode_handle_put(child).
>=20
> Switch both loops to fwnode_for_each_child_node_scoped() and drop the
> manual fwnode_handle_put() and loop cursor declarations so references
> are automatically released on all exit paths.
>=20
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED =
driver")
> Fixes: aebb5fc9a0d8 ("leds: max77705: Add LEDs support")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025190331.4494=
62-1-mashikiselby@gmail.com?part=3D1

