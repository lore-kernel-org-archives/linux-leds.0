Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1109305E1F
	for <linux-leds@vger.kernel.org>; Thu,  6 Aug 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786028591; cv=none; b=V632wGsdVakZLY5MlI77Ytb0iLYFoLqk8/3EC5XBPQVUQrtHgDP03qplB5MJe52fA8pYoF0nQyvot+pu7vbuJ5WldaAdhKbp0DS/3aCOsnOEPu8z1Qr9crLkkedVpL22/QkdUAF7xwoS1hHlUBrc20MUNO+wkcBw3pKFteyonco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786028591; c=relaxed/simple;
	bh=kVChVqMDaK7LPAXNpZdviISNg9qhj4T2L0xFkVGUbkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jn28YI6LJFIJkZwCiKYWxm+jB9QGARhdOPL2hk43FMZHudEssrn1Avj9ZHTJGuuxtJ0WNMvIC25r/jUnMlqHeP+dgyqVx5AwCG+M/ionbh0DUuSbHvUhxC9rz64vPpLBSUDXKqu+faA/pEkspbE1J6/4Y8Ak6W3sZxye2coban8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBCxwuG2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBCxwuG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22311F000E9;
	Thu,  6 Aug 2026 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786028590;
	bh=4teWkGaTIzZ1bwWu56xcSZD++7K9j8FJN5VFLxI/TrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hBCxwuG2RXS0TX+INgD9nUKcqxA10l8R0OzrGm9bNslXC8SB2IIaaw4+7ZfRZK+Vx
	 lGu69eARbc6APL9GePVXAoeDlKwcFuMDpHF6WkinTPv9Ol7v1c1f71U4jwbjMiMdv4
	 baLQKDsSPZRnYXvmcuFKs/6pnWEpJMKS17efUb56BIWl69W6V/vm7CWASqaBlQ58l2
	 cLJG/ul5Dufjd3n5nN0HaAu7ZuQ8Q2v83j1hruHxggu/5E6RNJ0d0J4Gho7rvrGI08
	 4HwUrJu2RTF3or9gX6/1eK++G8LFJ5yV8E9sb6/4fyJ0rIf/CBDGQ3UrCUo5XYzg2E
	 2WY10CcKS4woQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: lp5860: fix LED teardown ordering using
 devm_add_action_or_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260806145527.114844-1-kr494167@gmail.com>
References: <20260806145527.114844-1-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 15:03:08 +0000
Message-Id: <20260806150309.D22311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional self-deadlock during probe due to incorrect lock lif=
etime using `guard(mutex)`.
- [Low] Undeclared variable `ret` used in `lp5860_probe()`.
--

--- Patch [1]: [PATCH v2] leds: lp5860: fix LED teardown ordering using dev=
m_add_action_or_reset() ---
commit fa14917dcf9d1637bf1292a82596892d65e73078
Author: Surendra Singh Chouhan <kr494167@gmail.com>

leds: lp5860: fix LED teardown ordering using devm_add_action_or_reset()

The driver previously disabled the chip in its remove callback before devres
unregistered the LEDs. This patch fixes the teardown ordering by registerin=
g a
devm action to disable the chip, ensuring it happens after LED unregistrati=
on.
It also converts mutex initialization to use devm_mutex_init().

> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-=
lp5860-core.c
> index fd0e2f6e6e0f4..bbe299e36ad53 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
[ ... ]
> @@ -197,38 +204,24 @@ int lp5860_device_init(struct device *dev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_add_action_or_reset(dev, lp5860_disable_action, lp);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Set to 8-bit PWM data without VSYNC.
>  	 * Data is sent out for display instantly after received.
>  	 */
> -	mutex_lock(&lp->lock);
> +	guard(mutex)(&lp->lock);
>  	ret =3D regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_M=
ODE_MASK,
>  				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
>  	if (ret)
> -		goto err_disable;
> -	mutex_unlock(&lp->lock);
> -
> -	ret =3D lp5860_init_dt(lp);
> -	if (ret)
> -		goto err_disable;
> -
> -	return 0;
> +		return ret;
> =20
> -err_disable:
> -	mutex_unlock(&lp->lock);
> -	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
> -	return ret;
> +	return lp5860_init_dt(lp);

[Severity: High]
Does this code introduce a self-deadlock during probe?

By replacing the explicit mutex_lock/unlock with guard(mutex), the lock
lifetime is extended to the end of lp5860_device_init(). This means the
lock is held while calling lp5860_init_dt().

However, lp5860_init_dt() eventually calls lp5860_set_mc_brightness(),
which attempts to acquire the exact same lock:

drivers/leds/rgb/leds-lp5860-core.c:lp5860_set_mc_brightness() {
    ...
    guard(mutex)(&led->chip->lock);
    ...
}

Since Linux mutexes are non-recursive, will this cause an unconditional
deadlock during initialization?

>  }
>  EXPORT_SYMBOL_GPL(lp5860_device_init);
> =20
> diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-l=
p5860-spi.c
> index 5e0c44854a680..13ad90362d5f0 100644
> --- a/drivers/leds/rgb/leds-lp5860-spi.c
> +++ b/drivers/leds/rgb/leds-lp5860-spi.c
[ ... ]
> @@ -61,22 +61,15 @@ static int lp5860_probe(struct spi_device *spi)
>  				     "Failed to initialise Regmap.\n");
> =20
>  	lp5860->dev =3D dev;
> -	mutex_init(&lp5860->lock);
> +	ret =3D devm_mutex_init(dev, &lp5860->lock);
> +	if (ret)
> +		return ret;

[Severity: Low]
Is the ret variable declared in lp5860_probe()?

It looks like the local variable ret was never declared in this function,
which will cause a build failure.

> =20
>  	spi_set_drvdata(spi, lp5860);
> =20
>  	return lp5860_device_init(dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806145527.1148=
44-1-kr494167@gmail.com?part=3D1
