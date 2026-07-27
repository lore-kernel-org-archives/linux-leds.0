Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939BA3F889E;
	Mon, 27 Jul 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164519; cv=none; b=UEMyURDCVtjmU1UnpaB2rSqhF+Xb7ZxvBtgXultGC4FunQba7nGeENDQmhYy1gIDaujPMt7+EartWQaSlWzunGrSrPyKy4GzYmnDW+Xice5ftSTBoA399Ij1mLF7B1o/xmWUyiscY6mOsJVMRyKcBey0dVx1uwWKBjjPBczD1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164519; c=relaxed/simple;
	bh=Z2zjuzy0pDhK4U1Y4IE9dKi9e27gJNBMdRULkakphbE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RhBzon99H3Nj8xpvvATE5enftSF0KoTlkKggTD9slUhFaIa4T079guu+NpayFhjhB+nNvwCrta6UttGXvhJpOU/LxVWCnn69nbOfmNFXPZ9KeLHueGg9O+B0q8zhxfZ7XX8LVCTzrwIC9wpYyl8mXuRfbnjYODnIzVPh/unMuxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjljQBdE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjljQBdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42731F00A3A;
	Mon, 27 Jul 2026 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785164518;
	bh=Z2zjuzy0pDhK4U1Y4IE9dKi9e27gJNBMdRULkakphbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BjljQBdEVkADguKn/Mw7I2Xwa/lU/8fvHUTIEkHQ4dyIWE6wPbU77BxgZ7l8obRyU
	 ZGMrzxN/M2fJ9GywQFtdX4pNj0ts1LnArbCcaUWd6f/jLba6WDnng1D8NJwdKpAryF
	 ZeuZEfQrw+RdoJAdGxBWIdo7VydGOMtMryfu2gB786CYICXrzlqzdPu6l6giaJ+dSh
	 agB0gJkKgInyPHcbKSIZxtYYx/KH9E6W33qOsAYksNMMobOAey1/HCYwSDWOfpfjtV
	 5eX0/wxHZtuIiS0/0Dj5dfQSlhhg+T7hYa6UKvTD1FaazKqqrQTqBMr4/e2+WbPnm4
	 jAL4/bq4Vdnxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-monza-leds-v8-2-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
 <20260727-monza-leds-v8-2-6e7e93d44dba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 15:01:57 +0000
Message-Id: <20260727150157.A42731F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating the LE=
D subsystem guidelines.
--

--- Patch [2]: [PATCH v8 2/4] dt-bindings: leds: nxp,pca963x: add multicolo=
r LED support ---
commit 8880deb882c1836deb8075651311f02e71683b95
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

dt-bindings: leds: nxp,pca963x: add multicolor LED support

This commit adds support for grouping individual PCA963x channels into a
multicolor LED by introducing a multi-led node pattern. This is necessary
to support and model hardware setups where multiple PWM channels drive a
single physical RGB LED.

> dt-bindings: leds: nxp,pca963x: add multicolor LED support

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix is not
capitalized ("add" instead of "Add").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-monza-leds=
-v8-0-6e7e93d44dba@oss.qualcomm.com?part=3D2
