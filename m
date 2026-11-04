Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797073;
	b=WueiXiwiIG+wwh80s7JY0eZ/QzpWvqq9BHUs6wG5s58vw30lI4hSep8C28YJrZULYEKa
	 GWSAZq1eOX79VtTXH1JvrGsqWVNXXl2BlNJKqOJhK3dFnD+WTd1bw4LZuF/oE5+6yUbXT
	 ScChobw6eoVdXHSFhpTsV6d0Tr5gec0z48SJ/NnrbbPm4hHV6cMo2a7frdWwMHLMZmG4v
	 mHUAG+EJ2c7VltlpwRfBRKlhn1lW/EqyNd3nd5g8eCSHz3GeErWFB8oCiBfbFMI/AXKpE
	 qXFWx7LzjatpKJZelGYKDOOw8vJPxHK+KipMjn8Myp5cC/eOITeLc4mZ8GYJjv0xtnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797073;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JY8zpl+xVJ6Cy+PgHu8HYRCXM/aPfNKp4R03GCej6YE=;
	b=O1IVcFWoHsjozgbefcjJVaauGv5Y4n7cgRjsEgqq5Gp1oNdX0WmsXuabKnG2d+ElImgY
	 mbwMucTaEOTemwcKRVngZZiOwnxRIpGNxnjq48oRXtOGTwVsei+BkcwUP33eDD0xq9BoH
	 hPI060PTAx6/sRMmXTUufzwHwoeCUs74XMfdXuf5y3GAD6qtPE1dLGVAAcyEYMXD54XL7
	 8i1+tpN16EbS+mWmJby1GKdcZL1XHV6fLa4VS188gUEHS+MNVNn3UMRi+amsOFGdumRTl
	 KY7BFUfJwU2EGYvJb0YEGqmt1l3EH3J7D4FCti3jaH9c45P5fWiBOq/LXvmDTUssEoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXihP3qQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EEF606D812;
	Wed,  4 Nov 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXihP3qQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553791F00A26;
	Wed,  4 Nov 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797072;
	bh=JY8zpl+xVJ6Cy+PgHu8HYRCXM/aPfNKp4R03GCej6YE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WXihP3qQwVZqKOseNHSNfzRkJ6tZ8yMBXPDBsHsaD9xsZy0DZ0mwBv95qyDL/wacC
	 U5lPLZuLos5PlXkHh7PnLOLdL9vNzQe+FKQXu8JtfS10r7vD3tzXS7ov9jUwK9NWRx
	 rUwvyNSq486mfvvCWOdk17nq+VdAd7zl/dr8TAZM/vUF4f8BHeks5kUqeNAxAx/t8/
	 4WdBbflmYqa0zY4nqMe/+fZAALhorD2ZfSOCa0iMyF8u4salFTi6duIZWLQPFsAgQR
	 RsH4xFisWAVCHS9QGRjx2dllpMevHvPNEFymCWa10DHHGHAhNLwxzTA5wO4sAgvMjh
	 wK62UsELAEnbw==
Message-ID: <sashiko-outbox-197313@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] mfd: aat2870: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104123714.234634-4-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
 <20261104123714.234634-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:57:51 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Conversion of the AAT2870 driver to use OF bindings requires a few complex
> changes that should be done simultaneously.
>=20
> The AAT2870 essentially provides two functions via child devices:
> backlight and regulators. Both functions are fairly self-sufficient and
> may not be populated on the final board. Consequently, the MFD
> registration API was replaced with of_platform_populate(), and each
> sub-device was given its own compatible string.
>=20
> Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> was converted to use modern gpiod/OF helpers, allowing the redundant
> aat2870_enable() and aat2870_disable() helpers to be removed.
>=20
> The aat2870-regulator driver was updated to register each of the four LDOs
> from a dedicated OF node using modern regulator framework.
>=20
> The aat2870-backlight driver was changed to populate all required
> properties from a dedicated Device Tree node. Its channel map was updated
> to use u8 instead of int. Furthermore, because the maximum current is now
> parsed as an absolute value rather than an enum entry, the calculation and
> application of the maximum current were updated accordingly.
>=20
> All of the changes above allow platform data to be removed entirely.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backli=
ght
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104123714.2346=
34-1-clamor95@gmail.com?part=3D3

