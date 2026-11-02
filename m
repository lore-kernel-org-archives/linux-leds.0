Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650196;
	b=h+C3IjfoIpxBIXN8I1ms2Hdxn99ZxrBkxfl2dk3yRGsy2fQLkJ2MZ8/dgrfPoolG64dd
	 VXRgnz2lVODPTYULSVQ9k+WExqavVF1PizJ3NGEMoJ7c/sWhzhyzKv6WYc5Ex3pElFOcB
	 vx+QGQ0TgKGeofr/vm1e9Xy1aZFLvlxa56x581roqDZk7nZq71jg7HMze10sw1hjfpalV
	 B0JIKgfAq0Bknx/jqOpm7qth4v9iuvwGq7/flinBccKOff1U4As3/YeSxKF4TVMeqROou
	 FwRVdTHNvKCEeZ2ZTN47y6L0Cc2aimBZJuCEGv1VA2ZiBMU2n+Y1S1ojLTLlmhUPi9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZytqqvRy0otBpXnXagZSsk1WkpOeLDBKfLqIevCSMGY=;
	b=Hmq3AOGTGuvzfAv+Lr6U0ttlMA3SgkX/hzJfYenWbJTfASKE+DRy+LvLl4Ld+ZJ9n+X4
	 bq3EmGYvuyzCHqOT0/N69YXXHIAArW/wwKgMag3ajclt+uPGYI7dfBhcux/kXXm99nwPN
	 lQazrYCd4Wl2SITrxwMVFrsH/YDZNVC2utf5zBzIUxs13lCJIlef40juy7CYnSWfV1f4T
	 b5NDolHPvKZbVAFEdsTmBMsQ+j3nknbh3t7CPKKKF4WQ68lJ538KB5HxqUxdOSJSYVXZB
	 0RYE2YGLeHZy110dmjDfpY4Zy4sedeivqyZSV3Esg0booSpwpWupGlQqkQh9cvg+0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwJwxa7P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10648606A329
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwJwxa7P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3C61F00A16;
	Mon,  2 Nov 2026 20:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793650195;
	bh=ZytqqvRy0otBpXnXagZSsk1WkpOeLDBKfLqIevCSMGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwJwxa7PYv5HhD56sEWJSTvdAOsJrXmmJ1S4TuHG00Ku4ay3F2cmkxQOSmOSWCjnJ
	 QDOPvOWVkt8jOrXujcxrhgf0E8DFD/K2LCI0+treAxt6h2AiDtDvV0RC8zCk83uN05
	 6Aph58s0mFrgVLR4vwiZKpNk5D5lyD8lZQgCLC646YFFi/JUeLSKkrcDrLGztJoCi2
	 4cKGwa2Kuk23IehV7UXxNPQadqcOIKpl393El7G3UVz6QjfOwOEcYn6+OGVMNpE6ax
	 41aPNByBOIH7mvXho7By6wzv8G4vQ1bESMG6zektZmW5yed9JxOLgouB48vG4dBqjO
	 87yGUwrjcy7lw==
Message-ID: <sashiko-outbox-194072@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: add Kinetic KTD3137
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261102-6768-ktd3137-v1-1-b5b4f903c56e@protonmail.com>
References: <20261102-6768-ktd3137-v1-0-b5b4f903c56e@protonmail.com>
 <20261102-6768-ktd3137-v1-1-b5b4f903c56e@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 20:09:55 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Kinetic KTD3137 is an LED IC, used in various mobile devices for the
> display backlight. Add devicetree bindings documentation for this chip.
>=20
> Datasheet: https://www.kinet-ic.com/uploads/KTD3137-04a.pdf
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-6768-ktd31=
37-v1-0-b5b4f903c56e@protonmail.com?part=3D1

