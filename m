Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AF2D7386;
	Thu, 26 Feb 2026 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092287; cv=none; b=j442BRl93/NUOyOaEsSmL8LZO+8lsZ7aBEDgwAWG+lH4GH2pwkGotBq8W+9Or3aJ8mWkTBy6TVIx1xR6Q5hgheYHk0PlhiRbp6a6d123heVep1Yts29XhT92FOHv38CLbdP74YtF4YpHjPR7nwj+efj7eLWZGMZZFRAkbrp5sjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092287; c=relaxed/simple;
	bh=853EE6JswtL146QPlx0xKJwmaPwSVMEPY+7ZFJPHw8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPYnpLFm4aHxstff1FdLOmA08U7pP/J/sWEHjHYQESEVS3qdY0Ahhn7EzGgYEnT16rgrpLA1FHiYmckla1LXCUjOV8hMwoMgA8P5zUfsaZihLa/wE704XEoRRdG5IKCRtwnjW1cuLQg59D1fuYE9OaPzvJilWsCqlhi7MrjGsPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h96dgHq6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h96dgHq6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492DFC19422;
	Thu, 26 Feb 2026 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772092286;
	bh=853EE6JswtL146QPlx0xKJwmaPwSVMEPY+7ZFJPHw8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h96dgHq6uDpjTwC9DhcsgikND4HsHry77CIHiqyyBGvDugPykCFJOgqSg8hYVQ15E
	 IfODci0b11FRoVgL1ug+B0KbnpZoYSsaYWY4VJeTwXTnUr48pwTROSsETiskG6otXf
	 XP50fObZBFdwjGCuajvMxGAT4A99JRJbaEFEG6BgA66kkpKczqQo5xl8IPuie20VTO
	 ajUkQ+HGmFtrduFIlVcrrm+kgkCCOZ2TL0A3scIFlDasyUwcmeeoIJkbFrtqnQStCF
	 fIqVnF8Rg/S5MQuSEGA4NNcr6KL6dVv/Bg8IyFJJeMe/vDwQmkYxPCZKV5IZwLB40z
	 m/KsF+NHYe6Aw==
Date: Thu, 26 Feb 2026 08:51:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for
 Allwinner A523 SoC
Message-ID: <20260226-heavenly-silver-nyala-557ede@quoll>
References: <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225160828.1687643-2-wens@kernel.org>

On Thu, Feb 26, 2026 at 12:08:24AM +0800, Chen-Yu Tsai wrote:
> The Allwinner A523 SoC family features an identical LED controller as
> found on the A100.
> 
> Add a SoC-specific compatible for it, with fallback to the A100 one.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml     | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

