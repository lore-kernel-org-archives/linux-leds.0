Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E8040F8E0;
	Wed,  6 May 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087003; cv=none; b=sryyOPAIIz7w5E8fZ+C36uSW/OOpgwwTchz79TTrq8zYQKOrurXVOgVUuSuzP8o7SmHl5oct2ZyAemSxqWv5XkGzl3SqE7H+3/qZdPZime4F71bMiBVicHLZa7H15NqDY7dZFQU+OemKdKBU01+JeLhBuiiM+6PVvEtYGsZx0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087003; c=relaxed/simple;
	bh=B7/qNq1u3n3ZOcgzC2TWK7t0PKswyuqMpCoMWRqO80Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oqxr+uhi7gdKBjs08MZP7jeAhxfy9UP6VT9z9oaO4T7GinllpxX94rmjA6vVRWvXe1dBwti1M2AlCd0QQIgmhJcoNjTMOW3G51URMWb1/MfgcW0/hBcZ7sl8qZwJG8FjEynRZaiaOBwmc+UKxlvOMVVASUZh1+z57rsO8k+eIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olmRl9YW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olmRl9YW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDB7C2BCB0;
	Wed,  6 May 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087002;
	bh=B7/qNq1u3n3ZOcgzC2TWK7t0PKswyuqMpCoMWRqO80Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olmRl9YWKsrfj4EGWyuH+l3WVviSkLVRVs7D8ANzehr0Va3JdecJ6Pv5rZOqgxz/H
	 K0rTdTl28lAauEQgH+XhUl1l0FkQkx0hPgTnYBB3HE/0oJgyvQB/B385NNw5b1sD97
	 emwPuNeEM7Wb7U9bDpw2TtDgH648iDdClC08y0xLbxLVQVroCoy2/jebNznCfo5QmV
	 R5aYyuBWbKqSe+Azv0Sfp3KlZNAraSzTBg+ieQaJLbXUFwqbRjkIc1RjXIL43S2oeN
	 sGDt6s0IfUsZTc4AE21ucpzOU6b7E3J0h4wFzRUDb+KjwxoMqiMc/LNWz6ato5d/Ae
	 u/RrQaMCT3+oA==
Date: Wed, 6 May 2026 18:03:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <20260506-numerator-overbite-7b3d5fbd52ba@spud>
References: <20260506064847.37795-1-clamor95@gmail.com>
 <20260506064847.37795-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kQ6ms4uA7wI3gn83"
Content-Disposition: inline
In-Reply-To: <20260506064847.37795-2-clamor95@gmail.com>


--kQ6ms4uA7wI3gn83
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 09:48:42AM +0300, Svyatoslav Ryhel wrote:
> Document TI LM3559 and LM3560 Synchronous Boost Flash Driver used for
> camera flash LEDs.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kQ6ms4uA7wI3gn83
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaft0VgAKCRB4tDGHoIJi
0mTOAP9TwZaECCAw0/M0scY+sxfOTQWI+Za5hsX1Lp+ytMTycQD8CvtS7xugqPNP
kGL6fLw4mtdAau8iGSR03I/npW15DwU=
=mjwM
-----END PGP SIGNATURE-----

--kQ6ms4uA7wI3gn83--
