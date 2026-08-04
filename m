Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04A30DD00;
	Tue,  4 Aug 2026 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876665; cv=none; b=pNlPLwvg9Z/VlZKaMuwJgEphaZU7Az/zsDYs0E4awzz7MTsUYodRiCzC6iX0cZhjm3PZ8TycFAW8St1trhVsaPZIHnIB9QhRCrwd6Q5g7sPwPXgfWTsddTLlSRsbdH9qLDP8wktS451tJsjYYnRxBQSGOKdYmWFxtVQUc1re/8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876665; c=relaxed/simple;
	bh=k70ZY9qemGMXMmEVeJYGhJWzkWvHuCTacbrMvOsimOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C5r/kAnraAKCWnAocleOgH9QS2r0XGSJS48ln9IHGFdrQTepMHf5SoGvjVC+6wfoJOKy9hYurrU4awse5qBm8kEhOnn/2E+shybdc6W3chhkNsrd1BAO2q8EZT8qK9PwgTS78qiRe6WZBN3YxtJ/jxAwmn2UdGQzEw03ROE2ItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJJKxDH1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJJKxDH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BA81F00A3E;
	Tue,  4 Aug 2026 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876659;
	bh=PbFe7x4MUuNf4rw+mtGQYdNnR0h462hqgqecd6ZGlho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JJJKxDH1KPwNCBB1EP/liamXOn6wLGzaCIbeWSHnpgSgrFMmRC5ah8B+faeBtkCxb
	 LxUxm5LiR1LwOveiVCpmKN8N6PZrP07fOXbofKXcQFzCs28Vuic/6ySkUoTGn3V/e7
	 jlnFyDr9u8wv3WBNu3yibofm0gPEQiW3ZxOjHjc0uvdceDJ0yT9Bekc0D5Xfoqc1vO
	 EJYVATGwr0T4LnTdE4sxdsiK5arDbdpsPdEBt/DmXKeW4zoelpeDMnwSvqlFeCu7BL
	 lBG8cTMnSIbUlusVXLV6dcQBZnKnAvslCJLYFwFwWEkVLDnpU+QYCd8HsktZT6yEuN
	 eB7pIFTxm2oXw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next v2 2/6] leds: rgb: Add IS32FL3207 controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803205011.1249-3-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
 <20260803205011.1249-3-ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:50:57 +0000
Message-Id: <20260804205058.69BA81F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The commit message uses a non-standard prefix for the LED subsystem.
- [Low] The driver's private data structure instance uses a generic name in=
stead of the recommended convention.
--

--- Patch [2]: [RFC net-next v2 2/6] leds: rgb: Add IS32FL3207 controller d=
river ---
commit 85f9f1b2acee8fe8b7b8accc04c2fd34496cf682
Author: Ahmad Byagowi <ahmadexp@gmail.com>

leds: rgb: Add IS32FL3207 controller driver

This commit adds a generic I2C driver for the Lumissil IS32FL3207 18-channel
LED controller.

> leds: rgb: Add IS32FL3207 controller driver

[Severity: Low]
This isn't a bug, but does the commit message prefix follow the standard na=
ming
conventions? The LED subsystem guidelines specify using leds: <Driver>:
<Capitalized description>. Would leds: is32fl3207: be a more appropriate
prefix here?

> diff --git a/drivers/leds/rgb/leds-is32fl3207.c b/drivers/leds/rgb/leds-i=
s32fl3207.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-is32fl3207.c
[ ... ]
> @@ -424,6 +424,6 @@ static const struct regmap_config is32fl3207_regmap_c=
onfig =3D {
>  static int is32fl3207_probe(struct i2c_client *client)
>  {
>  	struct device *dev =3D &client->dev;
>  	struct is32fl3207 *chip;

[Severity: Low]
This isn't a bug, but does this code use the recommended variable name for =
the
private data structure instance in is32fl3207_probe()? The LED subsystem
guidelines recommend using ddata instead of generic terms like chip or info.

>  	unsigned int count;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803205011.1249=
-1-ahmadexp@gmail.com?part=3D2
