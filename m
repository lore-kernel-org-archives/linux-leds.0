Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101237;
	b=Apw5XQxNuh9E03xP8hgkP/Z1PclFCRiFYzBB3CEMm+3Wjc5EA84vCY8bNwkA5Zjm8Q1t
	 WFUwdO6kP3htTjv2H2N+1qHX5tl3t/Z1ZBdmqaGZ/in3kLjUY7H1U0rFj2esWi3DnNBst
	 muRqCLj1YcwJC8numy9afI0a6zWKXDwiy1WzqtqK+aTscLXxqA2YwxL8mY3qsasEZk/ik
	 IrlyfzY4FwlL8YNWFtdDaY0f6GBXPqNs4VIdHnOVR0d5T5krREe5aCVq0yqqXWbBzSA0+
	 +lsxYibSWSm0Gf4X17Rg36OZqcm+sdJ37hfDlROXbnuWS7NyKP6Ny8AMHG3H68z6tTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101237;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pMLqBB9w7nwq9bwKL2sXEYwayxW6pW2neDXTzZUCMz4=;
	b=1yweG0N8615KiLM5toqhGbiyKc/IMXynHbs+AWfT62PBVpZfwCeXLgUfPTdyJ56ctbCB
	 PozOxg3yKYbe6XHHiAh8k4x3kcXxEBABlVdXXKspLfmGQd08wW76mWCt1aB3uMylaWUmg
	 yY8jt4dm41ZA7YKhz8l5b+VrXaMBMndI1YTzQzRCrLb892FrNC/G/A9m2fei496mn7Ow/
	 zLJSOYK37GGvk66chipclC1wtKM/OU95gw8RDMBRHW5cEXAsTl45VtZbK1FB1WiHBfl2H
	 pfFbf4GO3psOPckY+Hqn4r1NwZieTJpW6Y1GvOiuFl1Y7PUpsQW9N4ebZ4ZNUElBLDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eba1ZAry;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A4606A322
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eba1ZAry
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B631F01825;
	Tue, 27 Oct 2026 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101236;
	bh=pMLqBB9w7nwq9bwKL2sXEYwayxW6pW2neDXTzZUCMz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eba1ZAryJJv2Obm1GeKZPttnxi7s2Q0wak5i/nS5Whk6RE3krA9I2rUCWkw+ybRni
	 BbhXavdp8E80qETaWAWO063TLOHJMa9ToZ4s0pnAW1/X4E1M15WauK4CcI3inC9tpL
	 BM3PqxL7oFodvsQ0hCC9up2ufhVtSq1jOU9EJUhsob+E10LrGiZtN+HLHOWozN4nqB
	 mg+wHW8wi//EJUMrzBcrcNk0rw0euPaL75/i4zvy7S2hZmrkqCzMWAgk7iCXIrVVDV
	 gagzZG6+BPeOKwbQ2lm0oe6yWhgKJi5DjcTtSE/pNos4kdq1lL1CiQbw2YJo9qESYy
	 EUTVlJcR2Rm0w==
Message-ID: <sashiko-outbox-186467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] leds: trigger: netdev: Put netdev on activate
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261027113349.383147-2-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
 <20261027113349.383147-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:40:35 +0000
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
> When hw control is active, set_device_name() takes a reference on the
> netdev via dev_get_by_name(). The register_netdevice_notifier() failure
> path frees trigger_data without dropping it, leaking the netdev.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914140045.B8F4C1F000FF@smtp.kern=
el.org/
> Fixes: 0316cc5629d1 ("leds: trigger: netdev: init mode if hw control alre=
ady active")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113349.3831=
47-1-alexander.sverdlin@siemens.com?part=3D1

