Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCFE2F8E9D;
	Mon,  3 Aug 2026 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772006; cv=none; b=qt5QLykLducGr+fLQvbwmf6G6NDqCMPJyEgI7GMHmbARauMF7ZkbM/bqTeb2WkTXLoqAiL58r+Fjt1ggy7/nGrN6tGdCup6HofvToJQUOiFyz+rmmduw6o8KK6tHjKCCanieeCXlnPijsLdZIOSjozlTNRXEfSovNsHokpd7oIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772006; c=relaxed/simple;
	bh=P0GUkDbtzCbp9Qw4obiPdjcNbJH8Jb6vFi0dAT8OA1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aO1wff44N4DhahKMmc72UJGPHD1o7KztUgC/mrpQoxeMrEMBUvKeR4myw6NCNQlHlebMXbFBvb5PQmlBLcP83U0tkLcIrccfknhTyOMGKDh+vh+y6Fj0vshqCeab8SY9+HGeg/uAHtaYPBz1KQXfsuPJ7VK0P6HjgZrljRRK2GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdpqzILf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdpqzILf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9626E1F000E9;
	Mon,  3 Aug 2026 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785772005;
	bh=Q6M+eyTgFgV8czxAacqDyZ8BHq22VWXaO4tklZ3polU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BdpqzILfXzZf2PjK1P9ZM/2jHW5o5iercGbE4IvNWZNrtmgpbRohEUayuVnbAOnWi
	 35iRil+LpuMgPy/ExicyiNLKT+SAT3ky5bK8faKAvyKq7yTwJeqFR0+t0sZVkG6r6m
	 CGCplJob3KWX0l8guDw3j1s0cN/zWmCaYH3kqcw7aF+O/w0/Ok9rdLPOF/5aKMYpgs
	 7FaGL1xZbrwkI/afNnjHVrHRYuA5hIICjgFegWgO2THC3l4wTnFLrUEdRTq1nPze4T
	 s72lk2WTnISqJFFjHhAJ3rRTWnH30GaY7axx56Lihn8ZaY5CSVcIcnJwekMjTvZ2YT
	 z4mdRa9LNsZUw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next 2/4] leds: rgb: Add IS32FL3207 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <7daca0186b6906af1d57314eebcecffc4cb68063.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
 <7daca0186b6906af1d57314eebcecffc4cb68063.1785684064.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 15:46:43 +0000
Message-Id: <20260803154644.9626E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The i2c_device_id array is initialized without named initializers.
--

--- Patch [2]: [RFC net-next 2/4] leds: rgb: Add IS32FL3207 controller driv=
er ---
commit 2f0ef1606e8fe9f37cd22e9360f765264557dd4d
Author: Ahmad Byagowi <ahmadexp@gmail.com>

leds: rgb: Add IS32FL3207 controller driver

This commit adds a generic I2C driver for the Lumissil IS32FL3207 18-channel
LED controller. It exposes individual and multicolor LEDs through the LED
class, handling optional supply and enable GPIO.

> diff --git a/drivers/leds/rgb/leds-is32fl3207.c b/drivers/leds/rgb/leds-i=
s32fl3207.c
> new file mode 100644
> index 0000000000000..8f04534644dce
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-is32fl3207.c
[ ... ]
> +static const struct of_device_id is32fl3207_of_match[] =3D {
> +	{ .compatible =3D "issi,is32fl3207" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, is32fl3207_of_match);
> +
> +static const struct i2c_device_id is32fl3207_id[] =3D {
> +	{ "is32fl3207" },

[Severity: Low]
This isn't a bug, but should this array use a named initializer=20
(e.g., { .name =3D "is32fl3207" })? The I2C subsystem guidelines request=20
that initialized arrays of type struct i2c_device_id use named initializers.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, is32fl3207_id);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785684064.gi=
t.ahmadexp@gmail.com?part=3D2
