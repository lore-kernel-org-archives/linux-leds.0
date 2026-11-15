Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742758;
	b=at5IDAnFx1QPE/P0GgdHbsrqo1P32iSqoE3oZbXoiVTdSNriRlv8DSgyQjdf4RAs/UOd
	 TFzjiFzRvdPJexldoU23pZotCJAZ0mGIi/PTisHOR5PkuhtqRtZPkBYsgaQp37qaifIuI
	 wBZ/eTjSnQvh3+7k7vFjPcggj0cpujZgBJPeZSCySns8WKxN9L5ovBee/tFfrFXsgz7Jm
	 7FiiyWxsoqwgAZoFqWB+Vxtr8HGoBCHbpVJ6oWHt5Ub3p/OslJRNkXccJJXuDq+Hk1ZWk
	 c6D8t8rOKpjJ4oKNi70G9HlnN3dGiLsWhSvUC4lKQSVoa3Ig6T1yOsj8AE85FAKrTbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742758;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=GAIraa4PzFWLg6UhGswjPe5UPHKE4vtWfL9FAp0+yGY=;
	b=mI7fEhwp61pSpLOxApcxhFIdv2e9ZLl7M3oG7oSqEJ1L8ILTh1882gy2gJpyDJyomdKt
	 5uPtd2Pr7FaDB3Ccnp+sTbcBowBtoCb/ep7YgnkYOMIZvJTljRhhZEnAl8uZULoTt0PXn
	 1c41b82c1vNkeKxZsOESzwKCKSm0W/6RTyUEkTqmQOJ7qhluHl+zTLfZmOvbtOk1rEQmH
	 T+kHqvyR7WgRTzQJLHHouNTVnHDFU6CznlHylldywO6RwhdHJBRiI9ihPZFloyMYDWH2/
	 a2WN5E65hJH6158l7YBoPWiWoV7KPY6n+mYc2ZjytnJEkhzzSxG/yeLY8TiMdKQ677A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IW7smJ6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75533606A323;
	Sun, 15 Nov 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IW7smJ6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DB81F000C4;
	Sun, 15 Nov 2026 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794742758;
	bh=GAIraa4PzFWLg6UhGswjPe5UPHKE4vtWfL9FAp0+yGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IW7smJ6vy0hdpqFnlaE7InL7y154C+zROv72lq4JoVMqMXReLiUSLcf/4Dzk7zNCl
	 UdWgOG0++6l/1QQNhA+k/UZVxe/JPv84HpgM67UKl0yjAHFF1m7/F7RAgP8WqN44Zo
	 fk79HADrUK8XL4TFpyNXQq5KuWiHDy86+2PKOXQP0A/yzJfZxdNo6bWdBgnWlpvqOe
	 6IttZ5l/gmzRQFJbpVyKSBNIsRhq7e908C93E7o6e4fxbq8hgizMohFKgGs0+k0TsY
	 w7GsxG6H+xpmQlNYF7yP5h0oehwVN10dEHXByLe2d5+/F5xfPVN4GuzhMEZK2pi1wl
	 XGLIa+pBAQOJQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A7258334D279; Sun, 15 Nov 2026 11:39:15 +0000 (GMT)
Date: Sun, 15 Nov 2026 11:39:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
Message-ID: <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk>
References: <20261115090520.102216-1-clamor95@gmail.com>
 <20261115090520.102216-2-clamor95@gmail.com>
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
	protocol="application/pgp-signature"; boundary="OiwUGip2trYydk2B"
Content-Disposition: inline
In-Reply-To: <20261115090520.102216-2-clamor95@gmail.com>
X-Cookie: A watched clock never boils.


--OiwUGip2trYydk2B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> The Maxim MAX8907 PMIC supports a single LED; document it.

Acked-by: Mark Brown <broonie@kernel.org>

--OiwUGip2trYydk2B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavmZ4wAKCRAv73Ows9A4
ieqxAP439ipWRWMgyk+tkBafSc5m5DKtVkYKSBxXqRc7DTfp9gD/RPAOD+XfauK3
RyMNdYLGzSQ/zNSeJYyFYtNZLnSgVAc=
=d4M/
-----END PGP SIGNATURE-----

--OiwUGip2trYydk2B--
