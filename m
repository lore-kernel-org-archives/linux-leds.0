Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518957;
	b=rJJPIHAitsd2A8hdlqxl/yULluQELInnh39AcSF2X9AYGvnDnnEPB7ThD3ymPQVKJSi8
	 S0N2ax6Hsj2JpnwtHypH3abimjtTo0LK8EZDrPAQwLUT+WKwdBzalUorPjHNled65TA8L
	 ipY/Zqx5uFLEkjTk0JeR5l//wbELI/5S2db0FnkkppXDMrM72PuvGSRMxn4xO4ZqTkJTe
	 lg+uSh2SRMoYrm5y2E9XNEc3q65FuoaNtuQuIV4xWMnlCcrTQ6SnR8fcJNH5PSkk47sVA
	 8AY5Lk2vF7xLh7membvmdOuSH9S33U25ZR4n+1mxrdtjRniNgkV2po5iJdtzQAfNnzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518957;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K8CXhK/SPFJK7NZbn0+oBRyWqfH1BjckOtDhNMG8Dks=;
	b=MfjzTw5bWPweJLFpagZqymLAaAmooVquUIQq7JTeqwId/qeIjS5FQ3noigMVFkcStmlJ
	 8hdBGGWtoLRkmkgKywdUrZHdW1qkZx0AoQyMJrAlt+KmRXdkxpzt1GssCFRY0LwQKg4cc
	 f3Ddil171fPVWoB8jHGel+WFTGcZnKnNXZa2nTR5ZoXScJgI/ahoWycfjGI5heoacyXhM
	 B45t1Qdg9XjDFd7ZT3a1lmEMvk1Je8OjYJ468SZ9slJbosqh4AEXST10JqMrCAwHk/DzG
	 /p2YD41nYYmCNnvtTgZSO5MHzS/Nhv0QZrzayD0aA3TEBJXKg5jxUFWhytSmxRNY71Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3CILbho;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C90E606A31C;
	Thu, 12 Nov 2026 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3CILbho
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D951F000C4;
	Thu, 12 Nov 2026 21:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518957;
	bh=K8CXhK/SPFJK7NZbn0+oBRyWqfH1BjckOtDhNMG8Dks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3CILbhovan2nG38+iulYjf/JC2ZxnTgN3AOyRauEziimeEvTkCcwnDdDFD2p+fkE
	 X30258+YNourTLmShw9E2sfHsbF2oDRq64NcCW4QyGJNp9zBHr7+HaQiHmM2+H7Bpq
	 JI0blIAbuUVD4qqQvwSWporJUVi5gOGKMrW/G+GeKj2tmMr9NN0k9IcgLKKHg+g+o3
	 itSpjrDHu7k25hHNO7GuIDmCMhfCTPAIdm0acLoB9C6K5InNcXnhqGe+e28VkAja5F
	 5eLQzXH97Q99iy+sfZXZneU/jRiNaYJyGpCbM/0tmktNrr4Chf4g3x9fqiP9WSWQKg
	 z3ugy6JA3oTWQ==
Message-ID: <sashiko-outbox-211866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-2-b2c5e323a90a@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 21:29:16 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] leds: aw2013: build error and wrong imax mask in
  aw2013_probe_dt()
--

commit 07caacf25b9b9285cf8d8cd5387ef8435b68fb1e
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: Add AW2027 support

This commit adds support for the Awinic AW2027 3-channel LED controller
to the aw2013 driver, introducing chip-specific definitions and current
configuration handling.

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index cf20e94920fd6..d3858b06e594d 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -20,13 +20,15 @@
>  #define AW2013_GCR 0x01
>  #define AW2013_GCR_ENABLE BIT(0)
> =20
> +#define AW20XX_GCR2 0x04
> +
>  /* LED channel enable register */
>  #define AW2013_LCTR 0x30
>  #define AW2013_LCTR_LE(x) BIT((x))
> =20
>  /* LED channel control registers */
>  #define AW2013_LCFG(x) (0x31 + (x))
> -#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
> +#define AW2013_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3

[ ... ]

> @@ -293,9 +403,9 @@ static int aw2013_probe_dt(struct aw2013 *chip)
>  		init_data.fwnode =3D of_fwnode_handle(child);
> =20
>  		if (!of_property_read_u32(child, "led-max-microamp", &imax)) {
> -			led->imax =3D min_t(u32, imax / 5000, 3);
> +			led->imax =3D aw2013_microamp_to_imax(imax, chip->cdef);
>  		} else {
> -			led->imax =3D 1; // 5mA
> +			led->imax =3D chip->cdef->default_imax;
>  			dev_info(&chip->client->dev,
>  				 "DT property led-max-microamp is missing\n");
>  		}

[Severity: High]
Does renaming AW2013_LCFG_IMAX_MASK to AW2013_IMAX_MASK break the build in
aw2013_probe_dt()?

Just below this hunk, aw2013_probe_dt() still references the removed
AW2013_LCFG_IMAX_MASK macro when configuring subsequent LEDs after an
earlier LED enables the chip (for example via a default trigger during
devm_led_classdev_register_ext()):

drivers/leds/leds-aw2013.c:aw2013_probe_dt() {
	...
		if (chip->enabled) {
			ret =3D regmap_update_bits(chip->regmap,
						 AW2013_LCFG(led->num),
						 AW2013_LCFG_IMAX_MASK,
						 led->imax);
	...
}

In addition to failing to compile, on AW2027 the per-LED current field in
AW2013_LCFG(led->num) uses the 4-bit AW2027_LOCAL_IMAX_MASK rather than the
2-bit AW2013_IMAX_MASK, so using the 2-bit mask here would truncate
led->imax for those LEDs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-aw2013-aw2=
0xx-rename-v5-0-b2c5e323a90a@postmarketos.org?part=3D2
