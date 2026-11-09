Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251935;
	b=oX08TkiFb+zhfpwmN7J2V5V2gOCBp47Sm0lGiqRAA3iJdlXluhW20PYHTtxVbNIKuylq
	 Wjm4zXQ4+hcQlbr5cPMEOCVi4Cj0A3BeTqrj0dcdSUErHJvPTgd65pNb1qIhnOSVHPlK7
	 yMUsaoAhzOYDpIxCWYyXivbbjaGpCIlrvVq1w7YJj2Tc3KP6NRuF+saqQ0X1uVolNqOYW
	 C/Cq9C0c8mLUUnYno4bBeao0VInbK/WoFEo0RYQ5J7JeOA/DeBRgYLIsjE297tHeLtAsh
	 qfmnO04YDZSwtiUD0Vm8Qaq7zZpCFPWNEDb70Wuz0ImY3sAPSjjSFzwUgPeyM0nBPQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IF+XFGWsqzj6JHeuhfwxpfA5x1DNMucwn9YaQeIeFgA=;
	b=q6OrsM7yw0Wl39jt1w/qOW/hd5s2yiT2sUK7PbgCMArFEqacBbBmLuABYZmBTSehgW/K
	 xX7Mf5Qtx4xEBCkAYDlMFV5CtccJsEwEa0u49j2W53yRe/v8MEMfYhSTAyBSrwcaTqS6j
	 4AsjmXLf2Zy+skej7DWZDmY70UJaWNHOAJnolWynSqR1HWaPVnBLmSSah9XBM7Lg39lw5
	 VwH5dc04DZpIKLhVWLHZr0TLDjiJY02ko+QmSJJwJL8IqNCv0XMjdRXx0JG/TJsAS8kxw
	 u9qwsAtO1adrP3whptlgxseeFmwSnT0qoW1+FKsHtuRat5vizWfj14cRUCp4KhB6x5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZDuRkSk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7253606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZDuRkSk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9961F008A1;
	Mon,  9 Nov 2026 19:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251934;
	bh=IF+XFGWsqzj6JHeuhfwxpfA5x1DNMucwn9YaQeIeFgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mZDuRkSkrpfs/PHtoCJKIfO/yoWveYCt28MzGOzldBe4qhFtE1lsSN2JFTAbnDTj1
	 Qs+C+Fc+AKwNR7glzIt+8YE3uACxLE5SHX9o/VJUyU17Ujat+M+xbVMm6FcJnmB7zp
	 eR62UpmU286m6+x8ldK514RHIyH6hoiFeEJCk8v8Y156KDyb2EcDUueJETjVpCWJfN
	 4TX+ElbSrqXQS4oek/7IihfY2AH6GM5yxZyuih5qE68PBvELnQn9QlNJq8pg5cYv0s
	 SHg82uz+GH0+UcbzZ1Hr5Pzd/LvdurEIkWNBzQhS/vuLBOPxoYb8kt5J4c4UHQrIFw
	 j1ap9yb0Vzgwg==
Message-ID: <sashiko-outbox-205476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] leds: rgb: ktd202x: Add hardware pattern
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-8-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-8-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:18:52 +0000
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
> The KTD202x and the ET6326 can ramp the LED current up and down on
> their own: the flash timer that already does blink_set also has rise
> and fall times of up to 1.92 s. Without them, a breathing light needs
> the software pattern trigger, which is an I2C write every 50 ms.
>=20
> Implement pattern_set and pattern_clear for the pattern trigger's
> hw_pattern. A pattern is the one breathing cycle the hardware has,
> "0 rise brightness high brightness fall 0 low", which the software
> pattern trigger plays as the same breath, repeated forever.
>=20
> blink_set now clears the ramp times, so a blink after a pattern stays
> sharp.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D8

