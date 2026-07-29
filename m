Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27FB380FCC;
	Wed, 29 Jul 2026 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311711; cv=none; b=ALoH1Q5otICeIYCWLhUzh7Ovi9zX2pUDbU8BUWvU6pTYLHrKEs0vMBDP+/WyybtauW5QUM4P5GSCT2jFjnLeDcOII/WVC3sBNQlpY3Mx2XLLl9JNk5HwIfhx8GHpxM5BlU0PzsnqpVTn/i0L2UKk5W8kJbDw3UR/mkOQ9LhypdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311711; c=relaxed/simple;
	bh=uIesNXsbfypRPGkFAi4oGNRysTq2NGi/3Xh3f6ZX7iI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q75nPc0v1mws8ePP3bwX3krKGI/N3ByHWUkwYNGpq2hUJnHI3JbsJRALXmUzQrv/nwjaGaXgr6CmNLhihhTds3Kfd3oZG/kqNi5ZRljvrpbyk3S06bkEQb8ZJ93lDyllHOKaRu1HGy/cErhuBKUP64tvmrrJGMIsLXZjSpxi8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX94FW7y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX94FW7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1211F000E9;
	Wed, 29 Jul 2026 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311709;
	bh=ch9aaCo6MUw2L7HbyvHGDqvTr9+b46qSSbkjnV19OWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HX94FW7yxg5e/PkC/xijqRZa/pD5cbf1zyktfHB8IaE1gjJ28BuF+YhSasKYExTyY
	 DV+xpVAymPWkAhLWtD4jKVf/XnObsEkNMDbUWhk00ah+xEcGboadtz3cjR+rYU2LvM
	 xn6elB9ockadXEPi6tRSO06EO5wImmAmQY0SrR+SUc8Hi20/SM18ieyn6AoMjuSNub
	 Hb9ot0B1Kb5dngdQbLbBfxJ4wyB72XyOu5Ua73RhjvXp1rBDM3REeIYG/y7wZ6FHcm
	 862ykf/iVSMTBtyh8P1b/KYsQ/UVP/yDqUpneTZnPqE84l382FG2yWL6NeLQ6iKsQ7
	 tXl27QoPUQ9vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] leds: pca9532: check i2c_smbus_read_byte_data()
 return value
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: imx@lists.linux.dev, linux-leds@vger.kernel.org, Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20260729-led-fix-v2-1-09ad218457bd@nxp.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
 <20260729-led-fix-v2-1-09ad218457bd@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:55:08 +0000
Message-Id: <20260729075509.4B1211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Commit message description capitalization violates LED subsystem st=
andards.

Pre-existing issues:
- [High] The patch addresses an unhandled I2C read error in `pca9532_getled=
()` but leaves identical, critical vulnerabilities unpatched in `pca9532_se=
tled()` and `pca9532_gpio_get_value()`.
- [High] Input event workqueue race condition leads to a Use-After-Free dur=
ing device removal.
- [High] A malformed Device Tree with duplicate beeper definitions will tri=
gger a BUG_ON() and crash the kernel.
--

--- Patch [1]: [PATCH v2 1/4] leds: pca9532: check i2c_smbus_read_byte_data=
() return value ---
commit 815cd02e98d4a21b790e3fbfdbff33af4f337f2d
Author: Haibo Chen <haibo.chen@nxp.com>

leds: pca9532: check i2c_smbus_read_byte_data() return value

This commit fixes an integer underflow in pca9532_getled() by checking the
return value of i2c_smbus_read_byte_data().

> leds: pca9532: check i2c_smbus_read_byte_data() return value

[Severity: Low]
Does this commit message violate the LED subsystem capitalization rules?

The subsystem guideline requires capitalizing the description after the
subsystem prefix, but "check" is lowercase.

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
>  	mutex_unlock(&data->update_lock);
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this same issue still
exist in pca9532_setled() and pca9532_gpio_get_value()?

In pca9532_setled(), if i2c_smbus_read_byte_data() returns a negative error,
the error is truncated into the char reg variable. This value is bitwise
modified and written back to the device via i2c_smbus_write_byte_data():

drivers/leds/leds-pca9532.c:pca9532_setled() {
    ...
	char reg;
    ...
	reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
	/* zero led bits */
	reg =3D reg & ~LED_MASK(led->id);
	/* set the new value */
	reg =3D reg | (led->state << LED_SHIFT(led->id));
	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
    ...
}

Are the other 3 innocent LEDs sharing the same I2C register overwritten?

Similarly, in pca9532_gpio_get_value(), the error is cast to unsigned char
and evaluated in a boolean context:

drivers/leds/leds-pca9532.c:pca9532_gpio_get_value() {
    ...
	unsigned char reg;
    ...
	reg =3D i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
    ...
}

Should these regressions be fixed as well?

[Severity: High]
This is a pre-existing issue, but does pca9532_destroy_devices() have a
race condition leading to a use-after-free regression during device removal?

During driver unbind, pca9532_remove() calls pca9532_destroy_devices(),
which cancels the work:

drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
    ...
	cancel_work_sync(&data->work);
	data->idev =3D NULL;
    ...
}

However, the managed input device data->idev remains active until devres
cleanup. If an input event arrives after the work is cancelled but before
devres cleanup, does this code schedule the work again?

drivers/leds/leds-pca9532.c:pca9532_event() {
    ...
	schedule_work(&data->work);
    ...
}

If devres then frees the data structure, does the system workqueue execute
the scheduled work on a freed pointer?

[Severity: High]
This isn't a bug introduced by this patch, but can a malformed Device Tree
cause a BUG_ON() regression in pca9532_configure()?

If the device tree contains more than one node with type PCA9532_TYPE_N2100=
_BEEP,
the driver allocates data->idev on the first iteration. On the second itera=
tion,
would this BUG_ON() trigger?

drivers/leds/leds-pca9532.c:pca9532_configure() {
    ...
		case PCA9532_TYPE_N2100_BEEP:
			/* PWM1 is reserved for beeper so blink will not use hardware */
			data->hw_blink =3D false;
			BUG_ON(data->idev);
    ...
}

Should this fail gracefully instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-led-fix-v2=
-0-09ad218457bd@nxp.com?part=3D1
