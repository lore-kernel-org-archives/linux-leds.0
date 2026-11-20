Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133594;
	b=ScqupQ5c+Elvbf3EyCVNqTrDtky3nMnCEYJKYDj8w80pOjdyHF7y+cgs11IZQ/PPtEPt
	 Wez3GgfXTXBQEPaZPlqNA/t7byUF7oAS73Elxc4noHTBjlVhfVZh/fMgbsjALe2koPa0Z
	 Qsj5S20+G6cuQLz5C/JYKb+nb12jyi9JuylKQgIX30GlOs5lx6ky+/mBIxe/7Kfo/g+W8
	 23UEHL6RaWm+/acrmrIeKtPYDZNqppaytWKBEBBuiRoDXYIZ0Skn1klJu/JiebYwaD8zE
	 My2Id2WnLpxkU+RgiyuTq8j3UEQ0GZpcxBNd64IHg4c1FERHmN9hyrl1oAM+bcKX/6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AxMyH+uOODgoHBtGymwL/7s8BJES8He66Au5m7MBhzg=;
	b=A0HwTDEfXyqliftPaFtUNm9lrhJoT8iDScZSOGq3plDP1IuOTxCRV69gsN09L0ulrBl6
	 ekdWsXjKnvft9/LgnL0UKfgysWlYdUKGU3SBVDvw/GHTtgehB/np5QH50IGCc3bJUbhfh
	 ylL5AZa50hFnl6epMW37buZ9ZDpypLaCW9/yzboflrxt0IYKyCHjD88Wzv2B5y4h+jYMz
	 HvxEg00muFSTlq7+5xysZ8ywKTixl0aHuAYM73rrUf34pCDOg+FbUk1kMKG3jOCnOSEim
	 9sfYRdF+IOZqKqg11W8uWyRYru04wUO/9kU7EC++nPccINEUu3aPTalOwAEhoGGEDCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tn2cMBdB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05922606A320
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tn2cMBdB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7779E1F000ED;
	Fri, 20 Nov 2026 00:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133593;
	bh=AxMyH+uOODgoHBtGymwL/7s8BJES8He66Au5m7MBhzg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tn2cMBdB9o3gO8b3rYkGaiKsZO+jRtZYR1XaEjCKSQvIjw1M896HwOtcdo1MdNtRN
	 mtE/wYGJsGLrwPvC1mNB2Wj9TL9KXMnfCjPxNlOyhRRjZFqCT5jnKtoHqyLWKvZEx6
	 hu16WIggFLXMKaV3V9ClBeWP+uSy5I7PoSXWxcn9L6bEEJ3/DKeXctFhz3qXlBwoI4
	 Dd+CP4dPO4xBVBGtfze0l/ULE9snFUm2gj68A05a9df3rEYuY1ZvKAij9PMIlno8vA
	 JU2x6XOnMwUWKYrX/DIvddkK4vhtVnAQ2+EWheU8/zME6ledQyXct7LiYD0zsxInXX
	 eDQyiTKIpwc9Q==
Message-ID: <sashiko-outbox-224259@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/11] leds: rgb: ktd202x: Limit the LED current to
 led-max-microamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-9-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-9-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:13:13 +0000
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
> The full brightness of 192 is 24 mA, which is more than many indicator
> LEDs are made for, and a channel may drive several LEDs in parallel. The
> GL.iNet GL-SFT1200 firmware, for example, runs each of its two channels,
> three LEDs each, at 1.375 mA.
>=20
> Honor the common led-max-microamp property for single color LEDs by
> lowering max_brightness, since each brightness step adds 0.125 mA. Set
> max_brightness before the LED is registered, and blink at max_brightness
> rather than at the chip maximum.
>=20
> Multicolor LEDs are left as they are: the LED core already bounds each
> color intensity, and the hardware this was tested on has none.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D9

