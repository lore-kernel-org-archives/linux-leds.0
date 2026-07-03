Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEA1D6BB
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 01:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783043496; cv=none; b=GO/0a5cuEv+dvVu0ODPMGtD3Md4XGL3poKdmWQFVpb8DZ8hGJHGrqelpnES+mq2SKCOUaI7JLs/4rm51MCiVUQ4SOYTv6yIsQHKewISCVLvJdZ9uMjp5j+OU4ZdirRJo+PY7vgOMhynurZza9Cq1kqM6/umn7MSjVY4ZEJYKlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783043496; c=relaxed/simple;
	bh=cHTG7e/W2PZc9n6wac1SniD0zUXGNUBls9F7Sf4BRBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e8j4F0BSrfQyb0CjWuY1WlMc+RHXGsrbNF55tT6Yyb3b13vTdp4cElXxiJgSbjkuIQ5NMHUJUIIL0YJiZy+T+y0AtBoO14cEc/UNl9EbDO/SQEnLQflljwtUrbyz8rqnYebm2qBG14cHSmgo22Mjy0bmdFBx//mNrYNePRBTKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9CXQAb9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9CXQAb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119F31F000E9;
	Fri,  3 Jul 2026 01:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783043494;
	bh=arV99sbkA3eezHLTifitkNq67Fk6rQG4Mdf3Pur6bnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9CXQAb9FmCDwaUw6eaDkWfg7yZO8r5/KRC9OmFLqXlQtyulZhf67iaYCP8IcB1W4
	 IXmV5cB017yTA5RgaeV6AzzPyKcsZy/isIYHXHPFZhu3vCzH/AHw8fqIU4SkGHbL4i
	 ePQBKgoi3rYR0SVODFW0q7T0rmv9vHGG79zlTOBzha7ahalNzE4UPbJrqgQ+unu6no
	 WdpoGpoQ+REION/H83LqlOhLhZBKWcO7mNdL2/d+ay4j+q6t750ZZJlyEpRZkubxKS
	 tCaqlP5qIh92ZL3qPLkQ2jYzBlpeAYCfhB4+RJXYG7egZklswPMKR9ipCvlw9Jsz5i
	 vqrOvoTyG/jOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pca9532: Fix inverted GPIO output polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260703014201.69829-1-chou.cosmo@gmail.com>
References: <20260703014201.69829-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 01:51:33 +0000
Message-Id: <20260703015134.119F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent register state corruption due to unchecked I2C errors in pc=
a9532_setled().
- [High] I2C read errors are silently masked and truncated in pca9532_gpio_=
get_value(), reporting invalid GPIO states.
- [High] A race condition during device removal can cause a use-after-free =
if an input event occurs after the workqueue is cancelled.
--

commit b1c20f70bc549eb29df798aedbdcc982c3294090
Author: Cosmo Chou <chou.cosmo@gmail.com>

leds: pca9532: Fix inverted GPIO output polarity

This patch corrects the GPIO output polarity in the pca9532 driver.
It fixes an issue where a requested logical high incorrectly enabled
the LED output driver, pulling the open-drain pin low, and updates
the input direction configuration to match.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index f3bf59495b68d..2d37e00e459de 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -327,9 +327,9 @@ static int pca9532_gpio_set_value(struct gpio_chip *g=
c, unsigned int offset,
>  	struct pca9532_led *led =3D &data->leds[offset];
> =20
>  	if (val)
> -		led->state =3D PCA9532_ON;
> -	else
>  		led->state =3D PCA9532_OFF;
> +	else
> +		led->state =3D PCA9532_ON;
> =20
>  	pca9532_setled(led);

[Severity: High]
This is a pre-existing issue, but does pca9532_setled() handle I2C read
failures safely?

When pca9532_setled() is called here, it performs an unchecked read:

drivers/leds/leds-pca9532.c:pca9532_setled() {
    ...
	reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
	/* zero led bits */
	reg =3D reg & ~LED_MASK(led->id);
	/* set the new value */
	reg =3D reg | (led->state << LED_SHIFT(led->id));
	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
    ...
}

If i2c_smbus_read_byte_data() fails and returns a negative error code
like -EIO, this value is stored directly into a char, truncating it.

Could this result in masking the corrupted data and blindly writing it back,
permanently corrupting the state of the other three pins sharing this same
8-bit register?

> @@ -349,7 +349,7 @@ static int pca9532_gpio_get_value(struct gpio_chip *g=
c, unsigned offset)

[Severity: High]
This isn't a bug introduced by this patch, but does pca9532_gpio_get_value()
silently mask I2C read errors and report invalid GPIO states?

Looking at pca9532_gpio_get_value():

drivers/leds/leds-pca9532.c:pca9532_gpio_get_value() {
    ...
	unsigned char reg;

	reg =3D i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));

	return !!(reg & (1 << (offset % 8)));
    ...
}

The result of i2c_smbus_read_byte_data() is stored in an unsigned char.
If the I2C read fails, the negative error code is truncated into a positive
8-bit value, which is then evaluated as valid GPIO input data.

Since the gpiolib .get callback returns an int and supports returning
negative error codes, could this truncation cause downstream drivers to
act on logically invalid input states instead of properly handling the
I2C failure?

>  static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned o=
ffset)
>  {
>  	/* To use as input ensure pin is not driven */
> -	pca9532_gpio_set_value(gc, offset, 0);
> +	pca9532_gpio_set_value(gc, offset, 1);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but is there a use-after-free race condition
during device removal if an input event occurs after the workqueue is
cancelled?

In pca9532_destroy_devices() (called from pca9532_remove), the workqueue is
cancelled:

drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
    ...
		case PCA9532_TYPE_N2100_BEEP:
			if (data->idev !=3D NULL) {
				cancel_work_sync(&data->work);
				data->idev =3D NULL;
			}
			break;
    ...
}

However, because data->idev is managed by devm_input_allocate_device(), it
remains fully registered until devres cleanup begins after pca9532_remove()
returns.

If an input event (like SND_BELL) is triggered in this window,
pca9532_event() will reschedule the work:

drivers/leds/leds-pca9532.c:pca9532_event() {
    ...
	schedule_work(&data->work);

	return 0;
}

When devres subsequently unregisters the input device and frees the data
structure, won't the unexpectedly scheduled work later execute and
dereference the freed data pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703014201.6982=
9-1-chou.cosmo@gmail.com?part=3D1
