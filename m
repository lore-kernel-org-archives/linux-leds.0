Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A324679C
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813300; cv=none; b=BHa5kCa1hf3REUcCYNqjcAjvMCpU7eGrzGvxl3NMLLifnM/NadHz2o5JlwYVMaRTOFyC7XTzjViHCaxjRIPcf7/BWaZXTdPfPO3V9MW23ShkuINVoUHfiUipyI2/EfhCYeneIYhwUrD9KiLVaD05xDRg8v06GKgkzHB6e8qI7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813300; c=relaxed/simple;
	bh=GF6H49S+qWXOTGCSnhOA6UfBtfK4FbfYT15c5B7hDYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S0vMjg2pYTQcaGqythIDPrYjKtsXn8y3y10XGq8vtQ8yDFJRCNk/KtPzO04XKldP1QWmq/fwgPgaQnCuLjFzleo/d8oWKdcLVYI4G0Hsc7o5C8KN6AZ9enVCmzRJYpOuRDMBK1m0t9NPeQCdjxCDdawzBgAV/VJNPnp3m9Ck0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Llfho/Uj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Llfho/Uj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609761F00A3A;
	Mon,  7 Sep 2026 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788813298;
	bh=ZlpTmH2a2bqGi4wQAm3Rqay1/Y6mkCuKOEsOE5fom3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Llfho/UjNkP7vCZg3G05PlEBcf/REdPA5Qznsaua8HCZTVpQI4KijkYlQvp3sz3QH
	 Cq7NgMB4VZfTTxpRZDKJ7tWWphQcvjsZd8lU9rW8OlrMifE2g5SborJezhtu1Vc/kE
	 7hbk0UThzi96Qkezwy0Jl185GtdtjU74DijCnKHSnN/vmHlhvAUhJtuunt8a8GRRXR
	 r2j6+d4nv553agpRHMl9tC7OOWe8+hzipYOBjuaphjnrotG/viGxmlIhZC5J4Hw6y5
	 G2lAr1gclyJKrpi3m2U+J7m6TAlppABbd/EedyUlOqtDlIf7tfTOZjqe2rukuIiRRC
	 xUI3H1jU2KiHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: is31fl32xx: Use fwnode/device property APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260907201940.40524-1-rosenp@gmail.com>
References: <20260907201940.40524-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 20:34:57 +0000
Message-Id: <20260907203458.609761F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential out-of-bounds write to `priv->leds` array due to TOCTOU =
race condition during child node iteration.
- [High] NULL pointer dereference in `is31fl32xx_parse_dt()` when device ma=
tch data is absent.
--

commit ed8f6f187305b333f2b97784d1f0f1abc18b4cb5
Author: Rosen Penev <rosenp@gmail.com>

leds: is31fl32xx: Use fwnode/device property APIs

This commit converts the DT-specific helpers in is31fl32xx_parse_dt() and
is31fl32xx_parse_child_dt() to their fwnode/device equivalents. It retains
the skipping of unavailable children and updates the format specifiers.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
[ ... ]
> @@ -422,7 +422,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  	int ret =3D 0;
> =20
>  	if ((cdef->output_frequency_setting_reg !=3D IS31FL32XX_REG_NONE) &&

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for cdef to be
NULL here?

If the device binds via the I2C ID table (e.g., fallback matching by node n=
ame
without a valid compatible string, or via sysfs new_device with an attached
software node), device_get_match_data(dev) in is31fl32xx_probe() returns NU=
LL
because the is31fl32xx_id table entries have no .driver_data.

If the node also contains children, device_get_child_node_count() allows the
probe to proceed, and is31fl32xx_parse_dt() will then unconditionally
dereference cdef when checking cdef->output_frequency_setting_reg.

Should there be a NULL check for cdef prior to this?

> -	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
> +	    device_property_read_bool(dev, "issi,22khz-pwm")) {
> =20
>  		ret =3D is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
>  				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
> @@ -433,7 +433,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  		}
>  	}
> =20
> -	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> +	device_for_each_child_node_scoped(dev, child) {
>  		struct led_init_data init_data =3D {};
>  		struct is31fl32xx_led_data *led_data =3D
>  			&priv->leds[priv->num_leds];

[Severity: High]
This is a pre-existing issue, but could this iteration cause an out-of-boun=
ds
write to the priv->leds array?

In is31fl32xx_probe(), device_get_child_node_count() calculates the number =
of
available child nodes to allocate the priv->leds array. Later, this loop
iterates over the children and unconditionally increments priv->num_leds wh=
ile
writing to the array.

If a child node is added concurrently (e.g., via a device tree overlay)
between these two lockless operations, the loop will execute more times
than the allocated count.

Would it be safer to ensure priv->num_leds does not exceed the originally
allocated count within this loop?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907201940.4052=
4-1-rosenp@gmail.com?part=3D1
