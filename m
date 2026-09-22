Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349513161A2;
	Tue, 22 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089218; cv=none; b=X+ybFS+pPgObZ0VTwdDGZCD+HMKaToxCH1M0DsNBkTZbuiC9/r8eMTF1MsYiEf7j/2zc5nqeejDb8mG7yOQlzRjQ6fbuO5n9KdWiXGfgEQ9aWhScTskWtR3D3gdLlSI7wjKM5XbJmTwrDYySkkpPhlPXUBu8lYPYx046QUSpuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089218; c=relaxed/simple;
	bh=MouncWN2b+cp9Ivr6MycaEjyiKdiwjW++L9yXgm7KpQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hxHI17n4Tl0CprZdAaQJmwK5LURb/8fNIF/bsvhyVePph4jFtqBVmqGiwOUDIgEXygE2i4A3u836o9TMfHOOl8APqnioRi3W3nRtk7dHTuBjaJDb26n3eZiOlBCURznDZobUSY+U43G/V4T4kWpIZAUK8sCdl9ZcRmBS79fr38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar+jFe1g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar+jFe1g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BE21F00893;
	Tue, 22 Sep 2026 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089216;
	bh=MouncWN2b+cp9Ivr6MycaEjyiKdiwjW++L9yXgm7KpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ar+jFe1glASjvDKalLyPtrGn40v4k9fQGcVTgSgVMlsD2505pGvxZ7Sm2ltapRNB0
	 cYs+aIMuToyRnaKl5xpNxNuE5DlTURwxxwZDejIGxjuXzeVAEWGI7Zfb7ZZcvuWCFB
	 9OalEhDsazMZJb+kQ88ZjrdTlUByorC4EiMdywfqAKl4/1JZvpq/DpQUQPQ6Qjk9Y6
	 Wlw8Ka3P1Aiqu9IalauPS9Ho+23bDFthVUfshi46EX1g5tVJRHQVRB8uoYwqx56CJn
	 +1kV+e4wgAAxkqpuFH2ANKoqbls+68WhrwAGH5F+urQOUMlMftZ8pkfes2OIeiySGb
	 i5omARbUSX05A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/10] leds: pca995x: Add support for group
 brightness control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <391973ce0168438612861bfe8570b6890af0f44e.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <391973ce0168438612861bfe8570b6890af0f44e.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 15:00:15 +0000
Message-Id: <20260922150016.44BE21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> When LEDs are set to PWM mode with group control enabled, their
> brightness can control using a global "group PWM" setting, modulating
> the individual LEDs' brightness with a second PWM running at a different
> frequency. This lowers the minimum duty cycle from 1/256 to 1/65536
> (averaged over the modulated signal). Group brightness control is
> particularly useful to adjust for different levels of ambient light.
>=20
> For simplicity, group PWM mode is always enabled, with the reset default
> of 255 as group brightness. This reduces the effective duty cycle by
> 1/256 at all individual brightness levels (the individual PWM signals
> are modulated with the 255/256 duty cycle group PWM), which should be
> imperceptible.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D10

