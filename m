Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103457;
	b=zLcc72D1+x4bAUSGtU85qgAxdn98eZ7PQrxlo2sYO2125r5u+GzAWLHn3UBxcmVrAPrM
	 fZkSC+uowdWAuBqPNlu+iQ9+y8ZmrAz9K0OVZv6/VKDsSpiguhejN29Yprj+7eUAzP64e
	 iai55pf+SyGWqX32zQ61yhjdNjrASjXaCFdbfjRyVko9N+O3rHHAPqhaSigapkRP6Auip
	 Ktix+dul77+WVR2+FIkGXSe/9TPTPvsGKZ2nUSNBCSjUiESRe2d9PCFMU3Rv32HwFneSb
	 ddbhbp1BL4FpaBsFd4a5Krkkbfb0a1W+/WvXfzqT71RgYD7MRO5gu2T2TPWFf2BjfJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103457;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r+sniQnEh0oP4jE9NGKVklnTWOd+bN9EHPs3d5eiWmY=;
	b=W6ooGV1dNZXjC/38MHWsuGC1wNMHV5eNq/BkDJLvUpD9p1bMTa97eIeRDUBygc29yrUV
	 tV0IjIEDzeSCVPOYRud8I7IkcgTJDp8RiC1Q7vwFdMxPQZqsh/bt0vlUgkQe3tnkYKKOR
	 Ra2P4kUjnyVvn6HQTsKp9uU6ysqn1ja5KrcD8M3BFGgKJzA+7jwce3LOjJ+yX2ddNv0jb
	 v3GTALF35D2fKKBrCSYg7fiZ5xgYzXf9ChgH/ViQu3a5X5qZlGLsEoCYT9cJLOlGaKsa8
	 qz9mu7pTZUOH0e8LSFQF8jHoHNy5neDoYFlLnpX08OhQ1nP5XMMX6K3nuYctLJ3Hwmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGADAm7x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4B606A325
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGADAm7x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669331F01825;
	Tue, 27 Oct 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103456;
	bh=r+sniQnEh0oP4jE9NGKVklnTWOd+bN9EHPs3d5eiWmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XGADAm7xHOf46o956F0mz0DeSiKnHkXa6IysCMiTqq1nx1f4L72byObRIIwnXWaCu
	 PqiH7Nqn/dvbRw5sgHpagY4YBJuFDNPGK/N7lwjdM4McUbuQ2pj43TBp6Kz0gNWd6Y
	 90qdDUXThaeRWqvLsVNOwS4O15fSdgtODXCl+Ek0oKRZhUmFqQWep2lB0cG5yAEM9S
	 idk3F3lbwD0egfufIb/PaZ8dcd6cvXZXtIJCdasfkLYQEeNHIeJPCHT2296M0WM6dg
	 uu6An/5m3oJsbVudOZf4RsU2ONnGXiBvcJl8Ld8MV0kyIBXea3AoocqneDftdWHN6v
	 Tzw8NReBwgWOw==
Message-ID: <sashiko-outbox-186524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261027113349.383147-6-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
 <20261027113349.383147-6-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:17:36 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> netdev_led_attr_store() and interval_store() update ->mode and run
> set_baseline_state() without trigger_data->lock. kernfs only serializes
> writes to the same file, so two attribute writes race on the non-atomic
> read-modify-write of ->mode:
>=20
>   CPU0 (echo 1 > link_10)       CPU1 (echo 1 > link_100)
>   -----------------------       ------------------------
>   mode =3D trigger_data->mode;
>                                 mode =3D trigger_data->mode;
>   set_bit(LINK_10, &mode);
>                                 set_bit(LINK_100, &mode);
>   trigger_data->mode =3D mode;
>                                 trigger_data->mode =3D mode;  // LINK_10 =
lost
> [ ... ]
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/sashiko-outbox-178980@kernel.org/
> Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link=
 speed mode")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113349.3831=
47-1-alexander.sverdlin@siemens.com?part=3D5

