Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD64D09EC;
	Thu, 15 Oct 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083243; cv=none; b=dm+ti0mO+uifAXEzYAmjd3SsQgMTTafdAqzmJLJMy0G90EUaELoA62Wi+vAL8PvsTxvT4ggVD1TENQQeUQVXqvNbrLayXlAM5c0s24TB2+WCXkktqtjV0ncby9jeVIRPttSCb65JXftaryQeGXUy5PDPb8cC/ZP0YdQebg9UY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083243; c=relaxed/simple;
	bh=lsixpdkeu2K6Haq7Nwz4LfFY5vNCtRpWCPSgySCIFLA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eBCZ6R+EO/9SW086ESmD1ofK/GgkRZcYtU8tvj3rMnsOq0a944Tapdl1EFeG3oIxJA1oN8PK9I7iIz80BPjOaAltbHCvAfwk90N42yGaM3CHNLOAvJXAmqfJ4ZBsM2bu687872iqxkc+Nb8PKrsTVQ2pIeRaGVeToLAfj+tzlbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2fLERkX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2fLERkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0DB1F000C4;
	Thu, 15 Oct 2026 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083229;
	bh=OyGLFgS3U777Tsdo8gLy+HR8t2K4eeJZZaBv+06v5YQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2fLERkXGQ4HOf/MK/xSFGSMVkl+D7l1Y0Pc7LCu4c5zJMdrQG+ya4nFDCxmehZWc
	 yhKdQEF95THIkUA+EQBJORYl7D4FhLPKK542FLlWnRwyauEpt8hg5dvPqbm50lZ08f
	 2+9NIo6PKmjSJYgJ4PuTMlohE/B6P6TYCXDB8/OTkOV1KY10w6TOzd2/Ht1AwaVkEu
	 LTmInUN0CZ7NfBeIp9Ih8Hzo9S9yAdMOzGMxLriAQ4TCyn3/emc/lWQcqi5dlBdlGJ
	 TZiCRuosaP+H858e6kdt8Hbm4z3bFgDoOqgHdF2TkKoc+Zb5N7ry/122AY/23yAzt/
	 TTBe3PMuRktQA==
Message-ID: <sashiko-outbox-173211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: Add driver for MAX8907 LED cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015164641.363500-1-clamor95@gmail.com>
References: <20261015164641.363500-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:53:48 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] leds: use-after-free on driver unbind due to mismatched devm lifec=
ycles
- [Medium] leds: software enum LED_ON is used as a hardware register bitmask
- [Medium] leds: stale non-zero brightness returned when LED is disabled
- [Low] leds: hardcoded device name prevents standard DT property configura=
tion
- [Low] leds: commit message prefix missing driver name
--

commit 18d3fac6772516707b8183897b99b767fe8a81f1
Author: Svyatoslav Ryhel <clamor95@gmail.com>

leds: Add driver for MAX8907 LED cell

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

> leds: Add driver for MAX8907 LED cell

[Severity: Low]
This isn't a bug, but does the commit message prefix follow the standard
subsystem guidelines? The LED subsystem conventions typically expect the
driver name in the prefix, such as "leds: max8907: Add driver ...".

> diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> new file mode 100644
> index 0000000000000..358505a1c799f
> --- /dev/null
> +++ b/drivers/leds/leds-max8907.c

[ ... ]

> +static enum led_brightness max8907_led_get_brightness(struct led_classde=
v *cdev)
> +{
> +	struct max8907_led_data *ddata =3D container_of(cdev, struct max8907_le=
d_data, cdev);
> +	unsigned int brightness_lvl;
> +	int ret;
> +
> +	ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_l=
vl);
> +	if (ret)
> +		return LED_OFF;
> +
> +	return brightness_lvl;
> +}

[Severity: Medium]
Will this return a stale non-zero value if the LED was previously turned of=
f?

If max8907_led_set_brightness() is called with LED_OFF, it clears the
enable bit in MAX8907_REG_WLED_MODE_CNTL but skips updating the
MAX8907_REG_WLED_CNTL register. Since max8907_led_get_brightness() does not
verify the mode control enable state, it seems it will incorrectly return t=
he
old brightness value even when the LED is disabled.

[ ... ]

> +static int max8907_led_set_brightness(struct led_classdev *cdev,
> +				      enum led_brightness brightness)
> +{
> +	struct max8907_led_data *ddata =3D container_of(cdev, struct max8907_le=
d_data, cdev);
> +	int brightness_lvl, ret;
> +
> +	brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> +
> +	if (brightness_lvl) {
> +		ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_=
lvl);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
> +				  LED_ON, brightness_lvl ? LED_ON : LED_OFF);
> +}

[Severity: Medium]
Is the software enum LED_ON intentionally used as a hardware register bitma=
sk
here?

LED_ON is defined in the LED subsystem as 1. Using it as the mask argument
for regmap_update_bits() on MAX8907_REG_WLED_MODE_CNTL mixes a software
state enum with hardware layout. If the PMIC's enable bit changes or differs
from BIT(0), this could fail to enable the LED and potentially corrupt other
configuration bits.

[ ... ]

> +static int max8907_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
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
> +
> +	ddata->cdev.brightness =3D LED_OFF;
> +	ddata->cdev.flags =3D LED_CORE_SUSPENDRESUME;
> +	ddata->cdev.max_brightness =3D LED_FULL;
> +	ddata->cdev.name =3D dev_name(dev);

[Severity: Low]
Does hardcoding the device name prevent standard Device Tree property
configuration?

By directly assigning dev_name(dev), it bypasses parsing standard DT
properties like color and function, which means board designers cannot
configure standard sysfs directory names for this LED.

> +
> +	ddata->cdev.brightness_get =3D max8907_led_get_brightness;
> +	ddata->cdev.brightness_set_blocking =3D max8907_led_set_brightness;
> +
> +	return devm_led_classdev_register(dev->parent, &ddata->cdev);
> +}

[Severity: High]
Can this lead to a use-after-free during driver unbind?

The private data ddata is allocated using devm_kzalloc(dev, ...) tying
its lifecycle to the child platform device. However, the LED classdev is
registered using devm_led_classdev_register(dev->parent, &ddata->cdev),
tying the unregistration action to the parent MFD core device.

If the child platform driver is unbound or removed, ddata will be freed,
but the LED classdev unregistration won't trigger because it's attached
to the parent device. Any subsequent access via sysfs or subsystem triggers
could dereference the freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015164641.3635=
00-1-clamor95@gmail.com?part=3D1
