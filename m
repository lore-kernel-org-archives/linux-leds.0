Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633177;
	b=YsskpmkbcUlv0/j7KxiDADfLFBE+swGec9xDkmRBC3e4JWZsBPcDXCDANO0yYDzyBEUG
	 rw2wrWFbzBYc6Hdlise1BQqqi5D/4zLZ24uvGvxpUYiRzYOpFfURzd9qivDUNLk4mJ4l8
	 wq5kyBqGFLk1p9SlrOa35bpXhl0jV2xv6jAZqimw6wWzFrKDxvc2UMQ2uTw15WiN5A73K
	 uC1Teb4IIG5Rx9GxPBvw7p2svJxqrCQCWtedkRWpCVNbG8MCRtU+alWlXQOpxFkdQMcFl
	 BCfZkAQRj4GX33sEIx4ZINblpRp1+WwDKTIEGaPmw8PrK7bnCGp2wNqZQbqqMWOhcVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633177;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZqguCfF0YyQu7sBK0Wnt/pXfbF7Q9j+fSL7Sz2w1T5A=;
	b=BjO3O3QAul8RE9SEsJC+o82cxA5jpLXHOq+nwWfPiP+8YCcdMj+aEiDCHE85gIIgHPPr
	 DO2T8wgtViSdf3dUwKgjMTeHX6lqfDTk99+tKHuD8Zf25R2Z1CHrCOgBuFZf3YaSs6Jaz
	 c4AYM+Ok2xWpmzsW6UrwAS3P2EROSq04yBOWUj76q5Ona2eRCKC5ERL3L8e8rdce7iQAs
	 XDs/Uj4ss0e9VhnxWJbo5huDWttSaS3eR4uw22r2dfiWJqeLRKdUKSo35IdiDBiBn+Pco
	 ZYKUr+yGr6FPRYD7fyKSnR2mBYS0YUph9vPrQGgTH5MxE6uba6fwawTIwn+CkwW4JFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CUw3D9L7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88E609A73D
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CUw3D9L7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658031F00A1B;
	Mon,  2 Nov 2026 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633176;
	bh=ZqguCfF0YyQu7sBK0Wnt/pXfbF7Q9j+fSL7Sz2w1T5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CUw3D9L7LzU+D7X4PzjcQqkcHGqS1aPJ41zORZYikfht51GuTDKD7pEhkWg52FT/Y
	 WDaHFzJ51eGx+a1ooWeLETe0+kV5AeLwkXp1sDL4wujUFwtempq24TlVkoZ/4gGtNm
	 WJgNpfpU5lerEZPUernSyEFEVeSvN5KUq2HG8rEcHbA6cxaXbRl6M+4ATtfaoHucyb
	 2Kx5UH99Q3batmWB8m7IRUAXQg22EC0cARk+lGyOFxQyj0tLngNvzkSj6Yx/WRZajp
	 Eg2MrvrysxbyDlp1BIC538wjhh+YAIRYDhvq6AAsmiIrwcw3sSi3xX7UMvLWHVdEaI
	 VYQ7LMe9WUL1Q==
Message-ID: <sashiko-outbox-193659@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: irled: pwm-ir-tx: add power
 supply support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>
References: <20261102-6768-irled-v1-0-c7064f3afed1@protonmail.com>
 <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:26:16 +0000
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
> On some boards, the IR LED is connected to a switchable power rail, such
> as an eMMC supply. If this regulator is disabled, IR transmission fails.
>=20
> Add an optional power-supply property to document this regulator.
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-6768-irled=
-v1-0-c7064f3afed1@protonmail.com?part=3D1

