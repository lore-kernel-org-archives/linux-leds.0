Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F033D494A18;
	Wed,  2 Sep 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352844; cv=none; b=D3Yk0NSmiaSJkQqM6d1Ln3r2nfOt/eEVogmD50aDtRSHXvdZ3XS8ky4SRG8c4FA9qsu+JTRqb23jV4rM7y8+PQcbbOrAeMit65fAoA6hrDwPt7yICFtTaSPsxyPabFv861IS4/jmXQ4cDgW6vlZHfx6tM4HcFLTL11t8qUia29E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352844; c=relaxed/simple;
	bh=7HKlsv6IcKPiNMaXG410a9K0xiDS4dAQTupJewzWe6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oi7qYAM7n0zYFt6IO69m1T7f2/DUCqXjJNB8QYKqwity2/4TPXubldbE6EjEEOGo/7aLPEogI6UsPR2xSgR9JfU3knDtXO4q6/jRIjvMJOZeQfdJiRH3mPga8VYKqRawsCE6CjZtuaZGBtfUr89QWOT0FEtRJ96zXBUap36bNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m14+qgN+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m14+qgN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3663A1F000E9;
	Wed,  2 Sep 2026 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352842;
	bh=WUsoByKRlWZhvl6Y86fLZ5IhVV6R8EFE0BMgFk5OCVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m14+qgN+oy0GmgB8DihWuyinRbjm8Z/RT+T5u65anILa+GirHqMScWmue4fDGN+5Q
	 aONQzRx3QWOCWxvqIsPqpMdBq2/RecFxW3XGRxwpf9gvr8iKpHoN+x2W69dWJ/sQIO
	 UJ9BPD4JAKvYwHYnjKtf9qB6pGrvYRNQChbILk6zKs91jINbr7faD6X6szfqhcsQBz
	 BwW0GXahUSv3OJLoP+iDTJXBWjYdoF4NsSGJODtu4lM30f0ZNcCqM23NQCVG4LCzzs
	 eGhwZ/41am/XYr3dlo87DnShUXksd+G9uBreRc0bbJvxJ49muRL9ZEuPMF5dWZ8y4k
	 nlR+qTxNQtzXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] leds: pca995x: add sysfs files for error reporting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <69f8e83950d4d0f7c1bf60fe2f4047cf9bee5f79.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <69f8e83950d4d0f7c1bf60fe2f4047cf9bee5f79.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:40:41 +0000
Message-Id: <20260902124042.3663A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `has_errors_store` function uses `strcmp()` to perform an ex=
act match on "clear\n", which incorrectly rejects valid sysfs writes that o=
mit a trailing newline.
- [Low] The commit message description is not capitalized, violating subsys=
tem guidelines.
--

commit 663ea7a7fd850dadfe05eb1aef14f297e78e15b5
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: add sysfs files for error reporting

The PCA995x has builtin failure detection. Provide sysfs files for
individual LED status (reporting "okay", "short-circuit" or
"open-circuit") as well as a global "has_errors" flag. has_errors is
sticky and must be cleared by writing "clear" to the sysfs file.

> leds: pca995x: add sysfs files for error reporting

[Severity: Low]
This isn't a bug, but the commit message description starts with a lowercase
letter. The LED subsystem guidelines request capitalizing the description
after the subsystem prefix.

> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index b069b93d39a54..2232b74528a53 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
[ ... ]
> +static ssize_t has_errors_store(struct device *dev, struct device_attrib=
ute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct pca995x_chip *chip =3D i2c_get_clientdata(to_i2c_client(dev));
> +	int ret;
> +
> +	if (strcmp(buf, "clear\n"))
> +		return -EINVAL;

[Severity: Medium]
Does this exact string match in has_errors_store() reject valid sysfs write=
s=20
that omit a trailing newline?=20

If userspace writes exactly the word clear without a newline=20
(for example, using echo -n clear > has_errors), strcmp will fail and retur=
n=20
-EINVAL. Using sysfs_streq() instead of strcmp() would transparently handle=
=20
the presence or absence of a trailing newline from sysfs inputs.

> +
> +	ret =3D regmap_update_bits(chip->regmap, PCA995X_MODE2,
> +				 PCA995X_MODE2_CLRERR, PCA995X_MODE2_CLRERR);
> +
> +	return ret ?: count;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D5
