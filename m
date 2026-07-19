Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08523AC0D7
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481192; cv=none; b=j7fEZWaGWAG5FmR8tLxQa2l7jWuLe4x1FsytWf0dH5EhFgxKBARl/cn8Xd1p7VaKJuyrSRjLfuoFoBPCLBm/YFwx1VQwx9bh6oBlaBTZy1jf6w2LJmeFIvANIJQsrKuCrtq9g1uMCsps7WLx/b1740XwbSS1LK+ZTdPKwJm90LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481192; c=relaxed/simple;
	bh=nywoeAQ+L4xolmqclxbaD8ZuwhEzfyZkuswFwYe/i/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CjcLneBzMw+s/RTiJDaQ2t7ivJYYlV2B/2gyq+Wgx1FawMDkL2CwPf7hfBI3SIgBtgueonxS/SUCpI5q18WytF9wsxyMvdAIf0QK2D1Vsu3eGd9YIU/Ivy0z1z9Ozxe0AoigPj45xo1hb2H2Nkkyn2MFLTHv97GhbNGtGlmcwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vnzx6U6D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vnzx6U6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8A71F00A3F;
	Sun, 19 Jul 2026 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481188;
	bh=GdNyBmuO4goAe9d3JMo7IhTc3/6X2AeY/jyBaeyXM+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vnzx6U6DjKehG8N974KqRR/OQhg1+4rDBba4330fiLQSqqng9EUp1B0heIif7crj+
	 uY2rOObk6wwIFJb1F2wrVv59rtbCJe49gM1jC443jgOnSMtYlAQ9mxI7rzwA0vyE1z
	 inJ07dbtm0XOsmOoIT/JKuavPSJ0CV8V0v83pe6twf2QmhwZpMy01alzRUJrajO7MQ
	 asBKRSf2Jljc853Ci06BdxJ3MrqdxNkzLDDNbKXiaqsYTR3g6ZbgMebB6XhghvRuaj
	 cSExuR9Wi/CYOuNQGbmSFwj/SEQKtWo8chEdmeVEUShonl59csBuhQv2ftTmPUVync
	 burwlDm3evoYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 02/11] leds: class: Remove hardware control
 trigger when writing brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-2-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-2-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:07 +0000
Message-Id: <20260719171307.BE8A71F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Since commit b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of
> hardware controlled LED"), the brightness attribute becomes write-only
> when the LED is controlled fully by the hardware. A write-only attribute
> is very confusing.
>=20
> Moreover, most LED drivers set hardware brightness innocently with the
> side effect of disabling hardware control, but the hardware control
> trigger remains active, resulting in the software and hardware being out
> of sync.
>=20
> Fix it by removing the hardware control trigger when writing the
> brightness attribute.
>=20
> This should also match the semantics of hardware control:
>=20
>     When the LED is in hw control, no software blink is possible and
>     doing so will effectively disable hw control.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D2

