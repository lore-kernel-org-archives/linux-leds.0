Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058583876BD;
	Mon, 27 Jul 2026 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165071; cv=none; b=CJ2u2Oyi++gO/5c0nQv3tKoTR1CjWbWVndLYILsO5PeBiciW3v6GVlMl53PQgwYs9+1VoMTKGrm2RGUvQztRg9/EXVawMVAifyUFlPx6nYQn6SmUzlXmPQshx95vlAvW+zb+2/CsymKtys9Mwcw7j4u6SeW+kQsdof9lCDQTGAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165071; c=relaxed/simple;
	bh=axWSOE2+JzPUlnAO3l7nDW4Mkki6QH5rqQYgkibC7y8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tg/jRHEnGsujIEC7Go6PQf77BNAstFlKAkFRoNVrcq5pOwe6nl5UAKsM/Fxer/q7YOjoM6IGvZQsoI9rJrtBPmlEx10xJJzhtI1jWrFC2/OW1snKK1bxDOPC69wasAzin9kb5mXkl7KKGRbgc1q06bCbGD/lW8ReMYVOEBJ4nl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD7WHJ+a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD7WHJ+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDAF1F000E9;
	Mon, 27 Jul 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785165069;
	bh=axWSOE2+JzPUlnAO3l7nDW4Mkki6QH5rqQYgkibC7y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aD7WHJ+aNAPFQONdyn6bvEriAVNDC/JKvLwgi4Ok4X37nLbOdgIP4b1f74Af0baq4
	 ZIs4cz/cZHV8WY15psvzZ9O+C0I85cnMaYWB2eYfeb+2nk9TYVQIh0SmlXQuzZljs1
	 b7ZtHL+wJfHqX8yY2E38WdS9nBFrzg5beGR+dYOYBTGVCZ0mePQOWDP9Gm29RIutC9
	 Ei3+Oikxao21WIPfyoTCxR/dqOXE5CqW0mblwsSifScstbtV3ZdRRfg/7wvB6CM1Wt
	 l3LnCGWhjlO68Uw7GL8bmPT0ujrmCyxCP0HuX2x8pMPZ3/1GtOsJNl3dPNSN3dKKCM
	 8xJxi8daKALQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-monza-leds-v8-3-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
 <20260727-monza-leds-v8-3-6e7e93d44dba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 15:11:08 +0000
Message-Id: <20260727151108.CFDAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
>=20
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-monza-leds=
-v8-0-6e7e93d44dba@oss.qualcomm.com?part=3D3

