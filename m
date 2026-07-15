Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF231A07B;
	Wed, 15 Jul 2026 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123559; cv=none; b=TfEEsIFd8GjQAQo31TYw4HbGjbAYMlUFV7zhv8x/UDpzot8gshONou+iHCYmBhU73JGj16+RK4vSwGOsF4XEEnWntWTmcOtKcF8OTILtuGjs9ZNqqHoc3B7iXctbv0sjjeRwOtwDC1Rx+Vvuwq2KH6kA2hipU9tPFkptMifNYk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123559; c=relaxed/simple;
	bh=JVkNXhvHeLHz37xYn56ZT8A7XUQqNvPgb9zbNuRVGuo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rLAUeE/1OBt0S3GR1Kmrc9Rb0EYX5xMwBHq/HpDjAOdW04pLKReR7C8Du9YYVka4EURE3H5uDZLit6GRaJD7Ay2FF3h2SHlPHNFdt43wZvmtMx6JF8pGFLg1UTn2ikPIXChMJJDPdOsi5J5MRqQrYv7sWlQls794GmlJhckSJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhKc6a1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhKc6a1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CF21F000E9;
	Wed, 15 Jul 2026 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123557;
	bh=JVkNXhvHeLHz37xYn56ZT8A7XUQqNvPgb9zbNuRVGuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jhKc6a1/1zLEldwQD63EKbVrxTQMz99T9pjlLsHiHCaMMeGMkPlJE2FU7hWtEqlH8
	 FVpBbgoSifSu5MBEjlPMLE4uXk5QhNViRwHC7QUvBcn8RWL4qWjqgjRPwBYX7pY7O3
	 3exlyKdTT1dGAMh6bnfuhh0uMvVLPLs2984sO+BbartiPKXyhrXzyQd9HpvM+bpGSM
	 mFYM7ondeEGI2GpjqE2LpvpSm/PJMYUxzuiFmCS1VS8iENw0pBrP+t1Q1Of/Dt8NPB
	 8kO7B25RTPRCJqUOBEGJrHs1uLS1iXIicto1hnYAR/9EGS0fovPjs2u3PqGbHzvs5L
	 oI8laMQ6NTCdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-monza-leds-v6-2-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
 <20260715-monza-leds-v6-2-d1724bb7fe3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:52:37 +0000
Message-Id: <20260715135237.79CF21F000E9@smtp.kernel.org>
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
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-monza-leds=
-v6-0-d1724bb7fe3d@oss.qualcomm.com?part=3D2

