Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B22498922;
	Mon, 19 Oct 2026 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404756; cv=none; b=rYJLwYmUPrSc5xG9yrm3WEGD+cVpGn3f6Sw1Exb//vKkM6DOAEEgY/Ky5klN2cALl+2ppCVr24Jwwe0uEOTUW0+ZMl+GjF1b1/kSKzurGrIdUevl/m09sObGzPvjYa/P3yI2AVnK4zJmEFL1knhR2ByCqe6vjwj5Gj2gsG7ytko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404756; c=relaxed/simple;
	bh=t6akOkspDM6DuO44EedMLUgBQZp0uz4pPTQNubsWsMU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jeHBBlVb/8Kop6/ib4IGykcUIA6UfLOjOQKB3v2T0FfXej3h3EyiKKuyYY0eQDsDZIFk4//yfNud/sQYSBYPfNCKZ0SHduX5GjCdfUMnLahxsY7AXPgivdd4G26uw8YkDNj2gL6PcA4/rNhIL9wWWMsiHX3a8waEE/jm7T6kX+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Smo1v6vw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Smo1v6vw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C61F000C5;
	Mon, 19 Oct 2026 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404755;
	bh=t6akOkspDM6DuO44EedMLUgBQZp0uz4pPTQNubsWsMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Smo1v6vwGP++nBiJEgSI61+Y2qL0nhLAcS7ynFl3r7+qOt8PNu0er0+IIw+OP0SDH
	 z6nhRpM6jocU+W7JVVDiapgESHyVgxSk96CZo+4AGaTbapt5bSE9REz4Jd2eOdoNNd
	 GNDi6hLCGXbWWda9HBTsaq/Wb9xnFwuHDaioKt5TFqDJboHzwPJRp4re6BaOvErQ1z
	 PO51Qjdh4SsWZezPwtLO52QyMCJuwbITKj2i/YVL198Mi7Ll95xSJIs6kzIQnv8w15
	 5dY64sR83lFpYIQwMv0uzTgxwgDKevvjwC0KDMaBVeixOnxcO5ZfVXnrmbCBzb7Kus
	 MKHUNxlndvy+Q==
Message-ID: <sashiko-outbox-176964@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019100930.110954-2-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
 <20261019100930.110954-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:12:34 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backli=
ght
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100930.1109=
54-1-clamor95@gmail.com?part=3D1

