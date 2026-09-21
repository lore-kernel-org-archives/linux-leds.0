Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1043785D
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985285; cv=none; b=HMXrwU6amWSQDgP74yaUHy6lzk8O5+PtPitI2vXrjfkdk2hwl5a0GT4SS0ycG1vlA0PPpqcP3oroqLHtT74QrpIOQgf7PRRKsYNFCeT2jU5ypPAeP5EHGgKht87y7zTSiDIDR1k/I0vkPdDdf42mbeZMUNHXb3m32KUZvIhvLck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985285; c=relaxed/simple;
	bh=ZmxErJ5QLxhLBXjw/gjnCppZ1YGvDmaRPv1i90nF2Dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dW7wi87zR1CDUXCk1XJ6Klppt+fW5Gx/oaNAbJFWJ7d8Nxr4R6frJ5Ai807l+o+p9h4S3Uh/QEySD76scU2jQh2LpQbyjMvySfnphRco7J4YCh2OfStISgCzzRQnVJj+Y/t1tRvk4OgipxIws0GT5Z/g6SnZs8DuvO13RjRRIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKZc43lN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKZc43lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538C51F00893;
	Mon, 21 Sep 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985284;
	bh=FHXJD6/S7/idUjwCbUkSj6QpgHoaifHT86xq8eDuVzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EKZc43lNwvZPt80ugz+627A+C2BoD01Y9IwKCzmxJRnSdr9d6y5c2SIUh9kzg2RR7
	 5DTOkIKzmA9y/NrIuzjVrJLxuC+A7BZUeetOe/0bUaJXpv6ZmynXC7s/nlTEhhBgMV
	 3gOb286cFXlxid8/yKhlTEiUJGkF5kfQ1h2H22NIomXqkUWhsRtd6toINhZNf5IVBm
	 GkxcHHCv00Dgwir0k+zs1aVXCfGs5eNjWOdnBSJLXhsyccGSLPiK8RWzHg3RQHb8vS
	 86GiIeeiJPZja2tqn2DlIUrwJciqUpH+JWgQdw/L+A8ZwYjOOjQN2TPwdzb0XqapLO
	 DHBl9uCeBCPSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] leds: trigger: netdev: Fix sysfs_update_group()
 races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921093249.3481413-4-alexander.sverdlin@siemens.com>
References: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
 <20260921093249.3481413-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:08:03 +0000
Message-Id: <20260921100804.538C51F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093249.3481=
413-1-alexander.sverdlin@siemens.com?part=3D3

