Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133406;
	b=VBT7EpiITMTtl8DN3jPO/2XpsZWNj4SGK7Fyz3OzjQtt1hHsrgPY+IXnqTTZs048rXF+
	 /uc8ipDS6wXHRVl3jeyGHoZgb00f2EbGVue0Gh0jaS9bVfDUPQX9cyFp0AeULY/DXQ+eM
	 quSIOSqahxmZ2q+G4JMEOIEaQFNs+QrR+Irp5YI3yBjLIbUeOQtQgZ3ztemIo8jtxkjPG
	 Y0raRndkh9/uRL5oI+57yCMgeYJZbgLFl5UqbJq60DDSoZlf/GBH65AnoVy+DBFfW92LB
	 FyZj+RRZNwvHPBJisNYoBsKs6dn3eJB9b7hHeS84bjwGRbG1QDFJwR4w6WcqYBWxSdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133406;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i+vlCfIa9pm69BZK8EDwVkYbyYPh0rrJPNvQdA1HmeQ=;
	b=vZRRZeI/O1TAl7AhnN4VRIDkyX2ckZZuVlFgF1592RWmVCflcWNb+Z2I+8LSKoYaPFNb
	 GJKlYur3zyeKiSGOpyuAyYKZyz2sF4p2azgsgm0UHq6h28MfTTRZadrCAuX8iNXFyCntZ
	 oIgruh9tWTu8oNSayasfRASroBQYbevkfVL1yTBL/ry1P9wxzW/40iee++gBvij6awdGO
	 FjCifqvqu+zKxDTpuk9r2QzulIZBk34jyxFI+TYU5Ng1F4RAR3jNNWDIHv6iN346w318f
	 2lsB74iHyAa4JQtnNFftYdWoF9ITkKJG3MzfIH/aIQTk+z+wrX4+i+KA/79nBGOIHNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsN5KZXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866760A2615
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsN5KZXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCA51F000C6;
	Fri, 20 Nov 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133406;
	bh=i+vlCfIa9pm69BZK8EDwVkYbyYPh0rrJPNvQdA1HmeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WsN5KZXOnJ1iDuJQ8GSAS7+615CRkTDs5ynFyNgdXuZlkEns3fCVahhrwn91/wRVa
	 fBhGuaSxTmX9KvwIZQ65OGo0fDLSVgs8xKVLH6R3PmtOgxdoQxJ2LSLAjguEenVerR
	 PIDoPxSvHDE/stYSvPMDZSR+VfL0ZhifsoySp1LBSHEO+3Bw91BqNo7N1mFBX+dBsD
	 20L0ftIyGOW31xxVYH0Axk3OYAf02D6+Tu2JL6Nh0miGosdgf6rM5EzCRtsVnMBkPA
	 c69qMgt15OWkBlQWqlMqPGXZWJHrohf99DHtRtfR0Dh2E1btSKBdE1cAZaDyLLziLo
	 0QuZ7yrJTJ1Cw==
Message-ID: <sashiko-outbox-224244@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/11] leds: rgb: ktd202x: Fix the flash period of
 short blinks on 32 bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-1-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-1-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:10:06 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> When delay_on + delay_off is below 256 ms, the unsigned subtraction of
> KTD202X_FLASH_PERIOD_MIN_MS wraps. On 64 bit the result truncates to -1
> or -2 and gets clamped to the shortest period, but on 32 bit it
> truncates to 33554431 or 33554430 and gets clamped to the longest one,
> so asking for a fast blink gives a blink every 16 seconds.
>=20
> Compare before subtracting.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D1

