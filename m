Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949040B11D;
	Wed,  2 Sep 2026 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393364; cv=none; b=Jg56A9v7emNq+aoGu3K0CcKaT1cy9vXNqSq59p8QvVGGnc4l0vMxZ8u85Mn+oHTJDBcA4JjIkQuDKZysOjG5Djc5FFw12carTK0vgEMZ2CX+/pdn0ZKIJQoVQasrXSXPJx7cRVHpEdez/+EwVTbXiXlhNXgCxJLLE+CA8YIxoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393364; c=relaxed/simple;
	bh=NOk7kI8JQtFrJpqIJcLbMhNq6OxRG2pE6FVIUW+XZ60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6J7wbmCwDTEn3rEbCua8jMKkjrNoAbktGGLSIu02c363GLNfVbWz5mtV4s3QVKpJ1429c1O9jn+EvV/gju4gRRvqfOCUGxnJK5vo/EexptQpGH4aHsyoTah8+q+JLIXNQjRpfDYYpmI++Dx5lbFTN3CB0kPpUba+pqRts3UZxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMplzgvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMplzgvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8112F1F000E9;
	Wed,  2 Sep 2026 23:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788393362;
	bh=KQ8itQNAoSXw+j8zxN/J6ovo3IIZujHCMg6JjIhFGfs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AMplzgvIVaiUAenE3Vgc6ji2TZkEc+5BAJdyLtn6RI8Zld4xwUd17jn6/guaveG+U
	 334BU/q/a648Y3v7QCtivvSO8R/HMLWFilBYtiTzC4OhX94BuTVhNTZpLv/YPxGq3o
	 nmlIIGCeUmEa9pQy47E6wXEFqsV2q4xFsng1U9xnMN/b0pBwfc25eG0fSU3vEGwQU+
	 tMECrJCQFcKiMtlXo4fDuStA2ctlSPrF/6pCek+csQzzlycQsDaDAzrz3WobQSLrHZ
	 46u6t1Y0ktL5S/as/uAysZICOtaYqG5BdR9zn/LbqBPSdvMMiEjdPkflVGNTzOQpjS
	 xJrnyAPXSJzbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-upstream-ltc3208-v11-2-28f5f0fd364e@analog.com>
References: <20260903-upstream-ltc3208-v11-0-28f5f0fd364e@analog.com>
 <20260903-upstream-ltc3208-v11-2-28f5f0fd364e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 23:56:02 +0000
Message-Id: <20260902235602.8112F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect assignment of num_reg_defaults using a register address m=
acro instead of ARRAY_SIZE.
--

commit 13fa42bec99e4f9ce4669e4a6a7c6f12807ee3a4
Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>

leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

This commit introduces a new kernel driver for the Analog Devices LTC3208
Multi-display LED driver. It configures the device via I2C and supports up
to 7 distinct LED channels with configurable current levels.

> diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c

[ ... ]

> +static const struct regmap_config ltc3208_regmap_cfg =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D LTC3208_REG_G_OPT,
> +	.cache_type =3D REGCACHE_FLAT_S,
> +	.reg_defaults =3D ltc3208_reg_defaults,
> +	.num_reg_defaults =3D LTC3208_REG_G_OPT,

[Severity: Low]
Does this code intentionally use a register address macro for the array len=
gth
instead of ARRAY_SIZE(ltc3208_reg_defaults)?

Because LTC3208_REG_G_OPT happens to evaluate to 7, it coincidentally match=
es
the exact number of elements in the ltc3208_reg_defaults array. However,
using a register address macro to specify an array length creates a brittle
semantic dependency. If elements are removed from the array, or if a regist=
er
with a different address is added in the future, this will result in an
incorrect size being passed to the regmap core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-upstream-l=
tc3208-v11-0-28f5f0fd364e@analog.com?part=3D2
