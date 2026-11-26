Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699464;
	b=Iy6lRPemILxpH+hkGMPsGMmj7GyM1SYab+3s4KYc3CGLWpxqwyvboUsfswCzG2aWA+Zo
	 sWsshyp2iGDy10ojkuwtKJFvgMczILb1fDwxyiOvFObkmvh47HhOeqWSQm/KRK/qXQ3A5
	 a6/hF5ZzUysvPuA1j1cY4BhW5RvzVviZxuTmNAauU7LM2Sw0tYf7pMa4R9Fc3DujOOHyC
	 Otc8Uo68qyMOR4OVllznqsfZdxR9o3wckdnUusT6PYkWUGjSCKvtG6t3wbTWxvLnZrjyZ
	 J06sq1Htdquw9L1oz89XVwBmNfUfoWVLJZ+HmOBDZZDO3kl1x2kuczNt/W/c4jLBVQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699464;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=mDRopIMGwzT6BXaAxV2Oyojc/oFZRkepQ1GugoEYb6g=;
	b=e7KOdfgYltgNZjo5T/5dHq02hNwjFZw7ZHNZgkNaL7mvHB+/JVoBoWvK5nA8/RG+rnCv
	 OmI1NFwj9UstjxuXBRusnOr5rcwQB9kj1nxXzaw8K6by6BzBigDfr3/pvj4+C7WHYhv4N
	 Z6JP9WBbsjXiUdvBRKqkm9mE6KiLh8tiEns93iZJmhLCpXqHqaYS50rPMBwcKW5uoHI1/
	 8ENORqif9GdOVlanvdginA/gGo45NwWb2UKVD9gXBuMIGBRx7Cg8NIyrYriijvMb695BG
	 IAQMW3Og4k0z2yh2J1fAOc0yxlPNsaK5TYsv4PMguaEK+zZNEUEf6KM4weLvGoqNCrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6e3aoGS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBE606A31C;
	Thu, 26 Nov 2026 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6e3aoGS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189B21F000CF;
	Thu, 26 Nov 2026 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699463;
	bh=mDRopIMGwzT6BXaAxV2Oyojc/oFZRkepQ1GugoEYb6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e6e3aoGS0640j5Ku4TsoqAkyqH1F+0CxEp7J/eWhK1tmNeWxFkoq4i9ZlM+sU8PBN
	 tUuCwYquvpJm07Xa62MYFsm5axfp7KzW4nDo/G8pZH+2J8m4ymPw2ThnZsEI0LlGnf
	 /09iPZXBvFzGX+YIOHgG3kG4W02bQHqReLMGlymP8UF6uwp3DO1R7jvMGOTu+FECBC
	 FY8w2/jAi8ZQXucFE5buDMrfqQq/mgt9uiM6QYO5MjD0mogb0jJ0pbHQweb9CE4EGu
	 TXyUBfN4Gqp+XKPQipNtuc0mJr0/88yZBrstffJ7O9JAXnUh2NsNR+pYlg1RgjhOvX
	 X/ICZnkb+F8fw==
Date: Thu, 26 Nov 2026 13:24:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
Message-ID: <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
References: <20261115090520.102216-1-clamor95@gmail.com>
 <20261115090520.102216-2-clamor95@gmail.com>
 <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk>
 <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
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
	protocol="application/pgp-signature"; boundary="lkMTXpSo7LhnuO6t"
Content-Disposition: inline
In-Reply-To: <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
X-Cookie: Please go away.


--lkMTXpSo7LhnuO6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:29:36PM +0000, Lee Jones wrote:
> On Sun, 15 Nov 2026, Mark Brown wrote:
>=20
> > On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> > > The Maxim MAX8907 PMIC supports a single LED; document it.
> >=20
> > Acked-by: Mark Brown <broonie@kernel.org>
>=20
> You should just apply this, I think.

Well, it doesn't apply so...  :/

--lkMTXpSo7LhnuO6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIMwEACgkQJNaLcl1U
h9DVKgf/WBUvfJFEfyB+Icwbu+WZM8E1O6+ZQbHgkeYdjEq/RtGvMdulmi4CV1kE
uEzDd6ysp0d5ym+f82MslPo6cYTUZ67cI/vUiReHdXDFogfVOUmErvP9y/OvebxY
kp1EWQu9kcx3Z2w3HVrqP7Zo2RSmSgTH3A+k3AY8ZszmSwkOl2EIkzNNnAlsc/ZE
3FpyM8IZo9WIb3s6/s79QEpCvkYVRHR5b+rN7DNhNuN/sZmwFwIDqIpApj5lR7sK
J9Ugul2CxaAvsykg7acJCf1KW02VZ+7WelqsVuZo8rwCG7LfnljKoxgfLI3+tGJF
rXUfvMaksguAe/7sh4K3pTfkJdlj1g==
=6Ev2
-----END PGP SIGNATURE-----

--lkMTXpSo7LhnuO6t--
