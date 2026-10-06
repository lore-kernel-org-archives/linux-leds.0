Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9171A704B;
	Tue,  6 Oct 2026 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259150; cv=none; b=g9JLq+NPSqm0zB42OjMv7RyEipU84fKf7cUf35q0owA250hOlSx9wYdm2B7fkD1JeoyxYFXL2oQ/NAu3GFR20yxZ3gT235GHVebiM65pnvtIIjgL9Qn2fPB/9A5fXB5bD8HkyFdNTuB7/HjRVi2hKN6stIlhVMxh1Zp+6LDjrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259150; c=relaxed/simple;
	bh=6CeMdXjDUwP21mgH6d0d0RBFlPsUjnIb1VaCO+DFbKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J2eaIKEp86/wWEPyVaRQ0ULILyt5oxbNkcYPGNWyv2+eMmKia/E9CRAR0l+FVUA4mqLnj/4NOoIWeymIgVNYvgKJOw3qcXRPulOX2NwN0MbFP8WXF5NYFEe0zt1qlNMKum7zhapL0C6gVdo81QDjK4fvppYm0QcA1GF9kakOuD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8Xw/YVp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8Xw/YVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932F71F000FF;
	Tue,  6 Oct 2026 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259149;
	bh=jEFnVYx/OYdAz9dbruGlUGYy+VLKj6VjVm45/R5ZAn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n8Xw/YVphPR3ZrwbPYyQ12jgXGMTqrqRxB9KUz6ejFVKcPbcbATTEHJZ+BWeUCKcW
	 pxwX82EE/8QPOQQ4NHNnAPLXnDYyWR6QkFMBxfjPgUBXpwh3zGbDnzuBgYJxb5sSEU
	 vpzyTbkBmjTBW2KziB0d9Z5eXU8ltEdKw9OrX4bXN0gD/jQ9RSpLs3HtxL7cDafv/8
	 FCPEcLxjDDGk36pzILOxCf+gStAeo3/kJNXuimln72SmZl3AY2q/Kj4lbHVyLxuzY/
	 deJURZMcTkHJKD97ok+QFvcx1VzHZZHjaFfclnRA1Sib/se52r8ePEGzPS6lN3bBaA
	 WQb8liOig2h8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] leds: aw2013: Prevent writes to unpowered chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-6-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-6-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 03:59:08 +0000
Message-Id: <20261006035908.932F71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: aw2013: unnecessary power cycle when setting brightness to=
 0
- [Medium] leds: aw2013: regulator leak on I2C error during turn-off
--

commit f162a4969ac4532fe0ad6e583070bbdf610e7263
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: Prevent writes to unpowered chip

This commit replaces the chip_in_use check with a chip->enabled boolean
evaluation in aw20xx_brightness_set(). It aims to prevent the driver from
unconditionally calling I2C transactions to an unpowered chip when the LED
core initializes the brightness to 0 during probe, teardown, or
unregistration.

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -257,7 +257,7 @@ static int aw20xx_brightness_set(struct led_classdev =
*cdev,
> =20
>  	mutex_lock(&led->chip->mutex);
> =20
> -	if (aw20xx_chip_in_use(led->chip)) {
> +	if (!led->chip->enabled) {
>  		ret =3D aw20xx_chip_enable(led->chip);
>  		if (ret)
>  			goto error;
>  	}

[Severity: Medium]
Does this introduce an unnecessary power cycle when the brightness is set t=
o 0?

By unconditionally enabling the chip if it is currently disabled, the
driver will incur the performance penalty of powering up regulators and
performing I2C initialization, only to immediately write a 0 and power
down again. This happens during probe, teardown, or when userspace writes
0 to an already off LED.

[ ... ]

>  	num =3D led->num;
> =20
>  	ret =3D regmap_write(led->chip->regmap, AW20XX_REG_PWM(num), brightness=
);
>  	if (ret)
>  		goto error;

[Severity: Medium]
Does this leak the regulator enable if the I2C write fails?

If the chip was previously unpowered and was just enabled by the new
check above, an I2C failure here jumps directly to the error label:

aw20xx_brightness_set()
    ...
    error:
        mutex_unlock(&led->chip->mutex);
        return ret;

This bypasses aw20xx_chip_disable(), leaving the regulators permanently
enabled despite the LED logically being off.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D6
