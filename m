Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4523806C2;
	Mon,  1 Jun 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297140; cv=none; b=QiiO4BA1rsAVqwrmlROSyGcIg0DsHnAj9aXWu8dzebAltwGRr9DOtxFpJKKXbicp3ZDndrwiGWBPKGNyLbs6mrRQ96Nn5s758fSCvopnG3vCZ0KC8/EpefMqdj+uTdHgio9CS+RH1C/d35S6YVCD6UlfGUG1sgpp+an9Xk39jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297140; c=relaxed/simple;
	bh=WBKKuhdxx/bAE1oVCnOlclgROzjpYuF6S3zJuCPlCuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WH9asSGasYeqMLK0vu7EHkFEVe4Ry7KAgfT80GEceQzXZmyliX9gXC7KKnoV2a5gB+EecU7TRmFKRRw1cOHczhXFH1ekNErwtnEIVDzOQHhicVrmtX1DJ2WOOdwGzvgUBXlF3Js0vyoOhmqynozFXsQ7FIThM8zE1t3bHr7mdO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HQBfHFbh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HQBfHFbh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B63B41A378F;
	Mon,  1 Jun 2026 06:58:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D9CC602AB;
	Mon,  1 Jun 2026 06:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10E1110888CCD;
	Mon,  1 Jun 2026 08:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780297133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mIIouX9atwC8TO7vo2wcLgAJzq/cTaHoTN8DO5/T+0Q=;
	b=HQBfHFbhqkjsF4pCV3oiBNQaeiPV0l/QdDp1DfBvD4+AlikHlQ0c1ENujAD7kqhbiXt15J
	KM0NSuc3onfrGwhRq2qpaIY1OCeASQkJMl29QvQ8eJLCab4THNCEzm9I78Hs4LTONYY9Ai
	440QtMOWoPVqQ7wOxY5TW0MIO+2RJ0NmUXhVKy8JSl17UmJGfWwmWx8VenwiCp5ESB915T
	6Rysm7UilOxHXF38ffSIzePeikeaqumzH5jT2U2FEwVDiPuy99pq4ACd5uSHFsHDPC1b/7
	C+jZQgL9Ry69ECOdwhNnAXHZIbJdVe8aeVsQiq6SlMDaNusrvR1gdQtmw7A4mA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jun Yan <jerrysteve1101@gmail.com>, linusw@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
 Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Shawn Guo <shawnguo@kernel.org>, Paul Barker <paul.barker@sancloud.com>,
 Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard
 <patrice.chotard@foss.st.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: marvell: armada-7040-mochabin: Fix
 is31fl3199 shutdown GPIO polarity
In-Reply-To: <20260525144629.498630-7-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
 <20260525144629.498630-7-jerrysteve1101@gmail.com>
Date: Mon, 01 Jun 2026 08:58:43 +0200
Message-ID: <8733z621cs.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

> The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
>
> [1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf
>
> Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

What happens if this patch is merged before the driver LED patch? Will
it break something?

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/=
arm64/boot/dts/marvell/armada-7040-mochabin.dts
> index 6bdc4f1e6939..cf690a85cc2a 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> @@ -236,7 +236,7 @@ leds@64 {
>  		#size-cells =3D <0>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&is31_sdb_pins>;
> -		shutdown-gpios =3D <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios =3D <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
>  		reg =3D <0x64>;
>=20=20
>  		led1_red: led@1 {
> --=20
> 2.54.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
