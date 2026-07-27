Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773493D564A;
	Mon, 27 Jul 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146927; cv=none; b=MtarRJCqFcvajUsbP8rr5z0DfXuhHXt383pB0j+C5GmYhHgCTcPrFQG8jee6o143OapBpDT1As6lzg0k+US2wDSg2pnNupgN6HnSDe4KnqJ5Z5XhfVWofXgpE6Buebmb56uGWeeo+5FNqpjfvM+p8P4yLuicn0PgucDGGUqsqJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146927; c=relaxed/simple;
	bh=MdjPOpIxrksWCrAOPqXA9lu4oofWH1xEcWyQt6ZvxmY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NHfctqcxzMu1LoE8xHsaCZ+8Tp6Y/zvOk+CHGpAQKtF8yQ2V2OCSESD0fdcG4eNEUDEN88/32IM27BWaDRBu+AzqSdkhh6OTmBboE32pttr50d1pv8c5EDqevbcToSjPu0V690tn8SXLdGY0ma+O2EKu6xUZCd3QvRlZ4WNqP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6a6hoih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6a6hoih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901541F00A3A;
	Mon, 27 Jul 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785146926;
	bh=q6whNwCJ4/Ap+DChQKL+2sJOdSEqEhTh4+McTIuqiS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6a6hoih+66xVenKcc2JF1k1wH1NDtreB8QZEaspQeVIYjglE/oXjJO3xI8KwgSf6
	 xJ0dTnhW0MKg8Q9WVAM2o4Xe0WHGsQhN6uyNmV8KnUjUgEFXmjsqdmSGfY3bwpD9x1
	 vlaQpHv7pADtH3Y+WY2uu7I1KLXSlLP3HpvPExtt5BxYwQlJaEC5Zq0lXtoUIUu/mr
	 WeKDD1sGUVomUCg4IN6PZq8GWB4i/N9Iy1fUed8CUcLJiZ2ImM1XNZG92yxo8KKmSw
	 XkfvszKXKXgA7GLBAb/5Y8eznOwmRUFWMIP2TwG1MudpbNaoL4X8HMpTrJVxwg3TVe
	 VKC+EQSCPyDeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pca9532: check i2c_smbus_read_byte_data() return
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: Frank.Li@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
References: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 10:08:44 +0000
Message-Id: <20260727100845.901541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes an unchecked I2C read in `pca9532_getled()` but mi=
sses an identical flaw in `pca9532_setled()`, where I2C read failures cause=
 register corruption.
- [High] `pca9532_gpio_get_value()` ignores I2C read errors and silently re=
turns meaningless GPIO states.
- [High] A race condition during device unbinding allows the input device t=
o re-queue work after it has been cancelled, leading to a Use-After-Free of=
 the driver data.
--

--- Patch [1]: [PATCH] leds: pca9532: check i2c_smbus_read_byte_data() retu=
rn value ---
commit 87ac49dee89ea1bd1132b25134fdbdfad3eb7c48
Author: Haibo Chen <haibo.chen@nxp.com>

leds: pca9532: check i2c_smbus_read_byte_data() return value

This commit fixes an integer underflow and overflow issue in pca9532_getled=
()
by checking the return value of i2c_smbus_read_byte_data(). It ensures that=
 a
failed I2C read returns a fallback state and emits a warning instead of
computing a meaningless LED state.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 2d37e00e459de..e8ee17b8bd547 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -298,12 +298,15 @@ static enum pca9532_state pca9532_getled(struct pca=
9532_led *led)
>  	struct i2c_client *client =3D led->client;
>  	struct pca9532_data *data =3D i2c_get_clientdata(client);
>  	u8 maxleds =3D data->chip_info->num_leds;
> -	char reg;
> -	enum pca9532_state ret;
> +	int reg;
> +	enum pca9532_state ret =3D PCA9532_OFF;
> =20
>  	mutex_lock(&data->update_lock);
>  	reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
> -	ret =3D (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
> +	if (reg >=3D 0)
> +		ret =3D (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
> +	else
> +		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);

[Severity: High]
This isn't a bug introduced by this patch, but this commit fixes an
unchecked I2C read in pca9532_getled() while missing an identical flaw in
pca9532_setled().

If i2c_smbus_read_byte_data() fails when called from pca9532_set_brightness=
(),
it returns a negative error code (e.g., -EIO). In pca9532_setled(), this is
truncated to a char, bitwise modified, and blindly written back to the devi=
ce:

drivers/leds/leds-pca9532.c:pca9532_setled() {
    ...
    reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
    /* zero led bits */
    reg =3D reg & ~LED_MASK(led->id);
    ...
}

Since one I2C register controls four LEDs, doesn't writing this invalid val=
ue
back corrupt the state of up to three other LEDs sharing the same register?


[Severity: High]
This is a pre-existing issue, but pca9532_gpio_get_value() also ignores I2C
read errors and silently returns meaningless GPIO states.

When any subsystem or userspace reads the GPIO value, an I2C error from
i2c_smbus_read_byte_data() is truncated to an unsigned byte, and a bit is
extracted and returned as a valid GPIO state:

drivers/leds/leds-pca9532.c:pca9532_gpio_get_value() {
    ...
    reg =3D i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset=
));

    return !!(reg & (1 << (offset % 8)));
}

Could this mask hardware errors and cause userspace or kernel consumers to
silently receive corrupt data, leading to logic errors?


[Severity: High]
This is a pre-existing issue, but there appears to be a race condition duri=
ng
device unbinding that allows the input device to re-queue work after it has
been cancelled, leading to a Use-After-Free of the driver data.

The driver uses devm_input_allocate_device() for its input device, so it
remains registered until devres cleanup runs AFTER .remove() finishes. Howe=
ver,
.remove() calls pca9532_destroy_devices() which cancels the workqueue:

drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
    ...
            if (data->idev !=3D NULL) {
                cancel_work_sync(&data->work);
                data->idev =3D NULL;
            }
    ...
}

In the window between cancel_work_sync() returning and devres unregistering=
 the
input device, if userspace injects an EV_SND event, pca9532_event() can
re-schedule data->work:

drivers/leds/leds-pca9532.c:pca9532_event() {
    ...
    schedule_work(&data->work);
    ...
}

Once devres frees data, won't the workqueue dereference a freed pointer,
causing a kernel crash or memory corruption?

>  	mutex_unlock(&data->update_lock);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-led-fix-v1=
-1-d635c5037109@nxp.com?part=3D1
