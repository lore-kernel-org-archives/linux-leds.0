Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3873B7759;
	Mon, 13 Jul 2026 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932957; cv=none; b=Hz4rZ3os8siupgtGeev2N6zsfkfFrkGcgdabjM/0gwsqUFMWJ4BMCkla1NAnczp8blivzPAlrhksJSPdReBAmX3GrQ94VE+tEXUt/H4vc0qQHz+NNQVxwcBSSp4FVgE5l4MMJQE5ybqg8kDDoBrF1QiK9tgCYIje3YbxM3agG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932957; c=relaxed/simple;
	bh=PxR3IYrOGaie1GzmTU3gAuPgCpTpDEmZgCF1YiD4c5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GFwp18cRM6CNZQVj5PLpI7JzUw9qbCUm2tmKO/SAJSy7ZBfd5J7pW+4WHijBAIggqdk45RCAbUSwYDHVIc8G5acHvQDLddXo3ZXcwtibDPTMhF7jyS80OZtZgCiyXB51aITFh2bO1UN+nH3WMW3pt5QU0oxlyYZ9yIPaGDjVG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsvxHcLe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsvxHcLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACAB1F000E9;
	Mon, 13 Jul 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783932955;
	bh=PxR3IYrOGaie1GzmTU3gAuPgCpTpDEmZgCF1YiD4c5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsvxHcLe4v+E9tNIL6Gyy3bsWy8PTDoDweZSYxrFWP3MzN/bUIabmap0qzuLQLOaC
	 r9Mmpi0rZPUBCtv7rUsqYDSsu4h15KsEcZ+N5yamn2P7hv0+dzpcC3GK0xtNDSf8t0
	 0lm/CXC+bDUnqZ2I9GOPfSG06YaH5qvwtX1E79itysuREejzM9DO+9kyQYGZstyo3p
	 c9/A17SxgRmTA4PDiztLb2qS1Jw46sKNHAqYGOhYLa8oYn9JAqBBvtvLBAeTeOYYZt
	 pdqgw4D0oajxs0EOOtEhqDepXlCdB0BR2nUfhVYpoQjBUvlq7Sy2VgVAx1eYsFFRws
	 UY73nOd50x4iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3] dt-bindings: leds: Add default-intensity
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
References: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 08:55:55 +0000
Message-Id: <20260713085555.6ACAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document the default-intensity property to set a default color on
> multicolor LEDs.
>=20
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
>=20
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-multicolor=
-default-v3-1-fb43f3f789cf@pengutronix.de?part=3D1

