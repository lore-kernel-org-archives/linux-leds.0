Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251370;
	b=4OiR2DXveb8/aSfbCCH2FfvpcS3doVJkCPDE1fGxanStNfloEALb0tf5pNhL4/ZodH+R
	 6rv+zwo2/FovAo4sDkZYByVYNICMQxLf53asrDcLDq+w9ipL9J48Qu/bjTmmUmDjO+Hfn
	 FrcBKeqMbmmaiIAL0rxaX+yrvgcT/J8K/rghu45lU3L9TvIoPkkaynJd2delIsofDVemd
	 h5f0ltlZodJ3ZYqNvpSoL96nzo14WEiNQJ/nwKofiTNAlKj2N0TLBYKGpphvpdzt+pSfU
	 iQMjiJGCo8ZbJQJU2BywxOKgsQovTv9/Yekp9Sz0GEe2pSJ6YF2EHT7RIgaC99iSswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c6WFir7+LyxByOo4f3V1cgUkCpXm7XRHRJvuyBUgj08=;
	b=e5Bnmp04OTxpnQdZr/dCeMRo73GBvFkE1v6b0piQqMGR8FYaW/ZAV1sFntTvNw13ps4k
	 IdbLEABOXBpu0TSH1R+AFOVUqCODuGXLMdwLXtx4TeAgO6YQu5DeRhUWFJSWPLvK0yypu
	 lGIavL0iOm8pTNgKIHWMAtx/pklCbLNvU+kWZddjT/uGfqGDhr8PdXeU2lysratNG0wBl
	 Io457W659VYsftD0QkqNusq6ZkKx1Th9JwGe70pk12io4HEK4E/COYKv6q5hWQuDfbCVA
	 mO+tWs4QM9GUqK44gvWmX5yUUkRstOd4ZK0keT9pG0POdCuy9IdTjOwZfaHxCX54g2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vd8KSyTO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55254606A326
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vd8KSyTO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004761F008A1;
	Mon,  9 Nov 2026 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251370;
	bh=c6WFir7+LyxByOo4f3V1cgUkCpXm7XRHRJvuyBUgj08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vd8KSyTOtI1gnaoo/vDcLX1qHWwiiuwelPd7KQVXnh+WtqVeYyBQH6yliwX7pPuha
	 GlnKig2Ijp+foBF5pzboHqsl34yLo6qouUXqybdNoaRoGoTeGq5igk5oJ1Wzvuzebg
	 YLiOQWhZanGQ58YOBok2hws932CECeO/nCEGW5ph5ua+plC02UCgUff/oXip4ztnPz
	 n5mXo1OS02BB1/lonn8afwixkBV/3a++jqWJtVqLW2N7I1HAajnO7K9hXZH8Sz/3We
	 SqUbRypojhMp8kfqtvE+1qiBxVgxH2ds4RLvvVlxPU6ZHecvxURqRH3EKSaWoXyjkb
	 uyvZWaiec9RSg==
Message-ID: <sashiko-outbox-205462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] leds: rgb: ktd202x: Fix a division by zero
 with long blinks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-4-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-4-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:09:29 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D4

