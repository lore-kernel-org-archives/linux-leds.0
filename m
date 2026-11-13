Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602478;
	b=Rw3i1C0Hiit1vp2VQu8FJa8CdEdXWqLFsr2hfyirZg/vq9b+f8pnMintqlFvd6yrR4hM
	 tHTxrVGcwu7VCnqizdkG4nSWWTQpRFJziqnLeu01oSeSx/3wrZAAFi7nD+yXMl64BXLxR
	 iNRXUuLHaphGWxDeDWA5CyuH3uhNDnVTGnXo6W0mqjE9hoWovuGEulf/DAgqVc7cNnlrc
	 Ll/l7BeyRWfyMUTMED9KCv+U+u6dZsOyBKdTgpi1g00SjJYTunEZV11TrEQPpwCu8u+sV
	 G4MIdWSK3k55pfirHbxYIi7V9kdilgaJtR68zwFTqnZYDs/3tFFop27GKRUmuj4F7VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602478;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5bWcwo4KShlb6XpUM8K1EKfPIxJcAEY/1VT0W5hqkmg=;
	b=wWH/gmDxZEN7rChNVZYPG02vC60+MS+VJo7q0jC+bSMraTMD+11U6Pg5lUPv96WqzP/U
	 pwEAGwTc8KS/wMz7NpR3FFG4Kns7MrLbCUjindTn1ZtC6tXGXtIN6nIYw/3WCfQJAoTX9
	 cE91lIS4x7FICknzYqaUQa1Pv4wxBM40KgtCL+teyJ0hSkQAWmReorK8FgXrURrk5oEl1
	 +XpP2lDKZPhYJrEn8T3x8/uATKxn0oN20UIsjlDPv7CnuKLtolHJw6++t2O7oz9+EKiud
	 qt7G2BSAKm+GChoJi+EtpgHvU5aWHmMW37WvUA4AIowVVBngvsObiWIafvR6yPQ0Nmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocYtIwGi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C90606A339
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocYtIwGi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9AA1F000C4;
	Fri, 13 Nov 2026 20:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602478;
	bh=5bWcwo4KShlb6XpUM8K1EKfPIxJcAEY/1VT0W5hqkmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ocYtIwGirb9d88sWVP9/nBblIq/VRBy+8Q/UUC9Va8DTQ+994s1H6SJb6P0molQaO
	 fHGqsWWUwp2HlYfOrPTSFbJtP5JTHtEQFv3xsH4jRg6wR682iOdqwj6e8aB9u2XpTf
	 KCW2/wyJNcR4AZ46LQ8TuUvsCdrQ3TQ5To5Z9AUQxlIL2gYqCtadXky40Ovem+iD9c
	 O5X4nkcWmF5n2LONnF90F00LirqOybHg+CAfYuLyEB3ysLZpu9Fo6WTQXQ5calAlJ/
	 bq0fjHCCW7XjA3xiKaiPuAuGyXLRgApRo1qp4CByC2HiAA6H9V0ginXS/gA+bCRS4U
	 rOJPVMHrdbICw==
Message-ID: <sashiko-outbox-213665@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] leds: trigger: netdev: Fix sysfs_update_group()
 races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261113201936.2645736-3-alexander.sverdlin@siemens.com>
References: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
 <20261113201936.2645736-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:41:17 +0000
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
>=20
> Cc: stable@vger.kernel.org
> Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link =
speed attribute")
> Acked-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113201936.2645=
736-1-alexander.sverdlin@siemens.com?part=3D2

