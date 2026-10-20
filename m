Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501016;
	b=0fKcSs10+0NE5WkKSxqGM7ZzObY6szFz22uRsKtBiMB5oUGHiPLLsbsorEfqIzQZyl47
	 yIFnC+vEpOweyJ9IJeaOQ+KjSVGb0W4y87LlyJrV9MTXjBtibFOAiRwIwrq/S50u4/onR
	 ii5qGzqU2sIyGlGLgZblDbTTDEM5aDPv7B58umFuG8gTq4Y+YHCOuDIIIXS7W5/2JSBQx
	 PT645rhylypgN1k8cpoEE+dOObBRBuL7/CjbYvAuqhAKr53V1MEUS2HzsjGo/070TESK8
	 fu59wpj7FSiEQvbWujTVU7ZwrYxwHuJo2fuWywiEQCMJD0O0xRKWfp+l8WAwxTk/e7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FeoIX8m7vkK4Q/uSX7NYbKhZraT6tUofb4YHU/bvews=;
	b=nVIkyIp+UD+mV1VZBgB8fGP6ato5WOUtPo4pdWPw/XhSJV5n4NhgB5qvKp0FAXTQzFK3
	 rWpQMPdl/2lAJL6GVowdYF46Yr9h2g9LZs+5+X2Tmboy0JwZuwfvLD/TZDUKeDjjd+niA
	 DSoyN9PVYqBGsZFVj3tY2ZpP3GimMlCtfyuszjYOgS4FMiEw0/mFdgXLYdz0GvrjcVKfH
	 6d9vQeOx3uhgaOJb9WYzGxfDAYSP+/3jGRKq3r6sD8ppzp1aIyOFhKthGV/tZJVrTwNpE
	 Dn7wLEnUsg4R8+qkmsp8V0RdCzV0jAZooPNb1E4W1h+t9FnQZy5JbAvaQlhzjjim7Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQCWUXCr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85192606A31B
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQCWUXCr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BBA1F000C5;
	Tue, 20 Oct 2026 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501016;
	bh=FeoIX8m7vkK4Q/uSX7NYbKhZraT6tUofb4YHU/bvews=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QQCWUXCrEhQykLEjCPHnqwmQHKrITRcYcqXgIJDsu7j0EhsbMAr8r0ZqZHip0wRui
	 sHrn2sayVAGHchSeCUXcmLys6qn3lrG/ZMOyWeBJRz6AANGbz1T46A9LxFvLVW3Hj4
	 2GGc5L7Iu9AAbmRytcED5mfhQMNibaYhWGtz2wslBP5Zfs+/H3qQOAfgJQlxIYDgR2
	 dsHP2XlKpg396mz0HylPvId7HhRLLwre1kSTctupM5LDe1eqQK5/FhcLCdXn/oCJvX
	 dbwoqZI+ZV8mOhfWX2fDACSyOY4d8QIm2LxqHd+a03OHjGwuarsEVJZe+/uUhhToRu
	 RbqY7EMkj5YWQ==
Message-ID: <sashiko-outbox-178977@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] leds: trigger: netdev: Fix sysfs_update_group()
 races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261020124651.1987272-4-alexander.sverdlin@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
 <20261020124651.1987272-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 12:56:55 +0000
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
> The link_speed attribute group was listed in netdev_led_trigger.groups,
> so the LED core creates and destroys it via device_add_groups() /
> device_remove_groups() in led_trigger_set() (under trigger_lock), while
> the trigger also refreshes it with sysfs_update_group() from
> netdev_trig_notify() and device_name writes. With no shared lock this was
> observed as a sysfs splat when the trigger is re-armed during PHY link-up:
>=20
>   sysfs: cannot create duplicate filename '...green:lan/link_10'
>=20
>     CPU 0 (led_trigger_set)        CPU 1 (linkwatch workqueue)
>     -----------------------        ---------------------------
>     activate():
>       register_netdevice_notifier()
> [ ... ]
> store that takes that lock.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link =
speed attribute")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020124651.1987=
272-1-alexander.sverdlin@siemens.com?part=3D3

