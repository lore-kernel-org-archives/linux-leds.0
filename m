Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87344D09FD;
	Mon, 19 Oct 2026 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405275; cv=none; b=otTExIVsKzamMAiGWrsMN4mSQ+fKfNxDs7H+Xk5qnZHq9KHlHgRrQu+tNSzZ/+QPxU1J1Uh5hbl38cZPpIQmdGqHE1aNiD2U95ndIVPUG/AFW/NrHrLiSe14Yp4oZ9YAMuDWqBLtfTTHGL2LTLSJOpezixzcXx3wqnBtgn1skAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405275; c=relaxed/simple;
	bh=l0v06s7BZKjv4w/J6KoIHK12NHCkvAm4w8ObQlHFSXE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dViLwZ/YXWPjaOjjgNYzcrRjI8WM17YxV/DSxy3X8kSf4xf3MzDjifMmdRzpT/lctRNSFlTYPFQFI6svUHUbS1ByUk7hYUirYB3MxHsuDORmk2vmm7LH61u8zmctBWYAs7w1cAd2GHLGqjVbplSQYq7/qZPa7N2vt0vMw+0vOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv/d5KId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv/d5KId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01181F000C4;
	Mon, 19 Oct 2026 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792405273;
	bh=8UJg2BKoLo6QJa+/0Y5EWFsrBfSroDSG6h0pgdbGvF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zv/d5KIdTE7tXKMbD5QvZnf8/OYyCVzQp6gJl0IZ52Ek2oFEF+ho6SCiprgSEUUjh
	 8EMHLWObz+p+ui9FX6IUqh3i9WTIWDKVxKQkclg1ThzlHnTllEpyVgOK+CQGvAzG1Y
	 UIh5VFaXiVaiuG5PnMzr7zJyDWo22Eg/MxMS+pzSu7Z5tyMl6LDSH7/vFh/Puaf/uv
	 Oa6NMLXJZ2/3MIsQqdHCcOOVESUhs5fuoZ7UQyrBjX50L1nlx+hv1NcP5fk+9xVUrh
	 TMa7s+z2hznOHxdrzPbfVyI5V+DnQe7+QmOqQs1gcji6SOlysiYE4kNhYQIrH/TQEl
	 I9uUnHm1xYU+w==
Message-ID: <sashiko-outbox-176974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] mfd: aat2870: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261019100930.110954-4-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
 <20261019100930.110954-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:21:12 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: aat2870: missing linux/gpio/consumer.h include breaks !CONFIG_=
GPIOLIB build
--

commit 7efa32d759fbc7ee0e1963e704db3b5316d972db
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: aat2870: Convert to use OF bindings

This commit converts the AAT2870 core, regulator, and backlight drivers from
platform data to Device Tree bindings and modern GPIO consumer helpers.

> diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> index 0d56cd6fbc6a5..fe43ef675f257 100644
> --- a/drivers/mfd/aat2870-core.c
> +++ b/drivers/mfd/aat2870-core.c
> @@ -16,8 +16,15 @@
>  #include <linux/gpio/legacy.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/aat2870.h>
> +#include <linux/of_platform.h>
>  #include <linux/regulator/machine.h>

[ ... ]

> @@ -348,60 +309,29 @@ static int aat2870_i2c_probe(struct i2c_client *cli=
ent)
> =20
>  	aat2870->reg_cache =3D aat2870_regs;
> =20
> -	if (pdata->en_pin < 0)
> -		aat2870->en_pin =3D -1;
> -	else
> -		aat2870->en_pin =3D pdata->en_pin;
> +	aat2870->en_pin =3D devm_gpiod_get_optional(&client->dev, "enable",
> +						  GPIOD_OUT_HIGH);
> +	if (IS_ERR(aat2870->en_pin))
> +		return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pin),
> +				     "Failed to get EN GPIO\n");
> =20
> -	aat2870->init =3D pdata->init;
> -	aat2870->uninit =3D pdata->uninit;
>  	aat2870->read =3D aat2870_read;
>  	aat2870->write =3D aat2870_write;
>  	aat2870->update =3D aat2870_update;
> =20
>  	mutex_init(&aat2870->io_lock);
> =20
> -	if (aat2870->init)
> -		aat2870->init(aat2870);
> -
> -	if (aat2870->en_pin >=3D 0) {
> -		ret =3D devm_gpio_request_one(&client->dev, aat2870->en_pin,
> -					GPIOF_OUT_INIT_HIGH, "aat2870-en");
> -		if (ret < 0) {
> -			dev_err(&client->dev,
> -				"Failed to request GPIO %d\n", aat2870->en_pin);
> -			return ret;
> -		}
> -	}
> -
> -	aat2870_enable(aat2870);
> -
> -	for (i =3D 0; i < pdata->num_subdevs; i++) {
> -		for (j =3D 0; j < ARRAY_SIZE(aat2870_devs); j++) {
> -			if ((pdata->subdevs[i].id =3D=3D aat2870_devs[j].id) &&
> -					!strcmp(pdata->subdevs[i].name,
> -						aat2870_devs[j].name)) {
> -				aat2870_devs[j].platform_data =3D
> -					pdata->subdevs[i].platform_data;
> -				break;
> -			}
> -		}
> -	}
> +	gpiod_set_value_cansleep(aat2870->en_pin, 1);

[Severity: Low]
Should drivers/mfd/aat2870-core.c replace #include <linux/gpio/legacy.h>
with #include <linux/gpio/consumer.h>?

In drivers/mfd/aat2870-core.c, aat2870_i2c_probe(), aat2870_i2c_suspend(),
and aat2870_i2c_resume() now use devm_gpiod_get_optional(), GPIOD_OUT_HIGH,
and gpiod_set_value_cansleep(), which are declared in
<linux/gpio/consumer.h>.

However, <linux/gpio/legacy.h> only pulls in <linux/gpio/consumer.h> when
CONFIG_GPIOLIB is enabled:

include/linux/gpio/legacy.h:
    #ifdef CONFIG_GPIOLIB

    #include <linux/gpio/consumer.h>

Because MFD_AAT2870_CORE in drivers/mfd/Kconfig has:

    depends on GPIOLIB || COMPILE_TEST

building with CONFIG_MFD_AAT2870_CORE=3Dy, CONFIG_COMPILE_TEST=3Dy, and
CONFIG_GPIOLIB=3Dn will fail to compile due to missing declarations for
GPIOD_OUT_HIGH, devm_gpiod_get_optional(), and gpiod_set_value_cansleep().

[ ... ]

>
> base-commit: 8c3ce6554a5b995599b84388347b301553e9efd5
> --

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100930.1109=
54-1-clamor95@gmail.com?part=3D3
