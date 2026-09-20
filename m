Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F33C5DC5
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934255; cv=none; b=P5UQDWfcjCYfQfIcQbvBRfwxkO1yrubLhQqC6tjmNGNzZu4bA02p+/yevHZ9wsCYveD1XxtIFPMbW324i3XXFfjXgutli5JwoXU7MUiXF7TQu535ntyZ+lUBZw7iiiGqK96j8noFqJt8p0xmnr1X1mBSJBfD+hTY+d00ag5Jjs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934255; c=relaxed/simple;
	bh=fDcIbOiw43ZPka9B/GZLip0Cx6N8OvE8iKRpFBmmIXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=us5Ws0zBEi/y01kc5qMjFEzfweJ1no+Ya9Cv0S2XkOtCQNURW9MJDxHLZIiTcOd97jzpJ8sTgSQH/DRYpsjR1GOz+KLkCpb5qLAugVFylOcapZ+2WRIm8lSX042MymEl7T0uGoF264aSg3nXm+7CzLEBuywQju3UUdQs/fWXWfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBQ+GjJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBQ+GjJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F29C1F000FF;
	Sun, 20 Sep 2026 19:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934253;
	bh=w2J8VPJycTZbQEGDe0vqtJarr4r/XEcjZiBlo0i/Orc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lBQ+GjJypBKoHoGxJv7PVsN7k4DSn8I641YzRAW2NnFldCIrn41MFZEHwjRbOUIP3
	 dkbMoojUCJI6L+H+bWEq8iPokOikfGxVwmF8hsCNP71Q7jLDGw/ldizPYp0bxzzeu9
	 8d4xOVnqlt7s2427Wwhc1rwGqFzajuJtgp1274kjEdwGpqHWtspVu8XvlZVga+51N4
	 HcA4RGmoOPwvLBQJHLIuCwFOW9SEAtppTuUnnXmc1suvebdqAF55I5yAhAfTudzprm
	 AcDRHbAG5Rxglt39sc/QD8orkzIsnUBpl6/Vj7HqE2+Knd28y5Rmnr+yAvRyaTe1yU
	 Ws021qFmscbRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/13] leds: class: Remove hardware control trigger
 when writing brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-3-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-3-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:32 +0000
Message-Id: <20260920195733.4F29C1F000FF@smtp.kernel.org>
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
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D3

