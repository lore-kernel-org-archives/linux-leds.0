Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05694CE68A
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231338; cv=none; b=I59W3nn1TlqjYwkn0DRxvBfIgOERqRFDyHjfYzVlifqLdY2nlvvbokBN8zOhCv3om0LrEO+VuLLUgg1fuJtO6Ayq8fHt2H07gen/DQPRHrnc3DXROzZdFLALOmR2Z6PZbJXzi4ELyAjGBRXEnVJPZ+i5ibykvXHxscVpLLLV4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231338; c=relaxed/simple;
	bh=C5WPFkzbZangNNkQOIjDMuFPUiNGz0zEWvSgXqoOKvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fx+aP1ee1FrSfxG6Gffz5iiMMZdze7t0NDkBcqzrtad690pHDkapFknEo8SGqUwkxQDl+EqJVss4bXykTMdAIsPrp3q38culGNc0qM/76MxQjFP/Rb3J6QCFpCBGZnLjj1Z36lbsAypJdyPPOCHwJVH4rfsf4fTWEdYtc7WBYis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FW+ulaem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FW+ulaem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1891F00893;
	Mon,  5 Oct 2026 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791231336;
	bh=C5WPFkzbZangNNkQOIjDMuFPUiNGz0zEWvSgXqoOKvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FW+ulaem7cF+QQfzFC2qWpmmto3kWjhqS1IlSxc/yxJ5+2Tm6aCzzuLAtnMX6HlVN
	 xhZ2urw0HExEDojN6qRAJGXEoSsSdHwGYEay8K1tOPalGR06ejkZLZW8n/3+naT8yy
	 shIwrRQDGqzhfC2s6L5GPE9gFVZXZCiSw/tUy51q1fJA2b9GdwsXhk/b/Sfnqj4cV9
	 OXefFCR0qxz0O4MW42LvCB3Hx/hxaPXa8CUn89MhUlsfPX1n5pGP4UM4C4jQSsVFEN
	 RhLLWHV+dhABlzJJjh+xVtz7yxDPPxlca134Q2oSqNVKul255u5qSPO00eqp40RKMo
	 SdSGXtnS57lWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pca955x: drop platform data and allocate LEDs
 with the device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261005200906.188636-1-rosenp@gmail.com>
References: <20261005200906.188636-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 20:15:35 +0000
Message-Id: <20261005201536.5D1891F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> struct pca955x_platform_data has been private to this driver since
> commit ed1f4b9676a8 ("leds: pca955x: add device tree support"), so
> nothing can pass it in through dev_get_platdata() and it only serves
> as an intermediate copy of the per-LED type, default state and fwnode.
> That copy is a full array of struct pca955x_led, the same runtime
> structure that struct pca955x already holds, so the data is stored
> twice.
>=20
> Remove the platform data and parse the child firmware nodes directly
> into pca955x->leds[]. Make leds[] a flexible array member so it is
> allocated together with struct pca955x. This removes three
> allocations and the num_leds sanity check, which could no longer
> fail.
>=20
> struct pca955x_led moves above struct pca955x, as a flexible array
> member needs the complete element type.
>=20
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005200906.1886=
36-1-rosenp@gmail.com?part=3D1

