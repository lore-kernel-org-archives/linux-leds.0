Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251286;
	b=drBz+QqS2tlIIsWg4wEU3JFFggyZ86WF1qBZsERLB8qDykgfBknDUHa2LQdjwrroA11i
	 KsecZwSAxFn1OJzLUtQ+a+YY3g2RQKgcVk6MrljwRmlvTj/pDHKzX+ZLw5mKAOGs6IKgE
	 oCC8ETAcLXDIAdkE8xmTy56ro014kUcGZnld0tvs+f8OGgWFMAEK8y4ajrXC4QlBz3jAB
	 PgZxrUSADcyDYj774Xk6QCSEviMEhsIXZsKhjlCut7+tnXDh0cWRrf9qALq5B87Ndvx1l
	 Kj1L4MdYHOQLjDi4mbl8Nqmr6HeJnBZ4hZXl4jWE9os8Ihsj5Pr2pZdInUUTAAyXGAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251286;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xXH2UdVnzqgRGnUjndRm0STF9i5yUy596slEgC4qbdQ=;
	b=W9QDo2wOqbz0CiMplyyO0Wz0UgF2IBoHisPF9zE4JrM847vTOh60S3QXVLbV6SRsmhhF
	 IoatlhEWzdBAWoNfdLpV1I/0uJsR9xXXKZHy3Xd+nUJ0LuOabI88Pgpfp/sU9BM8DBdsS
	 6rKwmm8WDivoxbO5r+XYKK5mNUiaEKFMR78HS4yCX9Z59H2lbwcwEBcfJkDrAOQfrN6+6
	 q6gAnciNaT6wkOwj5t2MZMiaCq+TLyi3/oQm2q5jmFeVfWDS4ISDzG5lRcqQFSJnkDxLR
	 zv8zki3BTfD/r+m6vgIxX6ziJf72OspEiVeTCXZMDYO7NOn27neOeG45AjLYPSYQ2RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fmXDANUg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFF7606A326
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fmXDANUg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B062F1F008A1;
	Mon,  9 Nov 2026 19:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251285;
	bh=xXH2UdVnzqgRGnUjndRm0STF9i5yUy596slEgC4qbdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fmXDANUgu+wnK3hOoFjzFjI/d82IgYCMOta4njh57+ZtYteJ8rgxjadQPfQJHL3hv
	 1YY3CVxSOQbL753JO7AJ1fpY+2XO8kHRtNtc/zJEpx0jDaEWnOosgF+To2QYrlv8gZ
	 Y4fFwzJKocgftx7PHlmmxHx0vKcIcLQ/468LbKhg6PbcUBeFHUbcGRF3K/scF5RhLf
	 4YOZhkSApvr12m3b7kK6p2nWVc5+Pyi3ku10sPZ3N2jPROZpRCwEUiYj/G54Zyte1R
	 8DYgXRFbzXQqWUVCnkExn0mQnIGTPzYI35bUV7/4nOmqWV/JwP0KNleorEWqqTVL4R
	 nCMCzI64SRR4g==
Message-ID: <sashiko-outbox-205459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] leds: rgb: ktd202x: Never program an on time
 of zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-3-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-3-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:08:05 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> blink_set() turns delay_on into a fraction of the period in 1/256 steps.
> When delay_on is less than 1/256 of the period, for example 1 ms on and
> 1000 ms off, that fraction is 0: the LED stays dark, while the timer
> trigger reports that it is blinking with delay_on =3D 0.
>=20
> Use the shortest on time the hardware has, 1/256 of the period, and
> report it back.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D3

