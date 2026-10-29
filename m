Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298958;
	b=kZnVnf0dsVbMpFzeVTsJH91S1zTvxLEwuZggCt60lsy+exs31c+7MQQ8BX6BgDkDlycD
	 9PGp+m/k8JfiaObA1zM7YPsbOFL7icA4bb8XPb4rVsgclRe+W39qDV+ArLjt8MsZPp/SY
	 EhotFXYbO1SifW0l8orjvrBWeO5hjBxS1Bg94utY5caYu2vR8U28eYwmO6YsTRa1s0VKT
	 a63bLC2dSag7R1UzzipW/C/tORj09viVB6M6gkV7y6DiHAIiZUptk1S49H+1RTmIfmzHz
	 zrsjI0765xHC5uVtCIeKUOYCqOTkbpeZ22qzwRXAbgo0pIUxcdelI20g8IVtHswR7/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=s7i5r9GSYJs0QEkKXvQrfeqqmT3BC0OgVsftr7C24eI=;
	b=vgT7lpII1YblIu8wh+M6T1LSonoeyDm0/3ojn2Lm1Sq8QAAsq++lpu0jeNgxdNle6Y+t
	 viO22kN+NctahS7MNkg9dhSRTcokf+DGoP0eU+ZpKXFBj8eQ/U9tSCm0lD+Lo+VFK1H1P
	 CxrOQhgPP48Xpf86xxQa+7sRLX+xq324e0zwqLPNBD5QDG67A3DjIU+YUPOf3XRuNjcnF
	 jv9GAv7VmxjqgKbaXl4IwF+/jLKnIwLDfZmEd5LfeqvWXzHi3hIKPmgGkKVhqHRO2xRey
	 3mzgRGLLUbninlmHRfS6weyZLEBb66F1FpnhAU//JZcD1Comx7kCTMx6y3MiuHc31wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jcg72pbC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2B606A31A;
	Thu, 29 Oct 2026 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jcg72pbC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DD11F01816;
	Thu, 29 Oct 2026 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793298958;
	bh=s7i5r9GSYJs0QEkKXvQrfeqqmT3BC0OgVsftr7C24eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jcg72pbCbg8pvUEFIYUsBWqfauVfZQZ1x3bJdD/eqLnazD159GlP8JYGSdy2JPs0u
	 vmyw9rm+LEJx9g65BVXc4Mh6n7L+h+EUZtVXLtbvYW7sZHYyu0gN5oGnyTYxxNB6Fl
	 0lJefEfV6h+hLGtQHT3hRoKiiIlVF9d+CeMr1Riorn+UR2V8L+IAUxkPD6jWE5r/2V
	 8XaMTlwDwIiZ9WL/wlR0oPqhuDHQJn1RM8IBNw/xCRaLpa5PrUbN2e9e9ZVHmiroN/
	 9Wu5xtbli0VhTT4jn1zOEx1GgbVfYW2U8ABThRlbOnEndJkCq0DSW0o+7jiP3iM7ik
	 /auw570/7iEvg==
Date: Thu, 29 Oct 2026 18:35:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: ti,lm36922: Correct filename to match
 convention
Message-ID: <20261029-abstain-superhero-90e42ebd78b7@spud>
References: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BR/qsMz+gg1ok9co"
Content-Disposition: inline
In-Reply-To: <20261029083811.43354-2-krzysztof.kozlowski@oss.qualcomm.com>

--BR/qsMz+gg1ok9co
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--BR/qsMz+gg1ok9co
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOSCQAKCRB4tDGHoIJi
0mGnAQDLOUBvawGA/a143wiLame+PqH8fHamOW3sMWzH5IF9hwEA8jWBVhLDui5u
XApJXKiHyy2PNOlJpytrJ1aa6/VqyQw=
=vCNb
-----END PGP SIGNATURE-----

--BR/qsMz+gg1ok9co--
