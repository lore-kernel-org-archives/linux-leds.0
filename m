Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500680;
	b=ZVMkFRd0uvbpS8SIGtcjLCJtG7Zo4Ga53LvbXnajkbhE1Bl8/n6pIqhU6dMDGAJUKezA
	 LjKprPTjZEk6wgReHVQ2Jq2YJppzEnfXySO5D91QQMQ5DUy9SjoAx2mdNHJ/aQMKo2LoY
	 TDu3GU+1m370hHrQytSinSvwgYaxP7ntn2btBmGGDesJtRiXzlqVtWfPX6WReJLdyeeWC
	 jDZMHd//AY3vFHuC5ftnKmMn41zkfQiHnQHOTouOVW7x/QHU30PrD5YGauBUG3dTfsSA2
	 fD4IbbdNRV3wkcpYSSTJxiejDSxR+Bg0+YuU29kBGdvhXq5FgD0I29ZVF7O804rdEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500680;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FihH1BSFqVOih9EviqK5D+JoItoWMkr6pE9EK4lYMI8=;
	b=qFKQbJVo9PJu265MayUL/1+fn5idtNAPfgSB2f53B5yZCxVdZVWKzokkQyXcEXwB8epU
	 tsK3EmWRZvW0kOQ1wQhptn83d6ofIHe5xiP5dzIJvFmvvqK98aHk9fE5gSe21R6b5VyOI
	 q0qYBXXRjY6yDpdY7+UTk3zLghNi1xX3c3ph9luwmV+W1/KEAAUF8UbpRtrOkD1czjgrR
	 0DeJBJX6HrR+57Xf4NCLeQs5Dt3k2uMC/AqQVpL+nTCtcZTmQq2JrO3qI0naKle4xZn9T
	 JaRbOCeXmQag0Nl0oAn/rbvrgDfBzDHhi4oekMSy3YOpIedgzp4FkCmkNtYwFT9TZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDc2Y9bR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF11606A31C
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDc2Y9bR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D866F1F000C4;
	Tue, 20 Oct 2026 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500680;
	bh=FihH1BSFqVOih9EviqK5D+JoItoWMkr6pE9EK4lYMI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fDc2Y9bRVpo+75I3yoC7+wKrFGfGtJcBtKCFf0SU7Ao2FNacwfuxrGo31yUg2CngZ
	 8cvMTEDUhBFZI7O+qHy2wQNBQuYtFt+HIgil2UHgHuyEOXTilrvVVh7BQhiy+aJSJu
	 Nd6Tqbs5tm8h2WCpHjQ8LouQQMWdJVsN4zad5ozKBSQp9DGwH0tVLIHsR11TlQnER1
	 0cCslo8tmye/eAuBdp43p/mSRBEn+2L/Lc4Id+4B1key+TzLalmU3bweesitPvUNCl
	 t+YLpmDespk8P4P4SL6jfvqL94ho9sKJB+oYwP7BLOEM5dtoJPD5lzposxnmO9d/mN
	 u9W94Oi/rN9xg==
Message-ID: <sashiko-outbox-178971@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] leds: trigger: netdev: Put netdev on activate
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261020124651.1987272-2-alexander.sverdlin@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
 <20261020124651.1987272-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 12:51:19 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020124651.1987=
272-1-alexander.sverdlin@siemens.com?part=3D1

