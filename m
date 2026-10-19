Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59E4DA52E;
	Mon, 19 Oct 2026 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406226; cv=none; b=VH3El6hSicU7iCPSsSeny/M04BRaIk5ULT9haeRNXnRc6VDPxSF9iWMFX6Wg1qo/6C5ap9+MjTBB1v1Hicb9E1S2wuiyQTkd92CGDjSmFgNuhtF8ZClDTiscNrlOmfFfre3kkiStjA4sVJFHoXTEPwosySH4ZUIVOVX2T3Yksm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406226; c=relaxed/simple;
	bh=TCAepqWJpaXuS036C0TyoyZvGSXqPMM4fnjQStdg7bg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CUoeqZOOqkCu4zyzRcc9WSxtMUPzUaNaN3AxDbYi1hPSBfRBytN3vDMEBHBHQn19R8U/gwVW8tq8nAGOPiBQLvHDgq3LsYY/0YIe+v9yTzIO3gB1QxMOnlOE+vTEThXf8SPCRMMFbzZL0ghHKpSMRat/M746uaeMbzzju6aTpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSGKeOzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSGKeOzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54971F000C4;
	Mon, 19 Oct 2026 10:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792406221;
	bh=6sv1YnHjrIU11koM9PmGFXDgoBD/Wtu6HQXyMP50bGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bSGKeOzRHW2EXkJqF5Ca75QvAfULDtSflkgOtefcSvrnv/zFokDUeEn79EGIld8s0
	 mT3JVoOnzTE6P6OeoOEGGl2xqR6Z+UKk94ViJHKQ4FIU4UWQOPDlohm2L55qru5DRt
	 BsUu0mpoG+vzR7QdauuB6NKOZPMaYqrjZ+8zXq0W3EG5cIFgeSFoBs6DaktN0NcrnR
	 Qe6f5688o05T+s2V5hWMij01z4VMV5IrDqzAmcpC/fxwyDgspSQatCdaQUcAFtDbhf
	 KTph1Hdr62Hl5jUJl4rrvs3JeOts5otL1qvrtS3SmzyHUTsWsv8fgidXKdleJjU2n8
	 2zqP8bGVkU9rA==
Message-ID: <sashiko-outbox-177002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: Add driver for MAX8907 LED cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019102007.131375-1-clamor95@gmail.com>
References: <20261019102007.131375-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:37:00 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] leds: max8907: missing MODULE_ALIAS() prevents module autoloading
- [Medium] leds: max8907: invalid fwnode and missing default_label in max89=
07_led_probe()
- [Low] leds: max8907: unused max8907 field and platform_set_drvdata() in p=
robe
--

commit 585d0f44a3d2f49e9a4916f8fc771037b7486e53
Author: Svyatoslav Ryhel <clamor95@gmail.com>

leds: Add driver for MAX8907 LED cell

This commit adds a platform driver for the LED cell on the MAX8907 PMIC and
registers the max8907-leds cell in the parent MFD driver.

> diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> new file mode 100644
> index 0000000000000..c3bd131800a8c
> --- /dev/null
> +++ b/drivers/leds/leds-max8907.c
> @@ -0,0 +1,92 @@
[ ... ]
> +struct max8907_led_data {
> +	struct max8907 *max8907;
> +	struct regmap *regmap;
> +	struct led_classdev cdev;
> +};
[ ... ]
> +static int max8907_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> +	struct led_init_data init_data =3D { };
> +	struct max8907_led_data *ddata;
> +
> +	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->max8907 =3D max8907;
> +	ddata->regmap =3D max8907->regmap_gen;
> +
> +	platform_set_drvdata(pdev, ddata);

[Severity: Low]
Are ddata->max8907 and the platform_set_drvdata(pdev, ddata) call needed
here?

Neither ddata->max8907 nor the platform device driver data appears to be re=
ad
anywhere after max8907_led_probe(), since register accesses go through
ddata->regmap and the LED callbacks retrieve ddata via container_of() on
ddata->cdev.

> +
> +	init_data.fwnode =3D dev_fwnode(dev->parent);
> +	init_data.devicename =3D dev_name(dev);
> +
> +	ddata->cdev.brightness =3D LED_OFF;
> +	ddata->cdev.flags =3D LED_CORE_SUSPENDRESUME;
> +	ddata->cdev.max_brightness =3D LED_FULL;
> +
> +	ddata->cdev.brightness_get =3D max8907_led_get_brightness;
> +	ddata->cdev.brightness_set_blocking =3D max8907_led_set_brightness;
> +
> +	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
> +}

[Severity: Medium]
What happens in max8907_led_probe() -> devm_led_classdev_register_ext() ->
led_classdev_register_ext() -> led_compose_name() when init_data.fwnode is
set to dev_fwnode(dev->parent) and init_data.default_label is left NULL?

In drivers/leds/led-core.c:led_compose_name(), when no LED properties are
present on the fwnode:

	} else if (init_data->default_label) {
		if (!devicename) {
			dev_err(dev, "Legacy LED naming requires devicename segment");
			return -EINVAL;
		}
		n =3D snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s:%s",
			     devicename, init_data->default_label);
	} else if (is_of_node(fwnode)) {
		n =3D snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
			     to_of_node(fwnode)->name);
	} else if (is_software_node(fwnode)) {
		n =3D snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
			     fwnode_get_name(fwnode));
	} else {
		return -EINVAL;
	}

On non-DT platforms using struct max8907_platform_data,
dev_fwnode(dev->parent) is NULL, and because init_data.default_label is also
NULL, led_compose_name() reaches the final else branch and fails with
-EINVAL.

On Device Tree platforms where the parent maxim,max8907 PMIC node does not
define LED properties (such as color, function, or label), led_compose_name=
()
falls through to the is_of_node(fwnode) branch and names the LED after
to_of_node(fwnode)->name (the parent MFD node name, such as pmic) while
ignoring init_data.devicename and binding the LED class device directly to
the parent MFD fwnode.

Should max8907_led_probe() set init_data.default_label (or ddata->cdev.name)
instead of passing the parent MFD fwnode without a default_label?

> +
> +static struct platform_driver max8907_led_driver =3D {
> +	.driver.name =3D "max8907-leds",
> +	.probe =3D max8907_led_probe,
> +};
> +module_platform_driver(max8907_led_driver);
> +
> +MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
> +MODULE_DESCRIPTION("MAX8907 LED driver");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
When CONFIG_LEDS_MAX8907=3Dm, will this module autoload when mfd_add_device=
s()
registers the max8907-leds cell from max8907_cells[] in
drivers/mfd/max8907.c?

Because max8907_cells[] instantiates the device by name without an
of_compatible string, the platform bus emits MODALIAS=3Dplatform:max8907-le=
ds.
Without MODULE_ALIAS("platform:max8907-leds") or a platform_device_id table
with MODULE_DEVICE_TABLE(platform, ...), leds-max8907.ko will have no
modalias entry for udev/kmod to match.

Also, there is a typo in MODULE_AUTHOR ("Svyatolsav").

[ ... ]

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index 7bac1d6517717..0f25aedb32df1 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
> =20
>  static const struct mfd_cell max8907_cells[] =3D {
> +	{ .name =3D "max8907-leds", },
>  	{ .name =3D "max8907-regulator", },
>  	{ .name =3D "max8907-rtc", },
>  };
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019102007.1313=
75-1-clamor95@gmail.com?part=3D1
