Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922575;
	b=xETgKiau9VWxS415JI8HcJhQxsnJI2m8S8eLiNouUwCJpIn+Wspdp/Jo8Ybp77DbAOBY
	 KZbPwKE67UFMlmcpxWWCR99OOJKVnp2nnpDl3MdK7v7JmR2MEZq/VBUjOCUF7JDrakVLx
	 L8sBXa3bIIGjnDJ0geYcwWkCmtxkCPcYH88DC5klESYY3qYVZgl+FTHp3Hm186wHncaWO
	 aGPnQc87vq6yLcNX3AdHjdJ0JNDkccJnkaP/+TDrIqhKZ9R1TT6IrWDVwGF1HxNeOKluy
	 VzTuz0mE/RujxjyaM5ocYZfG3iLS6xT3rEWDexQITxMVA5Q8W3gmffIrL0rWClDrTdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922575;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=X/2BPYcmOvPNZZbRU++v01rC+kIhnNmGpFqU4z7Oxsc=;
	b=OWFIslVyWA5bsSF8U6yx+HAB+edKsG2oh9s3EU8jr4mffZRaBsUulNc06ltnloZ4Hofx
	 WBjGEOe4QbAyuR+rVwPMKdvRbB/+HFO3mtByxTKw1YCOhlizD3w2IhXNeI12eibATrCpr
	 MJDci2254A81hyfIT9g5hHJ/JHFvCasLVo0rKQX9t111lSm91hKAmeC1WBca06ZajCwA8
	 jf/dTKeUf9lbnmMRuGL37yKM8DMtx3BMTaT/KYUKgmBFZY/b4vueJ05qLipTNHFH6h+gS
	 y0jeenx5UMDK3A81r8Y3OthdKupeumiotXkXfbSgmb6s8/WDgxv/TQlvY6P7nbYh9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cHa5pIYV;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21A606A32F;
	Tue, 17 Nov 2026 13:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF21A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cHa5pIYV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X/2BPYcmOvPNZZbRU++v01rC+kIhnNmGpFqU4z7Oxsc=; b=cHa5pIYVEjGDKHP3a9oo/XSAMY
	2karsmE33psxJFXv8KK2DfED1Zj3HSwk75ikjjSKNI8ZV1AouUUOO88LanyGgtLj18gL/l7ijN/3r
	av65dgsjmxHm/jjLGVte3ew15zvZUb+iI3X+6sCLYbiyKdS73wIDWu+RqGsXbZHGwSlc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJLx-00H9yH-47; Tue, 17 Nov 2026 14:36:05 +0100
Date: Tue, 17 Nov 2026 14:36:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control
 support
Message-ID: <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261117114432.2794961-5-a.shimko.dev@gmail.com>

> +/*
> + * LED_COMCON force mode bits:
> + * bit 2   - FORCE_EN (enable force mode for this LED)
> + * bit 1:0 - FORCE_MODE (00 = OFF, 01 = ON, 10/11 = blink mode1/mode2)
> + *
> + * Only ON/OFF is supported.
> + */
> +#define DAP8211R_LED_COMCON		0xA00B
> +#define DAP8211R_LED_FORCE_EN_BIT	BIT(2)
> +#define DAP8211R_LED_FORCE_ON_BIT	BIT(0)

Given your comment, this last one is not strictly correct.

Otherwise, this looks O.K. Lets see what the LLM says.

	   Andrew
