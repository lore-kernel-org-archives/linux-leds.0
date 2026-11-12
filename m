Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518725;
	b=taabvFWbbaeoGyoWy9S4Cp7Ozp1C4eGgmQFzlvvWeZr7gew04WXsqzRllKsWH+qFYIpg
	 +jC44fC6jnVbJeQtqMmS2oMrRLHBr67w90OWd0zyj8FoaU7znedaI7a51lNUJPAp1aFhh
	 HnOVDEvALjX4r7Cv69K/cAhI4RS0QgKb9qJG7mHhJw/kVk8xdC9VCDjtFa18MLYxXD6lW
	 uqehp569ejHBh0XfbUtzKAtmtPUzFaR3N4yI03Yw9xy3sarVUAjk8LyipkWtRgMmxpyNc
	 tVHgjD6JX7UnjBKqwDJDaW6UisOlVxBJ658ECoV5Co5FEZ83UOHBtlVU4O5VTHXVsjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518725;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o+ZEP2guZJsruRupNmjFh819zdPt8j8t5h/tum5EyIs=;
	b=i5H2m8Nh4XMWBB16N+aFz+z30WSLPYatGOFYh6xZyWefFaMfOyHLJDvvInW+/2dFpiEf
	 f7RfJBG6WfWvsi4exj3l5VIKDRn1kZIzugrb84//8IYQ5Os3YTBXCrs/tfMXIP2SUzrk4
	 T7Sg6N5K1nhybg+ysrPnpJoiywrXH/ycadU3RgYfnrAxiewMlV+qZJ5BJLGsVrRpGjgma
	 2m+07h3qgyU0UiyDJ0eFYGHoxiMCyvvcGKbda8e6jD+fxIbb2keU1QwXO9nUHIRigj35q
	 OC97HNoIX8CALYNASYrPi4kdwIC/ALIGa4CadCE7uEc/2aovoaez0AO/Z1MGeLPUx1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dR9Bs/9N";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9013606A321
	for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dR9Bs/9N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810811F000C4;
	Thu, 12 Nov 2026 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518725;
	bh=o+ZEP2guZJsruRupNmjFh819zdPt8j8t5h/tum5EyIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dR9Bs/9NxDEv8RFz98f0Asb2xgzHap6yrvaxFHsTODE7b4gUW9+wvPPj3+vcGe3nP
	 9udHaNdYU/OZ+lnGQF2xJLMzIbjZwRjaRBhsxA60H9JxULJ89OMX+h1oV/orlyurVx
	 up9gJL8kNapEnYqRXrDLPFVPKYjyn/ztwFKPgNokNDzJlohAa03SSGM77Qw2R9kvgo
	 4XuQxvqvPnOcnmKq+bXh/MUKLjS2CMiGdBcmHvob2pWq45kMJrsfYlfD98AFUGp9zI
	 lgbcccuT7kQax3v2qGiztxCkaDtvTwIJZTX+VVv8CWWlZYamR55LzmBwXEvmzI4wJ0
	 a3BCJBr9aklGQ==
Message-ID: <sashiko-outbox-211863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-1-b2c5e323a90a@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-1-b2c5e323a90a@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 21:25:25 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Paul Sajna <sajattack@postmarketos.org>
>=20
> The aw2027 is largely the same as the aw2013, with the
> exception of the way the max current is written to registers.
> This exception makes it different enough to not work without
> driver modifications, but similar enough to fall under the
> umbrella of the same driver.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-aw2013-aw2=
0xx-rename-v5-0-b2c5e323a90a@postmarketos.org?part=3D1

