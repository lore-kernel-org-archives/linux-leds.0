Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528695;
	b=zMJaeNbnJqDh/rFrpETe2Piq7x9yhwMhhdM+MDDw3pJahiwjgzHonLgek8ZqMDoQmEqL
	 gK/JS/9+SIuIKdroy8C4w0hxr25uC4b7cweuniWpnhixWK8Dfd+5f87RCOHmBn1sS+ZhA
	 oSdVxUISrvTvKqfstunfVOZhDkDjFobTY8r1ub+gcZYxzW421SzGh++ff44odBuf32swp
	 cMEppYpRtm63J0SPJuSnV43+id+eGCvPEGqmvYf6pop/WsWhtZ7sCQuOo12wX3yG3jeDk
	 ss+3uVFTAahLyILWGNqViU280ZIvc2n8/sLeb8cQacbZM1TdL/4wrJiJrzB2tBkZ9Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528695;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7i5Tp1P6e5z8WC2/DnjTRSfB9SMleWfl656xQfdIIao=;
	b=1ZQaGF5EvqWqNRHtlspzpMo/ZQ6Y4m5eJvzXN/aNwvxiSO7sV0XallhfCRPFoip12rl6
	 XEValTyaXFvMSrSEwXKY5JVx6FtmarqmiZvUNzrMIWMkYAuhyJSWDgtSjRSrP0qAgCEcC
	 y+7VyZ1H2qcpzGQq4dIlFko0k4OELEycfxiUqYstRqX6tW2n8FOF6LOlr5atlaZwutVKs
	 QMDasYFJuRrFu5ypWdSOouIMkfTRnooiQEvD0ONvdGigsPyQv6Zlpx/Mp2z7d8Cp2/RrE
	 lIWzYppHEmSJmNZexN2i4Ps9IZvqr6uz7dQ1j68F1PeQ0sYrrMT/1WLzdIIK26tcK3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGebCxqj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F7606A321;
	Fri, 13 Nov 2026 00:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGebCxqj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32281F000C4;
	Fri, 13 Nov 2026 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528695;
	bh=7i5Tp1P6e5z8WC2/DnjTRSfB9SMleWfl656xQfdIIao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGebCxqjV4ZGan9+YXIVLovq20GZG6ws00k7cxgqiNNSAa/ntRRP8J4bFfFFyXB0I
	 KR+tCjDYBh/Tz9OlvONH9lDJBz+qzN4DrafpgDvj2YbSnPL/wxKz3X1iW5h2RINCWk
	 tFPkzXgzhVQyzseluX5kVN1Mc/k3BP3ni4fYgWcXGbKZ4vts7NQJ6KE4WFmlJNk+vf
	 HRHAXZHggMHCOhbD1MEAv6VS3dk1Nil9sOZnZcZQpQoUodwc9QCwZmKXIB3N5CqOwc
	 SNMaHJiiHG8DbGK6rPnDVoLOc3dLZDnfXShe9xdYZYTA0kSBi9f2O3LZKPcaYZ9yrE
	 AOlMIMXjZv78w==
Message-ID: <sashiko-outbox-211976@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261112-aw2013-aw20xx-rename-v6-2-251eca340abc@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v6-2-251eca340abc@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 00:11:34 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] leds: aw2013: unpowered I2C access in aw2013_probe_dt() via
  aw2027_set_global_imax()
- [Low] leds: aw2013: pass-by-value of struct aw2013_led in
  aw2027_set_local_imax()
--

commit a83734f3f7807e1e9702a5495a99e5cba9b2c327
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: Add AW2027 support

This commit adds support for the Awinic AW2027 3-channel LED controller to
the aw2013 driver, introducing chip definition structures and configuring
both global and per-channel maximum current registers.

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index cf20e94920fd6..5ff9887086a61 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
[ ... ]
> @@ -60,19 +72,99 @@ struct aw2013_led {
[ ... ]
> +static int aw2027_set_local_imax(struct aw2013 *chip, struct aw2013_led =
led, u32 imax)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(chip->regmap,
> +				 AW2013_LCFG(led.num),
> +				 AW2027_LOCAL_IMAX_MASK,
> +				 imax);
> +
> +	return ret;
> +}

[Severity: Low]
Does aw2027_set_local_imax() need to take struct aw2013_led by value?
struct aw2013_led embeds struct led_classdev, so each call copies the entire
structure onto the stack just to read led.num, while also passing led.imax
as a separate argument.  Passing a const struct aw2013_led *led pointer (or
unifying the AW2013_LCFG update using a mask from struct aw2013_chipdef)
would avoid the stack copy and duplicate loops.

[ ... ]

> @@ -271,6 +388,16 @@ static int aw2013_probe_dt(struct aw2013 *chip)
>  	if (!count || count > AW2013_MAX_LEDS)
>  		return -EINVAL;
> =20
> +	if (chip->cdef->gcr2_imax) {
> +		mutex_lock(&chip->mutex);
> +		ret =3D aw2027_set_global_imax(chip);
> +		if (ret) {
> +			mutex_unlock(&chip->mutex);
> +			return ret;
> +		}
> +		mutex_unlock(&chip->mutex);
> +	}

[Severity: High]
Does aw2027_set_global_imax() perform an I2C register access here while the
chip is unpowered?

aw2013_probe() resets the chip and disables the vcc and vio regulators via
regulator_bulk_disable() right before calling aw2013_probe_dt(), with
chip->enabled still false:

drivers/leds/leds-aw2013.c:aw2013_probe() {
    ...
	ret =3D regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
				     chip->regulators);
	if (ret) {
		dev_err(&client->dev,
			"Failed to disable regulators: %d\n", ret);
		goto error;
	}

	mutex_unlock(&chip->mutex);

	ret =3D devm_add_action(&client->dev, aw2013_chip_disable_action, chip);
	if (ret)
		return ret;

	return aw2013_probe_dt(chip);
    ...
}

Because aw2027_regmap_config has no register cache, calling
aw2027_set_global_imax() at the start of aw2013_probe_dt() issues an I2C
transaction to AW20XX_GCR2 while vcc and vio are disabled, causing probe to
fail when those supplies are gated.  Since aw2013_chip_init() already calls
aw2027_set_global_imax() once aw2013_chip_enable() powers on the chip, can
this block in aw2013_probe_dt() be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-aw2013-aw2=
0xx-rename-v6-0-251eca340abc@postmarketos.org?part=3D2
