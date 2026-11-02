Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585859;
	b=hD5w7MJZfgsexSBxKvxtAQOEu5A7Xgcp9YwJTfSymbzsjbBn2nRTdZ32sT2spBzLps1N
	 OwYiifevgcAdhbySi17ZsQxkBkAyADep+g2vYUFWVxy9nPsrcZzt95IqSdul8UB6ZrQJM
	 CiPWwOsE8GSWNwnLWoBmZch3GEHLUt1zpAqMxbj52qPPIi4+CEKNLbbNR/rbfKyyPQoKA
	 yMp3bYpEUKaYQUGDlBkNWVcMQ5WjFvCzi+vQ5R+7CfDaAKkt2TFhOXpW9hvNOhGXGOr4O
	 sAed9P3kPyJiH1UWooT4q6wXPOQhAgTH4bvzFWeCVe/MdBSdMwqRsXU0ET959+Rp42A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585859;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n6Qbek9LA5EmGsWJy4g+zEUBaCCV0A3uVN7HKVa0vZ4=;
	b=ynntxB2BM+Xz3nxSE3ql4vB3h67xc8s3fbPV8gbdfzTXj2mWsBK2Hvn6q4nRiBQDp4ML
	 6jK2mjbOzBUesOlzfbdGTJ/nkMo7QUgMT4g01qKcJDWa2zfZUGKr0Vp3itRyHGfMW31qL
	 IXl10Jt008wtn3kGhIhNQtIpagOFRt3HnfSCWoWcFGM4bfRIFRoG8q2QZ/cGwbnMXxyxB
	 0vkaGK8RZwpWCbinQPNj/wUZKwUEIhPczTK9+N+0Dx5qcTu4kwFwOBwMQ/BfPUHovBFs8
	 YYJSJM7xDpQl7YpejfMPpV/Xcpw/r96uY+i5q8pKjyLmUiroiX+UJTre7YwLXA40vwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/jU1d6F";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B4606A324
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/jU1d6F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C641F000C1;
	Mon,  2 Nov 2026 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585858;
	bh=n6Qbek9LA5EmGsWJy4g+zEUBaCCV0A3uVN7HKVa0vZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R/jU1d6F3jrSebr69oqkyU1C8CClWgpwwHKO/bOlV/OE3sWQrt9BriAcsf7q2m968
	 qLkDqvjfEVjxtbotwFU1faky/vqL9kbh+oXRKJQASp2D7557UKMcdsnyklb2mT89oz
	 j95mn9igTWhXz8KyxCq5FQHBMxPMb3iYG6lrn19EiLz4AA4SKS914iaL9JFiX9y6Y8
	 EWjRWIsKmM8uRSa1Ww/2J6wGagmjoGEPkmXNsMPvmeHbTVtbkgFmM7s5SKiiRTY/9Q
	 mlZNqRhc4rHFx7Co45Q1CLQPZG+qLIblCWorXFP14XT1lTzr/GRcWv8a1YQq+/TGBs
	 WFvxTwW2FFIgA==
Message-ID: <sashiko-outbox-192824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] leds: rgb: ktd202x: Fix a division by zero with
 long blinks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-4-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-4-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:17:37 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> blink_set() works out the on time as delay_on * 256 / (delay_on +
> delay_off) in unsigned long, with delays straight from the timer
> trigger's sysfs files:
>=20
> - when the two delays add up to exactly 2^32 on 32 bit, or 2^64 on
>   64 bit, the sum wraps to 0 and the kernel divides by zero, for
>   example with "echo 2147483648" into both delay_on and delay_off.
>   That oopses on x86 and gives an arbitrary result on MIPS and arm64.
> - on 32 bit the product already overflows once delay_on is above about
>   4.6 hours, and a sum that wraps sets the wrong period, so long blinks
>   get an arbitrary duty cycle
>=20
> Saturate the sum, and compute the on time with mul_u64_u64_div_u64().
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D4

