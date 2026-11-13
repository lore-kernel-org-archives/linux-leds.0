Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567370;
	b=2qI85dB0Xk6nUdJxK064tMkUxCuU0IwChZNV//sF+OYVClkZoAE3jviAVBUT10cS2lFd
	 dFzQdTBTfZMSOl6EhUjfGqNWUAmxUwtcPpYoJhjQY/AO2P+CxIpD43XwzkMEH7K3IAUy1
	 uwtfLX+UwhsFO5bOK70hVdTWAtFIoJ8pwiSTA/J2PThWSaJTIR2KTxs+UAWHzeZQ2B+zk
	 phe8g7wfzcYxqS2CQn1YDPf3aTQ9j0gTsSdFp1dSYK5EXo4mmm4nPic8gjXsg6dyJyyyO
	 R3Ju4Vub1Xx7J6CuxDVozuQo/CcRFp32cjSk/AU+89fFOHWyN6YzSgCsx+ZV88CYIaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567370;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=M4J57fTk+8Vq6jT1uotc0cvxJaIi92KXTw5TnIXmv3U=;
	b=3R5paZxBoky5mCQYLT6x1cF9fBUAB+zKObsPmFzlWH3LMj6CBWEc8FEG8lovvjyoYpmi
	 dzwVQgJj5bHrVZ/WGa7ppi7Ud0JoVtkNGlHK4TEDKuM1IHBJ9skmbVdiz/4pI8eUtKeyS
	 dDN+WL3/FA4fANiChzxakAFR48hpPOAjN9hqwgo56kXbZQowuEw+V8w2dKFoj5L4Px+qh
	 Ag1hVqcVgEF1WmHWeJ4o8mV0rGcTiWWgyxUGoQyOkieij4p3Sa7qvtxGrkp5btfOJQ79Y
	 KI2A9u15zWCVGbNow1u9q34NPRBtj1nJeCPBCOzuUMdj2VCUxwR09aDnbSAdOkl6zmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Olf6s2gB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D727606A323;
	Fri, 13 Nov 2026 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Olf6s2gB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A761F000C4;
	Fri, 13 Nov 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794567370;
	bh=M4J57fTk+8Vq6jT1uotc0cvxJaIi92KXTw5TnIXmv3U=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Olf6s2gBMpvLpvfTA2eEk2NrJk3eUegJ+u9IQ/2Lhi68yAnO+iGbwKP+Ach1J0rxr
	 GzdS8daMZh2uZLR4Hb03nuvhwkQ/aLqAYizNIpcWttPHJ41YNGJCleAU79KdcOc3Zx
	 LttLI55wTY4IuLpZcko1FGbkz5heeJ2btrk0y4w2CHWuenlHGk+XCnGWgUi1NLHOrK
	 AsMktVHowmVv8JQ5trrP4wCaC6HBFQQu3CxhSmGpxtMsrCvUqLxQXyt+QgXZ61x2jC
	 Q+18pRi6NIhMqZJjmk6p3UeD+/jGeJO/8greKQ5Vx9f+7dNoUO1l7qGYUfvo9l/4Qt
	 O+TIZTtfctYFw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: leds: ti,lm36922: Correct
 filename to match convention
Message-Id: <179456736757.37337.3919255763716680323.b4-ty@b4>
Date: Fri, 13 Nov 2026 10:56:07 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 29 Oct 2026 09:38:12 +0100, Krzysztof Kozlowski wrote:
> Convention is to name binding files by one of the compatibles, so fix
> the typo in the name: '.' -> ','.

Applied, thanks!

[1/1] dt-bindings: leds: ti,lm36922: Correct filename to match convention
      commit: 78679e9995b3600c66e18ecef07d97e191d90868

--
Lee Jones [李琼斯]

