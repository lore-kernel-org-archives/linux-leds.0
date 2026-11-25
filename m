Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597304;
	b=CIAkR+XICLae7eO1tFhqZJZWgBm9uE2NgeEmvchPgqz0yf/ykGiTYyCiRF2YkoXOMatf
	 YQkoI8IT7thDP9KC2a+et4uyO5YLZybHQjOAp4ED+3nJeh2LLV/d8sg8bH8SMmnIKUYzz
	 p2eBw34kx5tYHl3J4ex+4SkI1TgSJWzLLhzwgl9eQ3uljFE/uxuhEFugtqql/wCDTN/D6
	 u93F1991IqbdNZ+l6Ai4/5Xdk+DCZxP6e3D4qHIWLc6yWq2hdUyJi18T+vOWUE4ZVOpB8
	 tVZyd+OOfghAGq3oWxjJi3mDROxnN6ah5YjaCokvTqEoEA8J93LKKIbhaUf8d/W3fkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ehp/5pPoaj2FU3qbbzRONmedKI/mtCawRJivIcnDnTM=;
	b=lNUZrr2iJVgboEuFqj9WhLPAvTGDRE2zrw3/KmVTl1ncQ0Wy0zXLR1ns+u9LO3QzH5LD
	 v0OctWxFB1ublTFnnEtJjtDK5aKVu2dLTgnoRRjPWxJTntV1kzkrU9bTjtpI1S5GOurPs
	 sKl2fobWV3LTymeNOWpZc74Xk8Qe2asgnca6M7jmMnscjfzbbFTZGIjWEnGODt+NbK9As
	 0uOSKAswnUXAxaUIluaWicvgbwmrWm1zxAgC9VuywMFiAPVcgd5CN5d1n57S7Wm/Osmv2
	 tWDahnYJYCng6BJdsXSVSfek6pDkJb0p0Qr6AojbdDcvCa/HP1poX3BX7y+d5Dwr/Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b85zPhhc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C8606A32C
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b85zPhhc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC401F000C4;
	Wed, 25 Nov 2026 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597304;
	bh=Ehp/5pPoaj2FU3qbbzRONmedKI/mtCawRJivIcnDnTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b85zPhhcaFzqb/nFk3NgIC5/LCgDDlJ2gL5mD+OP1SjP5D68zoEUAObIpkqx64O3e
	 XlCZG0T9iHVgK7P5lDMqSFvzJgBbhnvwQ9Mc8GjoSiA4emDn4UlyVH/lUg/dnaqpIh
	 GSgGCFN1LlUIxdhglGr2GblQp4wkpVWkzHQlS0mZley2v9yda1htCtriJ5cHn19MJy
	 gaJ0YJTeNM+XS9vOz/TnFNm6hFhn4QGirs0/SrIyWrRwH0troqtqGj98Bi1pJlIB3t
	 jugwZ92xb6ZJXnHeE9gJSqn1ZfVhkScJZRtntJPuraQjB+uYWpPezOI2M2wIX3FwZ3
	 hcbSK269nrG/w==
Message-ID: <sashiko-outbox-232968@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 0/6] platform/x86: thinkpad_acpi: Add a keyboard
 backlight auto-mode trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 09:01:43 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 6-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125084644.1375=
06-1-kmatzkaczor244@gmail.com
