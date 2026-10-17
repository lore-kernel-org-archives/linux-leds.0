Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F323644CF
	for <linux-leds@vger.kernel.org>; Sat, 17 Oct 2026 00:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198453; cv=none; b=EtOAyn9sHwX7+HbBsEQ+WSgOLMW+6YIPJFcsijBnAWsJ25M3BI062oP3FZb49/4NHAYsxNMRzB76uuLPEuFKqbQyQXeD9HnBX6LzZBNLsUVE75Uun8xKIwu54jNKVYXjWlZk1JXcECMjkNdRS5HI/SRkJPINSZZzSsF8G3Exa70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198453; c=relaxed/simple;
	bh=uPaLi9fJfbxRsv3FyRMJKevjgH0ims/STAD2WzS8Xvw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QsnYo3AiTmu9GDLbjA3DyktaGZFLKJvK7vkGrM2aWtbZz6N7nG8edlARgLdbqRg8yCCeEuVRybQcUVvrt06m1ONsW1grEGBGINDoBJCMTfv6xPXmfwZLBmLxsrvKtDTuV+krl2VG2I7lypUBC54zS7p7JeulZrMTYvUbIG8HAPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrqAVpcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrqAVpcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAD51F000C4;
	Sat, 17 Oct 2026 00:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198452;
	bh=8dv1RiobF9YE7sIEdTkLff/Lxm3nm8usXjUwBemmi1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HrqAVpcP5lxnAnjJjPdanUfMLCdMyvyviNojoIP7FyUQ0xysFTDvIhOFwnbaxu0h6
	 nHOBTGYd/ieaMZ2o2S88vGoDPqeYvYgKdJCZMGxOr7wWxRTCKoNDRFU5iYKlE15eMs
	 MH5JMfsGr9Mj3ApyG9kTp1dhS/J1qrdnzjo/Olz/INiZ+0+w4uPxN6U0/Un68i/16L
	 Bi24Tizgz/MRJ4mu0jati/2/i9WzDZO/jCm01fp1yeQfgcQTTl4cUyH3kb8kMj9n/V
	 0mZ2S/aU7h6JcDOCmbTPm1oHKAmkkXAsn86scM526G5t1k5aGP0XDBxW5WRGDYWh1S
	 SohXwIu2hMRcQ==
Message-ID: <sashiko-outbox-175083@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: is31fl32xx: Fix NULL pointer dereference when
 binding via I2C ID table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261017004351.1249547-1-rosenp@gmail.com>
References: <20261017004351.1249547-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 00:54:11 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: is31fl32xx: positional initializers used in changed i2c_devic=
e_id table
--

commit 7fdebced20c3197505f19872c5b5fdcf8d9db517
Author: Rosen Penev <rosenp@gmail.com>

leds: is31fl32xx: Fix NULL pointer dereference when binding via I2C ID table

This commit populates driver_data in is31fl32xx_id and switches
is31fl32xx_probe() to use i2c_get_match_data() so that devices binding via
the I2C ID table receive a valid chip definition instead of NULL.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 285085d274538..5ef4fd649d608 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c

[ ... ]

> @@ -611,19 +611,15 @@ static void is31fl32xx_remove(struct i2c_client *cl=
ient)
>  			ERR_PTR(ret));
>  }
> =20
> -/*
> - * i2c-core (and modalias) requires that id_table be properly filled,
> - * even though it is not used for DeviceTree based instantiation.
> - */
>  static const struct i2c_device_id is31fl32xx_id[] =3D {
> -	{ .name =3D "is31fl3293" },
> -	{ .name =3D "is31fl3236" },
> -	{ .name =3D "is31fl3236a" },
> -	{ .name =3D "is31fl3235" },
> -	{ .name =3D "is31fl3218" },
> -	{ .name =3D "sn3218" },
> -	{ .name =3D "is31fl3216" },
> -	{ .name =3D "sn3216" },
> +	{ "is31fl3293",  (kernel_ulong_t)&is31fl3293_cdef },
> +	{ "is31fl3236",  (kernel_ulong_t)&is31fl3236_cdef },
> +	{ "is31fl3236a", (kernel_ulong_t)&is31fl3236a_cdef },
> +	{ "is31fl3235",  (kernel_ulong_t)&is31fl3235_cdef },
> +	{ "is31fl3218",  (kernel_ulong_t)&is31fl3218_cdef },
> +	{ "sn3218",      (kernel_ulong_t)&is31fl3218_cdef },
> +	{ "is31fl3216",  (kernel_ulong_t)&is31fl3216_cdef },
> +	{ "sn3216",      (kernel_ulong_t)&is31fl3216_cdef },
>  	{ }
>  };
> =20

[Severity: Low]
This isn't a bug, but commit a031b5fce526 ("leds: Use named initializers for
arrays of i2c_device_data") previously converted is31fl32xx_id[] in
drivers/leds/leds-is31fl32xx.c to use named initializers.

Should the updated entries in is31fl32xx_id[] keep using named initializers
for .name and .driver_data instead of switching back to positional
initialization?

For example:

	{ .name =3D "is31fl3293", .driver_data =3D (kernel_ulong_t)&is31fl3293_cde=
f },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017004351.1249=
547-1-rosenp@gmail.com?part=3D1
