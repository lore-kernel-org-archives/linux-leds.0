Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF231F9A8;
	Mon, 13 Jul 2026 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959648; cv=none; b=XcYEnQKP0A4oDU54rXVeQKnhV113fZgpRimBlGGZVS+UAT9/G5bI2Q6h11oJtPQRqCDncBgRYLSdIPZVmSxVid5kqM77SRuVh46kM6ix8/PIl8cxskK+TFs4tXkBFqcHzylDucKZSm4uOYg1UTC2hezqFxUHt6IGwNgGfb3ZUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959648; c=relaxed/simple;
	bh=cSSW4ypFGq89oPs396o1/zwUZHbiHKzC+PaNOuaLAck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzTBEqDP/Yl0AeHIHXV37uIXZZcQcVQC+WLhpXjCPkG7FW5O/E3HaOdNRVNfSZLA9jSV3a28PT1LwWP65X52UTP6ClxIqJe7/LINKa6OfN4MWfcX8Dn2OcPQy7BMRA06aAQQRylbvyUP2fRwYrem8LxkIf5tUO1xTwKL5Pctos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaVOvfIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaVOvfIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6421F000E9;
	Mon, 13 Jul 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959647;
	bh=cSSW4ypFGq89oPs396o1/zwUZHbiHKzC+PaNOuaLAck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BaVOvfIRnG7IO+xMF4flH3S1TjP0VHwfFHsXIxwWQR8r9Re/RPNTE82fyCkByMqrO
	 MSckTdLVr7pwyD3Y6o4+7df42JhooFcBHokOa1haAKlVB+E+LzcRuvmxG0ixjJRR1i
	 JAvyeCMNx77QKkSXHt4+yVLM/xvG8zqXQXGKwcXYhk0BRSKh4Ujrw8QhmiBWhMziyC
	 hRFNXcPalCOMr9pSlsPA/11Om4t3K5Ldufv3SgAMGwWsLnF+zIsUThpCOjKB3ZISTp
	 kV0ZNUDCBGQ/iXDLqSfGHFaEDPjAcvD15XEcEqZjjJ2aiBa/7oY4EFdI9il8D0JT+W
	 yhLDYRUeqYF9w==
Date: Mon, 13 Jul 2026 17:20:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Message-ID: <20260713-thorn-usher-c469ff4af0de@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UNnpKZMutGUXxLoK"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>

--UNnpKZMutGUXxLoK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--UNnpKZMutGUXxLoK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQWgAKCRB4tDGHoIJi
0r7LAQCHZuS4ULfa1CohKUZKkj2cCcWXgBcGporY4iLJ5z+ZCAD/WVVFLEp85JrL
yHft5d3vx+rXL+xfyengmxXxeZZDpQg=
=G46P
-----END PGP SIGNATURE-----

--UNnpKZMutGUXxLoK--
