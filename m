Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938012;
	b=xTrDb12gP8exE6Unl2FZ57Q1a76WYpxL/buJoyRBSGyqmd1ZCHe4iAkxgNMRhe888yyy
	 +LWSMfmU4MehtL0PZizBCnukfW+VyG5EWqUEqfXFiOTvCpN6Z9z/ysudZ7qXu6agtG/+p
	 Xyx27AU5Ht6s3qesAy5avj5g6vHo5FwDE4e6yaeJMVRRGRmMjb4mwGAwKZ5cb+uEBZrsX
	 pVTpn1d6JRLZcks1/bDd56pTnAlR686aMRiZ8wq/vk7mBiOdcEqhlZ2ydUCifySngJ9GM
	 FJAgL7YKQI/TBgwp1S05eSHT5c4Awed6/rfg0b5WdFuHfVlC5s9cm9kxj3OWlsHnodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938012;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0HmWg/7WNvCT61mFNNBZwR0Ac0jUmTkic8kjEALlG6w=;
	b=dRtmxx7Fczrlo/jyxqZkbikyrSZn1FeJzWPxQnAu5YSY5nsmbU8h2/Wrqp0/o8Zc+TeP
	 RFQ91Hu7ZD1cXATAbTTZ8EB+Ju5vRYvYEIy8Tv+OpMAHLjfSdj90haBxe3H0ZFijd7RRU
	 b5liblakyPomCQH7TxqM9NJp84usnTNdRIKY3Un7dw+W02p9DZ8omyuJ54M0Qg3CFf9wN
	 1iobY1ta2wpZTpPrIbdPIGIw/Tc10uaQVZOHHVh+bIEiOgTLKQTbJGr1Sl9CYeH8r/xnK
	 dWkhDLYpn77sL4UJAym04/7z88URx0FtToRXMDIvuh58XQxyL0EqK3IFtn4cwvScHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzhtJ0dM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16170606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzhtJ0dM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AE21F000C9;
	Tue, 17 Nov 2026 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938011;
	bh=0HmWg/7WNvCT61mFNNBZwR0Ac0jUmTkic8kjEALlG6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzhtJ0dMVvqiE4WZQp85oSjinKRPVJp16KtxGWA3b4kdmid7oJ79dwMljodaN1rh9
	 Eml0qEFl1p1IyoX3giHJFiIE7iu4NyVq6Tg00W3p5khTNqaV3IKnOOsTWfnadFT3id
	 KwXbE4GGZoO+mhM+VtfBPcqQnXolH2Gy7H0uv6YT39vYqeUraCLVZK1fQxC0FsRshh
	 kHTcrtv/iLyWUNK2Eo1V17LBqS6Vd1aLpEtfZ0ugXiURjP6tFOUqDGali6FwG2fWcO
	 T57AXY1Upm1PCKGY3ptmjeYIJrKH+R2XMKvVqEFnRjYoVqGwBQD0oOPQK+KkAljW4I
	 Ys+lIhyDDVvIw==
Message-ID: <sashiko-outbox-219285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] backlight: add ktd3137 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-6768-ktd3137-v3-2-b4fd957e3b00@protonmail.com>
References: <20261117-6768-ktd3137-v3-0-b4fd957e3b00@protonmail.com>
 <20261117-6768-ktd3137-v3-2-b4fd957e3b00@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:53:31 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Add support for the KTD3137 display backlight IC. It's used in various
> Xiaomi phones, such as Xiaomi Redmi Note 9.
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-6768-ktd31=
37-v3-0-b4fd957e3b00@protonmail.com?part=3D2

