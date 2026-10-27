Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102597;
	b=eAHLoKDKvjN+b3RReAZHfieN7CUC3xtTiFpi0V/fYpznSJNqSWMGa0hMz2TP7LPax7AR
	 Bt0YNbRCOEWelA/UoRHpku7nh5prI2mzMkm2M1+a/8dyUJdgcWlVNylTA6BOCc1QUXeo+
	 v7Z1AjZUOFpJQlVnFhQtHQlSJ7oTn+/NxyEgGFCmsGrxJxa88nez64kyc/uGnG8vpnC8v
	 7RfB6v/cx8nBlIHQJrThqRJ/eRbImwPqyQ3wleKr0SbnSgwEEIPgTmGO9T+4+K6Ldmw0v
	 03LLdykAaTIqZdXaBlWJnvHvwjHsuJpkGwz4zdc3SVNiRnJDC6AgaHgbbX/pXUSlYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FJIjRXA5nvMrLQ841VHIH//E+GyffDDcp2qU2YfaThk=;
	b=CIl+asY0aThpryhI5emAP57mwU2JkOcJK2zIOs6FaQhziLl6u3hbWd+Hs5/PqQhPCmNk
	 LRTYHmRnuxItKhJhgmtqlAIwvc8zuBZbA+oX1jfaKz8G8WszgpFwwQAtSPURUIv4b0hlP
	 io415PYyjLXfqYk8ruQY6E0ez71YPwtjXdzXIEHCO+345G4TqCeFk12xSBmgEpVK5Vivo
	 RDWNTVMLJKh2v8xdIQJF4FJTOPRlAkn8D3uutLOgpQnVXu1TYbXFWbM9DDME4krGBUGEP
	 65c+eY1hjwXuMb6WtdxxWdpbERbOcGv+AEga7Bkv2lbEYw6Q8E++LX53BG3i/ArUeZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2CKqsmw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BB606A33F
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2CKqsmw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6B31F01825;
	Tue, 27 Oct 2026 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102596;
	bh=FJIjRXA5nvMrLQ841VHIH//E+GyffDDcp2qU2YfaThk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P2CKqsmwmllZbq2QUlZllFliOlshiHvvzyfGxPlkeoJ150Ef8mdaXiDxPZgaaUpit
	 eF0CByjlxsLhNm9NxHPXoWs5NgFWcgwDf/WRFrC1ZZ9x1MNQh0sNdqVm8oe9w/tZCp
	 NhAfCCFuyDTIkom8tNRaHlkb8Xrkuwr3Zu9eBwe3toVDUUisbmARbFLUCEFOodSUJJ
	 JRDzE8pPyaR2bkPbPqVokB7SczGwrtLBLteumDLhk8xkC92J93PNFIRv/rNs4f1iis
	 hCMIEZcgj5lqu+/2MXSHO/qg9fq2kVumIla1Or9qdR1HFvtNYFwCbj54Fpt/aGaOpH
	 16uL0HKAh2m9g==
Message-ID: <sashiko-outbox-186497@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] leds: trigger: netdev: Fix sysfs_update_group()
 races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261027113349.383147-4-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
 <20261027113349.383147-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:03:15 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113349.3831=
47-1-alexander.sverdlin@siemens.com?part=3D3

