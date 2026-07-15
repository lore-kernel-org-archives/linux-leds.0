Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1792BEC5F;
	Wed, 15 Jul 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123847; cv=none; b=BCkacedNCGGtPa/NN+1yC23OTOnH4bvZ7Mss7VwEtgHuYAaRn+xH/1Socc6YnjDM+6bmCRd2bK51RqPTumoNAyoElVNNy0ZzhLeJ2Y3kCeO5EZJskcwd6FlON6TbkhETR2FfeWWic30tcly53LNdOvnC7D1luPUZU6CF6SeyZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123847; c=relaxed/simple;
	bh=NO6jAPgSPzytuPFQfw/23MBWm+u5gYaS/UaApL6Kyzo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mf5wzs3efnWm7Xl5GgV+3tvkiAbaHTStAN8gNx9tNBH+j4kbownkjwaJJbGxgGtpIM8jpGT3Bx9+aKXDE/UEqwBSbD7yuNlFlBkdqATGfkb35sPWnjsUEoglQMrUrRhoKitTRDybX7eimSxeb6iTlWgHobHDfsHHHDCMuL5V2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwhlxTvM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwhlxTvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4A91F01560;
	Wed, 15 Jul 2026 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123845;
	bh=jYhzCVwkxqSGQogNfEYnNikHr+RklnA3l0xAFUg8sKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gwhlxTvMxgjNLWV1s18zNjItdCL6eTNAB9Jgi5ftrjXV3+gmxC3wl83HJuZ5/EKoC
	 q/f4FCAvB0lXyQ/+C+JVWXQScDaGbPuswySkr6RzN5ePDI92dG86P9VXYeJ1TpIOAI
	 91RckZrxb5gxKAWTmwsjbRNaVqLbrAe6dV+NXbt9ybBvwg/3gO/VoOe502EahJyukH
	 xmkdKvrBCVgKosiMNtIn9L3ipuQokPDwOzUgK2YNQm6OnvB/XjwXynxoyc5E3uq0Tk
	 czVV5YwseV4ALUWAYAmVJ+zOypdpcJ5R8PB5szdkz5iNWeL+gaw4WZQ+atwEgJWqqe
	 IJcENzHj6L1qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
 <20260715-monza-leds-v6-3-d1724bb7fe3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:57:25 +0000
Message-Id: <20260715135725.8A4A91F01560@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Commit Message Capitalization Violation

Pre-existing issues:
- [High] Silent truncation of negative error codes from I2C reads leads to =
hardware register corruption.
- [High] Unprotected I2C writes to shared global hardware blinking register=
s.
--

--- Patch [3]: [PATCH v6 3/4] leds: pca963x: add multicolor LED class suppo=
rt ---
commit 9035bb6a1e69dbc8b0e467061aaa0b06a70a0f89
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

leds: pca963x: add multicolor LED class support

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.
A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

> leds: pca963x: add multicolor LED class support

[Severity: Low]
This isn't a bug, but the subsystem prefix description should be capitalize=
d.
Should it be "leds: pca963x: Add multicolor LED class support"?

> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index e3a81c60ee27c..f3e4d65e48b4c 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led)
>  	led->blinking =3D true;
>  }

[Severity: High]
This is a pre-existing issue, but are global chip registers modified without
acquiring the chip mutex here?

drivers/leds/leds-pca963x.c:pca963x_blink() {
        ...
        i2c_smbus_write_byte_data(client, chipdef->grppwm, led->gdc);
        i2c_smbus_write_byte_data(client, chipdef->grpfreq, led->gfrq);
       =20
        if (!(mode2 & PCA963X_MODE2_DMBLNK))
                i2c_smbus_write_byte_data(client, PCA963X_MODE2,
                                          mode2 | PCA963X_MODE2_DMBLNK);
       =20
        mutex_lock(&led->chip->mutex);
        ...
}

If user-space initiates hardware blinking for two different LEDs concurrent=
ly,
could their writes to these global frequency and duty cycle registers
interleave and corrupt the hardware blink state for the entire chip?

[ ... ]

> @@ -221,22 +229,54 @@ static int pca963x_led_set(struct led_classdev *led=
_cdev,
>  			   enum led_brightness value)
>  {
>  	struct pca963x_led *led;
> +	unsigned long cached_leds;
>  	int ret;
> =20
>  	led =3D container_of(led_cdev, struct pca963x_led, led_cdev);
> =20
>  	mutex_lock(&led->chip->mutex);
> =20
> +	cached_leds =3D led->chip->leds_on;
>  	ret =3D pca963x_brightness(led, value);

[Severity: High]
This is a pre-existing issue, but does assigning the result of
i2c_smbus_read_byte_data() directly to a u8 silently truncate negative error
codes?

If the read fails and returns -EIO, this would truncate the negative error
code into a garbage unsigned 8-bit integer, and we then write it back to the
chip in pca963x_brightness():

drivers/leds/leds-pca963x.c:pca963x_brightness() {
        ...
        ledout =3D i2c_smbus_read_byte_data(client, ledout_addr);
        ...
        val =3D (ledout & ~mask) | (PCA963X_LED_ON << shift);
        ret =3D i2c_smbus_write_byte_data(client, ledout_addr, val);
        ...
}

The same pattern appears in pca963x_blink() with the mode2 variable. Could
this cause hardware register corruption during a transient I2C failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-monza-leds=
-v6-0-d1724bb7fe3d@oss.qualcomm.com?part=3D3
