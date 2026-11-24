Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506473;
	b=MLBSnWxtX9OX8esdq0+z9pyBgixwq2h8cuKVvho1BE+aHKrLWHCt5Xjz8+W4KafU5mpA
	 Oce5oF1M6LTbM+L/ax7+YZ0gVj2+xyXphbZay3YSrQXF54mQGaI30AQUn2sDbd3p6HixO
	 oBgvIiCGi/AU8DwwDU7EbvSD66/u/WyohQe5Vohsc8tDu05gl7X+Bt5+LfxjI5GSlkzrc
	 hpY4mqqLo+BXKXxag8CmXHuxtGnCjN4++rvTUhI568ByqFQDz652m0X6S5W9RjgVWIyjC
	 rf8GBpe0ywgiVrUTEgu30nD+kPJh+q7lbM9hZU3IXe+2umlnG1qeWI//aFE4L4kXhzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506473;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Opb1OVIShkw+D6CD5QzKTIBLPCWVm02nLoRZroW026k=;
	b=j52lchLrRwVX1vobnc/Hq5qeNe6h/O1lEODIeGVeSsy6Kf0DuznyF0pFz+2B1ohBq+6W
	 LKei1Oo+UZIGNdTaC1s9Qu+QsTs3OcxDns89oZ+5ucCn48qv2neH58nkf827BXFk9KgPx
	 zcqpTxKOCIrecDvbQWaOUpKr1pFI3ZX4oCDyfCD1AnxEeLBQkGZsLai81et3taq4mlUlp
	 Sj28PZW0YNFJXktHoMFWAG6JDuwRt+6BRktXoMKjX/xrFX16azMjgQywaajnOYJik38oM
	 RtHlvSB7MVW/kfYCCYiWgudGOEw8WIUaHN/NFZe3CBkySuv40496A5KVoF8WID9wEDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J7PAttrU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC2606A31E
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J7PAttrU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01481F000CA;
	Tue, 24 Nov 2026 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506472;
	bh=Opb1OVIShkw+D6CD5QzKTIBLPCWVm02nLoRZroW026k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J7PAttrUdnnm5ar8N93Nw9pNYfSOKXnUNr8JODO8kQvr65QjQ61t2wvjZzq/fBL3t
	 SY0jSSbKT/Lc0SxxkHF7+rSbLu6uLIsjaSCPPE/kyiShsg7iaVxx4Sj8hbCvss8Vok
	 +KWD+takMwqtL7sVWdS8OQeM+Cf4yRDex27e2eupjirlHAKi0/o+Rm2XAtkzL8w+sI
	 V/l88j7I12rqbRYFjwqqD8PhCHUDki0CQQABv4CWSxh0S8A6IC/hCksszQAJwIfMfY
	 gIzHK9VlS+thBM4q56RMTkvbi5XtmxpkGJ4Df3tvlMXVUSfsaqmybpz0NInMnIrFOf
	 YEl6AoVBG4j0w==
Message-ID: <sashiko-outbox-230673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 00/20] ARM: omap3: pandora: Modernize audio and
 backlight to use Device Tree to finally remove pdata-quirks
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 07:47:52 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 20-patch series:

- Patches 1, 3-5, 8, 10, 12, 13, 15, 19, and 20: no issues found.
- Patch 2 ("gpio: twl4030: Support REGEN GPIO"): 2 potential issues (1
  High, 1 Medium)
- Patch 6 ("dt-bindings: sound: Document OpenPandora sound card"): 3
  potential issues (1 Medium, 2 Low)
- Patch 7 ("ASoC: ti: omap3pandora: Convert sound card to DT"): 8
  potential issues (2 High, 4 Medium, 2 Low)
- Patch 9 ("pwm: twl: Support 64-cycle PWM frame"): 1 potential issue (1
  High)
- Patch 11 ("backlight: pwm: Support enable guard period"): 4 potential
  issues (3 Medium, 1 Low)
- Patch 14 ("ARM: dts: omap3-pandora: Model LCD power enable depe..."):
  4 potential issues (1 High, 3 Low)
- Patch 16 ("ARM: dts: omap3pandora: Describe PCM1773"): 1 potential
  issue (1 Low)
- Patch 17 ("ARM: dts: omap3pandora: Describe sound card"): 3 potential
  issues (2 Medium, 1 Low)
- Patch 18 ("ARM: dts: omap3pandora: Switch backlight to PWM"): 3
  potential issues (1 High, 1 Medium, 1 Low)

Detailed reviews have been sent as separate replies to patches 2, 6, 7,
9, 11, 14, and 16-18.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795505160.gi=
t.hns@goldelico.com
