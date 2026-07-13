Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDE40BCD6;
	Mon, 13 Jul 2026 16:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959737; cv=none; b=M69dBq3Pg1N1bmIXP/3CDpbR8NGWxv0HsisMR6Ot4Efl8Y1KDSTHH4+W0tR98WUdJtXXsd5m3JEwA40BKFxDvDnp/psAbQP6RQ+rfuSkUSYt8ULPIBlv17Pn4NpqOJiZBpH3LytB29kYB5IwYhsfNIkphaVNjCHuVr8KAspF3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959737; c=relaxed/simple;
	bh=HBSmQklKPp0n/9DUVTlSZldsEFQEEOVdWWf47uuF8oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjgVIWk1SNDvhtGAeG4UnoIqbxZb2VFL6ahT5M7C9i5sZAohr6y3p8fmzw0EyQZU655E3TGP5UaVFpRN2zsgmKnTExqUJT2/4lg5TejNgLpT9hefC8HQLIm79aFz7HbfKHDtdxgmHouBb2Q1DCx+/Y0XWVT3ayhjL1gYFVIS0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7EM2B0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7EM2B0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E301F000E9;
	Mon, 13 Jul 2026 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959733;
	bh=HBSmQklKPp0n/9DUVTlSZldsEFQEEOVdWWf47uuF8oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D7EM2B0sIolWj90N3V8D52TZnBRz0Mg+TfKsifOxkCyz8xJtKwVzbUvW07FuMM+8d
	 Fk8YpUQE7JbVvMvfvdbQ5QpgenqxLXb5M5++ADYcxosShWzgkAUc9qBR4rOegML/fN
	 hkzcjeX0oPfXprkkI0fvfgGQe6edAa0+yYmh9N+UBWor9WiZX8NtkPor6e9aTtSD+H
	 y0QjYuuaqKKUNSBwwRQCcXmU+aglQEk+oi3wpcdxjlc3/eT2DXPeS5PJwpjg3OqiJW
	 siBOyBxDVrpt9w2g6C/Q2MvMbqj69Q7+hT3skSeKVFoqIQef1DyK4Sdfr2g5AkbRxn
	 ASGE/bhX00YCA==
Date: Mon, 13 Jul 2026 17:22:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: rockchip: Add LincStation E1
Message-ID: <20260713-unclad-everybody-263f3beef672@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tEq5gXWOcvJSqEpZ"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-4-samuel@sholland.org>

--tEq5gXWOcvJSqEpZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--tEq5gXWOcvJSqEpZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQsQAKCRB4tDGHoIJi
0olXAP9w3D4pHfVHHnxQNCamgP1X5vtAm9liDaxGGK9GW0kSjwD/Yw3Lo4gcWho6
n/O6FisFQl/6eiqfqtdb4fxzVtTnLAM=
=BUJM
-----END PGP SIGNATURE-----

--tEq5gXWOcvJSqEpZ--
