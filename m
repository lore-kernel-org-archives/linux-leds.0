Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42DE3C3C16;
	Tue, 13 Oct 2026 05:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870791; cv=none; b=RyRzppC9G2Shx3CCFsU3C3I4yM9Y3XVJ+klGSy0t8i6iTPL+Dp1t22m8SwCutqAyMCstzxPQv6HvGm05SFiVrrGbWYpiRSjNTPflsBnAiNHmwQIFiEnUX6P035Hk4zDDEqqDYxPD/c/PGZ49v+FnQIWrGNFK23rK0mnAQDE2Ozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870791; c=relaxed/simple;
	bh=AvXZIHEgKbnDOudC7K7eS8vzYm0Anur4z00GXAuEFQ0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JV+jSY7n5+iQ6ERSUhTK4+EfK2QTHPrbul0LrDIWT98Jq/OsgKpZ+IZYQ9bkGf3CST3UI3w6gKEcmdzF8wKODugrZQjr6t7lSNZAVuAwTrqSygyGyEeLWP3QBDLjWKrOgqc+wi+oci+yLnGk3ABYmVQDgGFGBjGJMO1Cwj9ZaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM2SHDue; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM2SHDue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E871F000FF;
	Tue, 13 Oct 2026 05:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870790;
	bh=Cg2AuzKj1dcKh8zks53jRNdtC36R3XWLl7G3RViJgys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OM2SHDue06bubDMtNzLxiCsQXLFBydNU4vciMdr7asHb02SrlqfQpihjZCztPl04v
	 ZVv0cyBdW3ZPNtDwmgFPUMs3/r4tGDAdvKnNpl075Lqj26iVQ0H92XMu7/li5pbFTl
	 b0nRJMZs3IfDtjzSZK+dqKP+cEG59A6z9zE4WDgW8U/xhJyL8rru4IRhCdgAXO/zSg
	 hI9wOkV7lD5BI5Vv3b8ALYDl0wdBjtLWxT8//xm64VIir97S4Hnp9mxy0vOPVHW1oM
	 mpL5FLRb+6pz/XXnOHmNdB4kp9pvp0jzhaWy4NlBaFH4f8wwL+wcWTRwtIFAYcYh6l
	 CuYeIuA4in+Pg==
Message-ID: <sashiko-outbox-169016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:53:09 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] locking: double mutex unlock on probe error path
- [Medium] leds: aw2013: 4-bit AW2027 local current limit truncated by 2-bi=
t mask
--

commit 117fb3f76f08e72c0e73f7c0543a74753854f334
Author: Paul Sajna <sajattack@postmarketos.org>
leds: aw2013: Add AW2027 support

This commit adds support for the AW2027 LED driver. It introduces a chip
definition structure to handle differences such as maximum current, current
levels for color-mixing, and global versus local current configuration.

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 216755d6010fe..4da33a86af16a 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -81,17 +144,50 @@ static int aw2013_chip_init(struct aw2013 *chip)

[ ... ]

> +	if (chip->cdef->gcr2_imax) {

[ ... ]

> +		for (i =3D 0; i < chip->num_leds; i++) {
> +			ret =3D regmap_update_bits(chip->regmap,
> +						 AW2013_LCFG(chip->leds[i].num),
> +						 AW2013_IMAX_MASK,
> +						 chip->leds[i].imax);

[Severity: Medium]
Does this code inadvertently truncate the AW2027 local current limit?

For the AW2027, aw2013_microamp_to_imax() calculates a 4-bit limit (0-15) b=
ased
on the led-max-microamp property. However, AW2013_IMAX_MASK is defined as
BIT(0) | BIT(1) (0x03).

By using a 2-bit mask here, the upper 2 bits of the 4-bit imax value are
silently discarded. Does this effectively limit the maximum LED brightness =
to a
fraction of its intended capability and break the 16-level color-mixing con=
trol?

[ ... ]

> @@ -420,7 +516,8 @@ static int aw2013_probe(struct i2c_client *client)
>  }

[Severity: High]
This problem wasn't introduced by this patch, but patch 6 in this series mo=
ved
the mutex_unlock(&chip->mutex) before aw2013_probe_dt() without updating the
error paths.

If aw2013_probe_dt() fails, or if the final regulator_bulk_disable() fails,
the probe function jumps to the error_reg or error cleanup labels:

error_reg:
	regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
			       chip->regulators);

error:
	mutex_unlock(&chip->mutex);
	return ret;

Since the mutex is already unlocked prior to calling aw2013_probe_dt(), does
this path cause a double-unlock of chip->mutex?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-aw2013-aw2=
0xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=3D2
