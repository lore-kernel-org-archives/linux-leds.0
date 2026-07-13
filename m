Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E030F92D;
	Mon, 13 Jul 2026 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959477; cv=none; b=UyVa3voreW6i3XLSllHlXZdB042YSYtxEl0YEjLBF3ImIUd6YyCW3o6v4ZEFJ8GCEicjAY/W05L/cG7HXgXKoBbUHdIuUkyT5XldT/R5XXfSPxHmiyqdF80I2l30VblBiC3LaA8AKHxBVwkvA2vuZHZVhcaOQgWXH3sWW62yNfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959477; c=relaxed/simple;
	bh=tuwF9vwESMLqkD+bDFietU0mxhnReLF+5GhxbApRbqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPXh6cO+Txd0IpXKzKkPa/WAaRBWosP4uEFCVYv87wMHSNh9wLoeQDFZ8A1HNbHP/gx4/TRBOzXwHhOcrWJFLD6j55pemjapgsJaLHVAcBzU81zWRF/HVY5PvwQZGslJ9c4h7OkTk6Qe+GFgERA2RQrEndrhROSEo1MQwz0rNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JledqyFq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JledqyFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED641F00A3F;
	Mon, 13 Jul 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959476;
	bh=tuwF9vwESMLqkD+bDFietU0mxhnReLF+5GhxbApRbqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JledqyFqn3TcSRwAL0y2b2vcOAjaHitnZRcP5Cnu+4wadG9f8IDngb8YvUQ1mCoaO
	 UDBx4imS2imCStDpgzCbZhTBtk/CbjSNLO4AMC2E4hz+bVAnBO4aN59rJTFvQfql4J
	 2XAqa6kp5Yd32f47K0oJYnognME+dhe9H/a9OY9w4V3dmlRVvyFpxXjbXGcZnSzSFP
	 X0ezjYLEE056P1qNRzN0dWOPq/zV1qVeFAJwDstbHW5dGByrRdr8gny9KVOEpkMK93
	 ZLswKiCeGYfz190CT0rBCs8B3Fcm65MsxU9j8gdv2pRkaqBW0Vg7f+HBvC9W+mevST
	 sABuQoRqCM+pA==
Date: Mon, 13 Jul 2026 17:17:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH RESEND v3] dt-bindings: leds: Add default-intensity
 property
Message-ID: <20260713-preachy-tinderbox-5d73eef5f106@spud>
References: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s3WRRSQLhh5beZEZ"
Content-Disposition: inline
In-Reply-To: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>

--s3WRRSQLhh5beZEZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--s3WRRSQLhh5beZEZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalUPrwAKCRB4tDGHoIJi
0gqCAP98rL/t1xK7uPgwytUSDHlpe11BjbBYcqn4IJ8OVZlP9gD+JwzM7NsMDFfG
4puEsdJDinSzumwRmPYHdNWbulqK/wM=
=zS4X
-----END PGP SIGNATURE-----

--s3WRRSQLhh5beZEZ--
