Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162731;
	b=Hang8tnZ3bGIHa3imts7jqjvGIvtSrkbvTSam3iIe9JPehh57z5dX66x2Onp80gxNiDH
	 OCDQIKWEVBdBsKDfLx/nZ/6jiWw58qZbvyCLhNyN5+dPFIGJwdGuIl3sfnxattdN6h17z
	 eq2xEDWEOueVPo1kbwb5kYnwkwDsCyZcJ0BzalJG42wqlira6O+ZX9upJ0tN7798GBp4z
	 kPNXwF9v2WVT69o/dA72UQjE96EkfWWTJTredRGDhePaJDUK8yd5u/5dhkEJd0OqI7zuv
	 Y1Rji3RaRfFEJaQYoQM5BiOBFuMAl+bZubyf905uQTc99rtLMzpA97OtGa9d7ogCjpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FHzOrnQ0P0fd9UcswSpgH608MmJi7qSGvkn/5P0Hu/o=;
	b=kQmZyp+fG4xUDYVeTuDfgMMO9/1GLBwJFhYTDn6us0s2qrGd93NjyLsSi3Bjyx/YnTG6
	 mtwLeUcD6G1ZZ0Z8JOaFeHl7s4NrA4Cj6kihJxn6Fd1aHM0D598gx97YGR7ZWgPHeEZbi
	 hpKMjn2mv7po0SbZOlMb+Puu92tyrzwNc+qrBH/u7A7HNM4EPyV4ggAG+TuQwls81iBVw
	 bK/ef7jp6rbtfs2lbPhUNexaVb6wc76X02B+Z7Kg6ZkJskvwygBDpdgdxD6YHXrBTLLOX
	 8pl2CroEEqj6/jgJpuWnFKsp9K6mW7jcHnOfRNNBrS5McYjc5uCiVHkelfQi0NtqmAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kc3cqhv7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A16606A320
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kc3cqhv7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5971F000CF;
	Fri, 20 Nov 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162730;
	bh=FHzOrnQ0P0fd9UcswSpgH608MmJi7qSGvkn/5P0Hu/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kc3cqhv7IuSUxJxyp3m7QLOU/tT6mc3cuyWRcAVbSYfd1g3k6F44fiRO17+LN6HtG
	 7yc2+YOowECtn3pK8zbrwTIkQLK4+CNYqW0TBIuNdlO488UpQYDICum5a7B0kY4N23
	 Z+LXyMOD1wpgI7fIb1mccB7BxgOl7jItSfsHmEW/UtxdGeZ6AR51g9xZDg4oplNaV3
	 Yeokn+m5j8DbZrUCbssz5+FnXhzhvWCRW+Fl26f9cZJR4gdu7x0NNkGRiMs+uOXETn
	 aONta5g3tQfyvZFM76uzIiNXp2ifhL5cAi8LmwPPXqC6z7/3WYpvFqnxK3X7EzpXRY
	 DEszXnD4kqFGw==
Message-ID: <sashiko-outbox-224704@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/4] net: phy: dap8211r: fix kernel-doc
 comments for extended register helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120081106.2919010-2-a.shimko.dev@gmail.com>
References: <y> <20261120081106.2919010-1-a.shimko.dev@gmail.com>
 <20261120081106.2919010-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 08:18:49 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
> incorrectly state that the caller must hold the MDIO bus lock.
>=20
> Remove the misleading sentence from both comments since the functions
> lock MDIO internally by themselves.
>=20
> Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Eth=
ernet PHY driver")
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120081106.2919=
010-1-a.shimko.dev@gmail.com?part=3D1

