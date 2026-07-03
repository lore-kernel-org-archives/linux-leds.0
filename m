Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6F433E99
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097971; cv=none; b=j60PuuocsNMsfUHHXvDbb69Y169Z4XYX9DNQFwJfJ5pGPoVQBQpF1eWC3/qiV3fxgktCEUs4z0KOKLjiLA38DMPxsrj3wgSaIuEjcuoeQnYAYRuoYPGT+dKLZvJisSWtwt06slT8zSNw+lQkYowypF+O/s1KCY24JpqTEmq8Y8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097971; c=relaxed/simple;
	bh=XpRc/FccewU3OVF/4YDW2d5DYrYBJ7JkAONx7ZE+dK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fpoK33t88EJHs4+ZEuia6WJuySZzK04dr80pHDzImfs9+Wi6tcRTuLGhLfW1V0lbp3SbrSIeGcAx98UQJpy7nXYBPlKXLmnNNjVi92bJxfsvDnxGH5uEFguUdowWwL0Io/BJ43Xa2AczQzlbxTDZaryWuGzaKywqkWd5+XI6XYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HERQRtUA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HERQRtUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A161F000E9;
	Fri,  3 Jul 2026 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783097969;
	bh=p5pSgTKtlsZtJ1ooe8XOeXX9JsHWuC4BSx84bn1URD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HERQRtUAe6QAPnVu9HkoI0QmGY2hjSrw2/tUL48TIRgAQoj2h9uOWm1B7YPm4Am2K
	 7yJYwbsgql/A3/1fbicTTkiQYQhJ1cJrltbKFHA3BOVYezK9aARHeOCcOw3jC2OsSY
	 5ckftmItliMJS0mNEwe1xec2CxSlpO5wvpQdbxiRpzazY8jXexmNSjqaGphcH354x+
	 LnNwBsLlNhgVqHcYZR5KlcIZrKjaff9049EPEcpowG7nY58nNa6441vsm7zPGZiCw9
	 K0SF2Q7HtaGGo+3jq7A2JUvQC6C8i0VQh1Jkoc5G92+K1l0geG6BTJK4UdGFJkvbJ1
	 VsQSMq/KUOcvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: is31fl319x: modernize registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260703-led-modern-v2-1-d07dd0d6ec6f@kemnade.info>
References: <20260703-led-modern-v2-1-d07dd0d6ec6f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 16:59:28 +0000
Message-Id: <20260703165929.61A161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Typo in error message string: 'corrunt' instead of 'current'.

Pre-existing issues:
- [High] Pre-existing NULL pointer dereference of `is31->cdef` when instant=
iating the driver via I2C sysfs (legacy matching).
--

commit c7085457e861bc7b7298902d300df66d0cbd367a
Author: Andreas Kemnade <andreas@kemnade.info>

leds: is31fl319x: modernize registration

This patch updates the driver to use the _ext version of LED registration
so properties can be parsed automatically and LEDs can be referenced via
phandle. It also defers LED registration until after iterating over the
nodes to determine the maximum current configuration.

> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319=
x.c
> index 80f38dba0fba4..a912adf2c7d31 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -363,31 +363,17 @@ static const struct of_device_id of_is31fl319x_matc=
h[] =3D {
[ ... ]
> -static int is31fl319x_parse_child_fw(const struct device *dev,
> -				     const struct fwnode_handle *child,
> -				     struct is31fl319x_led *led,
> -				     struct is31fl319x_chip *is31)
> +static void is31_free_fwnode(void *data)
>  {
> -	struct led_classdev *cdev =3D &led->cdev;
> -	int ret;
> -
> -	if (fwnode_property_read_string(child, "label", &cdev->name))
> -		cdev->name =3D fwnode_get_name(child);
> +	struct is31fl319x_chip *is31 =3D data;
> +	int i;
> =20
> -	ret =3D fwnode_property_read_string(child, "linux,default-trigger", &cd=
ev->default_trigger);
> -	if (ret < 0 && ret !=3D -EINVAL) /* is optional */
> -		return ret;
> +	for (i =3D 0; i < is31->cdef->num_leds; i++) {

[Severity: High]
This isn't a bug introduced by this patch, but does this dereference of
is31->cdef in is31_free_fwnode() cause a kernel panic if the driver is
instantiated via I2C sysfs?

If the driver is bound manually via legacy I2C matching (for example, by
writing to /sys/bus/i2c/devices/i2c-0/new_device), device_get_match_data()
will return NULL because the driver's i2c_device_id array does not provide
.driver_data.

The driver already unconditionally dereferences is31->cdef later in
is31fl319x_parse_fw(), but this patch introduces an additional vector
where the new cleanup function runs and crashes on the same NULL pointer
dereference.

> +		if (is31->leds[i].fwnode)
> +			fwnode_handle_put(is31->leds[i].fwnode);
> =20
> -	led->max_microamp =3D is31->cdef->current_default;
> -	ret =3D fwnode_property_read_u32(child, "led-max-microamp", &led->max_m=
icroamp);
> -	if (!ret) {
> -		if (led->max_microamp < is31->cdef->current_min)
> -			return -EINVAL;	/* not supported */
> -		led->max_microamp =3D min(led->max_microamp,
> -					is31->cdef->current_max);
> +		is31->leds[i].fwnode =3D NULL;
>  	}
> -
> -	return 0;
>  }
[ ... ]
> @@ -427,14 +417,20 @@ static int is31fl319x_parse_fw(struct device *dev, =
struct is31fl319x_chip *is31)
> =20
>  		led =3D &is31->leds[reg - 1];
> =20
> -		if (led->configured)
> +		if (led->fwnode)
>  			return dev_err_probe(dev, -EINVAL, "led %u is already configured\n", =
reg);
> =20
> -		ret =3D is31fl319x_parse_child_fw(dev, child, led, is31);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "led %u DT parsing failed\n", reg);
> +		led->max_microamp =3D is31->cdef->current_default;
> +		ret =3D fwnode_property_read_u32(child, "led-max-microamp", &led->max_=
microamp);
> +		if (!ret) {
> +			if (led->max_microamp < is31->cdef->current_min)
> +				return dev_err_probe(dev, -EINVAL, "invalid maximum corrunt\n");

[Severity: Low]
Is there a typo in this error message? It looks like "corrunt" should be
"current".

> +
> +			led->max_microamp =3D min(led->max_microamp,
> +						is31->cdef->current_max);
> +		}
> =20
> -		led->configured =3D true;
> +		led->fwnode =3D fwnode_handle_get(child);
>  	}
> =20
>  	is31->audio_gain_db =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-led-modern=
-v2-1-d07dd0d6ec6f@kemnade.info?part=3D1
