Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916485;
	b=QORT/remsaEGIJG3ANYXSeSbKDC1lXl8DWODwT62px4F04vnnfNNd00IRNijrP+G5ZbB
	 pgkJqajUNcI3BxrYo8s5BpF+3B78OTTkPv9ZsXOIuXWDYHWcrTWnybSxialjYj1NQGutr
	 pqwaAdfNXdOaI/wIuFydSaW31yGQYadiiMqx5RrpAvk9Yr8QABhEFgj9m5Tjr+HAM8rNm
	 /C7LNxBi9cpscpS9xa7/mDU1PWnIs5FEkokHgxKKvTCSTVs4kpWISGpi/zZdPla8AMVL3
	 BK7aNCiDYadE2kpd5TESRJZN9NRL4q7DSci0bFHOCOf86Z6fwJbOaJhqKoLFD6earRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fAjiZp95jtQex5pJEZn2+7MtY41uf4gsNyZrik3sr30=;
	b=wVZxrT4QBJbCFoH/pJTbQBrfXvaxUbCKH6nwKfhctDyC0Yrp3VvnP7/gUyZETswpxanr
	 ot8pvbwwXpMuHeB0WM8wqAPjFS/UQr9OevlFSMKizAAwuJzzRBJ5prciFAG5aX+3sYDQM
	 XT+KJRQ7GzYl3nIIrokJtyGpvA2HgZUp0evD/J+vPZhEk4dPGDvPLihDXZtvv+yXKX4+x
	 bAlVA8yHSByZ9nbBhPlnSUquNPpMLEWrN3WDGyfVMJ70Bx2mKB6EgPNrgxFQPucrrLuDJ
	 L31Rt5Y8pqbwPGq3A4uAvRJ8hM2jwRlVx4/Z8A5o4xA0TXejCw6eaEJJlBm8/vHSJSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLqPHBgj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E48606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLqPHBgj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660831F000C5;
	Tue, 17 Nov 2026 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916485;
	bh=fAjiZp95jtQex5pJEZn2+7MtY41uf4gsNyZrik3sr30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLqPHBgjIJAdsA9ebanQdHaSv+EeNrUoHqePsXSGClmdwvqF4V9LKdgf46OQUBJht
	 nJLSrgfzxT03bDMnuSNQ+wNTncUvdeKgLQ5y056BrujNqMuexOnfKEgFPmd+/jyKDe
	 eD7etvEFiDm4d1uEf62V4iKZ8bOf8KWLjzmA14jlfl3OjArL9vpK8pxykduOtbAmT9
	 WnhlJ8ejiGXqatg5W7+vU+nxA/bJgIGe9bJyP8d5jm4CIrBhbaUMc8EMIByfOk8E//
	 Iz/rdnRgwV7qFBWxHHJbcmoS49ZElTuSe0bfl56ab5rni1h6+qGo+f8UQj84OaCgtJ
	 7t7WJa9WGzi4Q==
Message-ID: <sashiko-outbox-218741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117114432.2794961-5-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:54:45 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add support for hardware-controlled LEDs and brightness on the DAP8211R
> PHY. The chip exposes three LEDs that can be programmed to react to link,
> speed, duplex, and TX/RX activity or be driven via the force mode.
>=20
> Implement callbacks for led_brightness_set(), led_hw_is_supported(),
> led_hw_control_set(), led_hw_control_get().
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117114432.2794=
961-1-a.shimko.dev@gmail.com?part=3D4

