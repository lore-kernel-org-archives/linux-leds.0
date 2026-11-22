Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367578;
	b=f/idFiH10wRdLBhRq289Gq1DmRPs68UwCekBdUyXjNuyENoOPvA92YZlwZ6eWduj03Zv
	 NXdENATp8cw3XPq0xhTrMbglnhAbp4IJIO7/8E4Lz1nowYn5g/20dBAtdEwDXIe2VUxZc
	 xZpv8fzIKa3NR+sTikVFIRhEDVGoxtMezJ0/yWzZm6bk04drkii5HWeWTxIO8lHEg2EHy
	 0nCtYPESbwGjRvoZ0b52bYaNR7vZQXNoiWfk01kJHC9glnCWErmI2PsmBKObETpHeT7gw
	 vfIVDCpy1ChF5LEjKwhvyH/DsQupn90ePSTcSMpUhZLzUOC0xZnCsgBEyLPqin5xWxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367578;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IORnO1hd/mnHKJmnQWRw7c/upoPlgP/5GSuO0bj6nh0=;
	b=wlyjErDVuMnDzr2VIIdhHwq8v5oGHS1GaVA7ArjVjxSTsJHArmwPX0H9M6K3qBODpjME
	 tJ2rHLnB2INLL8PTw+8d+wtQGoi8U/krpGN2Dx4sVn653+47FEcrE++dKKqAGBgqSdfA4
	 h7SIfWmw+y+5m9zcgGQcJSbsjqjcuuPrEfJS83wbnUzwlsGbZqOx4rZBHXChpeA8vOD0V
	 fcA3V5YpOFRF1P+MxEYgsELkbk3yPAak5PfUCl+DK7urSgq7Q6CXuEnjOVqQlBS39SOWp
	 eUCl7vv36JZ/dQvI4cyIvgTxGkehrgtrTV9e1zqZ9CkCHBXhye+vcPe4o0omSxaQIgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EP21BpHF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA94606A320
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EP21BpHF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760441F000CA;
	Sun, 22 Nov 2026 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367577;
	bh=IORnO1hd/mnHKJmnQWRw7c/upoPlgP/5GSuO0bj6nh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EP21BpHFAKV1qs3tG6d1RdKtfqoler7VOElXgpS0eYRgkAwi2JpqgqCEd9ZDzubGa
	 R1w1mBr5u4EEMlhq6SB0XKp/bvYiGN077RdL245ZUJrS5UcTjQzwhY57GC42cNgg8W
	 +gdysYymyv/CcRg5eIq0Q9fgyiGyup5HmTlO/nCNYUgjxeHdPqwqNpVVFB46uXyj6r
	 omH0bJVgzCrqPeXIHJwi8sGIEeKTqiEMqUb/X6UkwsRYDZoP0YSVN2D0J5vQDvcb4S
	 2sFrtm52blQLcTqCa/fF2hXH99NdZM2yfTXgVv1JOmQy9YUNmVHphUY+0W2Vnk0puC
	 AYLqbdZJ/So8A==
Message-ID: <sashiko-outbox-228124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: leds-mc13783: enable driver for deferred
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Kurz" <akurz@blala.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122170615.31710-3-akurz@blala.de>
References: <20261122170615.31710-1-akurz@blala.de>
 <20261122170615.31710-3-akurz@blala.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 17:12:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] leds: mc13783: commit subject does not follow subsystem
  convention
--

commit b8ac1cfe2fa4a0a99d769fe01464d2b424da4bcd
Author: Alexander Kurz <akurz@blala.de>

leds: leds-mc13783: enable driver for deferred probe

This commit replaces module_platform_driver_probe() with
module_platform_driver() and drops the __init annotations on
mc13xxx_led_probe() and mc13xxx_led_probe_dt() so the mc13xxx-led driver
can defer probing until the parent MFD device is registered.

> leds: leds-mc13783: enable driver for deferred probe

[Severity: Low]
This isn't a bug, but LEDs subsystem commit subjects follow the form
"leds: <driver>: <Capitalized description>", so this should drop the
redundant "leds-" prefix and capitalize "Enable" (for example,
"leds: mc13783: Enable driver for deferred probe").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122170615.3171=
0-1-akurz@blala.de?part=3D2
