Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518327;
	b=PI8xZTgbp2VYdhwsw3/fpNCVU3ItjF076yqU9mknBuTqdqIz3sOUdHE9ZTbKcdSogih6
	 fmKPaiDcWZXq/jf8rdrlhq8na00J3gipjkov0IQw7GWP/rmmUhQnV7titjlsxS222NXg9
	 /6WCchGS28lR7C9thMLzetRW0rbO5oex20WXn/5f/nX4r6zitnumM2uBVTtJVXngxmiG3
	 UFEkwF4HDz/8eSKPGNx0ibuBIv1JzfJeZu4QU/VmpEauYX6I/zHbYz1tDLgEI+ZhymjWc
	 XtLHJck2yG/smxAU8BkgfQX1FBMdFsG3JuDFgPGRli/8skYMlSlAIbZ6iBj1uveThug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518327;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PAqiBxOuUjcVVcRZ2MUwiiwHtGhdU4gm9a/O1b6JhhY=;
	b=ButbI/upRNi1xNjCwtdQBbrdjq+8l1akzvYwcfmBQIzvKJUm5j3CRPwM/s4aOayLgAAz
	 4tXWluTgKzKlfDLVqnqNcwuZPSAlB+B2IgazdSOJ1lzn2B7rSDd1+t2CYKDluQGaWquOJ
	 GA3x4zeN/bVifUSG7MPTCyVI3MmVAY5NU5ipJdEkGIZLS2Dk4Uf+34oDoapJNl3/Dxv4K
	 ApZ1enkUldsJ7oZFE3npQUfVOegnGLXPzQW+YloCndRMLXtfyAzu1w0V33YMW8EuXLHq4
	 esQvQtkY5+6jkzgdzBmo3CR/MGsCfMJU9rSA24U/h1sQKVoOCu11N1LIF85hzP/V4Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB5606A31D;
	Tue, 20 Oct 2026 17:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A4A1F000C9;
	Tue, 20 Oct 2026 17:45:26 +0000 (UTC)
Date: Tue, 20 Oct 2026 12:45:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>, mfd@lists.linux.dev
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Message-ID: <179251832264.345015.830998474723147925.robh@kernel.org>
References: <20261019100930.110954-1-clamor95@gmail.com>
 <20261019100930.110954-2-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019100930.110954-2-clamor95@gmail.com>


On Mon, 19 Oct 2026 13:09:27 +0300, Svyatoslav Ryhel wrote:
> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
> 
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

