Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208569;
	b=GAzjOqVUA70sLRxInLkqvnugg2bntnPrZqV4ZQCstJHbhtWNWQL8v5rvxydN6y80SkyT
	 mER0BiiOi3Ek8TMZozOivepsEU55hb6ikdNvcXvrjv50tFw63amTryT5n/ZkQs2q7V8z3
	 AMoGh+k4VtMg0W5zq4XNsU385NelYyF6S+/e3k5cpYlg6oXkeCNFxcbOS2XlrleDD0ZlR
	 kNorjD8+9MiHgaXIPLsaQmbDWMAzXFYhgHIDma+MPtnZfO2thOsG/sWzU/WQ67646MCTT
	 NVhdTXuB2JHGPAgsJUW7X0QMqIVipurLq24jQj3RJbF5QZnQOurzTDVwnyy1CSRkyCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208569;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d3oFqklWPZAbyDpryRyoSJWW++TvhaDPDsAvNMGhd1I=;
	b=RMSathwyqon+oW1eRVyljxE0hmRMssA5Nt6OXgjquIivCleoG+Hnwe6lpxRqOx3o0Sc/
	 aTpFQ0YfmAVnsm8uqwyuSm2csnzsuESjreKDwFqPgYaKWBI7+4zlTlM6MrQAI97Z3T5OW
	 IHHOhmSPZd0u0ZwZ281wpySSb+pIBTiSXwp75Qn9dRUoqbA6/lY4P9rS1NmAoc0+vv7jM
	 MNily2g8E+c1JLaapB1HUDi+GlS52WxrbyF5H4tpc/zsPwhJ28pEWB8wS3jlxAqofvNHW
	 ypNvFfI5NNA/x4rOsejeW8n1W1OFR8zb5RgkLi8DHvlqfshhnRBn9sRKPwillQrkfkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHRA5YVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA64606A6B4
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHRA5YVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1241F000CF;
	Fri, 20 Nov 2026 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795208568;
	bh=d3oFqklWPZAbyDpryRyoSJWW++TvhaDPDsAvNMGhd1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RHRA5YVXIIdIfXV1llplSpLikBINgZGUfSoC7V02d+jhewZSgCpWMuXWwTCvjYCES
	 +XwlkigdPpJs54H7pgsz84ogZ5U9rw/tVKFsa3AFSJS4NIc+djUVG87QhRi/BHK25e
	 pvo7C62K4xOiXr2vXSRbkb5fXDHZh8MS88qa0TV+yUJQUT3EjMrvj1AQ2XzXwP8Zb1
	 Me5BJRconCh3m/UrJnr+6aKnMXoHetJXh+vH9DgGkd9ovXuNbNJU3PjXYQHgwY8aCk
	 d8uYoO/ngD36c+m1Rnq0WUeYe2Zevhk6Dp1Q/Gc8iEnuAD72ox/qoLn467Q5QPf/oe
	 rPm4H1BnuUwdA==
Message-ID: <sashiko-outbox-226119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 00/10] leds: class: Support custom sysfs groups on
 multicolor and flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120204246.6645-1-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:02:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 10-patch series:

- Patches 1-3 and 5-9: no issues found.
- Patch 4 ("leds: class: Create "brightness_hw_changed" attribut..."): 1
  potential issue (1 Low)
- Patch 10 ("leds: multicolor: Adjust maximum subled intensity du..."):
  1 potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 4 and 10.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120204246.6645=
-1-W_Armin@gmx.de
