Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6F5318EC7;
	Tue,  6 Oct 2026 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258538; cv=none; b=ZV96oztCdWvzggGwZP9EjBv+aTG5HhTJURhXIMBwi90NMmt4gW7Wj1OHkeQrVNGPz8W+z2AD8Cy/vlzbrGxVS2H6kEBqnp5ieDeN1SO3s8rxYWZeB+wA9i76NYcALqNq0gdO6Nz4gyc7mDLuMVfldl/QB4VpMU2Rfdx09MilHCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258538; c=relaxed/simple;
	bh=/RnbMAT4NIvZhw9t0pyOZnn/KQTDQtNZ0Y3VzQNzZgM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Op9rppMp1V1QzLCQCrmB9Dq+M9X23rQRP1Lw2AZNLGO6hj26KEF27OvPF/g3Zg2zsg1xoLdu7M0NB6nVZxFj0e99MEowAx4QoPmxex5f5NPgvTyWB/jILPSIJZuBcHlL4i36+U5PifVCX2W/FM/NcbEEawudrfUuxyJPi6M+FAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnaVS3jR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnaVS3jR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBB11F000FF;
	Tue,  6 Oct 2026 03:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791258536;
	bh=/RnbMAT4NIvZhw9t0pyOZnn/KQTDQtNZ0Y3VzQNzZgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DnaVS3jR5JE3Fz2G7NHF9L2rrzQwqyehLsTvRuQbxN9NEihAbRHZOTQDLaJvaNQIp
	 zk5tuk9Zcqncq08ve71KQ0EHUlEyEyZgvZhpjil+dtwHrpGsxBCOgLM8NepgAbISbV
	 c/Oh80JozXd3stXtGm1E5MRagHSuJ/5CBePOJOXd6k5bBaVQiTJSeNU1D6EBP6y1oj
	 kx5XsiNYKWk3l8PMSq5bW57612HUDFbDFzMKG5u4TTfIGETSkmuwc9XbyMC9AALLS7
	 ZXNySvXOHqtB1pZy2Nj+M5KmE8G1VUqnswTln0lb8x0II4ghfpfNn2T9+UavcR+KTW
	 e3+eY5w7h+psQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-1-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-1-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 03:48:55 +0000
Message-Id: <20261006034856.3CBB11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Very similar chip from the same family to be added
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D1

