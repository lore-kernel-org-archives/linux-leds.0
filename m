Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6053FD57;
	Tue, 22 Sep 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089130; cv=none; b=uoGl0L8C7ePDdZZkMvCBKl6vG6ukvEsOpOVx63AEipFPOxgajVD+jzopg6s33Xn/E5OjnqOgdR5zJcBReI5v1O6DO9MGY4Wvkf6DPJOdh4yjjlSs74us8rWUnclicrMOcHkAVLh+ofvLbvhxuAHzUGeXeggAeoPSSRGWnvjZ4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089130; c=relaxed/simple;
	bh=MgAiMu9+hjZJnocYgb89+AYgKEIfWEvUg1whhScKB68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gaWp9F91PE4WmQORtjAJBETwYQ1QTQXqRi3txuCZHlL+ux8IOfeKpd3YK/UoGTflUp3qNX/P90CbIlBWL8+0LxWt/w7rbgSlKuHUf4c5gy7fNhUI0OrQXU9A1jcBUYXMWCgEoiNC7noumLJe53aD9IEyago30wmBPPiTJ20TdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTqOWuF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTqOWuF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF101F00893;
	Tue, 22 Sep 2026 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089129;
	bh=MgAiMu9+hjZJnocYgb89+AYgKEIfWEvUg1whhScKB68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MTqOWuF950ibEdZZI21PmbpPxlnwUpS22xlbxH1gDeHPhr+qG5Tz05bSc5UzsatUY
	 sruB5PhdhxpBIVJwUVputm325K0CCiKAi6/LgLPAJ/zBxomDEs2zo9G2MTfEaYq7wB
	 GN4G7HlwIFGsUsODid9omajbHCrK07kKMYfkEzkocZK/pmQk48QvByviJmBNVGZ02p
	 MqgxJmBVUkjV+eXU1WDETy5Av9IF2NJZofTuRk0nfQVItJI249724IoHT9L4v3+1Qn
	 zaXILB5FxXcmCqZfSq9p6268EgebdGBb85mMwCQ0B0VThpIGv3f1/u7QPfbOHBq/A8
	 QsvHAQADEDAQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/10] leds: pca995x: Do not use full on LED mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <d1bf0a482f09297b9d166d40f7602c3c93459171.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <d1bf0a482f09297b9d166d40f7602c3c93459171.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:58:48 +0000
Message-Id: <20260922145848.9AF101F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> LEDs in full on mode are unaffected by group dimming. Avoid using it,
> so group dimming is applied consistently.
>=20
> This slightly changes the brightness at maximum (from 100% to 255/256
> duty cycle), which should be imperceptible; arguably it is also more
> consistent with the other brightness levels, as it will now scale
> linearly from 0/256 to 255/256 over the whole range.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D9

