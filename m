Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA79A3B7753;
	Tue, 13 Oct 2026 05:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870802; cv=none; b=QLHza1kSH65PdnqxAw62h4r1y3uoOPQUq3jgqs4VkgSkHiqKREgd5XuFlsJeqLjNFmJ2D5pHvMY+j3kLmmfmnkKEZppUTZPjL8DACMPJfA218R/TSEz8yMmT9bKix5gqkMfLj27/mMrbdiKnPHpeXTwVHXT/E8DPvmBHiyFcgkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870802; c=relaxed/simple;
	bh=lQ+HtShb1ILZcjgqjHwdtGlbpUFzBEitWcQqi4xJX9g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=a73XEEM1ePFwv1MykSu/qCgATGP7tdf0tulD/vWsnVgSWCjEGL/B7Ytg7zGq1PEky/QS3GF28nguvDCIZvZtMijLY8vnGvsbko6lHu88RI8i5TeDfLx8erv4m7cuM7ImVSxx57t/40tJGZ1epYjItso1U118n/PltyrfKpxYdRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJKQvTwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJKQvTwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4111F000FF;
	Tue, 13 Oct 2026 05:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870801;
	bh=cE7jlkV8aVdmjuf7B4+Za2FDX/kjq/K8eY6xNDElK0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJKQvTwLUm76dHdiodNqxv7ld8hJ5u0Y2RN9BncTmQd6WvQZfNo+Q54VkSezvmtfa
	 8L6/QEMwpS31vuF3yP6Ce3+limURxLpEO86hxVc3lL9CRGfVZqT7jbXx2EaVXimdtG
	 +kMoFM39EYxYSTWh+UyVb18moH9ZwXawcWiWw9eZgAPPe+psMZ0pRHGn7UKx617bV3
	 Bc2v5wmoVK62KDWKuRVXalBfTyGjV8PTxmb2Fa8k1qwfrQ86elv2x/q1K4+IKL+Fko
	 EN4Vaww7RQCv0dA9ppZzU8OaOAG1cXf+l8Xx1fI5G2dEf+BckUrqjJ8gavQQ5szfmV
	 dpyNzs7TGcR6A==
Message-ID: <sashiko-outbox-169017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] leds: aw2013: Prevent writes to unpowered chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:53:20 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] leds: aw2013: Unconditional chip poweroff on I2C error breaks acti=
ve LEDs
- [Medium] leds: aw2013: lockless early return skips PWM clearing on shared=
 regulators
- [Medium] leds: aw2013: state desync if regulator_bulk_disable() fails
- [Low] leds: aw2013: writes to unpowered chip in aw2013_blink_set()
--

commit 6dcd66138416065d07df9a5558a059f701861e00
Author: Paul Sajna <sajattack@postmarketos.org>

    leds: aw2013: Prevent writes to unpowered chip

    This patch replaces the chip_in_use check with a chip->enabled boolean =
in
    aw2013_brightness_set to prevent writing to the chip when it is unpower=
ed.
    It also adds aw2013_chip_poweroff() to avoid sending I2C commands when
    powering on the chip fails.

>     Because aw2013_chip_enable() is skipped, the driver then unconditiona=
lly
>     calls regmap_write() and regmap_update_bits(), which perform I2C
>     transactions to the unpowered chip.

[Severity: Low]
Does this same issue still occur in aw2013_blink_set()?

If a prior aw2013_brightness_set() call fails (e.g., regulator enable fails=
),
cdev->brightness can remain > 0 while led->chip->enabled is false.

A subsequent sysfs write to blink delays invokes aw2013_blink_set(), which
sees brightness > 0, bypasses aw2013_brightness_set(), and unconditionally
writes to the unpowered chip's registers:

	/* Never off - brightness is already set, disable blinking */
	if (!*delay_off) {
		ret =3D regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
					 AW2013_LCFG_MD, 0);
		goto out;
	}

[ ... ]

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 3b2be960c04d5..6e661afd77755 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -193,15 +193,13 @@ static int aw2013_chip_init(struct aw2013 *chip)
>  	return ret;
>  }
> =20
> -static void aw2013_chip_disable(struct aw2013 *chip)
> +static void aw2013_chip_poweroff(struct aw2013 *chip)
>  {
>  	int ret;
> =20
>  	if (!chip->enabled)
>  		return;
> =20
> -	regmap_write(chip->regmap, AW2013_GCR, 0);
> -
>  	ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
>  				     chip->regulators);
>  	if (ret) {
>  		dev_err(&chip->client->dev,
>  			"Failed to disable regulators: %d\n", ret);
>  		return;
>  	}
> =20
>  	chip->enabled =3D false;
>  }

[Severity: Medium]
Could this early return cause a hardware state desynchronization if
regulator_bulk_disable() fails?

During aw2013_chip_disable(), the driver first writes 0 to AW2013_GCR to
enter software standby, then calls aw2013_chip_poweroff(). If the regulator
disable fails here, it returns early leaving chip->enabled =3D true.

On subsequent brightness changes, aw2013_chip_enable() will see
chip->enabled =3D=3D true and skip aw2013_chip_init(). This skips restoring
AW2013_GCR to 1, leaving the chip stuck in standby but completely
unresponsive to brightness changes.

[ ... ]

> @@ -253,9 +261,12 @@ static int aw2013_brightness_set(struct led_classdev=
 *cdev,
>  	struct aw2013_led *led =3D container_of(cdev, struct aw2013_led, cdev);
>  	int ret, num;
> =20
> +	if (!led->chip->enabled && brightness =3D=3D 0)
> +		return 0;
> +

[Severity: Medium]
Can this lockless check introduce a TOCTOU race that skips clearing the
LED's hardware registers?

If two LEDs are on and both are set to 0 concurrently, the LED core updates
cdev->brightness =3D 0 for both before scheduling their asynchronous works.

The first worker executes aw2013_brightness_set(), acquires the mutex,
clears its own PWM, and evaluates aw2013_chip_in_use(). Because both
cdev->brightness values are now 0, aw2013_chip_in_use() returns false,
causing the first worker to disable the chip (chip->enabled =3D false) and
unlock the mutex.

The second worker then evaluates this new lockless check, which is now
true, and returns early without ever taking the lock or clearing its PWM
register over I2C.

When the regulators are shared with other devices, power is not physically
cut, and the chip retains its register states in software standby. The next
time the chip is enabled, will the second LED erroneously turn on because
its registers were never cleared?

>  	mutex_lock(&led->chip->mutex);
> =20
> -	if (aw2013_chip_in_use(led->chip)) {
> +	if (!led->chip->enabled) {
>  		ret =3D aw2013_chip_enable(led->chip);
>  		if (ret)
>  			goto error;

[ ... ]

> @@ -284,7 +295,12 @@ static int aw2013_brightness_set(struct led_classdev=
 *cdev,
>  	if (!aw2013_chip_in_use(led->chip))
>  		aw2013_chip_disable(led->chip);
> =20
> +	mutex_unlock(&led->chip->mutex);
> +
> +	return ret;
> +
>  error:
> +	aw2013_chip_poweroff(led->chip);
>  	mutex_unlock(&led->chip->mutex);
> =20
>  	return ret;

[Severity: High]
Will this unconditional poweroff disrupt the hardware state of all other
active LEDs on the same chip?

If multiple LEDs are ON (so chip->enabled =3D true) and a transient I2C err=
or
occurs while changing the brightness of one LED, the code jumps to this
error label.

The new aw2013_chip_poweroff() call unconditionally drops power to the
entire chip. This shuts down all other physically active LEDs without
updating their cdev->brightness in the LED core.

Should this error path only roll back aw2013_chip_enable() if it was the
call that successfully enabled the chip on this specific invocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-aw2013-aw2=
0xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=3D5
