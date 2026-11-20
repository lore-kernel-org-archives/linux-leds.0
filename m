Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181635;
	b=wO/b059MC4iwzIipyvyImWV4gVz9Suod5pPwPK3ZqK+gSszyeF+Qgs9NZqs/ay52Q7/d
	 0rnkISLNqXJQbgS4HhXSSkZt1Vo0LxR9ME4Z+4F46/LxtbH9H59Nu1CzxVpzNaxnzzy0d
	 YAh4aR1m+4cMjgsyOJDKLbmwvVJCnm1YcOtz6Y9GaQKqZPekh9KVGzLYzJg7QLYfz7SIF
	 NmUUVmTLGAbSwO/wxXFVA6hCZzmdDIug1F7QkGHP3Ghf6PZQZSvMc5n9FShXhINYbctwk
	 QcYnSh5hFEDlIzRG/KepSSP0JFbuhYJGSGOed+VpIGX+pICulEW+on5fEtus/9qBONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181635;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+kBjRWaQziO2wHDDZM9hGIAw39cKhnqljx+LSTLKLYE=;
	b=UY28ju341/1PB454nY1yS4JC7/KA1A901NC8x5U5IAUFj/w+HLOt7nF9FsBscC+pa/Vo
	 4u8xrJcmIVkVBNiB+bIEXKerJyhUflgqE1/MHVHWcw4TynTldzedcq195a/C2HQyfKfSi
	 ai8ZfdHaatXexr0xmnLu3tIb/HzzsEYQYXmehbkuKEQVe5JdzmpRCbFIBYGgi91IIYoQv
	 IhkpTgAnyI1UxII++KPGYOc8RDB2lHWgXgcU3lmDb/1U4YoBvGfANWIGCgMer9d00Bd1q
	 CmaoTOGKujUgRA9IZpxCezpd7Qq1WPLzwROu0b8+M3QW8y/WIniggofDQ/FwdRlcrkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLkmQt9V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77CD606A325
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLkmQt9V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068FE1F000C6;
	Fri, 20 Nov 2026 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181635;
	bh=+kBjRWaQziO2wHDDZM9hGIAw39cKhnqljx+LSTLKLYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WLkmQt9VJjCrJFcJ2pjtbkorm9+r818a9WQjVPh6lMftM8ApkMeDOPGkoYWy0Rl1q
	 u3ofBi2fCHseWTWabjv8UM55UhruVmIBlbuZcY6iwAFsevI8gw2rf1gIfX654j7otD
	 A69AHQFlauDdX7KpKJEfk9VReYbID7G6ioiSJacUmx59v8eKybc9dNhRb7wyHJCV/f
	 E2v0sE/b9enmIiBYpOjJtRUvJl7vMjcbesQPfvpdpsJbGskgcBg8bup6kUdK22Armj
	 kprAYH6n/FGqX2YMhcJoZNR2ydd5dJA7UmHp6Ya4v90S1YOjlFlrthKlzXf2/qBnhs
	 NwWVAYJeMyB1w==
Message-ID: <sashiko-outbox-225248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] leds: is31f132xx: Add support for is31fl3206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120-add-is31fl3206-support-v6-2-0969fd6292ab@amieiro.net>
References: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
 <20261120-add-is31fl3206-support-v6-2-0969fd6292ab@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:33:54 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control (in the lowest
> nibble).
>=20
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
>=20
> This commit adds support for this IC allowing the chipdef to define an
> offset for the enable bits inside the LED Control Register.
>=20
> The limitation that already existed for other variants is still in
> this one: all LEDs are enabled and set with maximum current, letting
> brightness be controlled by the PWM registers.
>=20
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-add-is31fl=
3206-support-v6-0-0969fd6292ab@amieiro.net?part=3D2

