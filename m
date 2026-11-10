Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337385;
	b=ReaVVdDT5wCUsrSZyJQ4GZ4oy16Npwd58pixkg5yMKPKP8GIBTDB3oOPHOUJvGlC9v3T
	 RX3LesPxTBHhMIPMFDe4irWinzgld2//GM0nE/cKKy+8LOX47s8PnJ8zh4ONb0Bvjk6Ux
	 bywba5pKUUr1djzYD4miVB1FaFe/WyQY3qKDNOL0mUUW+kuMp1M4fAx7CtbPb5xqRUNQ0
	 fla8+vDwDB5Zx5nY8ZsRnt1KQ1Q22Rw3AwJ6uhCeBU8TSHUhWU0w+c17R18/b2SHeRAqV
	 SeVJYaK9RL4SqvD6SOGakdHK+qTGQgaFma6Y+lvh5ECQp3JpmQ5+bTQhCkVse76oWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=/PjZhem9Fy6JL3Nw2p6DDW52np5aGp43vE9XJ42j9eU=;
	b=3GH9SYJrL5vGWJw6Kl1bCyfYdnV5N4PZ9mHLampN8nkS1ANx7/epvfrbMVgr3lVpQreN
	 Y7syojaXGGEcOhl8FxIJl02542XiJwOWSxMj7Dzujyt9dp9vrzeoVgX4ZlduslUcn5QJf
	 Tic/22j6u9ghDtN+yERcj8pPuZvfvQD++zuGvSieLMNYMM/Ay4Y/Is6KAh5CXPh80KJ9Q
	 hdeS4Uv/QDLyUSeRS8LlGGyujrzHQiZp8Nh7vBxCwmU4CyP1AX0S2PQCl3XlU0nDLGAK7
	 nUSMocJm0V/ZBNuz+mlnAvqA4mkPSuSinP8wSgOdZntbtTgZTCENi5hQCWk8nahWj+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1QoYXJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB9B606A320;
	Tue, 10 Nov 2026 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1QoYXJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC741F008A1;
	Tue, 10 Nov 2026 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337385;
	bh=/PjZhem9Fy6JL3Nw2p6DDW52np5aGp43vE9XJ42j9eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V1QoYXJD9tflrzIMnyiqrqjWKZ8LsYBm2IenrZjL3A6jVjtgvM/Yn9+IjEk5dncuj
	 On8xbe0+qdk47L7Oq4jPClQ46H24MWVDls54Umxu1jRlRFwZO5IEoganktJ9rrRi8k
	 JHGc03JhSBcBoANuQfEzfubO2iTqluHATaoEWWlW4nn7hTCtKLZ2joJ0wq1sQWgkcB
	 G4vpFRHzCxtrhqoSTIBWyXhjOB1/LPVf6NF2f4pYrQQMwRgOTwHUSp151TLoBxcczr
	 5fEP0K0pHKlgA4O3OOY5xUdvu/RV9Q7ls8B75Vt6guXhmPeDHudwt/JqZSbFppixur
	 MF5q9Q58m/m5w==
Date: Tue, 10 Nov 2026 19:02:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
Message-ID: <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
References: <20261108151348.204182-1-clamor95@gmail.com>
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
	protocol="application/pgp-signature"; boundary="7eMEJL0RBZ9sH+V+"
Content-Disposition: inline
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
X-Cookie: You can't take damsel here now.


--7eMEJL0RBZ9sH+V+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2026 at 05:13:45PM +0200, Svyatoslav Ryhel wrote:
> Add a small driver to control the LED cell provided by the MAX8907 PMIC.
> The LED does not require any specific configuration and is folded into the
> PMIC's node.
>=20
> Patch 1 of the series requires this patch:
> ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
> https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

This doesn't apply against current code, please check and resend.

--7eMEJL0RBZ9sH+V+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzamIACgkQJNaLcl1U
h9BzNQf/TV7Y11t+TQpv58LlQd90sRSGdPg8xP0doArCvthyydcTGUovPYVorBXd
B4AP5zjo+FyLfZjj1F/VT0NgkFeQtOVSwQyeciK6jEnz+BdkpbvqpFBKzjp12HFE
H7H8GoCXRs8/P0cKKO4c1ODtGLHQMTYBAKVdiHn1w6FSgsQxJ16okDsTweuLuwEw
m3BBo8/2YZYbkO/FB94ZbrPbvfubAU6r2hzl2hUMIBd2FoIwdpGRStyVmG3smIm5
Afw5VUrcB8MgI4dY5U7JpQXoYq0XlGieO8UkakmxKmbS3HrAvgprlNqmz/mtcgS8
1BRIKPQe6Q6g9qoR9uG90JH9xri6tQ==
=HWC/
-----END PGP SIGNATURE-----

--7eMEJL0RBZ9sH+V+--
