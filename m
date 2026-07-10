Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E293E24BBF0;
	Fri, 10 Jul 2026 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691953; cv=none; b=onE/cZbkb8GazfUIvxrMjhcJ60hcx8AR/LrhhhQrYem8ZcysHE61JQYSn6gcGDbem/xprDKzsZDpWX8hkHHezOlwldoRNbcATXktSFddr2339S+UhmdUvk4mnNw+x9VDfLlvQO26viKEMcncGJ1+9trdHcofps2A2YtBjY1l8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691953; c=relaxed/simple;
	bh=h1WnDKre/t4mGpCGkFt2BZ1V0yd3ja35U+G1FhXXyaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UUXdJciAheGgl+4UyVyPsYOxRXpJgFRnlmGBUs8h3zJa2P6y2R/WqNMs7PD1HaVTWLz+LocSCVrBCtIsIBVuIpYnns32v72qnd1nycWV54inhK8jtTelpLt8BQWTyboe2I7bAGCb9xaeQghxyLw2DuYcG6L1CY387EUAHir9oDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWOOoSMR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWOOoSMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E64F1F000E9;
	Fri, 10 Jul 2026 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783691952;
	bh=h1WnDKre/t4mGpCGkFt2BZ1V0yd3ja35U+G1FhXXyaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mWOOoSMRt9aYfq40dFCG15mU7aCwdJukkkF9v6Wsul5Cab9+Kk62s1NIJVJn4xV2m
	 G13xSy01g3HruJ17T4faLcFS+N7ZdpRw3JeRuIvBmbB2HMeY6DTet0O7rhIJyrOXhx
	 a5tJDKsZidON2e8vjjmRBjZ8YVsv5HrVgehw9fTTyHyPHAH9i6qvjMNLcrYER090UJ
	 PVC3/S1ub3gakow1UYiFy685j0JiPF1yx3xW1gOGxio1P3E1aElN9zKREvVxdJDMzl
	 MpRr++H1a26SrOL7i1y2S7gZPA+SPIN0QQeUK954qcaV/8P3TGRDJdbusB2MjigaTJ
	 Y6jL2d7YNDuSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: leds: nxp,pca963x: add multicolor
 LED support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260710-monza-leds-v5-2-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
 <20260710-monza-leds-v5-2-a8972d28c28f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 13:59:11 +0000
Message-Id: <20260710135912.2E64F1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-monza-leds=
-v5-0-a8972d28c28f@oss.qualcomm.com?part=3D2

