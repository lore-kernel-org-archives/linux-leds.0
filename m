Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882F331F9A8;
	Mon, 13 Jul 2026 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959662; cv=none; b=FCAt69pZNVw5nKIVOpFhgu98SLp/zkVYZO1CVaBPiFQfW5J0xAYvgAglTUK5Dncxc74MkB3i+Z2XYela2mp4Vu5j+W6vAnRSIuI6nE29JX2xY7MDPMvj5T4oGYxBBabVB7vwVzJGEurAzg92uJUxaibhhjQIkbc0TMgq4eFjNGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959662; c=relaxed/simple;
	bh=CZuU2nwPdOwLla8Is6fZKgR8o6flmQzOs610sHlRGF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCITUB6NnLau07he4x0y8jlUeC6J1hCo8/tCXxgc6ydrOCLVPu6eHJlv1zEFlqQCEW+O0HijzQ0zL5TpJQE758hiG3fPcFFIkjxzrXfJKIawDy87FiVRBNFgLJv8rLofIrzNACvP6wcE+T666zEDm+qf1NUJpU9Mg9vF/uvVLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAnf3T54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAnf3T54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9C31F000E9;
	Mon, 13 Jul 2026 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959661;
	bh=CZuU2nwPdOwLla8Is6fZKgR8o6flmQzOs610sHlRGF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gAnf3T54MOWerL4i9c1iRvBwGDSvRE1i0ux34P91ZULsdzmT7e7OG58wv8C0zhOXY
	 5I7KbPIQWuEftzmgDRCE6rSNfvGlyfaOUl1lKGf4vxXcXj1/uFcVwhksV/eouFg+VM
	 3BQazf+Rbubnx8pwRltBBmYCPasGtaC1BUP74cQ86tQYY7vlw/NwbVpzQvdcHqQ592
	 OSg5Cei1gEqM6vEbEjGJz6EtaUzEj8K4vEEH7d38zLTSh72slTaD4yHKTHSkeVEA+M
	 hmpSdbrCY0fbjfabDIObpE6762QYzc/vvYU/lzobV1AYdmR6iJBcyDvXjSehsp/pol
	 mv2BtQjgpv+Tg==
Date: Mon, 13 Jul 2026 17:20:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Message-ID: <20260713-chevron-buggy-fdb7812657f9@spud>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53fdQdUunGakAevX"
Content-Disposition: inline
In-Reply-To: <20260711192842.845048-3-samuel@sholland.org>

--53fdQdUunGakAevX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--53fdQdUunGakAevX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUQaAAKCRB4tDGHoIJi
0u8FAQDxnQgyP0pTRW9IemWBr9emhVbwxDD1qhepCwJraKJ1iAD/XIKwhwY2gXeY
9N4VkrL6k8eUsvVgTlf0rewh3twpIgE=
=U5O4
-----END PGP SIGNATURE-----

--53fdQdUunGakAevX--
