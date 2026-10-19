Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440297;
	b=K6gTvG3PZQRcnMoiYi2G9Tv7NSZ1jMIrWuAMYljPDc/nk6XTTx62Ze+hVXgiRdDR9QUU
	 6CNbsQxGR+Ti+hr605JJP6ioXkfcmhrCmgmYUAvrgryPmnUQ/3FJ8vVNCFYZokIfb9mvL
	 ZVVz54G6Jau0TYAQJneKYJHDzgYS2IE4huL3Uip49N528fNhs6mvyvsLppF63My6J2nFv
	 etRJnF8flxsdu4fhIu9HFC2ed9YuFprlp3C4nv1HkZmQqibIH29MCvHFhEvz3JSDGPfWS
	 l7CYpN6p+A4d49sLj41L0UyOfL5KMq/QztTL0/GH5rMWG4mrtqeUzzMge/QUUh2PFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440297;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wd2J2U3CBhe3v92sIV+81ASbrUC1cu2LGcUWPJ6cy4g=;
	b=RqtFZExLOO+KFAP9Q8eFJLUKD+NdEjvXx8b3ZJHMYGo3x0PRoK5E8TC4wEDPrTcbrdlN
	 kp3OLcfRXy7q2fGkrKgTrwFOKtcdrkswRUtu/DZ4/jeiRX8+u4pAeDjclEwhijcftVJBK
	 6uFMxIFoVmT8I8aOYNIhbUjuYhRk2jb08K0yMSbXlxlKbKVyukzpTovJxfDO36dTGRSbw
	 TQWNtngrrPZX0za1hPXBA1Ey75wkHBSeEmXNR56nE7sw3GgrSNl+ZNVrpXpGFNb7LUvNK
	 uB5qW3zLaPN6hhx2GmJvJyt+cfuyNhhQYgns46GFJPmCI02MBhh4BnJLyby2ajrhFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2HOzQW2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41F606A319;
	Mon, 19 Oct 2026 20:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2HOzQW2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487D11F000C4;
	Mon, 19 Oct 2026 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792440296;
	bh=wd2J2U3CBhe3v92sIV+81ASbrUC1cu2LGcUWPJ6cy4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y2HOzQW2qpSQtNLRNYjXMlY/L8yzQixXQMeCKIW5yf36LFHVknnn039QfCcUScM0k
	 mEk86V9ryCZBq55yKBA0iTnQpqCeDgz6s7eeuG25cn0lCGMYbDXxUSQAXtIberoWR6
	 QQzeomua/FJIIVyjyosepo7aWLkwj0xC1xeeu2+XKzZiqCrnpd+TAczqgfP3ZqMeqD
	 ijllve8XFEBilJwszgYO4sZpWK4zxrD6oVDQMpaxrNW7Ki+Rb9301k23WNvLCQlzoq
	 qDevWcYEVVLtHiwkmeBrratDRUNlyHW9+yx3Ll3Y9gXN6HfuZ15c3NmkwDi4duPP1r
	 pj8kYa3fN1XNA==
Message-ID: <sashiko-outbox-178158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: add Realtek RTL9301 port LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ross Cawston" <ross@r-sc.ca>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261018194339.132-2-ross@r-sc.ca>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-2-ross@r-sc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 20:04:55 +0000
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
- [Low] dt-bindings: leds: rtl9301-port-leds example uses raw function stri=
ng
--

commit c5aa8893c90e31ee15e18fbf27c8f17550a77f2f
Author: Ross Cawston <ross@r-sc.ca>

dt-bindings: leds: add Realtek RTL9301 port LEDs

This commit adds a devicetree binding schema for Realtek RTL9300 switch
port LEDs controlled by software.

> diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl9301-port-=
leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl9301-port-led=
s.yaml
> new file mode 100644
> index 0000000000000..8d6b35525263f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.ya=
ml
> @@ -0,0 +1,84 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    led-controller@cc48 {
> +        compatible =3D "realtek,rtl9301-port-leds";
> +        reg =3D <0xcc48 0x84>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        led@0,2 {
> +            reg =3D <0 2>;
> +            color =3D <LED_COLOR_ID_GREEN>;
> +            function =3D "poe";
> +            function-enumerator =3D <1>;
> +        };
> +
> +        led@8,2 {
> +            reg =3D <8 2>;
> +            color =3D <LED_COLOR_ID_GREEN>;
> +            function =3D "poe";
> +            function-enumerator =3D <2>;
> +        };
> +    };

[Severity: Low]
In Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml,
the ^led@[0-9a-f]+,[0-3]$ child nodes reference /schemas/leds/common.yaml#,
where properties:function states:

  function:
    description:
      LED function. Use one of the LED_FUNCTION_* prefixed definitions
      from the header include/dt-bindings/leds/common.h. If there is no
      matching LED_FUNCTION available, add a new one.

Should the example use a LED_FUNCTION_* macro from
include/dt-bindings/leds/common.h (or define LED_FUNCTION_POE there)
instead of the raw string literal "poe"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018194339.132-=
1-ross@r-sc.ca?part=3D1
