Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527613;
	b=hhEE/OvgkJZ315CMsoY3lDI2fg0Msp29KHLdwgYmsPKAC5tBsqf5le0xBkvlGFBuN1L4
	 /UIM6kqo/bwfcHScWkyyEmRHVS9zvI/wIlwUbZMkP3weWtoYExnaoirU9jBHp0lc+btcx
	 XOXSPQFcMmR3m1TuTiyu15lPoxJYuTXS8XxJzzXbzJqD2j7P3lnL/xgBsSR2gHqSgrH6X
	 gKunKvQDi6K0N+EHETKX5j6S6er5aXutVMN9mPn97reL3c2/YcyE1dcWHn1iy/CW/v+Ov
	 HQJicPgysFbl6AABaG2a2DK+pASFnBqbFtedesgIVIHs40j2ydRC21Pkz4Iq9DUgTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527613;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LXiFx+L5CCwKVruNwA9sXl2NhTIyj3jvkEbySanPels=;
	b=ZOVvkVLihVAp59sguoN1tV8IwHNeimrosL9vT+5FWkEOrY2YAooQytD7gkEtI9WfKVKL
	 6Mf7J07/5NU1D88IlqvLuxzcrqyw5ZRHujYnXjH014M8ASQT/YpYabupqXLCD9snQW3ro
	 3hXC3gX0PNoxSob6jNN7vJhW5n2wtN0AxrPYkfhi+//3wKMVSGP7Txhz0b0unt6lXnxUJ
	 KyszoRcfY9h10li8Zd2lBIvlMhvLMZ4ityJJPeQeNPt54PfTxh8zVyf8+Iftlin24ArPf
	 PbHs5BR8FiEXtxqBgAVPudA0hmYWWlgev7p8gTQqWrJ/uuQzJZ4Dtb6m76vvEREEJNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhmZVsm1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E99606A31E;
	Tue, 24 Nov 2026 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhmZVsm1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791031F000CA;
	Tue, 24 Nov 2026 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795527612;
	bh=LXiFx+L5CCwKVruNwA9sXl2NhTIyj3jvkEbySanPels=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BhmZVsm1F03k1gQhR42vPYWI3yvM5KqUr5TzQXRw69br9dDrzS24ACF0CW0cWStRv
	 nhKYE5mMbiV3T0C0P2suHiRK1UxBghW8geD2ZwEdC+Bn5QnjyZwO8yABHU4x68W4+d
	 Qkgzn/NMNWWuG+VM8hzD6q2X5loLeFUE6JKU+/VBu3Fvm3WFNY/wQLESZnWRvp1c6z
	 sb9dHgjUZ9PYK4q8Vua/64XIVO6yl12N7xmwdf9HBqGBeJkKCmNL74J5/f8NjyJYdj
	 VcZU3nKP5JWCkgoWZUUEwoneTHW2xF12oB56sa7R+p3llx6MG3LtW7wGvIQEqDRsAs
	 Y4u96/vQvkDmQ==
Date: Tue, 24 Nov 2026 07:40:09 -0600
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
	conor+dt@kernel.org, lee@kernel.org
Subject: Re: [PATCH v2 06/20] dt-bindings: sound: Document OpenPandora sound
 card
Message-ID: <20261124134009.GA43712-robh@kernel.org>
References: <cover.1795505160.git.hns@goldelico.com>
 <5c6f7deca16f70f1f19cb40c57d70e30068d6000.1795505160.git.hns@goldelico.com>
 <sashiko-outbox-230655@kernel.org>
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
In-Reply-To: <sashiko-outbox-230655@kernel.org>

On Tue, Nov 24, 2026 at 07:40:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] dt-bindings: sound: openpandora sound-dai omits mcbsp4 and
>   twl4030 DAIs
> - [Low] dt-bindings: sound: openpandora sound-dai lacks per-entry items
>   list
> - [Low] dt-bindings: sound: openpandora example has status property and
>   wrong order
> --
> 
> commit a7d9248344c1d8736a83ed4cfd8b21aad87db0cb
> Author: H. Nikolaus Schaller <hns@goldelico.com>
> 
> dt-bindings: sound: Document OpenPandora sound card
> 
> This commit adds a Device Tree binding schema for the OpenPandora OMAP3
> audio subsystem connecting OMAP3 McBSP, the PCM1773 DAC, and the TWL4030
> codec.
> 
> > diff --git a/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> > new file mode 100644
> > index 0000000000000..6c4d69ffc1c50
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> 
> [ ... ]
> 
> > +  sound-dai:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description:
> > +      Phandles to the audio CPU DAI (OMAP3 McBSP) and the codec DAI.
> 
> [Severity: Low]
> Should sound-dai define an items list with a per-entry description for
> each phandle instead of using minItems/maxItems with a free-form
> description?

This would be why you broke everyone else. sound-dai already has a type.

> 
> [ ... ]
> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    sound {
> > +        compatible = "openpandora,omap3pandora-sound";
> > +        status = "okay";
> > +
> > +        label = "OpenPandora";
> > +
> > +        amp-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > +        amp-supply = <&aux_5v>;
> > +
> > +        widgets =
> > +            "Line", "Line Out",
> > +            "Line", "Line In",
> > +            "Headphone", "Headphone Jack",
> > +            "Microphone", "Mic (internal)",
> > +            "Microphone", "Mic (external)";
> 
> [Severity: Low]
> DT binding examples normally omit status = "okay", and the property
> order in the example node (widgets, routing, sound-dai) does not match
> the order declared under properties: in the schema (sound-dai, routing,
> widgets).

Also correct comments.

Rob
