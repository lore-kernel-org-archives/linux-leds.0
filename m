Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133449;
	b=QLkzDG7iLNBebdlb1nWtMRsrQtuTjq9sG2QGJKbNvuucafYXvFWqLN9WQ+eU2ALg85/p
	 fxsuUKDqwJbrS50eG+5S5ubfntakPzAqwBS8jt5ol+stEGnfCrdaYvrF9ptyP4Fxz4i2g
	 YldEqAo8GWfaV/oDV2B/Wng8A1UBVC4jXJW31paS8WBjs/8f50sReIedOBa5Kddtrq6Lp
	 CL8QnfH+X4T6JX8J/QcU45iiYRBBde/ZmSp6PV+6jWDMktEVGPRzEYb12Y17kDhFKjPsm
	 wyzjf8rMwWgm4UuFsPL6OJIG+4wP2xeXL1VYgPZG51jJMN21801ij2OS4nhzAeVeTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133449;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XDQxJmzkXA/FJKftBYswJCKt4/YIpS3R5DbHcQ2pUWE=;
	b=ntKIOSt1fJYeE4MqgyAmn1NNi59hx49ejfnLeNMQE0HukgNVh/2li1ozEgmGVnZbN8iB
	 y/CkrJsOJRwalp0+5xiDRrBj70+FWGDyIEGsGJrdz/bG71+8uRILipfHZSOQL1hZYamH/
	 GN5aQXreGFqn9mWbOWoHonV/cnx2qe9iUgQWMIP9yLGmXtbX93toW3jsGOVPoLEVditTm
	 iUGc4jufl7lwKvFzbdRnrDqbPprmAs3gMWQHLcWbIIrgvcfSSPQK1/vtm5Wnm7g9OgfyK
	 Iy7uGJJYw6kFb4RB28vY3NkjYRtunPgnMXk2rOAyKhF+dcUd/cTpjly/NoeXAX6Ctbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOXTZ2EI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCA60A262B
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOXTZ2EI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5400A1F000CA;
	Fri, 20 Nov 2026 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133449;
	bh=XDQxJmzkXA/FJKftBYswJCKt4/YIpS3R5DbHcQ2pUWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WOXTZ2EITb/F+HeD5v0b2XbKR5BA6mMAXZRxTbxGEtD5u70NHPfMpAYUw2Rc4u3iL
	 efOedtGY2x//CHYGWoo9HJE9QSH5UwUUA3CZq5FuFGxTQIOVa63E3xkNkU+MIrUVFU
	 4hnZ6Anea/g0XgNPm+3C4MFn4tJMblWSO4b0OMiXLjtA+ZPFxLgsPTaPgmokCBX5XO
	 5S3FYrCsFDIZJbAnOehYCOZG6YyIZaAhbc5SKWXwAWvM91z8V41KZwbMd/VgErf7uo
	 oo5t1rhKcSD/ILuKbQKvzlntP0/6Zt7jOEYFJM1939e3/s+kU1tzBZ9JknElwB3GKK
	 T/hDOgmspJ7mg==
Message-ID: <sashiko-outbox-224250@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/11] leds: rgb: ktd202x: Never program an on time
 of zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-3-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-3-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:10:48 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D3

