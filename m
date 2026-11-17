Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905198;
	b=Q9u3UzoCZjWYsosHQ1f+tI+x4kz+fZRfUEySCM6ZY6OKXrhGWukKk3d4CFsXJkm/ohVA
	 YTapoHvYRNnwMOJUEyHi6Xk6NDS8i2nmDgJpXsw6eNwXyG/2oLCtqUZQZSNlZ04qeT1oD
	 FJ9vVLWAv8uTgA7BJPmxgCB4ITfmH5Q8MQdQWlWn3D5+M7bw2TdxCzuU8E4GHFWHgj2IV
	 xd6VY8GOEu0QK6nwSq97LQBA6LIvCsJQph+CgNZ9G9VdIU1GK1RLVvO/MM9soAaD//xIx
	 p/QX6BzQeT0I6Y3Iqb3hdI9F954jxVfspWmb2a7h4l9GPO+js8JuhKBRGhThK9l6HNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905198;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Bvl1hprC3522mZML42Jt/oflvhNC9b7+iCzYP4bjK1A=;
	b=QyQm7djCMMnAguhRQiBX9i6eWz43oVtnJGeIXS0QNvOb2hbT0y6UpI2wanipz+8L1CMr
	 qvv3SdTj62iq2Y1x3hlNIvOeqQnbeLzkjeIXQ4LlJdEZV14EoOKQE5ram+vEFrxVPLotD
	 oU7oAdFbVP5DZ4FcwjLgHKZbuXOQFF9V8ioae1R1FiTn5DE7X13T1zz6Vr/q3n+aFR5EA
	 CVSoWsYm1965vKcj8LN9PuHwM1e+wXFWkbsC0LJ2437yo1J+A3IyCNIh8CfFZ+AX6bExG
	 YqmgW+PCklK2tWHL+7/RaLr5hFbI8ZUP7b/R/e229gE1RpRbCp9Y74afQ7PDVdIHCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MDobl/he";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62B606A332
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDobl/he
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32551F000C4;
	Tue, 17 Nov 2026 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905198;
	bh=Bvl1hprC3522mZML42Jt/oflvhNC9b7+iCzYP4bjK1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDobl/hend+bfOVbjqmUfXMp8/ZFZM6iceUvXRZ8hzPGFrMLh2n+wcZlHcyQv9xmL
	 R9/YB47fsIWvPDw1i200jpsW6yXBdo6nLtiEYPaC5mnOH8w1fN+26xaeAQDu/wdp64
	 SdLHpYg9Q12U++GteqTXAXE1BjuKqQJJHEFkDG76ysYIGNq+PrP0KELySbEW/v6V/v
	 DAthlfwTPMpsAq5lPaCxKummT3itcgbxo33LAmpRiMKC/oI4ooMUEt6gol3eP1oG46
	 Cz5TL14mjjZ5z+qpns9gU7Aq+TUfIiR777atV7e6zvYnAKN0y96IPYn9sErusfjVIx
	 Q1vuZxAXBqOtQ==
Message-ID: <sashiko-outbox-218433@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: as3668: Propagate chip ID read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Siqi Chen" <chensiqi@uniontech.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117083917.3304865-1-chensiqi@uniontech.com>
References: <20261117083917.3304865-1-chensiqi@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:46:37 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> i2c_smbus_read_byte_data() returns a negative error code on failure.
> Storing the result in a u8 truncates that error and causes probe to
> report a bogus chip ID and return -ENODEV.
>=20
> Store the result in an int and propagate read failures before checking
> the chip ID.
>=20
> An AI coding assistant was used to identify the issue and help develop
> the fix.
>=20
> The change was compile-tested with W=3D1. No hardware testing was
> performed.
>=20
> Fixes: c7dd343a3756 ("leds: as3668: Driver for the ams Osram 4-channel i2=
c LED driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siqi Chen <chensiqi@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117083917.3304=
865-1-chensiqi@uniontech.com?part=3D1

