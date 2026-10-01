Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C44B7A3C
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860967; cv=none; b=FUzIqd5v4nHhhmVJ0UUN7hI07EScjRhu9CK2J6ZkqEB29+P86jlWtDqSottGDMgySWwVLlr6KmPATQEjPGv5ENA6BdiaczAhe62I6ECN4yNBFMt7qVeXERf41vsRroccXmfwHhP4AcB6v4pTsEOdPaKHpHKw/q8Crj2qQpdoYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860967; c=relaxed/simple;
	bh=DUzeBxWxozPFU0sB4FQkQhq5Kqju+u7LWrlnBszsW3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oLfCttCwburVwYymprR8sBPecEBRu1ik+bI082ssMgcS3DxBYYp35EIjUIWhg1y7K+kx+L18rzy9bLeqnIzb0kLk/hNndVmzCvUBNB+fjJtv6v2TwEPcXDCNo4/Vwcv+dHowiquf5tPpm/oe2GKmuvMereKs2WboMtGpLbw2IrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4TSixWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4TSixWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6014E1F000FF;
	Thu,  1 Oct 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860965;
	bh=CXvKvB1a7g89qM6OCGNonzyNcW+t0eW/NuHocFpqNfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4TSixWc941IE/sY521G6SCNkB4rJmMZceNSi3m5socM8IuV57Xbf8rAGECxuFVs4
	 zc7NH4ZeQ9WUX7rGOHZgpY8PaSPKRbnx8Po2fL+lwIr6YVxRSYX+dLx1dALXt7z4CB
	 Pom4838DqDS+Otzg+N5iB1LDlTOPRF85sDAWjN3yLWCvINSgCX27cUotQh2A1aSkn4
	 AEn35OJRvNHSpg5iB00nq/z3For78Ns5yxwnjc45vWwYVCnlYprxy4KzxvG4Exq0gv
	 tqxFu9d1AVjM5ubkGqvSN17miZ2M8WblIxuL3ED8Alt1/i/jYWl1t0MS/uNxfRSDwP
	 SZ4u/+AYheu5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] leds: trigger: netdev: Fix sysfs_update_group()
 races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261001131206.2513248-4-alexander.sverdlin@siemens.com>
References: <20261001131206.2513248-1-alexander.sverdlin@siemens.com>
 <20261001131206.2513248-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:22:44 +0000
Message-Id: <20261001132245.6014E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> The link_speed attribute group was listed in netdev_led_trigger.groups,
> so the LED core creates and destroys it via device_add_groups() /
> device_remove_groups() in led_trigger_set() (under trigger_lock), while
> the trigger also refreshes it with sysfs_update_group() from
> netdev_trig_notify() and device_name writes.  With no shared lock this was
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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001131206.2513=
248-1-alexander.sverdlin@siemens.com?part=3D3

