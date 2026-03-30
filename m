Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83760149C6F;
	Mon, 30 Mar 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854603; cv=none; b=pj9XExxbBZbYD1zlPD8CglQOWZYRDDjS7ApEiKmECO008l0fI2Lf0xOiCTpoQIWl29RDEwflfecl6ymPeSmFFx0pN3RMlqcgrHHqNGukOj5fQXJgTaw1GktIGo4DEMn2R+onL76XeSWZHE12fTOgxAzxUMq+d/b8xW0DG5jfnFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854603; c=relaxed/simple;
	bh=o5/s63W+wtwaYRANyWsRhZBBKWGpXBUj75tReIRNYdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/46nNuAZDLmyNXH+iBAt1W8XECdR5MlSttL02GCj56EHg4apDKZkIx964+a+5uru1DGt0zaBn4SJPUnLGBM9cC1EwwYWpaDXOOZDHfS/OKgLhTKsRXYqc74Pa2MdPW3Lhk2ZOfuv5z0Dh7DIJDZ4FS6wZfk1DQccaMnPAkx+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKLh3tgZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKLh3tgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F80BC4CEF7;
	Mon, 30 Mar 2026 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774854603;
	bh=o5/s63W+wtwaYRANyWsRhZBBKWGpXBUj75tReIRNYdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKLh3tgZ4TQGjF7lvG3Ct1JQh4axeWvYtTumjNaSRBwkP4GixS8EipmD0itVJS14h
	 E5HfsJsZo9PL773ub9a1IQcuWaDuZiyj9S8hJgbdATdx/jcSKjCxvG/dpaTCJL5zM3
	 YcdqweCEmf4tg3AZp3iRraLOmszLEM2jjCORZkpWD1cFdb+R+gqz5yTIgSfHvAm7P7
	 6FbaQmuxDIWjlsNQLPRe5nG7K8Z4YNGVV1rpF6nnBODQKDq3XrzKxIP1Uz0iU/qbtE
	 uzt+zFR2MpiC6JOf/+43RU8GC3EbkI8PJjhG9wEiJW+rtXMvkDBxKmEdOVDLae7cxN
	 VLxoR7aYUuEcg==
Date: Mon, 30 Mar 2026 09:10:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: pse-pd: add
 poll-interval-ms property
Message-ID: <20260330-spiritual-placid-jackal-cd4269@quoll>
References: <20260329153124.2823980-1-github@szelinsky.de>
 <20260329153124.2823980-2-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329153124.2823980-2-github@szelinsky.de>

On Sun, Mar 29, 2026 at 05:31:22PM +0200, Carlo Szelinsky wrote:
> Add the optional poll-interval-ms property for PSE controllers that
> use poll-based event detection instead of interrupts. Defaults to
> 500ms if not specified.

Why?

> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
> ---
>  .../devicetree/bindings/net/pse-pd/pse-controller.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> index cd09560e0aea..329d020f054c 100644
> --- a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> @@ -27,6 +27,14 @@ properties:
>        subnode. This property is deprecated, please use pse-pis instead.
>      enum: [0, 1]
>  
> +  poll-interval-ms:

We allow poll interval for input devices, because how sensitive buttons
are or what capacitor is there charging/discharging is really a
hardware property of the board.

Why that would be true for PSE controller? Controller is specific, so
any internal aspects of polling are already implied by compatible.

You have entire commit msg to explain WHY you are doing this, not
explain WHAT you did. We see what you did in the diff.

Best regards,
Krzysztof

