Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6C49BD6C
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069963; cv=none; b=Qa5kTwex7HSpbGvdavhCFYnVyLoZmvdbJeaZ5H9RwtYclN2RaBKELoaDKw4EGF8a0u8w7tjAeaxp++we3qw9/cdIZY28sSPywWT+yTMNtBJ5WqNtui+quzqyDIprdvaWAA87iXpPJfzXlxa9i1e6ooO4VwVz9FlzKPWXsGBkvn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069963; c=relaxed/simple;
	bh=XOQkucBW0mYR3Ihv7VHBp9O1LprfoS7tYNiXjkFghu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dvPCbM3hq2xjUgO9ps+icgLM/WH3KcK9oNEouCorPex+IMpLna9R9kjHIsdpUODxe1RaxUK/0C0jy6mq7Jp2gvgOi7Ta1U7r3DGgtKFCg4pkZFlN5D0z8J25zyDquH4g7M+YgK8k38PVeR3vj3Iw0en1nJ/wDhai0vFKRBu04bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbtChzSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbtChzSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E48B1F000FF;
	Thu, 10 Sep 2026 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789069960;
	bh=TROqhmv89l46AvDG+MexkJ6toJOG8fE5orjTUuvcHtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gbtChzSQ6U3qoFUjXIAFDoslFZtnmB4GtxTky0h3DkhSqwR43LCTNyOdycK8xaF1a
	 lKhspJ/zpBSFrBszxz2trPHR1wGMCIXRiELHPUVVVeCHUXfBsdozZ2WrG0h82TxR6/
	 GxRkTBcdYJQMuBvlsT+iwLO1y7Ox/zeB64B+ycc+PxjIHSYD4l5tEH4wC7L3LP26li
	 wimriThjufSF6BR7OBtDECu0c1XI4Eh/dg7aOPCqgIzdJBWOWoaIgY4ANKRjf3sR7U
	 AVygR8F6fjFcm7dQNTvRVNWaKFoKqc9tC8N83q2VYd/pZeo8COQAY15K8cvb74g58C
	 NwTbr2ej7qTwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp8860: fix device_node leak in lp8860_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miles Krause" <mileskrause5200@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260910-leds-lp8860-of-node-leak-v1-1-d333cff4345b@gmail.com>
References: <20260910-leds-lp8860-of-node-leak-v1-1-d333cff4345b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 19:52:39 +0000
Message-Id: <20260910195240.0E48B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The enable_gpio is initialized to logical low and never asserted, =
leaving the device permanently disabled.
--

commit fc2187284635f3278f3bb6af71e6925402976134
Author: Miles Krause <mileskrause5200@gmail.com>

leds: lp8860: fix device_node leak in lp8860_probe()

This commit fixes a device_node leak in lp8860_probe() by using the
__free(device_node) cleanup helper. It drops the manual management of
the reference returned by of_get_next_available_child().

> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
> index 69f064781f699..f6e4227de903a 100644
> --- a/drivers/leds/leds-lp8860.c
> +++ b/drivers/leds/leds-lp8860.c
[ ... ]
> @@ -282,7 +282,8 @@ static int lp8860_probe(struct i2c_client *client)
>  	if (!led)
>  		return -ENOMEM;
> =20
> -	child_node =3D of_get_next_available_child(np, NULL);
> +	struct device_node *child_node __free(device_node) =3D
> +		of_get_next_available_child(np, NULL);
>  	if (!child_node)
>  		return -EINVAL;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but this is a pre-existing=20
issue in lp8860_probe(). Immediately following this lookup:

drivers/leds/leds-lp8860.c:lp8860_probe() {
    ...
    enable_gpio =3D devm_gpiod_get_optional(&client->dev, "enable", GPIOD_O=
UT_LOW);
    ...
}

Does initializing the enable GPIO to logical low (GPIOD_OUT_LOW) leave the=
=20
device permanently disabled? The driver never seems to assert the GPIO to=20
high to enable the chip.=20

Other sibling drivers appear to correctly initialize their enable GPIO with
GPIOD_OUT_HIGH.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-leds-lp886=
0-of-node-leak-v1-1-d333cff4345b@gmail.com?part=3D1
