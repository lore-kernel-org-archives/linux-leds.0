Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6433563F0
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994690; cv=none; b=gmfobnQpTkssLrZH0xyi08hi28zb8KOOJOW+OV9/oDr4gG2HNvD+Ktf16HB7xCy6SMIi+aQwSynZrxVPv0tK2UqKbPCB/0A3xU1gRmgdlYT+BrsKLCixJHbJGY8H/wmESXorDQp/bfpnlRWlZS5YkliXedg3KpG+Db8V3oshKXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994690; c=relaxed/simple;
	bh=1/mlJ2vTm+Wdy40OoGI734BN2J749wayVxJJY6iD3jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D8WdlduqBJhj/wkyiQ6ua0DBVP6j83KEG1dWWmzq2kGbsx1jLFAupK03noysJE+F4ShfzDn0RYVmXYjMq1sXJgBnhrmwumHwRiWSsDzGXqiyKktSLHKj8KHIFqm2J8ZjQvfcGpiT+szE/JAogfNXUZBho6dwMXSoMxVHuNiLNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5H227xR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5H227xR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA2B1F000E9;
	Thu,  2 Jul 2026 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782994689;
	bh=Mx+gTCHC5dUvY0XpyX0SOjlvMOi0JncVCwa25V4x9kA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y5H227xRCRzuHGp0Cyk/wxWq0FyIhrfnY3ioNRDYSqvxnZQGfSa5VYT7DB/fl621G
	 3cj/aSuCux3YyMDeXGR4wTjqydMyFne3stdkDpsM8tN0ndA/X1VJvmxbBSJaXejsz4
	 wvfSY0ImnnvOXpzMdI1PxIGvpV1si7kRRQ6r++Ch9x0Cg+/ZGatwJP+etX8x6azxN+
	 wedGdtPJYdX5iVGCVM/kwxQ7IgkUitQdaWPb91XuDd4Yd2AtZwbNAOGdpj1JvWX3xS
	 iYYfyjM79h2wl+OV4UY8/Ap6DqG1bL05FCgbpTn1jDBdgISlh1OQ0yerZ93TqxZo7N
	 2pm2cwIDi3myQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: is31fl319x: modernize registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260702-led-modern-v1-1-a4af2e9aad60@kemnade.info>
References: <20260702-led-modern-v1-1-a4af2e9aad60@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 12:18:07 +0000
Message-Id: <20260702121808.AAA2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added devres cleanup action `is31_free_fwnode` unconditi=
onally dereferences `is31->cdef` before it is initialized, causing a fatal =
NULL pointer dereference on early probe failures.
- [Low] Typo in the error message for invalid maximum current validation: '=
corrunt' instead of 'current'.
--

commit f41ac0185576615af09273cdd8749b261df7d08e
Author: Andreas Kemnade <andreas@kemnade.info>

leds: is31fl319x: modernize registration

This patch modifies the is31fl319x driver to use the extended LED registrat=
ion
API to parse properties automatically. It also delays LED registration until
after all firmware nodes are parsed to correctly handle the maximum current
mechanics.

> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319=
x.c
> index 80f38dba0fba4..e5cca596fe7c0 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
[ ... ]
> @@ -427,14 +400,20 @@ static int is31fl319x_parse_fw(struct device *dev, =
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
This isn't a bug, but there appears to be a typo here ("corrunt" instead
of "current").

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
[ ... ]
> @@ -483,6 +462,19 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
>  	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
>  }
> =20
> +static void is31_free_fwnode(void *data)
> +{
> +	struct is31fl319x_chip *is31 =3D data;
> +	int i;
> +
> +	for (i =3D 0; i < is31->cdef->num_leds; i++) {
> +		if (is31->leds[i].fwnode)
> +			fwnode_handle_put(is31->leds[i].fwnode);
> +
> +		is31->leds[i].fwnode =3D NULL;
> +	}
> +}
> +
>  static int is31fl319x_probe(struct i2c_client *client)
>  {
>  	struct is31fl319x_chip *is31;
> @@ -498,6 +490,10 @@ static int is31fl319x_probe(struct i2c_client *clien=
t)
>  	if (!is31)
>  		return -ENOMEM;
> =20
> +	err =3D devm_add_action_or_reset(dev, is31_free_fwnode, is31);

[Severity: High]
Could this sequence cause a NULL pointer dereference on the error path?

The cleanup action is registered here before is31->cdef is populated.
If an initialization step fails early before is31->cdef is assigned, the
devres core will call is31_free_fwnode() which then dereferences the
uninitialized is31->cdef in its loop condition.

For example, if devm_gpiod_get_optional() defers probe in is31fl319x_parse_=
fw():

is31fl319x_parse_fw() {
	is31->shutdown_gpio =3D devm_gpiod_get_optional(...);
	if (IS_ERR(is31->shutdown_gpio))
		return dev_err_probe(...);

	...
	is31->cdef =3D device_get_match_data(dev);
}

The early return triggers the cleanup, which evaluates
is31->cdef->num_leds, leading to a panic.

> +	if (err)
> +		return err;
> +
>  	err =3D devm_mutex_init(dev, &is31->lock);
>  	if (err)
>  		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-led-modern=
-v1-1-a4af2e9aad60@kemnade.info?part=3D1
