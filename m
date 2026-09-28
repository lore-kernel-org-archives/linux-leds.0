Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE937F014;
	Mon, 28 Sep 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589289; cv=none; b=JLtS6uwOGc9cClbl7pFUJ1AXeCPkayNngonglDzlOxD4fj+DbU5zGGXr3ch/fhM51391Ade3MGLwLkUMafWWjRQ/2QFLLPE0qcZsREYcuZVf+zBM1etBCATrNDC2sGeQGwfWC31BMSCJiNeks8zRCEkaPn0HWSz+xfa3HKst4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589289; c=relaxed/simple;
	bh=BbTgacj27NppQ3DwQm1gobf05zoEuAlEPcEO626OIg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DDesGWpn23Y1Tpu3USToLlUIV6E004hV5oQHSNJ2QhgkJb8U7B3NmzTi4gGexYT8WMBF/xb4CD72ZvYTinu8gytdYxWyAa88Paa2XKu4q88elGTb9x0cuiWYH+HZ4IjisCpdL6Uw8ORP37eFvcg5p4u9qy5NCFNDDN4g2WmJXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBA8VhOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBA8VhOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6B81F000FF;
	Mon, 28 Sep 2026 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589287;
	bh=azRoduoUk0cZQuQPpkUeRaaX4yqeHj9RnKC2MnLx8rE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RBA8VhOiZ9LDSqGP6raeYkbkVB7cUYntZZncPLlj6onRN9w99hIIvRyx9hnSYfgXe
	 IPbY99sK0AhqUme27VE/3kvKPlfHTTs2wfO2Nn7SaWH2Pc4MW0bG5QFhA4tq62Xosb
	 EGcfD55BIIyOg7FD+vnlKPgbMiXpKdf81I0BQoUaITq8+uNeCiZjmuMiRx/yvnELCF
	 hpJqUpZEH0oSbGfLlZ5ZFNrGSvf8vx5aajISVl2R+ez9R7LKgF64VVND+CUuK2iMbg
	 Qo+iMCAG5G9UOv/LLLhEayUpwLU06GpXtOoh++uiz1R/Ff1eo6r+YXUbWgRDyYcpsD
	 WP71qEILmthDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] leds: flash: Add support for the TI LM3643 dual
 LED flash driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928094302.86966-3-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-3-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:54:47 +0000
Message-Id: <20260928095447.6D6B81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: TOCTOU race in max_brightness clamping after registration
--

commit 0af4a3a129a9adf0eccf2c17265d6d72e8d4acac
Author: Rillian Grant <rillian.grant@gmail.com>

leds: flash: Add support for the TI LM3643 dual LED flash driver

This commit adds support for the TI LM3643 dual LED flash driver. The chip
features two high-side current sources sharing a synchronous boost converte=
r,
supporting programmable torch and flash modes with fault reporting.

> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-l=
m3643.c
> new file mode 100644
> index 0000000000000..bbe9358c9caaf
> --- /dev/null
> +++ b/drivers/leds/flash/leds-lm3643.c

[ ... ]

> +static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
> +			       struct fwnode_handle *fwnode)
> +{

[ ... ]

> +	ret =3D devm_led_classdev_flash_register_ext(dev, flash_cdev, &init_dat=
a);
> +	if (ret)
> +		return ret;
> +
> +	if (led_cdev->max_brightness > torch_max_brightness) {
> +		dev_warn(dev, "max-brightness %u not supported (using %u)\n",
> +			 led_cdev->max_brightness,
> +			 torch_max_brightness);
> +		led_cdev->max_brightness =3D torch_max_brightness;
> +	}

[Severity: Medium]
Is there a TOCTOU race condition here? By clamping
led_cdev->max_brightness after calling
devm_led_classdev_flash_register_ext(), isn't there a window where the
device is exposed to userspace with the unclamped value?

Once registered, sysfs attributes are active and a KOBJ_ADD uevent is sent.
Could a fast userspace process read the unclamped max_brightness and
write an over-limit brightness value before the driver clamps it,
potentially driving the LED beyond its configured led-max-microamp
thermal limit?

This could happen if a device tree provides a max-brightness property
higher than the led-max-microamp limit. The LED core's
led_classdev_register_ext() overwrites led_cdev->max_brightness with
this value and creates the sysfs interfaces before this subsequent clamping
step runs.

> +
> +	return lm3643_register_v4l2(dev, led, fwnode);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928094302.8696=
6-1-rillian.grant@gmail.com?part=3D2
