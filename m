Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176070;
	b=ekIJHOCg324fSBLw8Xoigr1HWwuNhOfpT2mVmEDZphuQb3qB2kKYE8ESyJYH6q6tt1El
	 zsikQc5vEQeUp/sVEQmhA7TsG/Ji0EJRm4uZr/hWDHmI8xjQ56qm3r1mei0GqFhdSvmSo
	 J4UPoPGvKJeZlYL39pbXOobs7tBaFrgmwAS38SyoK5M8C4zwHB98iKufYbweBREZG36fo
	 zG9kmJu91RwD4hl1Mh5oxtijyMhEB89IsiT5jhsMj9OPYSZTeHdW96dEADdcCtJBof3fw
	 lkFhDh7TKOBMYB0aymyXbvqOLYcPG+zYGLNkipP3f1jkMqwDTkRqH0Lx7N7Ny8D7wUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176070;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qlHLIE2fTJe8ISEtj1MNWsbbd+L5mZrj+Dxiy+sEHyE=;
	b=OvutCUgBwhidGnAqcUs1s3FjAKuyVCZjUrlv09K0FN9AbELmuEy0D49MSmplq2QnhhAD
	 VKUvtcq3mxtMddQlmmd3LQhJsy326QMP2MFCDRGttGW/3aMn1XB31IdWuqHXDUVlYFT4s
	 zcgtwALDC6+E+J7RFYl3u3O5m8BwBUlJSbTRwsZWOkNU7dQfqtQfE2CRJUAI75m2SVxKg
	 i04YzamZNYdO6dldQrVBtyLyeK3yle4Uw7Xa8SUPeCW5ZuZmfYDy/i2vfGi+82LVAjPlE
	 q0E6wUJ5bztsHWahyZhe1TURdMKD012Bvo4AD39I6lghEV176uj4TLDVOLJjXyTNpEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDwfT56n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C585606A31D
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDwfT56n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DAF1F031E3;
	Wed, 28 Oct 2026 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176069;
	bh=qlHLIE2fTJe8ISEtj1MNWsbbd+L5mZrj+Dxiy+sEHyE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GDwfT56n5YuXtVoJvKU3TxOOKx46NjiWQD62deR3qSDDno2JadDouSzZXneogezLm
	 yMv1pChiqdvCIoDy2owli2m0E/ltW1K+JdOMG2TwfLv/J+UV7OvYMpFsl23fYG1Wom
	 qU+e5D10kQUU8r3SJax/USt8Ca5RoeaMgUuO7EQCK9h9uKzzhJ7f7HZsVF5xTeb/DA
	 e4/T2VBOlKN1xYv9tMb4nqJXl3FtF+0utEjYKvhq9fvu3G/0JY1qWX9HRZVpxrTjy2
	 tp1O5NKaVNUXR0yQ4Nq64GLj71Vi7sYYsPwzlpxA6dheKwhRNCFKfxfMN6im8yweq9
	 YKAccySPyGakA==
Message-ID: <sashiko-outbox-187621@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] xarray: switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <e2660c4c9f5e6f97be2ef7bd3752d259bce77d81.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <e2660c4c9f5e6f97be2ef7bd3752d259bce77d81.1793027261.git.d@ilvokhin.com>
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
> tools/testing/shared/linux/xarray.h directly includes the kernel's
> include/linux/xarray.h, which now uses __nonnull_args(). The macro is
> not defined under tools/, breaking test builds.
>=20
> Define __nonnull_args() in tools/include/linux/compiler.h.
>=20
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D4

