Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA935AC03;
	Sun,  4 Oct 2026 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132591; cv=none; b=Oiut601EZTWFAw3o69bDpMCNTNm4bzSltydYGQHx91SAuhX5kFTdSB5QhLXxPU2F0WqC8DSMLJpQs9es7taUuoORf9QizeDU/LVQJ0jnMQpgxZazVa3YmgXg6/InyuInoDwZcWKcbFtBIlT+O6E4BMCeo0APngqFWaWOAqgJNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132591; c=relaxed/simple;
	bh=2GvCWs79o3I/v/0fMpds5qr0bL0VPOy289wv50sqoSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oaWMTV9d7N5B9uj1d9FbfvmN2EcL5I9xYPDNh9pj8jijKcNstRzCUSxFx0f9Kk4IaWfrLktrIQyg3uVbA+ZjX1So5yebcRAkilW7W3Hhrb8VQ+yt5BWjRAV2Ao77czDzJiV9mk5wRsbpF6wUfNGHgrJjXrIntf1VE97OnIJnjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9jAW5Wv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9jAW5Wv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B61F000FF;
	Sun,  4 Oct 2026 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132589;
	bh=2GvCWs79o3I/v/0fMpds5qr0bL0VPOy289wv50sqoSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n9jAW5Wvo4kuVJm05eprG+hvvPkH/Q1Cnk5FigX4e+64Q660+F72KU+c9htmhQL5c
	 C4p+5WNlOvT9iNSwC3FxSi7yaDfKRgrHii3Got8k3C5pViNPKrQuig/oZ07vy+X+bg
	 xB9lP8gLp5thoSt19MSDsp+JJIKf0/JBRrlYr+2z7Asqp1JAyE52vmdJVXIFvTukgM
	 CfKUcKDSKhheqn/QIy1whEggHT0KDliFNEFZEqBAHJf9JBVJNEaMVSyYteggEPpYPQ
	 TG5GnhDPCVT7EeCzgOqgaSnW1dPeFz8VG4SJqqdIlnP6enyZkaBewP0qeT8SRMeAdo
	 S+x0uUEeD5RLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org
In-Reply-To: <20261004164121.193514-4-clamor95@gmail.com>
References: <20261004164121.193514-1-clamor95@gmail.com>
 <20261004164121.193514-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 16:49:48 +0000
Message-Id: <20261004164949.4A1B61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The AAT2870 supports a dedicated main power supply input alongside parent
> power supply for its internal regulators.
>=20
> Add support for retrieving and managing these supply regulators
> (vin-supply and in-ldo-supply) using the regulator framework to ensure
> proper power supply dependencies and power-up sequencing.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004164121.1935=
14-1-clamor95@gmail.com?part=3D3

