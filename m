Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174952;
	b=iHjoXJEuzM4UsQAklRku+JQNgwRNcaHBBGdMNXfKLE0aVKpmx0Eb2YVPy7mKzBM5/df0
	 qcgHYXHmTlLg/cV/rLRLw0mghq0oeGZEe/UTrVcCQXq0HD+hOfHYukx9v9cNbxgBOzYrx
	 xoNuGAn2rqQbA73PrOH2/uM3AlEV5k20BQxQXAEyPlDdh4SFp4P7Q1Mi00sTBbQtv6rvD
	 Xn2F+KVVeE0JLNSwhbSS121urZ5m/CnFe3PQC9dRdtq1OtMx93pXArK3uIrAkG7h+JEn/
	 Zr1qatSt1F1kuP7vmJs1akp4q4pNFXepIl49AixpGE2ggUhLSHtzlL8+Pn3OEr40I+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174952;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kb1PTUV0xxtjhvtPn3EtVi5xcvAxODe2VIog1iimgY0=;
	b=uq4SLbni/5v7fPQXaEaSc6xhT5yNjJM8BOx19Erf9xzPTA0IJj15rK0SvmCNGaSHvnHv
	 mce56hNCxpO6a9mSA5DUTW/aiRHUCaYe/QkIrUgTQf169RBvO+0/516eebGN/ixHHrO30
	 JnHPOY6Uh/2W1vov3T9hiBKILFTYZX8HO92P8Ii/+0kJntLKq1gj3b/bUjLnSrLJeZDmO
	 fn2QXfCZjQ8Zk0LUk2GYapPPVThJZBlbR7Hnh4XkgHGdQ1/rXluHN3Dr7/D8dwj5dMM3c
	 IUnmb0FdNtM8d9S23vteXUH0l79iCAvGGkl/i6t8M9no1wtYY2+dRQJAfXeUNg3tsKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c02vSH8w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E712606A334
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c02vSH8w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6EC1F008A1;
	Sun,  8 Nov 2026 21:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794174951;
	bh=kb1PTUV0xxtjhvtPn3EtVi5xcvAxODe2VIog1iimgY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c02vSH8wlc1dGaNufmg0keKu0/SESI+5g9KEdHtUFQw0TjP8O05lFR0Zbyl7TLvKc
	 ZrHcIEbKBF4+vS01VzmpMd+Xcu1MvPUE9Efv0XbtUncPgBp4OIyMB8G3lzHm8CCNiJ
	 Hl+8kf2tFVJ8gS8Ay+fT7kE4t+PUkfHfOcZuATgbvIguxFRedvTVKUWBbOCHCnS7gT
	 NTJb7VpvMHmSqjqcNia/vvheN9WbetLBfUOff/yhYBTPOJVTamuUVBRwGkbrggzjYg
	 WRL9yaE094+Midn8pLANu8p7lj7I8y4kHM19qTnreRywoiahaaQtbShswn3r6qmfWt
	 O2fXqcJ/3wTSw==
Message-ID: <sashiko-outbox-204099@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-2-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:55:50 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The AW2027 is basically the same as the AW2013.
>=20
> It differs in:
> - the max current (30mA rather than 15)
> - the number of current levels for colour-mixing (16 rather than 4)
> - the supply voltage max
> - the charge indicator (unsupported by our driver at this time)
>=20
> The max current register (imax) also moves from LCFG to GCR2, and the
> selectable current levels for colour-mixing (LCFG_CUR) take their place.
>=20
> The current driver implementation provided here sets the global imax to
> it's maximum, and scales each led to the closest value using the local
> imax. It's the best result achievable short of adding custom sysfs
> entries and mucking up the linux interfaces.
>=20
> Comparison of all AW20XX chips https://www.awinic.com/en/productCompareLi=
st?id=3D47&ids=3D1022,74,96,75,72,71,928,927,73,76,578
> AW2027 datasheet: https://doc.awinic.com/doc/202507/77b87097-27bf-48cd-af=
9b-9b615064c1e1.pdf
> Vendor driver: https://www.awinic.com/en/driver/AW2027DNR/454
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-aw2013-aw2=
0xx-rename-v4-0-826529beeb52@postmarketos.org?part=3D2

