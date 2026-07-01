Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B00370ACD;
	Wed,  1 Jul 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923399; cv=none; b=NP0OCpFvSaUYs6uwQhKG7CMu3Qxmw3Z5RybwN8OYe8bADmWsVcg2YyD792/10zZ806VgsUmFel0O4z2jCFZs9005Xs2RdY6W6hqnjBDiPWnysl4vUQE639dQjOD2ydz8X3MZs35oyjPR2j1d0xc5OAZN2tcSIc6YWNAKWSjl5JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923399; c=relaxed/simple;
	bh=wl+RG0uPIG7o+LZDklazZbw8dGoknmTzSziCcMAXx8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iEFWzBfl8COzFnBMjHuZLM5Vrk1ieFcv84FXvz7fAMBCjzeaweRNdS4bBqEQuhD/qP5UE6DoiV535kco4GRhNOw5E/ZgEx2d5A8XCgxUa+m4A7rKXav6Y9UM7nYgWWWPmNDZdyNyPekjYs9kgc+wH5a7FEgiZXx9sSlLrm7MVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuO4KxQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuO4KxQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE81F000E9;
	Wed,  1 Jul 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923397;
	bh=wl+RG0uPIG7o+LZDklazZbw8dGoknmTzSziCcMAXx8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YuO4KxQ8h+kZyYBsI7BuNWLRCiUvXw3nY02dHBwRvHH8SPx915cR78UkaaP93Flj7
	 uwR9tvLOTJc2fshNQuVZ0QL5CtnL/QnpmMIf+Zmx8u7HwdqMzoSE5vYP5xWkTw6Zpd
	 0g9zTswSTctBXnCMio+40AWVlLqfh8vk1qRo9zpYUZrUveb1pK9xQ7cCzX1x+9tWMg
	 CanV5pIAbvwFGHQ5n1W9+gRRtzu1fPNSsObuP841BEeXjhKUlzqkdWtd1HeacgEnbl
	 +EoQ9+gJ0rGcwT9mEOG55wYZSsS7S0T2pD6AEXbIyP3VNy/xieIsmJVuNqaWh+w0Ns
	 scCxdJnyLieFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701-monza-leds-v2-2-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-2-c1be0b472926@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 16:29:56 +0000
Message-Id: <20260701162957.2FFE81F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-monza-leds=
-v2-0-c1be0b472926@oss.qualcomm.com?part=3D2

