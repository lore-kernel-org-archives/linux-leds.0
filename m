Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969677;
	b=Xxfl9mQroVwt/BYyjE5aqU+LQhCCMrDXff9a9RL7pP+ZHDlnqYG9VZVgzqzVLyK0scVS
	 JErYRzUImxGQ7ZLRbS2WkSBTcuVGDgIzgHmJGdgXdh7GC5MQSG5mNkUoFXYgYtbm/9GM4
	 MXmbcZmi7wrIGrb3a68Ox490jJe4PeGTzU9oHWBpGrIOHiA+ni+qVFvZ23edVu0fpCGB6
	 Lkk4Rf7XbQgCL6kDmBjZvArLizS/6WZcTwzsJhWzlYmnfJQWfEH8Lg4YYxkQNBliLMGba
	 2WTpmKENxVHVBXUz2yQrjxLVLaXRF+IyNgMHcgl1hNtA8ba+sUGiC1SskZjV+I2SY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969677;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5re80ecKPdp2+y+DE716w3bjGtgGTGOIC2NM3G2zvxc=;
	b=xqSX+XzBBrFIwtpZXDFaT0z42CFqKwf2MYBLSLiTRntVs2b+OjINShTpmwg1Y4yx4aGZ
	 RfIPbqNYwvM6LPsF9lFXnx/biiVvbAcjLCXsBkmtN5ZvQUMehFa2rn8OiP4Gd6uAnubHr
	 GzHggEBL/6Mk+ug82iXoQfEU8z6mY8M/Ed1+uCTXAzHgEAvgt0js1clQbhqgowy8vPtxv
	 fPrV75pdtUFWJWAZ4ANcqeixl6bN4ZlRooasAmGgna1jMrB25a1SrN9n2Jt8gS+v0N4n+
	 wjNhXjvlVS6vNjB1Jws3NdtLWLQSST5DvmfrbDtik1haDtxMShCND6uK5g3z2L1I58g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYZXZ37G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14735606A326;
	Fri,  6 Nov 2026 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYZXZ37G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C0D1F0089F;
	Fri,  6 Nov 2026 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969676;
	bh=5re80ecKPdp2+y+DE716w3bjGtgGTGOIC2NM3G2zvxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UYZXZ37GzZqVN8Ppc0COny+J4rgpJOO5e7HEierw1l6qqmyP0qbROG0lm4udm0mSS
	 RRrZMlWhcTDjGYDPy8BId6TgbNrWTgt9UhwMv8qbWN3TZ2SZAXce8WDCn/26RotS3E
	 eiWtCRnErrBCaFgCZwQf46aP4F3PjzNg5QwUFs5Bweer9e8YP8mWl7YRHqagdu+0mP
	 HtOEX+K/Wa9pS/Bcn6YK/dlQtjDPSCD5h8gs+NfDlykGtoQO5tNJ1PMGF1Qfs9Snhs
	 IvmNPYlmhCd4XeKcY+Tjc/ux6Eu5f7AcnPmGdNYO3SoMMu3PHviRTdOeopXvLxJnMF
	 527LMD5Uz1y2w==
Date: Fri, 6 Nov 2026 13:54:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Sean Young <sean@mess.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-media@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: irled: pwm-ir-tx: add power
 supply support
Message-ID: <20261106-humongous-marmot-of-novelty-9a7f44@quoll>
References: <20261102-6768-irled-v1-0-c7064f3afed1@protonmail.com>
 <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>

On Mon, Nov 02, 2026 at 05:22:56PM +0200, Roman Vivchar wrote:
> On some boards, the IR LED is connected to a switchable power rail, such
> as an eMMC supply. If this regulator is disabled, IR transmission fails.
> 
> Add an optional power-supply property to document this regulator.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

