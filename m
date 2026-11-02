Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650715;
	b=d1tmVXLwxylWykoxlvZ7Dl95LUZ52t9ytvnsX4Sn53JeYxV9e/NajaR/FeFy+Fxf/LAZ
	 PCCDCcpnh+lmXuMPQ9YjXCqGemU2cquJ8t1UPkIy0/4cmKXrie+NoSWbDjVEtHTveTtSa
	 dafBSb1Xz903JrIWC01PUFMqlOglcHKWtJo9RVdLiJAJ0qPRmGmGFtmE8+wOEh6gCE5ky
	 z36m7He4QgNXi+6PERcbk/nsyyc2IvazdL6hwTJ3ief5fmdhH3ktnxhVwnLxLRBOxuLTQ
	 6t3RauFapQ2DP55itm1MhiiYmLjhrh9pdHWMeblRZD996F/K6zJKZX1+YLBehaVu1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650715;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=foci4f70UydJSwMd14VzyKAURSSHbyEmiOSHIFxoTXQ=;
	b=J2jw6v6xY872LbBiRCG3aanS0zaxC8uUdTKoqGSl9hw1RG/h62bd/SEK9wynP/rdrgPY
	 dC7n2ltmH8pVJg03z/T9rbs9gQYnIW5xpCljGtoePyLUL5nvLdOdVKIRLZd7YmuhU2L1z
	 Flcw5YvlQHXPaUBb4D2dzFOIJ5cAp/t+z+WmjArD192lltDeZnQ0tYD/zF6syyR6PlTMq
	 h7Nm2Zu1DjT1Ksiu/eWhgHETXhofLZbLlwb28jyOFnSkNfvtzNoboT50/0rzFrmlAtouv
	 myZ6/o/bntL9gJdhQuXZMuF2a+Dt10H7Pg31ygtXbyfP+SGLqTniVM4k3vw0zRJAbGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsvayB5g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D84606A326;
	Mon,  2 Nov 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsvayB5g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026831F00A16;
	Mon,  2 Nov 2026 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793650714;
	bh=foci4f70UydJSwMd14VzyKAURSSHbyEmiOSHIFxoTXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UsvayB5gFXO2p0INdlx7X0jjh3ZRWiz5tN0A/Ep53mbNjkeJfwiChFxHTLe7TeHgu
	 NJidCFGoGHbEujPtP5SLNEUE9FC3+8QuuHk7O5uYG0sNJfmiakQKYoZ+l7x75x5/jU
	 OubnnSwGeVs36SwvcTvEK6ovPBhoL+2iDCSkOd6baunSwWLOF5TgrIrdbSFRxrt2cT
	 rXC7sYs3OA3gXdJ0ji0yxFybSfLO6HSjrEkFLYCRHOxTdWnbYrtQo3kWJatC/dPmqY
	 AFkPeMP1LFrTTAktCWxwzn+td/wSEVkNjupIqoSW2hW76QDHWvOHooCnEkmJKxJLNJ
	 cyAWEaoJ1q8SA==
Message-ID: <sashiko-outbox-194088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] backlight: add ktd3137 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261102-6768-ktd3137-v1-2-b5b4f903c56e@protonmail.com>
References: <20261102-6768-ktd3137-v1-0-b5b4f903c56e@protonmail.com>
 <20261102-6768-ktd3137-v1-2-b5b4f903c56e@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 20:18:33 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] backlight: ktd3137: use named initializer in ktd3137_ids
--

commit d3260d17f4919396b8ff6c1268dffef7e26e01cf
Author: Roman Vivchar <rva333@protonmail.com>

backlight: add ktd3137 support

This commit adds a backlight driver for the Kinetic KTD3137 display
backlight IC.

> diff --git a/drivers/video/backlight/ktd3137.c b/drivers/video/backlight/=
ktd3137.c
> new file mode 100644
> index 0000000000000..a3ff334b8d460
> --- /dev/null
> +++ b/drivers/video/backlight/ktd3137.c
> @@ -0,0 +1,262 @@

[ ... ]

> +static const struct i2c_device_id ktd3137_ids[] =3D {
> +	{ "ktd3137" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but in drivers/video/backlight/ktd3137.c, could the
struct i2c_device_id entry in ktd3137_ids[] use a named initializer
({ .name =3D "ktd3137" }) instead of a positional initializer to match I2C
subsystem conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-6768-ktd31=
37-v1-0-b5b4f903c56e@protonmail.com?part=3D2
