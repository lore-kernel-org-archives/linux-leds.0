Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F12F7F1D;
	Mon,  6 Jul 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353285; cv=none; b=qa2gF+Qdayy00YLwZrMKEru1TF/TIMgGgdcwdpnfvdK/VnpIxi7XwWsATLTmZMDZHvORU0TjPA82I1JjeP/dpOeowAIXVOZUmPFFf6ounssbieQkVoeM9P2ZFmRcvrhhQBkQmfF++cWMjhEK+jDDcua8vqbTfOwtPrvA11tNOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353285; c=relaxed/simple;
	bh=y/wnLTRNpeQajux61WDDzgy9qXiop+DYmWp2W2gqeoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ccLA9yoFqmsy/1UhC7q76R6vq7Psqn4Ida2WUllIEoya7Er6Tg0rLDEOQ8nSuw0TwHzg3PnMmkG2RKH8RYLQmHyxlXVc0CxOX56oa8yR7/fb3uu/IpSDMPgm+8bQgMcIdJ0G84eSsg+WDMeVYusgaarutEBYCoz7XbViYObDNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qd1zCb6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qd1zCb6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D541F00A3A;
	Mon,  6 Jul 2026 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353282;
	bh=y/wnLTRNpeQajux61WDDzgy9qXiop+DYmWp2W2gqeoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qd1zCb6ijtHZWiexGwWF77RhQ5VwFbKC4z4hDMPoCn1YROtWT3UBr6yw4Ew/keWbh
	 +mPgdRCE9JMWm2Xh2D/MEeghOvI81cZ/5gjDgqJjeCTcSuAs/EgDNdETV34G1IUHab
	 oTbEB6WS3nKC0i+yIwZkf0Rjpjumg0czxSfnVAMFfy8XMbqkfLTP146TAS+L2BWQ46
	 GKrrFObIHZkMpinpdMIzKfr/MJHjdL7vUpoK3J13qLnQ8H2vccQ9/FPSr92YmBc41d
	 iMk6HUofGOBUyNFPqrMf7Tey1Hijo0KspWbKENJdIx8KF8sSlvpe8i+AJWf4BXc5HX
	 hDbpmxYfJQr0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-2-37ea8c988363@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:54:41 +0000
Message-Id: <20260706155442.49D541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add support for grouping individual PCA963x channels into a multicolor
> LED by introducing a multi-led@N node pattern. This follows the
> convention established by other multicolor LED drivers such as
> kinetic,ktd202x.
>=20
> This is necessary to support and model hardware setups where multiple
> PWM channels drive a single physical RGB LED.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-monza-leds=
-v3-0-37ea8c988363@oss.qualcomm.com?part=3D2

