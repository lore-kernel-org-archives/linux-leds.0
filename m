Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868A3859EE
	for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443600; cv=none; b=cnrtlrJeyZYYDF7Np9IKtEN8JvjZJUCrHxzZPG4uF42EwMBuVJ270neuv1raOVae97hQiEf89Jwc+gfQsImvQeeZ1qBSuzEKlnI6Rij1CEVjycak/uqNaPb+JOdRh6NytXNW6eAccTz+suflBPMlJTuCmusWClq4T/Pihjk1BNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443600; c=relaxed/simple;
	bh=/rX4pIdGoHNsj8+yW1BfGtNifiRbcp37zhs6Ropmpfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZoHXJAUXdoqxsKTpTDTZWHqy5x5F8VG7AQwxM6I6LxvOKz29ll7JXZvZRaep30lTqQ6lz4eYldokhfEXEH600BPgoohk/5rgAxxn59w3NCaQnRkh0l/UefzUTch+QyxwTnWkT+Bo5z+SS64dt7cCV1gxJOeqZmRRe7HVsmKTxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fknW13B3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fknW13B3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A8F1F000FF;
	Sat, 26 Sep 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790443599;
	bh=oxXWbbB3E9A2eHs0nbKrHhDUjWwBi/YSnK7h3gXd7Vw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fknW13B3dDVZlbGCSR2PbvkAi6GXJrdrdYPLiXj7NaivokTg56scdJBuND/dtgAD0
	 bsBltUtFxDdsnngkGAhiyFO1Xqrq49bFVuD0iVsRmJ5L5ozgLEkAyLkVh/WYaB4TN/
	 19Yh4CrFvveGIGPzseMLY6yhDFmZcteUeKPjKQzSFStR4VmDCwqxuf3lRjrQ0twx4h
	 0GyfRbXzh3C2lEWQIenPLtqR2EGiNGxst2qO/cbbfwS83JRfAe4343z68eipCCIkDN
	 HiBSTzuS5cKUdHxwRYydB+QBPjjOcBc9vqeI1ObtAJZ9JdNkTtcYdjBSq83KL/8U1x
	 nv73B7hyNySqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: tca6507: Fix use-after-free on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Danish Khateeb" <danishkhateeb03@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260926172115.543800-1-danishkhateeb03@gmail.com>
References: <20260926172115.543800-1-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 17:26:38 +0000
Message-Id: <20260926172639.30A8F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

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
> Assisted-by: LLM
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926172115.5438=
00-1-danishkhateeb03@gmail.com?part=3D1

