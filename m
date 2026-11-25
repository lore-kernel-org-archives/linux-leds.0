Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611759;
	b=LZDv/29wJ6Vol4MYkMI5bPxv323S417eSSDsLv/j3+sltP8bZhRSfZyrit6wsF02SOJR
	 3s+Xk7gobzPToprpdb0fB5p3u0sz6ZWmLzVoNkeGjet7D6FaC3JKbv89bRC+Gb89Q9rAb
	 svwT4dFd5AiggCSZ9PDCmIfLkTw7iZ2ywifaPeNqlmBGOpuIcj9leYRRk9SGXk2UvJcln
	 wM8/+KNSx31ULT6yNlmubcnKvbRqpUZJ2Ho/nFxpiMRK304ycKRgJ00OJ98BHV6Odo+oJ
	 P7LRxjLNz3zXRtW5/mU4YR6BBYydpHnBsvLwpXJWFJR7fJAvcPu0kCb2zwZTO0AJ+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yvnS3zyIbNGOuj2ISao/WcDN8gkv8+LL+ZJueOL0GHY=;
	b=vb+gL5ucjHlQJwfDNdFaNr99QVSrk9mX4VoB7mXiUF73r9aLcQArTldHvOteHgSUfD+H
	 NaJz2CLEQs9L5/iF+Zyg5s7v+JBsSoWmstjCbVczCBvMDYAlkev22l8vm0/5sF6o1DeEH
	 4tOzYY4QODmVhWkaf66rqXrUsgsQhVN7SsVo6UVyIDal5qD4uoki7N57PwZsKjMXGWPJl
	 QYtn3DuHNkEa72Uh1TmCJIX95PLf5rgtylwzTWa47khsqNRr/ujPP55Z9ypCxkoKBoFNH
	 FOrTjM/Sh+DnulmaSln+9L43xmbzixicWbIXPmBBGZQ4KhtHmfkmM1rKGlmJOwmemcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLr6zF9U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3E606A327
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLr6zF9U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD391F000C4;
	Wed, 25 Nov 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611759;
	bh=yvnS3zyIbNGOuj2ISao/WcDN8gkv8+LL+ZJueOL0GHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dLr6zF9UI4TG55Y88z+qt7fh+mkpijU1cdbMUTezQB5LzP5bbfjaec46NJSOF4xnt
	 OrFeDpG4I/Hxgr0G4xekciE59BNo3285AoImsOTkDdB5BhVzPWAMG7e7ANpFgv2+JD
	 q0ueweyDX2DVa06IfTHncRDZkfzz3G5OLFAljfxHyGPicsyrVmrbuiQVU0TRuk91sq
	 g8j7wSQDefPBIQaT9JgNzFMrKAh+NwPS8eHObJha5XOLgbUfmGpnSRqpjzMwZPnalE
	 NMMZkUADGpdTprSm3a9mG0xW3lC1AIoT682aSR1ovEowi5UwfqJ8+bMCvLG0KALMtG
	 S6vRInSlMFFvw==
Message-ID: <sashiko-outbox-233431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: rgb: ktd202x: allocate the LED array for the
 chip's LED count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261125125719.2565828-1-congnt264@gmail.com>
References: <20261125125719.2565828-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:02:38 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> ktd202x_probe() allocates chip->leds[] with one entry per LED child node.
> The allocation helper sets chip->num_leds to that count, but probe then
> overwrites it with the number of LEDs the chip supports (3 for KTD2026,
> 4 for KTD2027).
>=20
> If the firmware describes fewer LEDs than the chip supports,
> ktd202x_chip_in_use() reads entries past the end of the allocation each
> time a brightness is set.
>=20
> Allocate the array with the number of LEDs the chip supports, and set
> chip->num_leds right after the allocation, because the helper only sets
> the counter on compilers that support __builtin_counted_by_ref. Entries
> without a firmware node stay zeroed.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125125719.2565=
828-1-congnt264@gmail.com?part=3D1
