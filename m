Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133439;
	b=pSW2OTYkRokdASnCCyhKJ5GXDgHKulSPTYEDQfN13vsr9zWoOMyj5CWqpcSrZr82Tjzj
	 fQA5cqMp/s76lvh5kI1XPiwA5w004ddFHpiOfIsjlNEQMzLFafk4ZAQB9ZuuyAOxvBZGz
	 lYlu+TeUWeqki6v3PBVcMQFPk46dOSSX35BK7+FfNqqEfjvR2FiSdSg/0OgIga7WTvDcN
	 ecGCej6+KmGtemhRkX8kmmYptTx4X443sJyiQp97lw6mLw5DzRqPZ+frwhCQp9oks4wvt
	 5e7WgBdxb+O43LvAIpUEJY2vj8747OH/hX5jL8Rv8ATjUL0xunG4uEzDg7CF3fvFCQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133439;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TJ1YVv5FHZnxnITkCE3f/GiKHrOlXJXWXohuTn8hnrM=;
	b=qNQBr/J5YGogn/Vd7pzVinXIvgiUH22zTezP9cL/d1s5shFexD5mvhO9l1fjGnGZAu6M
	 7Zclssp5IhRoQamlUbyRYml3VxUDWetNx2ls3OS2gVHheqVH/n+0pqwtcybIZDfVE222u
	 q1P7Gf+29+Tphz3rPn+FLVReazYkmG0yQjxHWWl3cUVClnhb/+392wHmzrIJ60EflkTfr
	 VzIKD+7KtHmJOESk2gXUGNY5MzqtjRQN95oojAIwfGh9BPro3pB5Lvg1RlJZsAOxx13ll
	 UHTzueHkN1+2ftZzq/IN6ZXx+pOQQbaLllYKJ87TkAQBGu0bBWVHyAy/tw8rif5pVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcwU145D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0436606A326
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcwU145D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FB01F000C6;
	Fri, 20 Nov 2026 00:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133438;
	bh=TJ1YVv5FHZnxnITkCE3f/GiKHrOlXJXWXohuTn8hnrM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TcwU145D+CEs3OFmHABpgrAvUuxJbjJIixv2bKWzwRWR1P6zTRzHhmBvCTgtzYFqM
	 Y/bVg1rFN4SmghI8wU2y+gCzyp94ovuZBzlvGkcumSwB8XiN/4g5vzffhdnZDpNA49
	 HXS8Qwf0t9Hxn5uAYU21VLi8o8Oxy1fXZ2t0WC8TYjhEAzv/1yfA7oIV0g29Vdkm+t
	 ku/CiWZ8Zslp7AEIU1jZDf2mRwhH7GMByYwL22tz6JoK7SI11pmCXsSWKmEYXI4fUB
	 ZjjvIrxoQ146i9BIdeEhSJGbwusEdjYojDbDgsg0s1wIijpR4yiq/ogGgP0LQ0yCQj
	 IiprMRnyMJxDQ==
Message-ID: <sashiko-outbox-224249@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] leds: rgb: ktd202x: Fix a division by zero
 with long blinks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-4-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-4-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:10:38 +0000
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
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D4

