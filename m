Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A64968EE;
	Wed,  2 Sep 2026 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352919; cv=none; b=n6NbX6RNCCuULUjYRGpd/lTbQrdHjfXlnTTkC+YCnh1FzR68Kc3iMgH796pZ2YKHqI4AqzYhL6D7/1hGv3if8TgGBudbOE4VmyUEn0MTpwKYfvUsGPAhgEBurq2WjUoApQ9Os9GqJzi7WX2QzlBii3CEw4bl8oxKlD9quDdgxhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352919; c=relaxed/simple;
	bh=nS9ZYL2qizNhRzB6xacnIz27/m1IJDvBFRqgsQqvvlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e/aLjCDBlqibbnQ64PV6i5DU3FGD68wXB2iWGQMfd1xTw7x34ZJOMxbeijBVli+QMv+MAJ6hCym/L5mWSbheCTgHRIXjYyHqE/0a3K2R/xF3ilKpQQy+MG9g682KLt6RIDzkYDJIvvmy/K5z9PWw/mydNi/bI/4lHc9JGhwgZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6K7OUDR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6K7OUDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F441F00A3A;
	Wed,  2 Sep 2026 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352918;
	bh=7SoWBbEYJPjADPueQ9vz2kU8in6fVF+bd8fRgSgRgns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J6K7OUDRSREsabqvGI0iVkpbJNtOiLpolV0XsND8uttLztnpjkVE7/b7iim+3pyTQ
	 0wR4E0usfhsYNRVZ71WDTEOdT78cTIguRxMp8fPUuejg2DfdXW1Qc2+f17bxYRFz7z
	 K79y9iHQkWMmwMIqJY6rjpVqoQcyI/eZCAZF0Fl2TjxnJpSnWf7X3Rpts5boVBqfml
	 Bg/lf8doRwUHE90gLCXlfmCysORBLzvEVmdwBhZxe5z/aZ+hbJ4H9KkS07kkp3BZd5
	 GKhXsee+Jg5rWsFTayWZyCyzgwXywlR6uClbGrukLtOwMfiuJv0/g4mzIWxypi7hkm
	 qOV/7qPA/8iJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] leds: pca995x: add support for reset GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <1d5436e3a143d72c04c2bfd1d7fee2674e0af8e5.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <1d5436e3a143d72c04c2bfd1d7fee2674e0af8e5.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:41:57 +0000
Message-Id: <20260902124158.19F441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] The commit message description violates the LED subsystem capitaliz=
ation convention.
- [Low] Using usleep_range() for a microsecond delay under 10us.
- [Low] Use of the legacy <linux/gpio.h> header instead of <linux/gpio/cons=
umer.h>.
- [Low] Missing #include <linux/delay.h> for usleep_range().
--

commit 73fa0526608a4d478003bcf92f25fa0aa33eae7c
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: add support for reset GPIO

This commit adds support for resetting the PCA995x LED driver during
probe by utilizing a reset GPIO pin if provided in the Device Tree.

> leds: pca995x: add support for reset GPIO

[Severity: Low]
This isn't a bug, but does this violate the LED subsystem commit message
capitalization convention? The guidelines require capitalizing the
description after the subsystem prefix, so "add" would ideally be "Add".

> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index fee6216cd1bd0..8eb9847b9709f 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
> @@ -8,6 +8,7 @@
>   * Copyright 2023 Marek Vasut
>   */
> =20
> +#include <linux/gpio.h>

[Severity: Low]
Does this code use the legacy <linux/gpio.h> header instead of
<linux/gpio/consumer.h>?=20

The kernel typically forbids including <linux/gpio.h> in consumer drivers.
Since this driver only uses descriptor-based APIs like
devm_gpiod_get_optional() and gpiod_set_value_cansleep(), relying on
<linux/gpio.h> can cause implicit declaration build errors if
CONFIG_GPIOLIB is disabled.

[ ... ]

> @@ -130,6 +132,16 @@ static int pca995x_probe(struct i2c_client *client)
>  	if (!dev_fwnode(dev))
>  		return -ENODEV;
> =20
> +	reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(reset_gpio),
> +				     "failed to request reset GPIO\n");
> +	if (reset_gpio) {
> +		usleep_range(3, 4);

[Severity: Low]
Is usleep_range() appropriate for a microsecond delay under 10us here?

According to the kernel timers-howto, usleep_range() is designed for
delays greater than 10us due to timer setup and context switching overhead.
For delays as short as 3-4us, udelay() is generally recommended to avoid
unnecessary performance inefficiency.

[Severity: Low]
Is there a missing #include <linux/delay.h> for this usleep_range() call?

Relying on implicit includes from other headers (like <linux/i2c.h>) is
fragile and could cause build breakages on certain architectures or
configurations.

> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +		usleep_range(1500, 1600);
> +	}
> +
>  	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D3
