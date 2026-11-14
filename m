Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697205;
	b=mhS0eRpYc1ZJbYHDE+NZ0umU6lZULl0MeupXncpdvP4GMID7gPMMr5e3aVmnSpNucA9r
	 ZiP7PR7timIPe0vAxv7OiIMGFDTEqNNL9p9DQ4Ao4xG+1HeB3j0zaXRSOLwVS5/lT1XLC
	 gPfBbmrjHEeLBk8g+5tq3wTjTagO6bGDSyULfRi68zyqGAnP1HxFenj8qJiS/1c1H+he6
	 D0tnPG5KzWJC76ROGIbPCAbPyfz1hy4o8/oHy885xZAwQE4Y12JdrBZ6JghD7YEqUdCvH
	 iNHwUyglnkHE9Q05P5IXFFIt8vQJjveg+LQz+ZyqAoCtQYj0ziRQwqsADqzH157upvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697205;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0wa81wjKvq6D81wGQOOKb3vbFn9v2lmkCTbZ586IOGY=;
	b=GDtlM8sjxAaClnJTMna0bFIVRu/BAw3wcUFoummPbtSrP+gaEBaEmFHAmPwfpjNTMYPS
	 iXXMhUJGOuNK1lADNKpNTApJLLWK7rUTb2Drnt1sTeA444xMR0o7LpKSwQJw3Z33fUGGK
	 pAfGQTNYG7OTCp5IgYiEOEsla3QJQKS+Y32SCl3PzK/UU42xVGdwXwiFgevN1kSrHCFDN
	 xPL+TVRc7QChRF4ad8MbzCecGplVz3rkpK7bCEP3u6cEsfKy4JW29b0L5ZPmWnCM/7E6I
	 OMk9lU1KsVkK2TDdq6A/aoWKTWw2N90u4hPftQ0/K/T/2MiYqCwXar2vvzBX19VYOQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUBFE66J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF66606A32D;
	Sat, 14 Nov 2026 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUBFE66J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F3D1F000C4;
	Sat, 14 Nov 2026 23:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794697204;
	bh=0wa81wjKvq6D81wGQOOKb3vbFn9v2lmkCTbZ586IOGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fUBFE66JQCQ2H9pyKDE5tScOOtu5AnYdMdPPkD7asAyzch/bkLmkGj065bzET/tqc
	 4DMafBYNevruVdCQRJq3nE6wmxbIqqrqx6jw3ieDDErjs7Ls98p5JBbqVzGbiPxcJ/
	 5hcodmb4KGLYk7MJvycjZt3UThkXMJXzqvnQMuRCKOJgL4Hn2qFk5g6M7HEZ6APeV8
	 JuyUyRDQQX4hBuacAhOk3ZsGb4W+t8zgvOLtzqbstb3q8EXI7YaVnAzD9ic4Fwjt8a
	 BqKWwiv/3GvwssflxowEwU2ZBGOkfautBcUuPr4zh34X9hlo9rOx/Xoo/deXNjc44N
	 cLxWYJ9D80OJQ==
Message-ID: <sashiko-outbox-215079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] drivers: leds: aw2013: Leverage C99 for-loops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 23:00:03 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] leds: aw2013: commit subject uses drivers: leds: prefix instead
  of leds:
--

commit dd420770c3e97b4e4988e32c3e735789959ed94e
Author: Paul Sajna <sajattack@postmarketos.org>

drivers: leds: aw2013: Leverage C99 for-loops

This commit moves loop counter declarations into the for-loop headers in
aw2013_chip_init() and aw2013_chip_in_use().

> drivers: leds: aw2013: Leverage C99 for-loops

[Severity: Low]
This isn't a bug, but LED subsystem commit subjects use the "leds:
<driver>: <Capitalized description>" format, so this should use the
"leds: aw2013:" prefix instead of "drivers: leds: aw2013:".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-aw2013-aw2=
0xx-rename-v7-0-ea5a3113a479@postmarketos.org?part=3D3
