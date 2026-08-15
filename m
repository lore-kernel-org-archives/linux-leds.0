Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752BB38D3FC;
	Sat, 15 Aug 2026 23:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835516; cv=none; b=NfZsuXONAfvxIS6wKNcDRn8HN5he9/2so9ESAyG4lZY4cvnFEJI4nek4SkQJufYCTRts8L2LshPdTlszMv1pgxcFKjtW39RU4drr1VWcEQfmBHJcdj4b/vH1TcMuxsslRZGnz9rgedA9Tpv2AnLZKdVOONhV96HVchy4NAFMRxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835516; c=relaxed/simple;
	bh=HsoL4gM9LiABz6+LERBwb3PkmDsnbjW2IQZh4ValomE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aSJpgPxwg+9lZE8taoqeoWNPmUaiUi/e/2ipDEl+UOgbsNS4974hTrgUSeP0mx+t06WLgLc18PZ6wfoF9UAOAXlaMEcLYoHjbdc5appA9aSINFuayq49n0ISS1XgsQLk0gARmncuKwC45/84javpAG1fGnV5oSn2/6mWJsNPj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIkC4NHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIkC4NHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0809F1F000E9;
	Sat, 15 Aug 2026 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835515;
	bh=HsoL4gM9LiABz6+LERBwb3PkmDsnbjW2IQZh4ValomE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gIkC4NHqP7LI1+VV3ZfHAQBDF3Yl/tLtUgAaK58Q2vem2ZairU81eTUpPcZUqLVhz
	 sAZVKxh4gSbJ+MLXC5qk6cXWwuD5HXjblqpirgw/g71WhWSrLbx9QA+bjogC7yfro6
	 jP7Dw1a7AyEZ8XmZhHjoP6qPlwcKpp0xxsWbsqezLWNksGBx69LKbaaJRFVMsSbKXB
	 TgO5Mfw66nUT2bvxuHPX+qhvsSXern/bc3XmJuVfxZLn6WpJ52bh+UojP1zUSAOXmg
	 VWY3zmyM64qE+2fNkvOKQzlYCx8Dv+/NuSGzW5kn4l5AiQa2gDINv+CjzyFWr8jCNg
	 MXhhA7c9GLrfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 7/7] ptp: ocp: Add Time Card V9 I2C
 peripheral topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <1b0ad989c6290a400bd642f9fb2d26d965bc02c8.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <1b0ad989c6290a400bd642f9fb2d26d965bc02c8.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:54 +0000
Message-Id: <20260815231155.0809F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Time Card V9 boards use the same mux infrastructure with a BME280,
> a BNO055, and an IS32FL3207 at a different address.
>=20
> Describe six RGB groups. The first two expose the GNSS1 and GNSS2
> status LEDs on outputs 0 through 5; the remaining four expose the SMA
> indicator LEDs on outputs 6 through 17.
>=20
> Select the profile only when the fixed-width board ID exactly matches
> TIMECARD-V9 with zero or erased-byte padding. Older revisions share the
> detectable I2C devices but not the V9 LED wiring.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D7

