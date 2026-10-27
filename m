Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102279;
	b=PVAMg0dHQOVwKmIZr2/aEetC0ojDu0QUg+UgYcc9FvROLb0YYlGNvG2zpnf73AHtLNFv
	 VcRiUUXLyTjTk7fnTPgcu1vrElYvXr2MUPy2mPVOfPNeqK/iJ1eLxVv3EnA1Zi43FcHRj
	 Z6ARo0R8+XM+CFNzrwmQxwe2yyFNSwNtAGYIs7nonbU3njgnLcT/e+RjuY9XsKhD8W0Xj
	 iO1OB6k7YyFDfSHzih0VVrg7U/GN3kdS2st26b6fXsTZP3NoiOaFf4p3LpgK1M4My5bS1
	 ZlpvjFsY7jQ3SiUqi7ZGTV8aFSpuG3e+yeJZtxWf7lcKXyDNDFetXV8aFq/txSprdpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102279;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cr06mdMQfIwpZAkepe5+jK3LjB5WUrq/BxyvLHpO16M=;
	b=hB1fBN7BOpcXx8CR2JNYok3I2tkGWGu63By3QVaNcoYIhTASq/GOwI4AXyxO/cvF8pLi
	 uHKSOm0li6Z76cCGnk114HAyqAYydgLWcMfDjKlWA/oD0YwBf6IjmVvn6IXF9n3onFhMA
	 iCdpm7h5K4XiQYSyXg9R4j96DgSwl8/1Cod/qFBDLWak68bzmlQXgofzW7tMbueWhuvc0
	 t3/zgwso8Klq0hIh+SbSuK+ANgSQc2LW86eikbgVZNUqW7uoW0GRsvYbHir2nmCkECZzI
	 Hjai+RqEKxxulX02BIprfxmIC80OT8Ppa0yZjX9nZ87Mk3h7lJT82yJuSTykmOc6CmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ipy/AboX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF485606A31A;
	Tue, 27 Oct 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ipy/AboX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B771F01825;
	Tue, 27 Oct 2026 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102278;
	bh=Cr06mdMQfIwpZAkepe5+jK3LjB5WUrq/BxyvLHpO16M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ipy/AboXs04qpK7DtuAFte+VXa9EwsqhSdL6/3aCtkbIpRaEu27iWpkbINnukkrbg
	 VfERic6ZM8emZqg4KsOX1oPi1kdz3rT8eAf9Xj2WB119aiwPhNVetXWQPq+4TisvTn
	 GYva3S7YBsrOY0a90grPnXPkT+6BmmTh4L09CC9nxZJROqn8wYexMYNelVOMR08MHd
	 WCGEY64BGZQDVodVPvzj7Nwt49xP8jpbRL6tMWfob21uMCadcRmFQ0n2tCPxgRPpKT
	 eYPMTbLa52/0b6jbKoTPs5j+bbyNcmYDJIeKCm6fgbra6txfJgmRBFxEF7nOV5KZft
	 ZwdThjsLn8NLg==
Message-ID: <sashiko-outbox-186489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027115006.86032-1-clamor95@gmail.com>
References: <20261027115006.86032-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:57:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add a small driver to control the LED cell provided by the MAX8907 PMIC.
> The LED does not require any specific configuration and is folded into the
> PMIC's node.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027115006.8603=
2-1-clamor95@gmail.com?part=3D1

