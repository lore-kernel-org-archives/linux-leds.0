Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023207;
	b=m1nJXVCdTylex32ZoCnWksOq+zuoeJ94O39cA7O+FolPiBd803dVukXGhl7hwNFc4toB
	 AHb/ja3VTwVIGYG9F3NThIZXyoK1t0b9mQGGLlfcBHZJRu9KiQFuVDXNQyM1pWWTvKcBs
	 HJh5IQRWKSg3Zb4naqEqHVE2BZLQO6BP4T5xsRpGRds1NLF16UQGLu06gOicwDRiDGAHf
	 U5+PUeztN2TyzOU3Bpf6HK5W7oR+pLN54RmDM0ZEdo8kFZoc48ksG8rtduc+gtgpGnuzv
	 h1wc0UKyPdSkAbXi3Q8x1w5luk7FwXvu1gfmpDA76Nvycxac+oj2sTwCV4NwpzBHfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023207;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d4dGv0bK58M/dg0iHmKQKLW6+Rm3/AYSgkaD8rSUKtM=;
	b=zU12bZ+5g/2a7EsPPa2dfm1Iw7etCfDYFYoOzXfASMy3ZuoOH+kdXYElMKlwvWVnODVX
	 legeP3ovzixGHn2bBZisBzJyA4VT1o/ICy04Ojp5yNGbxVZdaHKxD35VpSHdRgTwcw6PC
	 uduxf6kX1XuUChWX4SBsQPqpOndNo5YxuOM+Vdjt7iUwEuubcRHBZPuIADSYYG1t4wlEo
	 Amfaua5wpECVN5lluYPWfmUwf/yLgoEzLbMyWCUMR0tdVlsY7rRdK36VZcftXAc/qJSg4
	 lRoq3sdMWy8L3P6LcBUxivET9BVggkoPhGI3/SjUBC6mSY/1TUuDZaGt++9mAK3jruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHimc5Mj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEFB606A31F
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHimc5Mj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99D11F01828;
	Mon, 26 Oct 2026 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023207;
	bh=d4dGv0bK58M/dg0iHmKQKLW6+Rm3/AYSgkaD8rSUKtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mHimc5Mj4+0e6TlVu8y99xi8M3JhsFPoU3R8tXdNbTDsfV7ogqX/CYm2/oaOb1Pbh
	 DJprLlA9CuYDf7hn/hmlFMMnmzj5JJ/ECpiUe9M/cN+DNfFhIXQYu6jwGsTkGoG2IS
	 y5QeCV8ZkAlfCu/H0dDKOtYGdI5pVQ+DK4rru7p7tYQsUoDuWLjy5OKuDpyeKhvYwC
	 Qt66VFmhai1nszKuy0PF6m1OrirtKQwkDMq7Jop5qhBZmQeHwKLgH7WKB7jTylDM76
	 YhII4N1QM/LM0R05WlG8ttta525FDRs6dQIgvUMPjbNdCkAPuKm9xYDvEA5XcOewJC
	 qWxk5c894Ggfw==
Message-ID: <sashiko-outbox-185362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] Documentation: leds: lp55xx: Add an LP5569 example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261026-lp55xx-v1-3-6eaaf530115c@marmottus.net>
References: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
 <20261026-lp55xx-v1-3-6eaaf530115c@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 14:00:06 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add an example for the LP5569 that drives three LED channels at the
> same time.
>=20
> Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-lp55xx-v1-=
0-6eaaf530115c@marmottus.net?part=3D3

