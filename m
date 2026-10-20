Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481349;
	b=TgV+cTqV/GA9nrCry0WQurbtCZCJC9+U11+wb75nRBnuMeSyVcw7Ep1AvqfRI+YmJ2dw
	 /Y5iPNGXbShqF6uLVkZZEeEHFfsQgg2F1Vrk7Wo298Fv6hOT6ZUdGPSvnOYfm9MSxHqHs
	 DSRjbUKsS6hLvB2I9uNSVRMEQ6OQLQVrDX5fSuyqam22aK8WyIhVD2q8AwIQ3gE39Pn8V
	 39ojqfL64+vu7s7LdFRZggy3RJuv6i1kdbsEjleSY3N2JBScTyk61Bw1AZ4Q7RgqIVkjq
	 9fYdujrg7phPVP+SBPewQvpmn4kqktBy8VIE6zK+kmq3FvYj3PxV3sJMwJMkuMnZ3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481349;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CdVPKzwoivUCsdSw3FkVKkpyKW0HyzJVixAN0MOhIPM=;
	b=ygVJ6tvPx5MdBRMkm/IDYsbXPiXybLdYiKk/4vxVVUZjMoEGHzk37okZcFVVoK+jmbb3
	 pFoj2iubhMkyUbbUPhVkaNDGH939sJl95LLF4uLrucnLUw+vKtEu6KPC8gToxRQ9WC9fp
	 +/FjSJmLEN9RwVWv+9surJdwEh/iKNQmEEFJlHQzfJwSzs8GTKR5CMU3/0pO01Ux5nYQt
	 REevbiJd1xsRGNtgl0quzzDC/XK6byTkG8OUsJftLvzByQpMY7THelkVv2xOFaB7NzGWL
	 czDCTytZUxbNbLj+YciBhZxOs+xmrw9CV7PQ7Y7NXrJaL+Q/JAXygyLIx3AnM5Fl77w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIXjbYf3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A625606A319;
	Tue, 20 Oct 2026 07:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIXjbYf3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E20E1F000C5;
	Tue, 20 Oct 2026 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792481349;
	bh=CdVPKzwoivUCsdSw3FkVKkpyKW0HyzJVixAN0MOhIPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIXjbYf3AV5Qs/wCsTPZ+x0WbGU4mOV3fNH+XeUA8OVU7ams05iy3bM3MC+3f3iHB
	 cPBLKROzYNxbHqTVW/8yWeM2etJfpmM1tZ7X9P/w5PTeOvcdSxQJCQspOm0FisTpvJ
	 wouf/WTsjMoO0hLUeMeYcs+VyD7BV1zRWPPlvcpRNp6dQotnwE+Xewsgwx4sDSPk7L
	 vTLb52l8ud38tvfX/qOqq6xhxAkSrcTPmsCkwPCQ9xbpchvLZo95i4ZMMG+HVQr0iA
	 yEfqOwk9L6k3ISrIJP0xNGJUaCN0wkegAuEgTezWOjdcwIBdg+EXS780XvEZUjjeHX
	 4ipcJzhYkfowA==
Date: Tue, 20 Oct 2026 09:29:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ross Cawston <ross@r-sc.ca>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chris.packham@alliedtelesis.co.nz, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: net: realtek,rtl9301-switch: add port
 LED controller
Message-ID: <20261020-weightless-tidy-goshawk-aefb1e@quoll>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-3-ross@r-sc.ca>
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
In-Reply-To: <20261018194339.132-3-ross@r-sc.ca>

On Sun, Oct 18, 2026 at 12:43:37PM -0700, Ross Cawston wrote:
> The switch drives the port LEDs, and some boards wire LEDs to it that
> have no hardware function and are switched in software, such as PoE
> status LEDs. Allow the software LED control block, described by
> realtek,rtl9301-port-leds, as a child of the switch like its I2C and
> MDIO controllers.
> 
> Signed-off-by: Ross Cawston <ross@r-sc.ca>
> ---
>  .../devicetree/bindings/net/realtek,rtl9301-switch.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
> index 80eabc17066..9529327ee0c 100644
> --- a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
> @@ -57,6 +57,9 @@ patternProperties:
>    'mdio-controller@[0-9a-f]+$':
>      $ref: realtek,rtl9301-mdio.yaml#
>  
> +  'led-controller@[0-9a-f]+$':
> +    $ref: /schemas/leds/realtek,rtl9301-port-leds.yaml#

This depends on previous patch, so cover letter should be explicit what
maintainers can or cannot do with it.

Best regards,
Krzysztof

