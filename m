Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209625;
	b=Z1JhBJbqURsmjYEWrFHfMFqIpYTd8LEdR29h8O15Pyf9CPNku7h/bP13mKf2bdXtYpwG
	 lMtf9Kopu9qrmQXhNz1pxNPV1z6QMge0cEAB0durBMwfzLjNwU0TMAcgR7CgqyccruHzw
	 d6pLK1reT9Q45xGzDaeett9zzOtNW1NRnqg1w2x9kCmPSdfpYoDB/ghVCYJ+zt9G6WG2F
	 31W0qqHEr0dMIt3TRaB/rrYBWkTXW09k/YsCxU/V3QshH9JrYaqlT9rfbrsXC3rLjR3Ow
	 rVMsw1mbhxb7gXJMb6vnFI9xjX7Zi7EfOvqP7Mal2udlQJ9QB0FYDzGYiLExVCuf9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209625;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kyLp2L/cNylrL67O7mfltdwKbZUOWRn7hX6cAyn8oNo=;
	b=tLaBOO9Dk+WGBwPTvgxk7lFko9Ml0lPFJLhRfW0Zg791Ccj+pWrzhM+04nfDHnhHnpy+
	 WzcimG9nZi2a448BpYXbeRDMe0WJhDUecnJ0lQ8FeeAjFgE36FZBzbxYXWXFahNbk1sG0
	 PnITe4EJa5qo6g9Ae0iiI1tkaZmnu49sC4oPhlVWdqOow2Hq7QCyP1mQMWA0HHfls55lP
	 DxKXeMyOGZ7+u5j+vCgzAErZj7yjh9SBLjKX11BjNgBgtuHH+Be47RpjVc0g4t9rAfSg3
	 Q7Ty0rrxaDyXe+KvCzK/c2KC5hoGCWFqtmHiBID0X+DoKffquR3M2IE2H7S9lYJX+Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CsSJwJnH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB40606A31C
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 17:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CsSJwJnH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C37D1F01828;
	Wed, 28 Oct 2026 17:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793209625;
	bh=kyLp2L/cNylrL67O7mfltdwKbZUOWRn7hX6cAyn8oNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsSJwJnH5T9IUs1cbG4cLmfphOjdNTrdSMu1u0hNI8AoLfGbNgAtwZ1faViU0d7cT
	 LRyrx0PlIdT71ElQEIycK/830jfrcaaFJaxHsihfC5NZtEoSGujizW5j36F0bnc9HU
	 BPbnnSrDI35HWUfqNZTBPnQabK547gYL0iggzz1d6nRHvKNh8DM0f6SaZ/erkp2jJ7
	 1T6wkkW9kyOATXEuZGqseHHByJmtfmNUW28JOJCMSxWukv5a/0j2WGIdsGvWUf/cZ0
	 6PlubJXuM6KsesAH8boZp04oUPRJIMzhOnD63sKkRYWR+9fzmnmGoChdRt6pBCxu/f
	 4R4HA82W34APQ==
Message-ID: <sashiko-outbox-188255@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] leds: tca6507: Fix use-after-free on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danish Khateeb" <danishkhateeb03@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261028174348.64014-2-danishkhateeb03@gmail.com>
References: <20261028174348.64014-1-danishkhateeb03@gmail.com>
 <20261028174348.64014-2-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 17:47:04 +0000
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
> Set up the work with devm_work_autocancel() before the LEDs are
> registered, so that devres cancels it after they are gone, and drop
> tca6507_remove().
>=20
> Fixes: 1b5c2fa7081c ("leds: tca6507: Use devm_led_classdev_register() to =
simplify remove path")
> Cc: stable@vger.kernel.org
> Acked-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028174348.6401=
4-1-danishkhateeb03@gmail.com?part=3D1

