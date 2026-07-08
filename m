Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA023E92A9;
	Wed,  8 Jul 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527944; cv=none; b=SgLIqqHyqyr/qRpXbMTyPzoDV64bpDjBKLvfkKEZdtKpMFtWfmEXnWBpET/v1w1DvsBmez0S2xyFVf2/Vg8x7MnUm1qqvfjRvp4dPvHTQkgdzJqPpYWS7arV22HdXaaeXh5je8Ynp2BjiTTQbP61acX+kHMGdKY6+0HruCN0M5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527944; c=relaxed/simple;
	bh=a2tNkFRfD0KlQKBP31jaMgHQUa/TYY9ui16VFcmcGKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWTTko6fdykghw0YzCyznvkjHan1W0u/zMedQq+ROfta8LFpx5ydoJ5RP7UVfNv2HweZzNo6wcAb2yETGoXJExmvjj3ovtrRArU+J1ObyXRmVs8zJuqVDlTC6WBG9hxY1vmPEhrkHTQJfpUHAohNRq6rpwiOnu06kQrGwzHRGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAth/HBe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAth/HBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891761F000E9;
	Wed,  8 Jul 2026 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783527943;
	bh=a2tNkFRfD0KlQKBP31jaMgHQUa/TYY9ui16VFcmcGKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAth/HBeVSUG7lIoaOaB/S7hVURtBX+sGQ6L0bwXWYFnocOwfuxfdqGsUBOxOva/I
	 RTV9hEczbD2oh3B8b6W9GHwE70eHXRbGh5aFVoSZbnbipVo9Xvq2eYbKSjntEqysF8
	 pqs1MF2+RmJnwisM/iCpD5SDzz86YM1f+hVYXuRtMaqhvgrjIFCklIx28HMv0OSHZ6
	 fWyUWq6YOYkzdZUEE1NsiFzRqshoP2ym0rlKyxzOjBAPwxGD1zzcQjOEVbBHkTe3KA
	 apdV24OMlVr3/c1sGJ1QY0He3hBrA3kgDR3TRN1h429EwPyApv82QryYwmtIqVTxHB
	 Ewd/B6g78Jqew==
Date: Wed, 8 Jul 2026 17:25:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Message-ID: <20260708-partner-carpenter-7e7e09e3b2f6@spud>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJMf1EmhaTk75qxo"
Content-Disposition: inline
In-Reply-To: <20260708-monza-leds-v4-1-a7acfc524c0b@oss.qualcomm.com>

--DJMf1EmhaTk75qxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DJMf1EmhaTk75qxo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak55/gAKCRB4tDGHoIJi
0l7SAQCnafjiqROG8RStS4qX9PjmQMJAK3KQE78tBf9be2/cYQEAkejsF+lMEnUV
1x2/2luy/CAqsFF+pFGjKE6jk9S2sQ0=
=Lkhl
-----END PGP SIGNATURE-----

--DJMf1EmhaTk75qxo--
