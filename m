Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251260;
	b=WguhQ8WLFCbHqQmUtyONRrtG/+ffJY721vt/Eb1kIKG0KvoX4PQr1K8k/3j/5/6CnMrZ
	 DGTj1/v9uMLRfD2dQXB2JeWdn3GoLDOXOJxgbw2sqeoQIDWRBZWITWQ9+BOCw2wkvfMpM
	 6Bo81B2oCSRRudY879d6FMqFPnv6rIchzZCj/yYMRONIgvR39jc6xkq3foWmArmpuKJeO
	 lIS7CjOPVpIaXC/tdJbR5XaJQ8h91cW2YvszYjnsl8nFC2eHJo6T4xLX1pFB+3cyDngTD
	 Ldv4MhIGHE2VUho6sZyT9a7JkLf5c/6Xi1KV5RWN5Cgk8QNznG/0KcpKO6m6XRkfKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251260;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hxv0Sbp6ZkENdX7ZfJLg3SNPo9QY6sq4LbpGuZ0Lves=;
	b=cXRh/vHEqVaWJe9MJSicM7u3MxkAdnEun8d40D5WGBESscKR9o2VpwEH1er3cIcRuyrr
	 sunmYjGHHPMWTxHScCVX7FzkyTOz8VOovK2nqRZq/f5l6Uwm2GMurhrEe0gXTnncUv655
	 Ox9mXOP1DkpZ88nL4TCGkdJNKwQigyTxximaOvnI7I6tD3+9SgE9MLLeFZEwpu/tj93EF
	 IAa6ExZgLWmptCAQ73Iyj5MmKLC1eXcKw/8VumOoD6pdATEjN6myVHIoaOY1oFbx9igZX
	 x3iU88QUJNaublLXVmMsY9pV+sBKOlOsL3+rS9Csj/Oi4cqImrKTqTLjNlxTmS6asww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiSCDzEj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5C2606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiSCDzEj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CBD1F0089F;
	Mon,  9 Nov 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251260;
	bh=hxv0Sbp6ZkENdX7ZfJLg3SNPo9QY6sq4LbpGuZ0Lves=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fiSCDzEj+v3AZahv8FJcz0ZFmBmrxsZxYNaYfnSXkHsb9sFaukdJxKANWvKHcIqyu
	 VU2SgNTt3gZ3qhRn0gLigCKRsOzpzo+asDPb1FfFGxjK4TJ0pl3WnCGGpAxPg/I8Hq
	 rKYTdJYJQiS5iTLVtf3P/fEBo0kSHp3/M/n1jMt4F/dVwy0pgpeLvqFbccBHCaTiLa
	 j38zi/cFR8wNnmyP8nz/A4vY8MUlyVO9SU56Hk0F0yVGOHRjBciSlncystccgPwhRR
	 mMaQwGRUCSIv7Z7WVJptvUKXvlciOCEfuu3ZKyNI3xURgsdJjY5ekNzirWyxIqEru9
	 clhppB8+0YAxA==
Message-ID: <sashiko-outbox-205458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] leds: rgb: ktd202x: Fix the flash period of
 short blinks on 32 bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-1-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-1-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:07:39 +0000
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
> When delay_on + delay_off is below 256 ms, the unsigned subtraction of
> KTD202X_FLASH_PERIOD_MIN_MS wraps. On 64 bit the result truncates to -1
> or -2 and gets clamped to the shortest period, but on 32 bit it
> truncates to 33554431 or 33554430 and gets clamped to the longest one,
> so asking for a fast blink gives a blink every 16 seconds.
>=20
> Compare before subtracting.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D1

