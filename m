Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101007;
	b=G//vBHCG3RIH7M0DthCnvOvhsRIJGiZrHqBP3ysVAC/al7WGxY1IwHtejHoEjw3504p8
	 Z75wzzSzqKSE4pN7hcGgkXLn9vFVrjCNPeNXtOmhrEVNKo4xPZA94tUFg/VvhGX6qBfly
	 Q67kM+qEvM+NO9qTw+dtSPRtzgYUa0pUNJ4m9hphSWnK4Y134M4v+NNbUyqDbjpCi1Bu7
	 nJFhG2Shy8Nng2blOkO+AeOMqsAK3LZXmiPaIBLMkZUi+YpZjcCWWrkrcnDbIfmhTbeb6
	 k+/nRDW0EfreHM86Rye9vSUTrXGpmIKExlnTspMM3HCZZhb9O0b3jg0G/o6u3wXFHMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101007;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8mdqfp+D1CTdrR5jsCEKjR/bWKJaWlSIiu30grNUNmw=;
	b=Zd8gFwqRa0fh/PL4qnU2nKoQWzY4o+aFKODiUdht+6neHFfytLPeDr+6y628a7xkJRZz
	 Pc44Pg9SoMmejjmD9aZYYmLk4GtXHdTEgHi8l4mt7KDtSRYL2synGXlWfCclLdC2D6Jb+
	 FOvF2DifArLSMDuIP7C3jNcvvhMIlHqm+CQ5NtViWYQg0Baqjp4fR2P/vX6eO9RVKj7TI
	 1tRhKdPEzr45e4RjnJaJCF7Lk3NjKrxrIEMZZcw9MdVnJwv71xbWBo4bpt8MaahqOVd7c
	 MZESO+LBCfFMbfnv8Deg5o+kZqakgSjpBz67k3047aXKjhHJikntcLQ9Qdk5zT2zKAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/ex+Ez7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423A606A31A;
	Tue, 27 Oct 2026 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/ex+Ez7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B271F01825;
	Tue, 27 Oct 2026 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101007;
	bh=8mdqfp+D1CTdrR5jsCEKjR/bWKJaWlSIiu30grNUNmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a/ex+Ez7SkdAixM/8BRzuRbMjnYemcfY85B48Ad/9RvbQl9zOwiQ+PDhPEBRFoaNS
	 nMoLpFzBBwsO69iRXm5at5srs23NamQdlirT0KwrjfzCEQOU+XUjfqKJH2mfDi2hCw
	 /O52DnKthv6F/KVu4++UXj/PMXR5gGGa6XdReLb/w5zuAaFQqbvW1W0Pud8vFIHp9g
	 ClqNcVXnmcBmK+uhcc9GYjyT9Vdhifaqtm6WuNcj+DlN3zSPhFmPhVmycs5b5BaNVu
	 BKXtJBvou4pEoDuXPdod0XVsHpuDRNEibeeMB1MY+ugOpWPRR69g8W6WpKwxJyFIll
	 hnLPNjXwa+/gQ==
Message-ID: <sashiko-outbox-186462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: leds: Document Skyworks AAT2870
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027113230.47538-2-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
 <20261027113230.47538-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:36:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backli=
ght
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113230.4753=
8-1-clamor95@gmail.com?part=3D1

