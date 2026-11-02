Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633359;
	b=EG678dN+huyiSnqUIGrLBv4eGKcjHqYQKDLOwhh7Gy05IEg1IwczmkvJSfKr33adr9ks
	 lu+Dv1toPnJUF7l8Szhy2NcniB4IkO9z+LpZgpWXdxvywOnADsWC5zcn8d6nGcfLuVTrV
	 N9XRwxjNBSddzpB0U83CyPNl62LAJW/Eeyz7QpvoXABBrd2/m/AE5dqXLIR/LGZJzFEl2
	 2E2jsm7lM+AtNvSDhNWkVuz/Cw7reO3UUMiGOkMZYiUyvPGLsQXppBL/qzO6FSOPbrXKX
	 1uQtxO27ohm6PJeCw8qplCatMj09jJ8JlaysRQ00UrxjvgPLLAapiNxQ0sleNvlFvNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633359;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tFzwDLbPKCgxHsxxWv7vVWRumuBAel5kbbtd9myH9jQ=;
	b=HNmMw7JrytJi+zDHJy/UzAO00BWSJzIlEGgMi+zKU7sz832HuMnUFC3QEUmQ1LXuIpav
	 5+9iaj/ae+YfOcu1F6xb9FBSYi4De80ntI8/kimIHxnSb4Jjmn0ARlNPO+nQ3Zc25VBK6
	 qOu9YvaYEI7kxWyO9LYfaUC0mAisHsUacM8XndvzBdSq7N4vQzOHgEpmxVeDyor7s5E3f
	 0R9/8ukS9oKw3yyaaUTTqbJl1d0VWkrTE3H0MmUHGXCScKoFhWCXXzwLntuGzURl06fWe
	 s2XycYYq63MA7c3c5mjbBdZ4+7KCzEMIkLHbHIUqM+AH2qzLSZ53HzjP/i3P47b/rgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWKXGzFq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C0606A91B
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWKXGzFq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85DB1F00A16;
	Mon,  2 Nov 2026 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633359;
	bh=tFzwDLbPKCgxHsxxWv7vVWRumuBAel5kbbtd9myH9jQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWKXGzFqvqjfpOj5WfLy2Xrnlj2sYaKvj34eRrD14+V5tVmZ9G3vM5OG2VTtRcj9+
	 689FrC1Fc0yP+ql81oPQ0vuzAV4exe5O78ML42vZ16doK07XsXO2gy6lZbdmVkJZfn
	 p8QMvlYwtYCMNWUUB6GdEFjcfHJ0lPdh2Nc0ZjO1Gsho573jfLEOeEedpdVSStQQCa
	 1WfuXzRIfYnFsC6JBC50fDb7HfaDtdWhU20gqW3H9TzmvgA+VqeEcse0ATU4iGE4bE
	 JazlozQcocdVTBgv+fuPQk4y16bO2qSlG6eXpb46sDFbGSpYal6IHsGFxceEt6ySlj
	 WbjBiNPhvEQpg==
Message-ID: <sashiko-outbox-193664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: pwm-ir-tx: add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261102-6768-irled-v1-2-c7064f3afed1@protonmail.com>
References: <20261102-6768-irled-v1-0-c7064f3afed1@protonmail.com>
 <20261102-6768-irled-v1-2-c7064f3afed1@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:29:18 +0000
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
> On some boards, the IR LED shares a power rail with other components.
> If that rail is turned off, IR transmission can't function properly.
>=20
> Add optional regulator support to ensure the power supply is enabled when
> needed.
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-6768-irled=
-v1-0-c7064f3afed1@protonmail.com?part=3D2

