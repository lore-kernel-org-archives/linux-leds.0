Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586169;
	b=Pxc101qUlfEO1Acw+Ma1vTKaUcXVsRQJrIyrkJdUk7THEfJQCEwFKkKHOF67dU6Vv4GF
	 KCTxQTaTroDE5x5ZnOJzEKvcPZF7IkpnA+19svgI3yyC13tb2cBdfheQaUmenkj58iDCl
	 52bQRZkw6c6hwswOehHBMnxH2T7hi9O14YZ+cLkMuu2oxPdx3xrOdxhSXEVpduwpxxTrA
	 UPjyy93fqmCYVUtB8SjHYY+3MAYZ8RREiu7HJADzyRqU/9RXP7/uW4NTJEb0C/8LoSuGl
	 +RSFn3mNYe3JjX2hHZxT95j2ss4Z/QbG4TDM/1lQj7IrQdrBlBzZE805FAGmW4wVd8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=14T2lJXzC+QlsgrD0XfylBjUX9fY5CQjCPMXfcZn1MM=;
	b=w9WEN+aXhNGdgPaJKCyTDpDo3a/3scowOKxmA3ihnxd6VWOZDo2jqy40HWVKtSOula1m
	 tO4qyX1rTUa3o7aFnQLidb/hKF2wtENjutKNCPvCGDR0onSdSkMQvz3uZWSn40OHiCc+6
	 kKV7gayv5xoE6v4y8LGXViwEw/nFhyiKHE0TCb0NNQU0OeyRo6ioh+zWlPDyGnnYaB9Gg
	 ghNIXtqTUvF/OHGftPNeGOq3zPzLDb7P+cAhk3yOCdt2YjimtTHmq3upleKk3hwoDdiO/
	 sYkOtuGI4/LkERJcq1olbC67TSDWbJ1MQdb3t0gVjI5Xm9gjWVypWgMwhhtwgeRy8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoEmFZX3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40549606A32C;
	Mon,  2 Nov 2026 02:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoEmFZX3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEA91F000C1;
	Mon,  2 Nov 2026 02:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586168;
	bh=14T2lJXzC+QlsgrD0XfylBjUX9fY5CQjCPMXfcZn1MM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FoEmFZX3ZnDSGz8JvRFyatND5eysGhah2Tnp4rmbJomvF0WzhHHC7lGcSTke7uTGj
	 dbNo3jJJalwmlbsAA3mMojOLwZHOCvaGMi4hqonueD64uma2ErkZSA9DDMas+WMpvt
	 sgA86IM+ahEc4+g6D9SjxgS4Q0zmH8WpiEV2HonyiNlXtaVBC4IqNa3xbf3nj3m5Hl
	 q48mZAvKVOQDFX+9xpkp4O2pf0POGi13x/IvTyAx0+kF+4pFZx2NKwg5apQeSRCkQf
	 kzZjkDBd7gqrMxJA6pMh1+zq3lW06IdvE4B0jjgUJCoIIfcfrUPiPCdYKZgP+v4BKq
	 yxjVeXPMQhEbA==
Message-ID: <sashiko-outbox-192833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] leds: rgb: ktd202x: Fail the probe when the chip
 does not answer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-9-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-9-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:22:47 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] leds: rgb: ktd202x: failing probe on reset write breaks KTD2026/KT=
D2027
--

commit cbade43891d8603172b94d1364ff11d464697a37
Author: Joseph Telaak <joseph@telaak.dev>

leds: rgb: ktd202x: Fail the probe when the chip does not answer

This commit checks the return value of the reset register write in
ktd202x_probe_fw() and fails probing if the I2C write fails.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index 48521f1e5a704..5f51df9930cb2 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -722,20 +722,23 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
>  {
>  	struct device *dev =3D chip->dev;
>  	int count;
> +	int ret;
>  	int i =3D 0;
> =20
>  	count =3D device_get_child_node_count(dev);
>  	if (!count || count > chip->num_leds)
>  		return -EINVAL;
> =20
> -	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESE=
T);
> +	/* Nothing is read back, so a failed reset is the only sign of a missin=
g chip */
> +	ret =3D regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_R=
STR_RESET);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset the chip\n");

[Severity: High]
Will failing ktd202x_probe_fw() when the KTD202X_RSTR_RESET write returns an
error break probing on genuine Kinetic KTD2026 and KTD2027 hardware?

Per the Kinetic KTD2026/KTD2027 datasheet (Register 0 Reset/Control bits
[2:0] =3D 111, Reset Complete Chip), executing the reset command resets the
entire chip including its I2C state machine immediately upon latching the
data byte, so the chip does not return an I2C ACK pulse for the reset
command byte and requires a 200 us wait before the next I2C transfer.

Because the KTD2026/KTD2027 NACKs the KTD202X_RSTR_RESET write by design,
regmap_write() returns a NACK error (-ENXIO or -EREMOTEIO) during
ktd202x_probe() -> ktd202x_probe_fw(), which is why commit 0ebdb7210943
("leds: Add ktd202x driver") ignored the return value of the reset write.

To detect a missing chip at probe time without regressing KTD2026/KTD2027,
could the driver instead check the return value of a register write issued
after usleep_range(200, 300) completes (for example, writing
KTD202X_ENABLE_CTRL_SLEEP to KTD202X_REG_RESET_CONTROL after the reset
delay)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D9
