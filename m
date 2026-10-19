Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440299;
	b=yAEddePFQzBeTY947tcVvcibvq+NYv4XOTkrerFTzFmKem5LePofmKWHlTIeUjwDAXit
	 JnviuByeQSQ6V43vL3frUJhoBFrn1aI6/ZsyjDIFzP3X+JMPcXI/7KnWoKDKggwAKadPe
	 ck9uLayJnhXg402UyZV7DaBekFuWOXJmUV2AONPB6v83qbrsOggaRIgMxu0RpM2iHyhEs
	 W5R3BesKlzgPHu+x+iTTQrSYlHO+j67qGKmaoxc5fwiiJwmENLU+siazugn+Mj0GqSuUb
	 sMeFvuf6uV8tE5WzwsNTlsuQWL4EHTBiTwoDrMIHflKpTXHKEpHddQ7W2fLcfdg+POw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440299;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=foNZpNRcKHNGDJLa5wQrncPDfbijG8GvgEflNxo6XAY=;
	b=gOfgc6/zU3eaD8ziDvC3M5zjR1fN3SpcbQcKt9Opid5f/8DjnwQiAdEVVE5XnPo12uK9
	 O36xD+qGfO7Uk4iEn97n3Fkle5Y78KGkJWzQ5kxP0ev4e7jcGRHRIxL64oXQ01ocuKL2n
	 gbO8vcr4RtbugD3z61iKSAzoPsyUL0C7zzRPIwD2rE6ahG2qkZmIyqVoeqNfx0aIgHGeS
	 kwBhXh+9xpI4gRb7vSdEHOuOljTOQfnuLplg3gtpyFHSJsCa6lwLrJo2pHxOmENQco0VZ
	 gcN7/O1+6YzWPVYrXbKxVfYWs/Fqlwi7O+KjiTIrjQ9fyohFs78fkYL0cKmmvo5tDGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEr+wWg2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE54606A32C
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEr+wWg2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3094E1F000C5;
	Mon, 19 Oct 2026 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792440298;
	bh=foNZpNRcKHNGDJLa5wQrncPDfbijG8GvgEflNxo6XAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEr+wWg2BLJrMilKLcUp/lHHvowvtDZ8/tlkbsKOCQ4ME4Dp5fi5rtNIzkGnT1mo4
	 yTmLxVDitiWCBzY9hVYJwN7KZ9xyqhXzcK5t7PCv2v5D8y3ntr69CINMIbhxygrQlJ
	 edUZzlVWpdOOKy9aaFjCHl5uHM/IcdqLJgEafWOTCQ+TctAcNhmkoeyXwuomXPw0F0
	 JYjXHf5HCniLFc/sYbOGUpF6eGbve32htXjYfw5uiuqNl0K/olkpc6ornnCpgcriXI
	 skvs445Nx27xdBa7szBTLKLLqyULUSWK3l+eLGGmBWu3Yq/gkUYS9PI1uUOPywQElu
	 uBE6KqNKFAMRw==
Message-ID: <sashiko-outbox-178160@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] leds: add Realtek RTL9300 port LED driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ross Cawston" <ross@r-sc.ca>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018194339.132-4-ross@r-sc.ca>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-4-ross@r-sc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 20:04:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The RTL9300 switch drives up to four LEDs per port over its LED
> interface, serial or scanned. Each normally shows a hardware function
> picked by the LED set of the port, but software can take it over: one
> enable bit per LED, a 3-bit mode per LED (off, on or one of six blink
> rates), kept separately for copper and fibre media, and a load strobe
> after which the LED controller applies the modes.
>=20
> Add a driver for LEDs that boards wire to the switch without a hardware
> function, such as PoE status LEDs. It takes the LEDs listed in the
> device tree under software control, sets both media alike, exposes them
> as LED class devices and hands them back to their hardware function
> when it is removed. The register offsets come from the reg of its node,
> within the switch's syscon register block.
>=20
> Signed-off-by: Ross Cawston <ross@r-sc.ca>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018194339.132-=
1-ross@r-sc.ca?part=3D3

