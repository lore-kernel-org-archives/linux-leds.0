Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA60433E8F
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032533; cv=none; b=XnZ2L0DFrEL598DytRlVgs89poI918BO+A6e9TmUFcyCaS5wKCiUV363LB2EQPD+UFiywhX5bEIwDoUglNS35RvAOWIi5k8vhHp3kYYhs9WjcHOoomEhhDPXYQq6k0dl0q175NHqzoelDxozJYeR/O/sPcfbP+Aa4XExGqUQ4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032533; c=relaxed/simple;
	bh=sHdH0IBdv/DbgkWfVj6Qowipdbi8upIsYhoBvgApV2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G1eckB8tJWUJ4Y7dJBKb5TvbHPI7JmWNEw2AIoB6xozn9pOL3K+DQ/4qtYVxlpxfQcrB79HyFt/D4xMDjEcD0lVQ+mr1QHYIaTTpMIIzZC8+CGrZ3UTbMWgffZ6RbaW+HdZ8DKiZhMjZwadJx2whheaVG8pLGaqItleNVzeuiMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0yXjXyr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0yXjXyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF2D1F000E9;
	Thu,  2 Jul 2026 22:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032532;
	bh=dpmUjVP1+Qa118ZgGIKxyRArnMcBmzISzEoO383zc2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O0yXjXyrU+WnbZ+4Q1BhsSN13ScLrQa8BP61WnKbx43S4meF3sLtUc3/EC6uYWGBF
	 tr55HPJ/LUBDH1NY9b2e+/x0eQGEz2zN7ceqTHQU2OUPEqSAB7omL/NY2SPQObC3yY
	 yf9ACSdow1WhVH1RFfyfkLtkMgrBm7OiXNoQxwFoKeS5tjXtyVuZHSRO/iALbu4H79
	 MYiWKtkYdpzng+2txqH8DZTxD7Q3LhqO5TqWCRPIZxdJjSJ2qY22cI4WlPWFXS0m19
	 6vswKotkOgaNIdtzVZ+x3//CLO9DWlYFHkaypfhYhJh86caDZPU2cNAeAQr75aOdQq
	 HpDq3pVWsg5+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/9] leds: st1202: stop pattern sequence before
 reprogramming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84978D0F499774773C7DA1FCC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84978D0F499774773C7DA1FCC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:48:52 +0000
Message-Id: <20260702224852.7EF2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver assigns a sleepable function to `led_cdev.brightness_se=
t`, causing panics when called from atomic context.
--

commit b372e8814a9b45529499c4d9490a6fff3999cb74
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: stop pattern sequence before reprogramming

This commit updates st1202_led_pattern_clear() and st1202_led_pattern_set()
to clear the PATS bit in the Configuration register before modifying pattern
registers. This stops the sequence, ensuring the hardware accepts the new
values immediately instead of ignoring them during infinite loop mode.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 7f68d956f6948..316ed8eb054f9 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -200,6 +200,10 @@ static int st1202_led_pattern_clear(struct led_class=
dev *ldev)
> =20
>  	guard(mutex)(&chip->lock);
> =20

[Severity: High]
This is a pre-existing issue, but I noticed that the driver assigns a
sleepable function to led_cdev.brightness_set in st1202_dt_init():

	led->led_cdev.brightness_set =3D st1202_brightness_set;

Because st1202_brightness_set() acquires a mutex and performs I2C writes,
it can sleep and must not be called from atomic context. When a user
configures an atomic LED trigger (such as 'timer' or 'heartbeat') via
sysfs, led_set_brightness() can be called in softirq/timer context.

Since this is an I2C device, should the driver only implement
brightness_set_blocking and leave brightness_set as NULL to prevent
kernel panics when called from atomic contexts?

> +	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
> +	if (ret !=3D 0)
> +		return ret;
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1
