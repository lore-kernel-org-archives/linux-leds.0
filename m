Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023325;
	b=DkGpEGUzqS09xFC7UZlYLrqGSfUecveJrRDpA5cFxG2p64EMtL7GXfRJYLhp6uYL4xrr
	 E895ivHsqkHzj1356Qas9rggVxfo5LNilB7N8kXcPxIHDwJPabBvmllNqXy/KSOnOtZ8h
	 opaZeemHmaPIOsJv5uOk3LyeoqscyZIzeun9OTTB3yAiZ/dYJJBxIPI+yhEPoJFWdnf/G
	 +TSz1Xx5/PkNmQesOxMdyXuunKRUB/006lEb1Mo1iaUu0PlIZvfHfY6JNjMuKn6+5ovlf
	 0ZR8TVK+SkfdM5WAs8lwkunqW88qgpTt36xjjpG3TPvB3y8hU6e8w5G/bDD9Vlg6Acw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+ipJrP/QRYvoYzmdz1Ui4JZdgsUipuBSYFqk2Vzl6zw=;
	b=5G7a9QiPLpHStDqwn81KMBviwSQCsdE3MhXFiBDWu7NnQ71ancMbem2cpi47t7UYqgAq
	 Dp8WPgj/EO3QnmHbW61TWaidy4g3Cd99RV0hYTxj+6oA/khX2ZXc4tP/p/AxFYR7Yiv+H
	 fcIIlnk/qaVOIqvu0hhHMwFNR0X8ze+eFbnIDR4rQar+b56d0R+AVVRptS4gfYeLvq9Mk
	 5asvz1WQiURzob9pMLPjfdCu9rBIz3p32pq++HI1VmwHMKtMFH43toYQZMoFcAOJK1dUG
	 soGINB+9xrl2XhK1OMYzUFQaZ+a+WPD3ZxMd+P0SKmH5CvK3UoagaAeBmWMaM8+XaTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpoxiLsk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DFA606A31A
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpoxiLsk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCC91F01828;
	Mon, 26 Oct 2026 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023324;
	bh=+ipJrP/QRYvoYzmdz1Ui4JZdgsUipuBSYFqk2Vzl6zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpoxiLskQjEYazRbpV183Nfk+yW6hnFAxhOYIFsOVFshnAkJxXsLaqHT9nl1w4aCL
	 MWbExX47JBy5HmBjZ/iyT2M3OHtg98JnCLihhzfVrbPng00LeOyhjNRYNL0VkTODIs
	 TwKlNbikEJnZHAkw/Au5T+a8kGQxw5WvlBNBTqgi0KUkGW1rnlO0Zb6f6gupKoy+i4
	 t5kidakKsEr/XBsTuqsfMCRorfoMpEsB8ZJalRT/LRGoLytqlHBK8KsYeEiRhMI5Zg
	 7As8YuxsBSKf26Y9bx1tASKuuxGVkNYAfWTsDaWF3Sa8jlOdDVS8xbQKWDNR6/sF19
	 9xmjtZSrxtnig==
Message-ID: <sashiko-outbox-185366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] leds: leds-lp5569: Place the LED mapping table in
 the lower half of the SRAM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261026-lp55xx-v1-2-6eaaf530115c@marmottus.net>
References: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
 <20261026-lp55xx-v1-2-6eaaf530115c@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 14:02:03 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The LED mapping instructions (map_start, load_end, map_addr, ...) take
> a 7-bits absolute SRAM address, so the mapping table must be in the
> lower half of the SRAM (0-127).
> The driver placed the muxing info after the engine programs, which
> these instructions cannot reach.
>=20
> Place the mapping tables in pages 0-2 and the engine programs after
> them.
>=20
> This changes the SRAM layout seen by userspace:
>=20
>   - The program of engines 1/2/3 now starts at address 0x30/0x70/0xb0
>     instead of 0x00/0x40/0x80 (ENGINEx_PROG_START).
>   - The mapping of engines 1/2/3 is at address 0x00/0x10/0x20.
>=20
> Programs loaded through engineN_load or the firmware interface are not
> affected, since they are written relative to the start of the engine.
> Programs that use absolute SRAM addresses (map_start, load_end,
> load_addr, map_addr) must be updated to the new layout.
>=20
> Fixes: 30c6743cc89c ("leds: leds-lp5569: Add support for Texas Instrument=
s LP5569")
> Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-lp55xx-v1-=
0-6eaaf530115c@marmottus.net?part=3D2

