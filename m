Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424655;
	b=k3v8m2ff8CG0ougyfqMExY4c2quLmpa2Q66/zS1aPignEtG5IbPkk2Mj9R+odX/DdsX7
	 xX2iWfBloHPQjDbQQ6bLTTVYXvbRQXSqMLhUGynUyROhZ1tzQRTozxUxwIBw0QpXP8uCS
	 GKvqxvV9Q8TeLqOEHnmCEinwWTCC00GsFDJDmQKOH/VuIB08w9Jx0h3vjrQd6CzSMaDBM
	 kGtR8cQxI69CF3GtKV4YHar/XkAb2KkYWQH4tY0q0P/00BdB4COOWR///ZH+dCXOdr+IW
	 6frRbtpEcdR+6eeNY/dG4nMXB5/M+59Rbeotw1gO6ULeDzqUwm8hqE6spsOzOZnqrLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424655;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Em63qeFZn/R98yzJQCTDD1RX5sQJgpirUmXf880NUQg=;
	b=vEutJrGAarYb9q+EbtV//wdm2LyiZGRGbgbSwMWlbc49zhu9Krk7HhipH8lPuikDqhhL
	 3cik9JR/34rAmzKhLobmfnl7JMT/xlLcy621IjYds5ATZmW4hPPt1LO6YZbrmRp6gLJpA
	 B0aXuyrf/lUtORR7Stynla2rt2PAQJpJmpvm9vMcVzcyE9q+cccKcUMbkXYJN/2FtHFQm
	 z6S5FDRpLtp2VFzCQGt7kkqlTo9fnT2c+XtmMx34CZaUO/eJPCMpL12whu9Yos9KvNtGF
	 4eFNFnttmOrnBeK1yVHR2Q4O4YQNeJz9sNadxcRUXRi9sxPpSYx6Mcwcf6siyAsVoKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtdHzCrO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D3E606A31A
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtdHzCrO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A27E1F000D8;
	Mon, 23 Nov 2026 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795424654;
	bh=Em63qeFZn/R98yzJQCTDD1RX5sQJgpirUmXf880NUQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LtdHzCrOxm73TdwpgiLqWmULmRVpI8djWzLurw2KeFj/2mC476T7xClwhyfEViMCe
	 moof59PbffiEqaI6OOHxahb+oH/FkYXE/Iwr6T0l8nWmoDZak0E8Qbvm3vm604t6Dz
	 9E6gvkrCcWcnRDhbyJyvBRoE37agkD9qNfsAdKIc/kG336M5mJDFp6ve06/1A0U4o4
	 l5A8W5xWiWQKyylW28mVRmX6B5/FXHL5yGukQhwradMc7AjSS2i/RbrzhiGh4wBid6
	 gF2/tXC/ULxMiAQmaiFgT/+nU5OeSAG1EHrBJli5N39ciuSRvmmXsu8OfIWkcEs07e
	 Xz+j+wWyXrmqg==
Message-ID: <sashiko-outbox-228927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] tools/leds/uledmon: reject device names that are too
 long
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gu Bin" <gubin@cmss.chinamobile.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261123090055.2508-1-gubin@cmss.chinamobile.com>
References: <179442104215.44545.2144163087581820120@kernel.org>
 <20261123090055.2508-1-gubin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:04:13 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> strncpy() does not NUL-terminate when the source is at least as long
> as the bound. uleds_dev.name is passed to the kernel with
> write(fd, &uleds_dev, sizeof(uleds_dev)), so a >=3D LED_MAX_NAME_SIZE
> byte argv[1] leaves name without a terminator and the write sends
> trailing bytes that are not part of a valid device name.
>=20
> Silently truncating such a name would create a device the user did
> not ask for, so error out instead, like the other argument checks
> already do.
>=20
> Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring user=
space LEDs")
> Suggested-by: David Lechner <david@lechnology.com>
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123090055.2508=
-1-gubin@cmss.chinamobile.com?part=3D1
