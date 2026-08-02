Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7D22FDE6
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691914; cv=none; b=ouuQWBWcig6mWgo6dMyLSvHxcCu16TC8dAhLaTPVBcIc9cDuUtV2gdjD83sJYn9O9ctQnRI80ZBHihMIqRMZ0AQQZTomg6MP1PQZkcqYj5zAK8URm/Z8OnNGkZxjs14nfUrA0CGTXwzHB6UI1Cg8v4l5D3NueuFd0doKNj6ew88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691914; c=relaxed/simple;
	bh=E65pnZRP1GDgOU7Xc1TEmtYVVmiKTlOKliwBkKGFo0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qVg3deIGLqlCfJqIBC82kkeGCnH04E2EtH721Ts1kzq1rDNDjsuibR/6Je5fh80EYuKS1Sf1TS3pZG/IKR3IxXusFdJhv6OSrwghs//avC+L7wXwTIAqxfJ5Ko+WLk6Vy53xOtPlq/JL3Qf6SO7vdaXkGATHu7NFk+U3Xm2CtrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCTs+iOI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCTs+iOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB75C1F000E9;
	Sun,  2 Aug 2026 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691913;
	bh=E65pnZRP1GDgOU7Xc1TEmtYVVmiKTlOKliwBkKGFo0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCTs+iOIzaVYVPbHRZdwP046CUkpifgWLwpaZ7rLYP4OEuNnXRq0Bhgw7TwghGhpR
	 15F7o3N0dq9B1FkrLTrPfSPrNXi2HC2uhKZeq8dvbo/xpAp5tzN0z3l9O0vtxa0tv1
	 YwZmzcJR4PK/u4CqkaqADy2SqQFqGOh+38y/bTqBaWPcTRsIFSJTXzBn82BKPshKhA
	 EGtadEOTET5KycAtscWMDcF/GUXo2T1L1Lyt2lfhT7M3A4fOs5H0xSSzVmQy5mV5qH
	 LThxQrPitb8hAKurJ7cmPaHLa/q0Vl7w1qD5RwwZmhlgA+VSwIEjCZAysAKD65jYw3
	 /1cGMtPianpIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-10-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-10-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:52 +0000
Message-Id: <20260802173152.DB75C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Some recent models come with an ambient light sensor (ALS). On these
> models, their EC will automatically set the keyboard backlight to an
> appropriate brightness when the effective "hardware brightness" is 3.
> "Hardware brightness" can't be perfectly mapped to an LED classdev
> brightness, but the EC does use this predefined brightness value to
> represent auto mode.
>=20
> Currently, the code processing keyboard backlight is coupled with LED
> classdev, making it hard to expose the auto brightness (ALS) mode to the
> userspace.
>=20
> As the first step toward the goal, decouple hardware brightness from LED
> classdev brightness, and update comments about corresponding backlight
> modes.
>=20
> Since upcoming changes will heavily rely on kbd_bl.last_hw_brightness,
> also convert it into an atomic_t to prevent potential race conditions.
>=20
> To minimalize the diff set in upcoming changes, a trivial refactor
> also converts the initialization path into another equivalent form.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D10

