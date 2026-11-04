Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820961;
	b=Y+wGLwVbJHzm5+HeUKQNTjPz8pE2FKysQc6FCRX/IkUV/JFAYxTt0ANMz9B2TB3+s3vY
	 NzKJLKgeISRWQ95rapCiVdYVhR0IOmUASpIYM0AfM6siTiYoeM6NXF7jrHATzv+PeG6cc
	 3Sb61M2pI2qSbEBuwANLbHDKMYEq75Z21GzP46if2Hvajpn00BcpEXCBQNQ/M9/DTFFQL
	 9h0n4lIqdY+VzCGffOjvSIspm+6H+ZNdSHprxQrnPVl6YckR/fH1TF1bxahPTJUVuiGi7
	 yb2bJC57s4+sNo5uoVNX5Uob5XJtKZN/8UW8mIGK4nTXTJr+Z9n35opj753iSmXxICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M73di3oyKssF7D05VokrgmHCjEdtkragTi1MLAAEp/w=;
	b=AbqVnLvySCD6PobTnw6SaabCx6ewmsXNHtOLIClh26aXcKyJpw7/bFl2UO4duRXyG0WY
	 7lhWxqDCkqBW66pZ0PJUEe3/YJbkVMOVyg73aJKwppoT8FQMQrsjVZ1MVh8e29p8LPtf7
	 49ywxxko3mcerU2OH6ZOFigqOklYd4Xcbzc8GfbewEA+FWRvGLww0mytLjea95SiTCtpU
	 Cu4GtqoSnTLre2a0Tf5mB10CHT51kOj1gp64GhqsrFNjRO05b7TXcTtvhyQQfZrRZoz0G
	 WqjVXTYR/WgNr2hKaYHOKmdOYyOfK2F6I7qpOC2tLo2mzy6lOlB+8qqlhdt7F7MeApA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpQyLT5S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981B606FAD3
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpQyLT5S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45971F00A17;
	Wed,  4 Nov 2026 19:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820961;
	bh=M73di3oyKssF7D05VokrgmHCjEdtkragTi1MLAAEp/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpQyLT5SxtY0tKsimYJ+OQcrIqBzr6CTLOsVcU1umtUN5dWbJP9Oe8mYrSCkN0NIB
	 c/TkjSJ6699rpLXjkwjM1dbNv2mEXcFHOBE1XTnGIYWMnliqmnjDqYADlIqdx5/OfS
	 SDe/On4dRpnjs5c5rjC85wKxxMZDGf/5YTiQdzvW9TuvOls0UAn1Cu8ApFH7ZUQcxC
	 KDZmhqPB/ysXEqEyB2RF8Av48jT2G2GAMmovZWVW0I2W3SDMMcyDgEnodDvNqbiLCg
	 6TKPNQHRjpXW8Fk8GytCJZCsi5FHfRGxmppenRXr9wl9KQBxEX4271EogR5rkBbcM+
	 SsaaDzeh3yGnw==
Message-ID: <sashiko-outbox-197964@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] leds: tca6507: Fix use-after-free on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danish Khateeb" <danishkhateeb03@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261104193038.91614-1-danishkhateeb03@gmail.com>
References: <20261104193038.91614-1-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 19:35:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Since the LEDs are registered with devm_led_classdev_register(), they
> are unregistered only after tca6507_remove() has cancelled the work.
> Unregistering an LED that is on turns it off, which queues the work
> again from led_assign(), and the work then runs after devres has freed
> the chip:
>=20
>   BUG: KASAN: slab-use-after-free in assign_work+0x414/0x5b0
>   Read of size 8 at addr ffff888010d5c0c0 by task kworker/1:2/65
>   ...
>   Last potentially related work creation:
>    ...
>    queue_work_on+0xb6/0xc0
>    led_assign+0x223/0x340 [leds_tca6507]
>    led_classdev_unregister+0x26b/0x340
>    release_nodes+0xb3/0x140
>    devres_release_group+0x247/0x470
>    i2c_device_remove+0xbf/0x1b0
>=20
> Initialise the work before the LEDs are registered and flush it from a
> devres action, which then runs after the LEDs are gone and before the
> chip is freed, and drop tca6507_remove(). Flushing instead of cancelling
> also makes sure that the queued writes reach the chip, so the LEDs are
> really turned off. By the time the action runs, the LEDs and the GPIO
> chip have been unregistered, and the work does not queue itself, so
> nothing can queue it again.
>=20
> Fixes: 1b5c2fa7081c ("leds: tca6507: Use devm_led_classdev_register() to =
simplify remove path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104193038.9161=
4-1-danishkhateeb03@gmail.com?part=3D1

