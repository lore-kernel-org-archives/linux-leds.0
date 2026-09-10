Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC24DA546
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070174; cv=none; b=QIZbrt6Y7cg04bCnd5obLt2okZ9wGJTGCEemi6/iq1J7ziDvrSIn4kGJr+wdLKTVMpvjzBNhLFHknfnZ2rG1NF2arTDGzecLDxvUbSqyS6RM6sAG34YYxbwyo/I6RDCwk/fg1aS1LCwu2RrYQfMTLWGe5Sr+FzR3+WkarIaPgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070174; c=relaxed/simple;
	bh=wdC7y2X0qaTfKnM8bgFIa2jxpOS382CkzwXHS8Z0pn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gxVHEzLjnjgAI9aAPIL3MM+uYaKdP+GBlpWwZqCDnmqJG3dCdvll+0pJvEZeWCiMe6+ULIiwhZZT10pqEfSvVXdcwSJEs5U5lqax/njkpd8EDh6DqMK+j9+tQk9btEuPFQt7Fzme/SZzZsiRP8B+9ySpuk8eV4OZL/zlUNuzvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY0OrFLa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY0OrFLa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C511F000FF;
	Thu, 10 Sep 2026 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789070173;
	bh=TZ2r3qi1ExYnPrV3zHvBvtQgqkO223wlT399bME+VoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KY0OrFLa2o5nX/6gtMddNhb9MfHqee5mgsL4W8Q6ON+k3elS24J7bO7OWzxmB1ZUd
	 YoRoqvCjqev4GY17tdQ1l5KRNon/pK7dHWvB8GYWd53l93WkvUKnG1hEvM81P6rCk+
	 ueQx1DhcUmGYXa5CMM8vxduT6XMPi4Jv19xWUk0hes56RrkvI1Sgv3hcAFOaz0bj+Y
	 UAhNxJ/ffbGkBjB8c4eyLDLztkp2CmJW3Goxu+VfS/E1bcw0HbK/cHRkr7+cDnaDxF
	 2b3ERuR/FB3ArpaTaUfEfqA83MTQ3AaPU/CTZbuf2Ep7xvp7Dd58rEuLNvSRKoNJj2
	 uhQQ/q4UJLjYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: ktd2692: Pass context to regulator cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260910194525.99654-1-mhun512@gmail.com>
References: <20260910194525.99654-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 19:56:12 +0000
Message-Id: <20260910195613.02C511F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent suppression of -EPROBE_DEFER from devm_regulator_get() and =
missing return on regulator_enable() failure.
- [High] Race condition exposing the LED device to userspace before hardwar=
e setup is complete.
- [High] Kernel panic due to division by zero if `flash-max-timeout-us` is =
configured too small.
--

commit 6025dd2c27de45e105ee950ad7b4f5c0824e9c17
Author: Myeonghun Pak <mhun512@gmail.com>

leds: ktd2692: Pass context to regulator cleanup

This commit fixes a NULL pointer dereference in the regulator disable actio=
n.
It passes the allocated driver context directly to devm_add_action_or_reset=
()
instead of relying on platform_get_drvdata() which is uninitialized at that
point.

> diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-=
ktd2692.c
> index 22fbfccd48735..43d4d55503ab5 100644
> --- a/drivers/leds/flash/leds-ktd2692.c
> +++ b/drivers/leds/flash/leds-ktd2692.c
[ ... ]
> @@ -233,7 +234,7 @@ static int ktd2692_parse_dt(struct ktd2692_context *l=
ed, struct device *dev,
>  			dev_err(dev, "Failed to enable supply: %d\n", ret);
>  		} else {
>  			ret =3D devm_add_action_or_reset(dev,
> -						regulator_disable_action, dev);
> +						regulator_disable_action, led);
>  			if (ret)
>  				return ret;
>  		}

[Severity: High]
This isn't a bug introduced by this patch, but does ktd2692_parse_dt()
silently suppress probe deferral and missing regulator errors?

If devm_regulator_get() returns -EPROBE_DEFER, the error is swallowed:

	led->regulator =3D devm_regulator_get(dev, "vin");
	if (IS_ERR(led->regulator))
		led->regulator =3D NULL;

Additionally, if regulator_enable() fails, it prints an error but continues
probing without power instead of returning the error code:

	if (led->regulator) {
		ret =3D regulator_enable(led->regulator);
		if (ret) {
			dev_err(dev, "Failed to enable supply: %d\n", ret);
		} else {

Should the driver properly propagate -EPROBE_DEFER and return the failure
from regulator_enable()?

[ ... ]
> @@ -290,6 +291,7 @@ static int ktd2692_probe(struct platform_device *pdev)
>  	if (!led)
>  		return -ENOMEM;
> =20
> +	led->dev =3D &pdev->dev;
>  	fled_cdev =3D &led->fled_cdev;
>  	led_cdev =3D &fled_cdev->led_cdev;
>  	led->props.timing =3D ktd2692_timing;

[Severity: High]
This is a pre-existing issue, but does ktd2692_probe() expose the LED device
to userspace before hardware setup is complete?

led_classdev_flash_register() exposes the device to userspace sysfs.
ktd2692_setup() is called afterward:

	ret =3D led_classdev_flash_register(&pdev->dev, fled_cdev);
	if (ret) {
		dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->name);
		mutex_destroy(&led->lock);
		return ret;
	}

	ktd2692_setup(led);

If userspace writes to sysfs (e.g., brightness) in the race window, it could
trigger ktd2692_led_brightness_set() before or during ktd2692_setup().

Could this lead to concurrent access to uninitialized hardware?

[Severity: High]
This is a pre-existing issue, but can the driver trigger a kernel panic due
to a division by zero if flash-max-timeout-us is configured too small?

If flash-max-timeout-us in the Device Tree is less than 7, setting->step
evaluates to 0 in ktd2692_init_flash_timeout():

	setting->step =3D cfg->flash_max_timeout
			/ (KTD2692_FLASH_MODE_TIMEOUT_LEVELS - 1);

Later, when userspace triggers a flash strobe via sysfs,
ktd2692_led_flash_strobe_set() executes GET_TIMEOUT_OFFSET, which divides by
step (which is 0):

	flash_tm_reg =3D GET_TIMEOUT_OFFSET(timeout->val, timeout->step);

Could this cause a division by zero? Should the driver validate the minimum
value of flash-max-timeout-us during initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910194525.9965=
4-1-mhun512@gmail.com?part=3D1
