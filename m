Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101129;
	b=JnZ40765hdZczzRL2nB9XF0cZPCO0PtaQr87tFb28MY1sR48Y2wV0FGgxRdr1nlPgKbh
	 LM+SgUk1Jn0HNcPzwLfBP2w7LTTMOvY4qGXwGAjP9n3uGIjdkl6m66N0o88oFBV7bUGaS
	 YHJvZYm5l4OUXxVJgXNbNKz7XyLhlmiyqwv6o2jj8jkEsKd9LmNJTNMttdO3OtBHv9Ca0
	 xI+5RGRIHBspziieVwBhuKjpwYbVqtO43eM+kJi9aNbdQPG7mKX8mzZo5GKXdWGw16diK
	 48J5cAVcUhT94/mpiTKayYFkoY1wOHFShqodK4FlPKsFEZw18UNMZFE4DqfR5Ah4Zpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I68+/4H5DUJhJmSPJ+HUkk22Un5uwRn3JLfG3U7F33A=;
	b=3oFP1woNHQoHqnvIZ5n/qH1lrT4FhNWjmd9/WbtRMmhVweph2dFOwa72JWFzJB73rZOt
	 QgF3dDJM5Tp+ogUEXsBKaCigurFS+iydJ7cgWrccf9OIP3MXN627HflWF8QCyVy2pLS2o
	 zD/OS15W84xXqt8mjOtV2b+bNA7Ky7nJm6NDiY59uR8lWwG227BfawannRXLWJbkJKHxR
	 xJjDV0Ox7d9II/FxPodMbM9MeDQNZMy0cNB6Wynb1EvDZP/n/5UUV85CA/o6c87KTA5TC
	 VaPy2PYbTaOE7bm+UB+Sja9ucqQEDq/UPVtOg2++pqDrKwmlaXYCYXPIWTPnK0TumkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/9Vbue1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AFE606DB18;
	Tue, 27 Oct 2026 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/9Vbue1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F37A1F0144A;
	Tue, 27 Oct 2026 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101128;
	bh=I68+/4H5DUJhJmSPJ+HUkk22Un5uwRn3JLfG3U7F33A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c/9Vbue1Ihm0wi7+oaf1aeybezGNZ3EVwj/+OM6E0/gdWIq3uLWOG2vsK/GeIiqvY
	 7DVEt2InY1nZNqoLAtJ78+ZClPiRlG/L2n+0kXEsb6JoIJz0aqheX7ECSAUkYoO2/I
	 pK16HxDLYaRZKckbvLU9wO3ODMMbhPjajNW8sTON1GAwCoplQ8uv/z9KHFMz8S0T3Y
	 BheO12ofR02DVuDSUCG2yptX2NRgBz6zUjg9MJrCzwEEKNrXOVgozb08vun7ORkO9C
	 4RnHnOOWKH01Sq6NcRZ2jI4SbVqWCAwUTpkxQq07sM714v6NCuSLTkR6IAHj1ML58N
	 5ElD56YF1lxMA==
Message-ID: <sashiko-outbox-186465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027113230.47538-5-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
 <20261027113230.47538-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:38:48 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The AAT2870 supports a dedicated main power supply input alongside parent
> power supply for its internal regulators.
>=20
> Add support for retrieving and managing these supply regulators
> (vin-supply and in-ldo-supply) using the regulator framework to ensure
> proper power supply dependencies and power-up sequencing.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113230.4753=
8-1-clamor95@gmail.com?part=3D4

