Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176069;
	b=4A6ucKbui+2bqxw/bEKRWto0V0201byUfqOrHaU+AssNT4sY7qTRmjoM+eRfb65ub/dD
	 I59OzlX7V64uz0dgHOggSXgxS7BG9aXnTsMCdKI8mKcKIwVuXbGQ0z4kPwIvdhPpD9wM3
	 HwV69PpecsMqJ70s/4Osd/7R4tDwgHC52Ej4F8LzEokBh0qWaT626KLByEBhd0XTCufiW
	 Vnw9s7naQYlYM1n7d4NVa0Q/mxU8vyxgR3//5Caovq+0OBXizUgA/FP8B4If3ngpg8PCW
	 kVrU27BJuSgQbjsTywwn9kPa+Qa1yo6QMTYoUsskeP8micmJnDOdHvRWLwOverQTe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uBYlOvVju148acY8a7z0mNzUp2vijez0Hhg3ZMTbtTU=;
	b=AB5CQ8IOPB5X5ehHanvcQs2a6boG/yVZ5LCaB0uihOw1mDW36Esn151oHGxWoKG4f2LP
	 X6irzkgWpgxrCpKHX4nT8nHGmkOrJvwgINnyvVq4pAjz4lxp9898mf1zJ8R90uCl9DvtE
	 igXzBzH19eoUOW/vnt39QohbG4tPnFE3de3+2TOiwQExfaIbvxMVLg/lw23vdsnOUDg2u
	 EG5eW7+107XgdoTB+MdB6dlMxCKl4kRXllL0loE+XhephgejW43eAQpKVCu1mJJYOxgMt
	 nwt4zJiJPZE7MQG7LqBl4gFJm17mVns9oxynWSWwo8wyryYnZCcGpzFYO8dPtfBAnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SraZZeFg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C4606A322
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SraZZeFg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0440B1F031E4;
	Wed, 28 Oct 2026 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176069;
	bh=uBYlOvVju148acY8a7z0mNzUp2vijez0Hhg3ZMTbtTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SraZZeFgFjcXcVCTv/S5nXECOJTdD0XQZ0raw2rUgQiyOcGFIIEBtBeUmA4GdeCb7
	 jjceZ8wCmfpYjtqlg6KFkOBikWeuMnsOzRWCy6m9EPnB/7vON5kxWWuq6WXjh2b9QV
	 B7rZi3Ss0todJNSfXKYXoDvbzXj2E1+2HXR0GxhEVfCyd5pk78usNwiUB6j97Ea+mT
	 btjJqaMLzyYd/7+V1HSOGGASRFf+voasg+envTxMzxpp4JME42IAtfqR1AOAt+/qto
	 vqgwsWfnq04rappENtzgIFoZUYYTDqvzWx9aF0v1Yu2RcJuPbgO8HrgqkSwLjT70/f
	 b/i8uHPR8Lzpw==
Message-ID: <sashiko-outbox-187620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] lib/list_sort: Switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:48 +0000
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
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.
>=20
> Add spaces after the commas in the __nonnull_args() argument list to
> follow the usual coding style (according to checkpatch).
>=20
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D3

