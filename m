Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176071;
	b=Q5IvVjUkhpys0YPiqan1kYsyPG0mljyoMmQ0fXnVWUC+8IHzAcEFcpZct+/UdMlHsaHa
	 UaQf5X9II3GWqlllzqiqSrVCwZEMa9yIMAoeF6n2BnMK83A3hHp75kBgn2QAE+8DVMc3s
	 gsCtEtGlqB2nxC/DvjXUY2m1BfevMytV77MVnj2Y1cl3XtZ6F9zvC3IDyuAFFa3Huh1p5
	 SpERKndYsCGMweaqx+TJaddU2VFkOpl6ccghuydDJC62NCDNbO8WVrXieZS8upwQj76n8
	 WzeXc/3Tf3MCOk1pXCU4Si1MjgkC4lV/aPtJvry4jAkAbLB4IfC1kT4IumIZg4PJnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176071;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZLKiAU1YTfrOnj8P6p+c60tmfr60JNxo0+d83hbtfAY=;
	b=yAkDX8Qu3YU/5Im1/NvTIv1rT+zTUtPdpyXfiCwxG7LJLkKEnAWsw9uRPerobF7kUeDX
	 udbT84rJlUcgFOPeih+yjOa2uPWb/TBrTM+s1GeAKQwUnjdUrRXf3CwY5oHZaghPgY7UF
	 PGACXyvk0jkwa7sx4qAKnf8pojK6wQKm8B9D8hOMNc6wcZtCB6d/I0oYWdhxTpvDLSDnq
	 TPLMipULlEM1met8nb/OKVbEwerM+/WfksZaN7aMeryfaq+OgewlPpcfN+1v+PPr4oNR+
	 DUB7MOas1x2PctrFE8Oo+pCLexiwf7vJuDppYFq/nF0ik42jt0390qaEDTiSFoc0pMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8odVYA3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDD7606A31D
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L8odVYA3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565781F031E4;
	Wed, 28 Oct 2026 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176070;
	bh=ZLKiAU1YTfrOnj8P6p+c60tmfr60JNxo0+d83hbtfAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L8odVYA3TepWu85m7inbhQ37iuSQCghSxsMqP02MWMO1OzfT8P4fOxdJCslUuz4fZ
	 MF0ZcYaawb2Vzsag/zOD+NMsYEDPSwnfR+qUsTALYXr18EoCDbo68Fg+UKiDdzsu5e
	 3EG78yJPh4FtrmTMX1YQ0HdWsPvCnTR73tAxG8nzFPuFUA31by/LPIIUngKJ6W/jK1
	 bLOsztxsKEPIrKIq2rU5PNRYdI0nEwYk8utQeg/brSvgBPCs298Ww4gNrJ/vQtrZ4z
	 r3l8G6LyPL6r7D8fAngwb9KM3iSZ1K7prGPVJQiO+VYDf1hojeFQmXIeVgIRgCarfX
	 ki1O79iYXBSsg==
Message-ID: <sashiko-outbox-187622@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:49 +0000
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
t.d@ilvokhin.com?part=3D5

