Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053877;
	b=dNgEDUVQcTTLm2zaxGr6plLTCUb4fIWoSosAeaj8bMKbO7SJ+VlA/JSZUfis/pGKSRIS
	 2joda330iv/KY8fgjRqyWvxoJ6UR2SWe/1WBg9lVVjd+TA8HrKQvo30AsciMi26dWkIG0
	 GckR2Od37BMNWHBx8PY3WqAgxEI866yKQ0Rg/SzDI/55/zxRPLGSqyTtL1DpwueAEPRZ3
	 0t5DbV1Gu5KpSVJuRuvvvKPD/1OhuBdfj1lHdxQ0D6sQPgU0yBTtMCgfIhTk9o+n2mZFQ
	 FyAhjLH3kGPUZPKlIxTg2CF8uO0OvaXXTPlWlImWi/s8dXBWZ9nhv7e9bbl42MaMUtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rCydP6kJxMfI1MDGoxmou0F7skN2Rkgi6insGItJSbM=;
	b=3ewgrqbRFRVtHuYHK49UPPrhHmAgVp5hdTMz58jb/QZ4otwOpnjnXYfBBhmPkSnFfn76
	 nhBt2ZCgEdyv5xkSZiMePvwyTMpIKUBRyG6tx/zERTLswxTYHo9qkSZvfydCDBNb7a/7o
	 mRgIIUFB/NB0Rd3mg1R6igftoWWfZBSo6Vi9WmHQg6r0K39I4QoS9yzrzBUpaiFOg8x8L
	 HxuzPcJKfAEDL8s9/QLeLwgJcQ6cQtQvBcsskOofhOmCikSdo3IVTQ3k4lfXrRxZ8hFZX
	 RLh19h7rGGKqD/wRqe5bGup833V3O0Fd66ABmCJieb4RstLgO86loqVRIzfvM5Xuf3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXKweOx6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB002606A326
	for <linux-leds@vger.kernel.org>; Sat,  7 Nov 2026 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXKweOx6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2561B1F008AB;
	Sat,  7 Nov 2026 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794053876;
	bh=rCydP6kJxMfI1MDGoxmou0F7skN2Rkgi6insGItJSbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XXKweOx60fMARUa1SOih9xKVdzqFBXHR7B4GO9mAOFXRpPjdIZCXaEYNOMO1nlOro
	 7EAxzqGBqhZcFmoaSIX74mqRqBkoMd3CEehUmbQOZyUkbFYTywGA358gAmyJbfR1u6
	 2QlHPSJiyixbLw159be8+VrCO9PvVpOvrtUFt5h5Drf9b6Fvo1vI7QsLLPSHY3gB5m
	 bO2YbHsURmeTJjT5286awN5XqkTS5o5z9K017Mnvl5RYxPbrztGPdtc+bga9Iy4GpC
	 yv5sEXajqZMpF9fnfGxh7j1HtRC3lSQTplFQ8XNt83RmsdaVuwcF5k3UyAIVZD9y0m
	 NQV7WBvWglsyQ==
Message-ID: <sashiko-outbox-202884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: backlight: lm3630a: Add
 led-max-microamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michiel van Beers" <michielvanbeers@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261107-lm3630a-led-max-microamp-v1-1-ec9e441d9b2c@gmail.com>
References: <20261107-lm3630a-led-max-microamp-v1-0-ec9e441d9b2c@gmail.com>
 <20261107-lm3630a-led-max-microamp-v1-1-ec9e441d9b2c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 12:17:55 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Michiel van Beers <michielvanbeers@gmail.com>
>=20
> The LM3630A has a full-scale current setting per control bank, from
> 5 mA to 28.25 mA in steps of 750 uA. Boards whose LED strings are rated
> for less than the chip default of 28.25 mA have no way to describe that
> limit.
>=20
> Add the common led-max-microamp property to the led@0 and led@1 nodes.
> The property is optional, so existing devicetrees remain valid.
>=20
> Signed-off-by: Michiel van Beers <michielvanbeers@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-lm3630a-le=
d-max-microamp-v1-0-ec9e441d9b2c@gmail.com?part=3D1

