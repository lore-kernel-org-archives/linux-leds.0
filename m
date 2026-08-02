Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D8B22FDE6
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691908; cv=none; b=Syi9oPpPMGwrwV4t9MMb9d0AcsysGkKU9Zq2bQR5UplF/aRBnX/A1tPE84Lq/UER2c1GszEpg1CzznHiQhfxsWru1dDLNW7P3nzxechTt9FwIZ8sItppVQKyqgDpdwMvNpiqAvIu2mdyRO2mBzw+jvLjWwQUVzaes7oXO8qxtJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691908; c=relaxed/simple;
	bh=JPDYyEkLX4O2x3vMsqlxGSxn+yK0ha+O1t1lh+dQDFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCIN8N/K/Hha7iLVS+5vf0oNim2kQksypBMktwRahx3lEh56ZY/qbwaFVhF/5MhJTStZwWBOCxkKw7XYuVjGS1PBy6j+vZXdSllv52INEJVbDoPI5O0/sQnu/h1Y7oBQ690MrTu1j1n4EMFo9K2LVwsufsbKaByK6ZU2mH6WGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqkIIATp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqkIIATp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE471F00A3D;
	Sun,  2 Aug 2026 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691907;
	bh=iFHuaYkq9C/C/0eZDCxMqWfO7xEp5clJxYN6GKYPbrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GqkIIATp2ZhYtAIuGHF6+qkgEUyyN2MakCWtlWt1ToBmE6hGCZ5OBVbBeEVCY6F7w
	 2mKySIwjwCZHygUVe8WYxcwWs7kk497fMofvySgb1qLPTs4a6JCSxtUOAZcAsHnDCT
	 vEkShkJUfw/Kj86pboJmEe+AtTKXQbahGuQgDnOPK3BJyvgjHdEW0i6caaWyeSILLD
	 t6i3pasP0jYZe2Eq7BhwkbikjE2FTAdUwhWcTSNe/NHfUdyt9ivpb3BMTCN023OlV3
	 T7gC+sR9lkNmDodkU2J5DF/EcVe/RuLb+nK+tfgLlpSkqInA/3ELFTeLcnhXBhefzC
	 ci8WKom4GHpug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/12] leds: class: Remove hardware control trigger
 when writing brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-2-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-2-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:46 +0000
Message-Id: <20260802173146.DDE471F00A3D@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D2

