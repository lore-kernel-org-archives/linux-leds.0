Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176072;
	b=Izj9HqjOD6JvDn4vu2Mj7pewpr9BhrlM0YnUxZhzcSdKLnyHpGH0Mtle8SaHDvCfbY4h
	 w1sJlTHy2eTgj+2aVW9wF895wqwhsoR9uByF4txJUZa28oWXHMqtyfm1oalOu4WYsom8h
	 AC/wB8jBbf57Nj12YXlGh2ghX5DmhSWCcz65PW2cI8QazkUZ0UXqNiatwoZIFPtZPVqUX
	 2gCeMCOWya4PUqyOwlXQRScSzhEDu/AG4tJuKPN5Ggv9e8VSACP8FrhqE8RB3NUWNEvAe
	 /zaDjoRufmkTFHyg+jWRnn4rLdof9jiIqrznt/kmYDJXJYRFbZ8jJrEcZ0xLRRiqHVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KmWH5dX1iwKvUB3WL3GXc1A3dDIfkfRUYInYDsJDTOY=;
	b=KFe9iDpPlFspfXwrpD+2b8Pc3m9YNtKb8Dk0yZ3TChp3b3DT2MwY2kgJAnqOMrAdG3fx
	 UPLzeN2NXcB7ylpCTDxWnA803bl+xQNm2FaMOKrCd7nGWsp46qF4NBppF431nR5HjlbPK
	 W1Q6emLP8N6v9ilmMcCduXMpuUs0m5UT1kRe+uX+oQNPy6pesUwOA3ffR9AkTLskhWtq7
	 Q/72GcjyCEYHNFlMZGJ82WhaVShZOGMxRUVt0HVCSi8NNlp6rJC2Dyvv/mhobaZd+5JfP
	 1D6RWipc9nXqdbs58TXwBF7dfUrk3Zq0Tn9iRnYYXCx4b87gfRis9KvxzmYzjtbvh+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGtyFKVJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E886606A31D
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGtyFKVJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA52C1F031E6;
	Wed, 28 Oct 2026 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176072;
	bh=KmWH5dX1iwKvUB3WL3GXc1A3dDIfkfRUYInYDsJDTOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGtyFKVJxBvrjfZUCGHHXyzHkCdgyrIFn2nT+Y8XtojijBEaka/OoCaF/9pZWVhm/
	 C1oaPgUJxBP8oOLOb0pChy2hTwZdfZeUyHwrbRY35BLZo5pWI/NQ7xJMIJ6eNi8eH+
	 QMoqJVMoiAXqCGY4LrNLihYnm4usBB5ml/5rnXPno04FmvgseYdAmpXBf4SCfW+42k
	 EM9ikEh1rEesx2tVXfBGKfxLWXQyNle9TsJe6KaKG4mfYgbA5HEDojdP++deTK2q2U
	 uvWE6lXxpzQMtUPXQ9AKZ9FHOOLZo1oCPhO8CdIqSkrDPvRL3d63UmBpCzr8OCwQHj
	 2cysd9xDkm9KA==
Message-ID: <sashiko-outbox-187624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:51 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>=20
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.
>=20
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D7

