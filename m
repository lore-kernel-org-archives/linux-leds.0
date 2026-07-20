Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690F3CF211
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543823; cv=none; b=MyrTaNSzPNLVAJR5la7lPFK0KGV9mScsXy5JeJwpZ6pr56o92attOhwPCN+X9oxp1GjhgA3EnlhJwwy2OBGdhq0L4Qi5LvHLZPlnh1gMn4NcGYBHjJMcjL0wTkcfhGso0osl1hQ+NSW5z4wpyYJ+gA0e4G4qAiEBg96hx6LwQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543823; c=relaxed/simple;
	bh=m3v03enS2hPpJiA5F3cCOmKJh7ax7kqph41Ik5zJaAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cC7RKEz9nGN4cjXTXCES0A1tSSdZYkfZIuOQhAhM92Jn72LBn9bMcWC5sc0hTI6KxG2IryhcKc/MgW8lYZE4ZP9/uezcTzivMb5ybAgux+DDnaB13vPqQeb9PfTZmvbTcLzUscKU6Bk5r1DegwwSHO5wpbWWFiDcz+ahztncCDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJ+blEVg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJ+blEVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195E61F000E9;
	Mon, 20 Jul 2026 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543822;
	bh=6TUbQhMn8obz+8+HTf3ALfyw2rFH2oMY7Y4Xky0IdGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XJ+blEVgrZDbepSUk/bMxTs3hQRj03hgeuG5x+Nz2yDwzbLvc0SvFRnR48bgwGCn6
	 hQT73sJBbzls6YB/6tXzSILRgvjTO6jZ1brhnOSXLzTloOdgTN0IhIg4dNIoY0Q7qV
	 srsRP0YBNJHu2GMDJtBQb9cnyxHDyEnbP62VtIF+Q0hb2oXiB9URGMR7xLrU+6soCI
	 tyPqCC39ircYJ11CoMpYOtdsWPrpJf3l9iVvxTU+WwFOWwTHyR75OMeFVe33oq15py
	 g47Fq7WpHgOAMiQAibpdcWlmIcr3ZsXfdRoaldkG454rt6hxkjpeF9iQoXSPdXdsFs
	 aMcFqpbXAkY9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp5860: fix init error-path locking
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260720102525.86475-1-kr494167@gmail.com>
References: <20260720102525.86475-1-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:37:01 +0000
Message-Id: <20260720103702.195E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message falsely claims a deadlock existed on the `reg=
map_update_bits()` error path.
- [Low] The commit message prefix and description violate subsystem capital=
ization guidelines.

Pre-existing issues:
- [High] The driver destroys its primary mutex in `.remove()` before execut=
ing hardware teardown and devres cleanup, causing multiple use-after-destro=
y locking violations.
- [High] LEDs are unregistered via devres after the chip is manually disabl=
ed, risking invalid hardware accesses.
--

--- Patch [1]: [PATCH] leds: lp5860: fix init error-path locking ---
commit 2979577a641c15da3d90ccaf3a97200e7e476dbb
Author: surendra <kr494167@gmail.com>

leds: lp5860: fix init error-path locking

This commit addresses a locking issue in the initialization error path for
the lp5860 driver. It releases the lock immediately after the regmap update,
avoiding potential lock mismanagement in the subsequent error paths.

> leds: lp5860: fix init error-path locking

[Severity: Low]
According to the LED subsystem naming conventions, should the description
after the subsystem prefix be capitalized? So "fix" would become "Fix".

> lp5860_device_init() jumps to err_disable with the mutex held when
> regmap_update_bits() fails. The error handler calls lp5860_chip_enable(),
> which tries to acquire the same mutex and deadlocks.
>
> Conversely, an lp5860_init_dt() failure reaches the same handler after the
> mutex has been released, causing mutex_unlock() to operate on an unlocked
> mutex.

[Severity: Medium]
Is this description of a deadlock accurate?

Looking at the original code, the err_disable block explicitly executed=20
a mutex_unlock() before calling lp5860_chip_enable():

err_disable:
	mutex_unlock(&lp->lock);
	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
	return ret;

Since lp5860_chip_enable() uses guard(mutex)(&lp->lock), it safely=20
re-locks the just-released mutex. Could the commit message be updated to=20
clarify that this fixes a double-unlock bug when lp5860_init_dt() fails,=20
rather than a deadlock on the regmap_update_bits() path?

> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-=
lp5860-core.c
> index fd0e2f6e6e0f4..e21d5f2302be0 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -204,9 +204,9 @@ int lp5860_device_init(struct device *dev)
>  	mutex_lock(&lp->lock);
>  	ret =3D regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_M=
ODE_MASK,
>  				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
> +	mutex_unlock(&lp->lock);
>  	if (ret)
>  		goto err_disable;
> -	mutex_unlock(&lp->lock);
> =20
>  	ret =3D lp5860_init_dt(lp);
>  	if (ret)
> @@ -215,7 +215,6 @@ int lp5860_device_init(struct device *dev)
>  	return 0;
> =20
>  err_disable:
> -	mutex_unlock(&lp->lock);
>  	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);

[Severity: High]
This is a pre-existing issue, but does destroying the mutex in=20
lp5860_remove() before calling hardware teardown lead to a=20
use-after-destroy violation?

In the spi driver, we have:

lp5860_remove() {
	...
	mutex_destroy(&lp5860->lock);
	lp5860_device_remove(&spi->dev);
}

But lp5860_device_remove() calls lp5860_chip_enable(), which acquires=20
the just-destroyed mutex:

lp5860_chip_enable() {
	guard(mutex)(&lp->lock);
	...
}

Will this cause a kernel crash when lock debugging is enabled?


[Severity: High]
This is also a pre-existing issue, but does unregistering the LEDs via=20
devres after manually disabling the chip cause invalid hardware accesses?

The driver uses devm_led_classdev_multicolor_register_ext() to register=20
LEDs, which handles unregistration automatically via devres during device=20
removal. However, the manual lp5860_device_remove() call happens before=20
devres cleanup:

lp5860_remove() {
	...
	lp5860_device_remove(&spi->dev);
}

The automatic devres cleanup will eventually set the brightness to 0,=20
invoking lp5860_set_mc_brightness(). Since the chip was already disabled=20
manually in lp5860_remove(), could this result in regmap I/O to disabled=20
hardware over SPI? Should the hardware teardown be synchronized via a=20
managed devres action instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720102525.8647=
5-1-kr494167@gmail.com?part=3D1
