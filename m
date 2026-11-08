Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174708;
	b=a7jNYcZgHsRxzaHutg7sSHANAOXtN0/Cwl+n95qjz/bjcX4y30RVeYjvTq51TydvifVt
	 duXVDq6XY0KP0ixrLr6so01t3ivsSUVkkiw4Rl0b6XGLXKnJhKnvqLp4Qyu6JZn56hrl5
	 qjXaxc+YUFzeMT2sVgpTU35d1AC17Nh/9yi3i/hxLUjQdIyPCjQrGQLcy37aJkd/8qukc
	 Di20oqkrPuxt83FQ4JTvDUbMjuFxDDT0Z447j1Tiq23E8oKli9AEAnyCqLx2tOmXuq1nQ
	 v/zQpHjKOeqdut56sEO3FGQtS4gtYkTDf4jsVCdrgMjIb4w1H51khGEzHCPcYGkjaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174708;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qKxe7+csTxsV1yclT0/23YTBQERh4drFzeI28ypjLsw=;
	b=jFJXX0PfSs21iq6OOBAw19E7nk2T8tKtmJm2MsqqF2KWOLVxZBbxsJwp+la50O7l9nBm
	 7U2KTbH2tZaE1+G7hRlRyagBX8x5HhmWZA2aRp8jlgtgwNsiXL/TIliCAMxqSnuEUnVKp
	 XQM2Ss6cx0S7dV0G10vxIZ9fqnpwhJuY+BoAFxml+7Kmj/3k8N8TVI1CHggqpZx3G/1Py
	 nCGGnKvEwgHiOmOzjaR20JyM7i5EKFzbNzlP6YPAMRZjGUwsTJdJwhwxmQYUC/rHjudVF
	 O3GOXQPyJRHtjjBUK7T0+hGmYnm9gpkxkI5wDVdYcNkHTTB9nNSmDqF23g0OY4lDqHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcTXvXoC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1752D606A31C
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcTXvXoC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAB31F0089F;
	Sun,  8 Nov 2026 21:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794174707;
	bh=qKxe7+csTxsV1yclT0/23YTBQERh4drFzeI28ypjLsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NcTXvXoC4gHuFdVinS/VcXL3+V/OVbR+A1IZbrsG2MNKKn1KbEKIgMkRRMr/NOIa0
	 PgLeFZLvQ6DnVYu7VR3cXuBZxVT2c08Q0qIFBts0TaYOFWJOJZF8cLaakTaL5j8Wa2
	 OfqOAFOHSAcqs6tohk+ACS4hKv+MDIJf+AApcqqnkLCSuHGsW0ZTm2aMsdKEMWp2Ab
	 c9k59QOFSQWSO1vTKp42f7juJ8vcay8yTDzy65NQttpbBaN5E9gTsruX0IKuMsXct+
	 89NgFJDCuTRzGs4tsOGN4kGYRkPjmRnHLSdxeNDEe34Ms/6Yjw+EpERNAFdo4wjCdk
	 nji11Z60dlueA==
Message-ID: <sashiko-outbox-204093@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-1-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-1-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:51:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The aw2027 is largely the same as the aw2013, with the
> exception of the way the max current is written to registers.
> This exception makes it different enough to not work without
> driver modifications, but similar enough to fall under the
> umbrella of the same driver.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-aw2013-aw2=
0xx-rename-v4-0-826529beeb52@postmarketos.org?part=3D1

